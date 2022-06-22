Feature: Store Scenarios

  Background:
    * url petStoreApiUrl
    * header Content-Type = 'application/json-patch+json'
    * header accept = '*/*'


  @getOrder
  Scenario: Get Store Inventory
    Given path 'store/inventory'
    When method GET
    Then status 200
    Then print response

  ######################################################################################################################

   #match control
    * match response == '#object'
    * string expectedOutput = read('jsonSchema/getStoreInventoryJsonSchema.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('utils.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, expectedOutput)




