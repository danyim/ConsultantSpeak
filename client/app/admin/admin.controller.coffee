'use strict'

angular.module 'consultingMadnessApp'
.controller 'AdminCtrl', ($scope, $http, socket) ->
  $scope.awesomeThings = []

  $http.get('/api/jargon').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    socket.syncUpdates 'jargon', $scope.awesomeThings

  $scope.addThing = ->
    return if $scope.word is ''
    $http.post '/api/jargon',
      word: $scope.word
      type: $scope.type
      defn: $scope.defn
      usage: $scope.usage

    $scope.word = ''
    $scope.type = ''
    $scope.defn = ''
    $scope.usage = ''

  $scope.deleteThing = (jargon) ->
    $http.delete '/api/jargon/' + jargon._id

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'jargon'
