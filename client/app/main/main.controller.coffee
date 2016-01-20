'use strict'

angular.module 'consultantSpeakApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.jargonList = []
  $scope.jargonListFiltered = []

  activate = () ->
    MAX_VOTES = 3
    $scope.hasVoted = false;
    $scope.votesLeft = MAX_VOTES;

    # Fetch the data
    $http.get('/api/jargon').success (jargon) ->
      $scope.jargonList = jargon
      socket.syncUpdates 'jargon', $scope.jargonList

      # Filter out inactive words
      $scope.jargonListFiltered = $scope.jargonList.filter((e) ->
        # console.log(e.word, e.meta.votes, e.active)
        return e.active
      )
      # Find a random value
      $scope.randomize();

  $scope.addScore = (jargon) ->
    $scope.hasVoted = true
    $scope.votesLeft--
    $http.put '/api/jargon/' + jargon._id,
        meta:
          votes: ++jargon.meta.votes

  $scope.subScore = (jargon) ->
    $scope.hasVoted = true
    $scope.votesLeft--
    $http.put '/api/jargon/' + jargon._id,
        meta:
          votes: --jargon.meta.votes

  $scope.randomize = () ->
    rand = Math.floor((Math.random() * $scope.jargonListFiltered.length - 1) + 1)
    # If our response isn't empty, show the phrase
    if $scope.jargonListFiltered.length > 0
      $scope.jargon = $scope.jargonListFiltered[rand]
    # console.log 'Random called'

  $scope.$on '$destroy', ->
    socket.unsyncUpdates 'jargon'

  activate()
