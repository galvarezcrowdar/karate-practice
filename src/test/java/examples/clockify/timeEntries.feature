Feature: Time Entries

  Background:
    Given url urlBase
    Given header x-api-key = apiKey
    * def workspacePath = 'workspaces'
    * def timeEntryPath = 'time-entries'
    * def workspace = call read('classpath:examples/clockify/workspace.feature@getAllWorkspaces')
    * def workspaceId = workspace.response[0].id

#  2. Agregar horas a un proyecto.
  Scenario Outline: Add a new time entry
    Given path workspacePath,workspaceId,timeEntryPath
    * def body = read('classpath:examples/clockify/request/addTimeEntry.json')
    Given request body
    * set body.projectId = '<projectId>'
    When method POST
    Then status <status>

    @addTimeEntry
    Examples:
  | projectId                | status |
  | 64a5a8bc489b5f36e239baee | 201    |
    Examples:
  | projectId                | status |
  | 123                      | 400    |

#  3. Editar un campo de algún registro de hora.
  Scenario Outline: Update time entry on workspace
    Given path workspacePath,workspaceId,timeEntryPath,'<timeEntryId>'
    * def body = read('classpath:examples/clockify/request/updateTimeEntry.json')
    Given request body
    * set body.description = 'EditadaDesdeKarate'
    When method PUT
    Then status <status>

    Examples:
  | timeEntryId              | status |
  | 64a6be6935535e444d712066 | 200    |
  | 123                      | 400    |

#  4. Eliminar hora registrada.
  Scenario: Delete time entry from workspace
    * def addedTimeEntry = call read('classpath:examples/clockify/timeEntries.feature@addTimeEntry')
    * def timeEntryId = addedTimeEntry.response.id
    * print timeEntryId
    Given path workspacePath,workspaceId,timeEntryPath,timeEntryId
    When method DELETE
    Then status 204