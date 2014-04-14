var app = angular.module("myApp", []);
app.controller("MyController", function(myService, $scope) {
  $scope.quote = "....Getting a quote";
  $scope.nextQuote = function() {
    myService.getAdvice().then(function(d) {
      $scope.quote = d.data.slip.advice;
    });    
  }
  $scope.nextQuote();
});

app.factory("myService", function($http) {
  return {
    getAdvice: function() {
      return $http.get("http://api.adviceslip.com/advice"); 
    }
  };
});
