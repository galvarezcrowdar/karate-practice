Feature: reqres tests karate practice

  Background:
    * url 'https://reqres.in/api'

  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200
    * def first = response.data[0]
    * print first

    Given path 'users', first.id
    When method get
    Then status 200
    Then response.id == first.id
