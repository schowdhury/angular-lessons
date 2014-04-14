var app = angular.module("myApp", ['ngResource', 'ngRoute']);
app.controller("MyController", ['$scope', '$routeParams', 'Todo', function($scope, $routeParams, Todo) {
  $scope.Todo = Todo;
}]);

app.factory("Todo", function ($resource) {
  return $resource(
      "http://localhost:3000/to_dos/:id",
      {id: "@id" },
      {
        "update": {method: "PUT"}
      }
  );
});