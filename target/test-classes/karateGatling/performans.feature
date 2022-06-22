Feature: Store Scenarios

  Background:
    * url 'https://www.n11.com/'


  Scenario: Get Home Page
    Given path '/'
    When method GET
    Then status 200




