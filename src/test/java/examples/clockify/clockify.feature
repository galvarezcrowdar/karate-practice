Feature: Clockify tests karate practice

  Background:
    Given url urlBase
    Given header x-api-key = apiKey

  Scenario: Get currently logged-in user's info
    Given path 'user'
    When method get
    Then status 200