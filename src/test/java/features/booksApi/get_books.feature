Feature: Books Get Scenarios

  Background:
    * url API_ROOT //değiş
    * header Content-Type = 'application/json-patch+json'
    * header accept = '*/*'

    #init request
    * def bookId = call read('classpath:/features/booksApi/create_book.feature@createBook')
    * def createdBook = bookId.id

  @getBook
  Scenario: Get Book
    Given path '/api/books/', createdBook
    When method GET
    Then status 200
    Then print response


  ######################################################################################################################

   #match control
    * match response == '#object'
    * string expectedOutput = read('jsonSchema/getBookJsonSchema.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('utils.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, expectedOutput)


  @getBookWithBookId
  Scenario: Get Book with bookId 1
    Given path '/api/books/', 1
    When method GET
    Then status 200
    Then print response
    And match response.id == 1
    And match response.author == "John Smith"
    And match response.title == "SRE 101"


  @getBookNoExistBook
  Scenario: Not exist Book Get Book
    Given path '/api/books/', 123456789
    When method GET
    Then status 404
    Then print response






