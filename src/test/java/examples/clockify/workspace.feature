Feature: Workspace Clockify tests karate practice

  Background:
    Given url urlBase
    Given header x-api-key = apiKey
    * def workspacePath = 'workspaces'

  @getAllWorkspaces
  Scenario: Get all my workspaces
    Given path workspacePath
    When method get
    Then status 200

  @addWorkspace
  Scenario: Add workspace
    Given path workspacePath
    * def body = read('classpath:examples/clockify/request/addWorkspace.json')
    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * set body.name = 'PruebaWorkspace-'+ now()
    Given request body
    * print body
    When method post
    Then status 201
    And match response.name == body.name

  Scenario: Adding a workspace fails because already exists
    * def createdWorkspace = call read('classpath:examples/clockify/workspace.feature@addWorkspace')
    * def existingWorkspaceName = createdWorkspace.response.name
    * def body = read('classpath:examples/clockify/request/addWorkspace.json')
    * set body.name = existingWorkspaceName
    Given path workspacePath
    Given request body
    When method post
    Then status 400
    * def expectedSchema = read('classpath:examples/clockify/response/addWorkspaceError400Response.json')
    * match response == expectedSchema