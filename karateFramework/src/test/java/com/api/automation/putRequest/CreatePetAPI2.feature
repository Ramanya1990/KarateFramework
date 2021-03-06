Feature: To Create the pet using swagger API

  Scenario: Create a pet using swagger
    #Post the pet to swagger API
    #From Calling feature
    Given url urlValue
    And print "_url------>",urlValue
    * def getRandomValue = function() {return (Math.floor(Math.random() * 100));}
    * def idValue = getRandomValue()
    And header Accept = "application/json"
    #From Calling feature
    And header Content-Type =  _contentType
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
      #From Calling feature
      "status": "#(_status)"
      }
      """
    When method post
    Then status 200
    * def responseValue = response
