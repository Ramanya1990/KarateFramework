Feature: To Create the pet using swagger API

  Scenario: Create a pet using swagger
    #Post the pet to swagger API
    Given url "https://petstore.swagger.io/v2/pet"
    * def getRandomValue = function() {return (Math.floor(Math.random() * 100));}
    * def idValue = getRandomValue()
    And header Accept = "application/json"
    And header Content-Type =  "application/json"
    And request
      """
      {
      "id": '#(idValue)',
      "category": {
      "id": '#(idValue)',
      "name": "Jake"
      },
      "name": "Jake",
      "photoUrls": [
      "Jake"
      ],
      "tags": [
      {
        "id": '#(idValue)',
        "name": "Jake"
      }
      ],
      "status": "available"
      }
      """
    When method post
    Then status 200
    * def responseValue = response
