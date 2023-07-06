Feature: Shorten API test - Academy

  Background:
    Given url 'https://url-shortener-service.p.rapidapi.com'
    Given path 'shorten'

  @Do
  Scenario Outline: Shorten <scenarioName>
    Given header x-rapidapi-key = '<api-key>'
    * def body = read('classpath:examples/shorten/request/<requestFile>')
    Given request body
    When method POST
    Then status <statusCode>
    * match response.<responseNode> == <expectedResponse>

  Examples:
    |scenarioName       |requestFile        |statusCode| api-key                                            |responseNode|expectedResponse                       |
    |                   |shorten.json       |200       | 5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b |result_url  |'#string'                              |
    | sin Body          |noBody.json        |400       | 5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b |error       |'API Error: URL is empty'              |
    | Invalid URL       |invalidURL.json    |400       | 5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b |error       |'API Error: URL is invalid (check \#1)'|
    | Invalid Token     |shorten.json       |403       | Abc1234                                            |message     |'You are not subscribed to this API.'  |
