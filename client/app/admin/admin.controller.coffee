'use strict'

angular.module 'consultingMadnessApp'
.controller 'AdminCtrl', ($scope, $http, socket) ->
  $scope.jargon = []
  $scope.selectedJargon = null

  $http.get('/api/jargon').success (jargon) ->
    $scope.jargon = jargon
    socket.syncUpdates 'jargon', $scope.jargon

  $scope.newJargon = () ->
    $scope.selectedJargon = null

  $scope.selectJargon = (j) ->
    $scope.selectedJargon = j

  $scope.addJargon = ->
    return if $scope.word is ''
    if $scope.selectedJargon != null
      $http.put '/api/jargon',
        id: $scope.selectedJargon._id
        word: $scope.selectedJargon.word
        type: $scope.selectedJargon.type
        defn: $scope.selectedJargon.defn
        usage: $scope.selectedJargon.usage
    else
      $http.post '/api/jargon',
        word: $scope.selectedJargon.word
        type: $scope.selectedJargon.type
        defn: $scope.selectedJargon.defn
        usage: $scope.selectedJargon.usage

    $scope.newJargon()

  $scope.deleteJargon = (jargon) ->
    if confirm("Are you sure?")
      $http.delete '/api/jargon/' + jargon._id

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'jargon'
