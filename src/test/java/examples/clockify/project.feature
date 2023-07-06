Feature: Project API

  Background:
    Given url urlBase
    Given header x-api-key = apiKey
    * def allWorkspaces = call read('classpath:examples/clockify/workspace.feature@getAllWorkspaces')
    * def workspaceId = allWorkspaces.response[0].id
    * print workspaceId

  @getAllProjects
  Scenario: Get all projects on workspace
    Given path 'workspaces',workspaceId
    Given path 'projects'
    When method GET
    Then status 200

  Scenario: Find project By ID
    #Punto 1 de practica: Consultar proyecto por ID
    * def allProjects = call read('classpath:examples/clockify/project.feature@getAllProjects')
    * def projectId = allProjects.response[0].id
    Given path 'workspaces',workspaceId
    Given path 'projects',projectId
    When method GET
    Then status 200