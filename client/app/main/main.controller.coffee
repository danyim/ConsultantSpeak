'use strict'

angular.module 'consultingMadnessApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.jargon = []

  $http.get('/api/jargon').success (jargon) ->
    rand = Math.floor((Math.random() * jargon.length - 1) + 1)

    if jargon.length > 0
      $scope.jargon = [jargon[rand]]

    socket.syncUpdates 'jargon', $scope.jargon

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'jargon'
