'use strict'

angular.module 'consultingMadnessApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
  $scope.jargon = []

  $http.get('/api/jargon').success (jargon) ->
    rand = Math.floor((Math.random() * jargon.length - 1) + 1)
    # Filter out inactive words
    jargon = jargon.filter((e) ->
      console.log(e.word, e.active)
      return e.active
    )
    # If our response isn't empty, show the phrase
    if jargon.length > 0
      $scope.jargon = jargon[rand]