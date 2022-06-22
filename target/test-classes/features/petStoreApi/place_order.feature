Feature: Store Scenarios

  Background:
    * url petStoreApiUrl
    * header Content-Type = 'application/json-patch+json'
    * header accept = '*/*'

    * def placeOrderRequest =
      """
        {
          "id": 123,
          "petId": 123,
          "quantity": 123,
          "shipDate": "2022-06-08T15:21:09.258Z",
          "status": "placed",
          "complete": true
        }
      """

  @placeOrder
  Scenario: Place Order
    Given path '/store/order'
    #And header Authorization = 'Bearer ' + access_token
    And request placeOrderRequest
    When method POST
    Then status 200
    Then print response


  ######################################################################################################################

   #match control
    * match response == '#object'
    * string expectedOutput = read('jsonSchema/placeOrderJsonSchema.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('utils.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, expectedOutput)





