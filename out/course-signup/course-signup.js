//var angular = require('angular');

// create angular app
var validationApp = angular.module('validationApp', ['firebase']);

// create angular controller
validationApp.controller('mainController', function($scope, $firebase) {

	$scope.yearOptions = {
		"ba1": "Bachelor year 1",
		"ba2": "Bachelor year 2",
		"ba3": "Bachelor year 3",
		"ma1": "Master year 1",
		"ma2": "Master year 2",
		"oth": "Other"
	}

	var usersFire = new Firebase('https://popping-fire-9951.firebaseio.com/cthpilot/signup/');
	$scope.usersFire = $firebase(usersFire);

	// function to submit the form after all validation has occurred
	$scope.submitForm = function(isValid) {

		var user = {
			'name': $scope.user.name,
			'email': $scope.user.email,
			'studno': $scope.user.studno,
			'year': $scope.user.year,
			'study': $scope.user.study,
			'experience': $scope.user.experience,
			'motivation': $scope.user.motivation
		}


		// check to make sure the form is completely valid
		if (isValid) {
			$scope.usersFire.$add(user);
			alert('Thank you for signing up to the Coding the Humanities pilot! You will be notified soon!');
		}

	};

});
