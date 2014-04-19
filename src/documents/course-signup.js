//var angular = require('angular');

// create angular app
var validationApp = angular.module('validationApp', ['firebase']);

// create angular controller
validationApp.controller('mainController', function($scope, $firebaseSimpleLogin, $firebase) {

	$scope.yearOptions = {
		"ba1": "Bachelor year 1",
		"ba2": "Bachelor year 2",
		"ba3": "Bachelor year 3",
		"ma1": "Master year 1",
		"ma2": "Master year 2",
		"oth": "Other"
	}

  var authFire = new Firebase('https://cth-site.firebaseio.com/');

  $scope.loginService = $firebaseSimpleLogin(authFire);
  $scope.currentUser = false;
  $scope.users = $firebase(authFire);
  $scope.showForm = false;

  $scope.users.$on("loaded", function() {
    $scope.gitHubKeys = $scope.users.$getIndex();
  });

  $scope.users.$on("value", function() {
    $scope.gitHubKeys = $scope.users.$getIndex();
  });

	$scope.usersFire = $firebase(authFire);
  $scope.login = function(){
    $scope.loginService.$login('github')
      .then(function(data){
        user = {
          githubId: data.id,
          avatar_url: data.thirdPartyUserData.avatar_url,
          userName: data.username,
          fullName: data.displayName,
          email: data.thirdPartyUserData.emails[0].email
        } 
        $scope.currentUser = user;
        $scope.currentUser.registered = false;
        $scope.showForm = true;
        $scope.checkRegisteredUser(data.id);
      });
  };

  $scope.logout = function(){
    $scope.currentUser = false;
    $scope.showForm = false;
    $scope.loginService.$logout();
    console.log($scope.currentUser);
    console.log($firebase(authFire));
  }

  $scope.checkRegisteredUser = function(githubId) {
    $scope.gitHubKeys.forEach(function(key) {
      var user = $scope.users[key];
      if(user.githubId === githubId) {
        $scope.currentUser = user;
        $scope.showForm = false;
        $scope.currentUser.registered = true;
        console.log($scope.currentUser);
      }
    });
  };

	$scope.submitForm = function(isValid) {

		var user = {
      'githubId': $scope.currentUser.githubId,
      'avatarUrl': $scope.currentUser.avatar_url,
			'userName': $scope.currentUser.userName,
      'fullName': $scope.currentUser.fullName,
			'email': $scope.currentUser.email,
			'studno': $scope.currentUser.studno,
			'studyYear': $scope.currentUser.studyYear,
			'study': $scope.currentUser.study,
			'codingExperience': $scope.currentUser.codingExperience,
			'motivation': $scope.currentUser.motivation
		}

		if (isValid) {
      $scope.showForm = false;
      $scope.currentUser.registered = true;
			$scope.users.$add(user);
		}
	};

});
