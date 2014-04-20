var validationApp = angular.module('validationApp', ['firebase']);

validationApp.constant('firebaseUrl', 'https://cth-site.firebaseio.com/users/');

validationApp.service('firebase', function(firebaseUrl){
  return new Firebase(firebaseUrl);
});

validationApp.service('loginService', function(firebase, $firebaseSimpleLogin){
  return $firebaseSimpleLogin(firebase);
})

validationApp.service('users', function(firebase, $firebase){
  return $firebase(firebase);
})


validationApp.service('authentication', function($q, userService, loginService){

  var login = function(){
    var deferred = $q.defer();

    loginService.$login('github')
      .then(function(data){
        var user = {
          githubId: data.id,
          avatar_url: data.thirdPartyUserData.avatar_url,
          userName: data.username,
          fullName: data.displayName,
          email: data.thirdPartyUserData.emails[0].email
        } 

        var userFound = userService.findUserById(data.id);

        if (userFound) {
          deferred.resolve(userFound);
        } else {
          deferred.reject(user); 
        }
    });

    return deferred.promise;
  };

  var logout = function(){
    loginService.$logout();
  }

  return {
    login: login,
    logout: logout,
  }
});

validationApp.service('userService', function(users){

  var findUserById = function(githubId) {

    var userFound = false;
    var gitHubKeys = users.$getIndex();

    gitHubKeys.forEach(function(key) {
      var user = users[key];
      if (user.githubId === githubId) {
        userFound = user;
      }
    });
    return userFound;
  };

  return {
    users: users,
    findUserById: findUserById
  }
});


validationApp.controller('registrationController', function($scope, userService){

  var users = userService.users;

  $scope.$on('user:loggedin', userEvents);
  $scope.$on('user:loggedout', userEvents);
    
  function userEvents (evt, user, current){
    console.log(evt);
    console.log(user);
  };

	$scope.yearOptions = {
		"ba1": "Bachelor year 1",
		"ba2": "Bachelor year 2",
		"ba3": "Bachelor year 3",
		"ma1": "Master year 1",
		"ma2": "Master year 2",
		"oth": "Other"
	}

	$scope.submitForm = function(isValid) {

		var user = {
      'githubId': $scope.newUser.githubId,
      'avatarUrl': $scope.newUser.avatar_url,
			'userName': $scope.newUser.userName,
      'name': {
        'first': $scope.newUser.name.first,
        'last': $scope.newUser.name.last
      },
			'email': $scope.newUser.email,
			'studno': $scope.newUser.studno,
			'studyYear': $scope.newUser.studyYear,
			'study': $scope.newUser.study,
			'codingExperience': $scope.newUser.codingExperience,
			'motivation': $scope.newUser.motivation
		}

		if (isValid) {
			users.$add(user).then(function(ref){
        $scope.$emit('user:registered', user);
      }, function(err){
        alert("Don't try this at home");
      });
		}
	};
});


validationApp.controller('mainController', function($scope, authentication) {

  $scope.currentUser = false;
  $scope.newUser = false;

  $scope.$on('user:registered', function(evt, user, current){
    $scope.currentUser = user;
    $scope.newUser = false;
  });

  $scope.login = function(){
    authentication.login()
      .then(function(registeredUser){
        $scope.currentUser = registeredUser;
        $scope.$broadcast('user:loggedin', registeredUser);
      },
      function(newUser){
        $scope.newUser = newUser;
      });
  };

  $scope.logout = function(){
    $scope.$broadcast('user:loggedout', $scope.currentUser);
    $scope.currentUser = false;
    authentication.logout();
  }
});
