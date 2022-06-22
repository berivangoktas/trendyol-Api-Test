Feature: Store Scenarios

  Background:
    * url petStoreApiUrl
    * header Content-Type = 'application/json-patch+json'
    * header accept = '*/*'

    #init request
    * def orderId = call read('classpath:/features/petStoreApi/place_order.feature@placeOrder')
    * def placedOrder = orderId.id

  @getOrder
  Scenario: Get Order
    Given path '/store/order/', 123
    When method GET
    Then status 200
    Then print response

  ######################################################################################################################

   #match control
    * match response == '#object'
    * string expectedOutput = read('jsonSchema/getOrderJsonSchema.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('utils.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, expectedOutput)

  @getOrder
  Scenario: Not exist Order Get Order
    Given path '/store/order/', 12345678
    When method GET
    Then status 404
    Then print response

  ######################################################################################################################

       #match control
    * match response == '#object'
    * string expectedOutput = read('jsonSchema/deleteOrderJsonSchema.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('utils.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, expectedOutput)





