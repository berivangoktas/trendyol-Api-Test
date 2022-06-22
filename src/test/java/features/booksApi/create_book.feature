Feature: Books Scenarios

  Background:
    * url API_ROOT
    * header Content-Type = 'application/json-patch+json'
    * header accept = '*/*'

    * def createBookRequest =
      """
        {
          "id": 1,
          "author": John Smith,
          "title": SRE 101
        }
      """

  @createBook
  Scenario: Create Book
    Given path '/api/books'
    And request createBookRequest
    When method PUT
    Then status 200
    And match response == { id: '#notnull'}
    And match response == { author: '#notnull'}
    And match response == { title: '#notnull'}
    Then print response

  ######################################################################################################################

   #match control
    * match response == '#object'
    * string expectedOutput = read('jsonSchema/getBookJsonSchema.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('utils.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, expectedOutput)







