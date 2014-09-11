'use strict'

angular.module 'consultantSpeakApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.jargonList = []

  $http.get('/api/jargon').success (jargon) ->
    $scope.jargonList = jargon
    socket.syncUpdates 'jargon', $scope.jargonList

    # Filter out inactive words
    filteredJargonList = $scope.jargonList.filter((e) ->
      console.log(e.word, e.active)
      return e.active
    )
    # Find a random value
    rand = Math.floor((Math.random() * filteredJargonList.length - 1) + 1)
    # If our response isn't empty, show the phrase
    if filteredJargonList.length > 0
      $scope.jargon = filteredJargonList[rand]

  $scope.addScore = (jargon) ->
    $scope.jargonList[0].meta.votes++

  $scope.subScore = (jargon) ->
    $scope.jargonList[0].meta.votes--

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'jargon'
