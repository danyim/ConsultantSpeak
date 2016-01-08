'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'consultantSpeakApp'
  beforeEach module 'socketMock'

  MainCtrl = undefined
  scope = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/jargon').respond [
      word: 'Some word'
      meta:
        votes: 4
      active: true
    ]
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should attach a list of things to the scope', ->
    $httpBackend.flush()
    expect(scope.jargonList.length).toBe 1
