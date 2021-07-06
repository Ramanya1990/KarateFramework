Feature: To Create the pet using swagger API

  Scenario: Create a pet using swagger
    #Post the pet to swagger API
    Given url "https://petstore.swagger.io/v2/pet"
    #And header Accept = "application/json"
    #And header Content-Type =  "application/json"
    And headers {Accept:'application/json',Content-Type:'application/json'}
    And request
      """
      {
      "id": '123',
      "category": {
      "id": '123',
      "name": "Jake"
      },
      "name": "Jake",
      "photoUrls": [
      "Jake"
      ],
      "tags": [
      {
        "id": '123',
        "name": "Jake"
      }
      ],
      "status": "available"
      }
      """
    When method post
    Then status 200
