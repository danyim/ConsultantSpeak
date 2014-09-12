'use strict'

angular.module 'consultantSpeakApp'
.controller 'AdminCtrl', ($scope, $http, socket) ->
  $scope.jargon = []
  $scope.selectedJargon = null
  $scope.hasSelection = false

  $http.get('/api/jargon').success (jargon) ->
    $scope.jargon = jargon
    socket.syncUpdates 'jargon', $scope.jargon

  $scope.newJargon = () ->
    $scope.selectedJargon = null
    $scope.hasSelection = false

  $scope.selectJargon = (j) ->
    console.log(j)
    $scope.selectedJargon = j
    $scope.hasSelection = true

  $scope.addJargon = ->
    return if !$scope.selectedJargon or $scope.selectedJargon.word is ''

    if $scope.hasSelection
      console.log($scope.selectedJargon)
      # Updating existing row
      $http.put '/api/jargon/' + $scope.selectedJargon._id,
        word: $scope.selectedJargon.word
        type: $scope.selectedJargon.type
        defn: $scope.selectedJargon.defn
        usage: $scope.selectedJargon.usage
        active: $scope.selectedJargon.active
    else
      # Creating new row
      $http.post '/api/jargon',
        word: $scope.selectedJargon.word
        type: $scope.selectedJargon.type
        defn: $scope.selectedJargon.defn
        usage: $scope.selectedJargon.usage
        active: $scope.selectedJargon.active

    $scope.newJargon()

  $scope.deleteJargon = (jargon) ->
    if confirm("Are you sure you want to delete " + jargon.word + "?")
      $http.delete '/api/jargon/' + jargon._id
      if $scope.selectedJargon = jargon
        $scope.newJargon()

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'jargon'
