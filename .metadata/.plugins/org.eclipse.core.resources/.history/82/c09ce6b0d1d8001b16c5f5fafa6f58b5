Feature: To validate the swagger API features using karate framework

  Background: 
    Given url "https://petstore.swagger.io/v2"

  Scenario: Uploading the pet image using swagger API
    Given path "/pet/27900/uploadImage"
    And header Accept = "application/json"
    #location of the file,name of the file and content type
    And multipart file file = { read:'image.jpg',filename:'image.jpg',Content-Type:'multipart/form-data'}
    When method post
    Then status 200
    Then print response

  Scenario: Uploading the pet image from another package using swagger API
    Given path "/pet/27900/uploadImage"
    And header Accept = "application/json"
    #location of the file,name of the file and content type
    * def fileLocation = "data/image.jpg"
    And multipart file file = { read:'#(fileLocation)',filename:'image.jpg',Content-Type:'multipart/form-data'}
    When method post
    Then status 200
    Then print response
    Then match response.message contains "image.jpg"

  Scenario: Create a pet using swagger and updating the pet
    #Post the pet to swagger API
    #Modify the pet using put request
    #Validate the response
    #Syntax for Call keyword
    #Gherkin keyword call read(feature file location)
    Given call read("../putRequest/CreatePetSwaggerAPI.feature")
    #Put Request
    Given path "/pet"
    And header Accept = "application/json"
    And header Content-Type =  "application/json"
    And request
      """
      {
      "id": '123',
      "category": {
      "id": '123',
      "name": "Sparrow"
      },
      "name": "Sparrow",
      "photoUrls": [
      "Sparrow"
      ],
      "tags": [
      {
        "id": '123',
        "name": "Sparrow"
      }
      ],
      "status": "available"
      }
      """
    When method put
    Then status 200
    * def tagsArray = karate.jsonPath(response,"$.tags")
    And match tagsArray[0].name == "Sparrow"

  Scenario: Create a pet using swagger and updating the pet and accessing variables using context
    #Post the pet to swagger API
    #Modify the pet using put request
    #Validate the response
    #Syntax for Call keyword
    #Gherkin keyword call read(feature file location)
    #From helped feature
    * def postResponse = call read("../putRequest/CreatePetAPI.feature")
    #Put Request
    Given path "/pet"
    And header Accept = "application/json"
    And header Content-Type =  "application/json"
    And request
      """
      {
      "id": '#(postResponse.idValue)',
      "category": {
      "id": '#(postResponse.idValue)',
      "name": "Sparrow"
      },
      "name": "Sparrow",
      "photoUrls": [
      "Sparrow"
      ],
      "tags": [
      {
        "id": '#(postResponse.idValue)',
        "name": "Sparrow"
      }
      ],
      "status": "available"
      }
      """
    When method put
    Then status 200
    # To use the embedded expression value inside json path + postResponse.idValue +
    * def tagsArray = karate.jsonPath(response,"$.tags")
    And match tagsArray[0].name == "Sparrow"
    #From helped feature
    And print "postResponse.responseValue.id--->",postResponse.responseValue.id
    #From helped feature
    And print "postResponse.idValue--->",postResponse.idValue
    #From helped feature
    And match postResponse.responseValue.id == postResponse.idValue

  Scenario: Create a pet using swagger and updating the pet and accessing variables using context and passing values the caller feature
    #Post the pet to swagger API
    #Modify the pet using put request
    #Validate the response
    #Syntax for Call keyword
    #Gherkin keyword call read(feature file location) {var1 : value1,var2 : value2}
    * def postResponse = call read("../putRequest/CreatePetAPI2.feature"){_url:"https://petstore.swagger.io/v2/pet",_contentType:"application/json",_status:"available"}
    #Put Request
    Given path "/pet"
    And header Accept = "application/json"
    And header Content-Type =  "application/json"
    And request
      """
      {
      "id": '#(postResponse.idValue)',
      "category": {
      "id": '#(postResponse.idValue)',
      "name": "Sparrow"
      },
      "name": "Sparrow",
      "photoUrls": [
      "Sparrow"
      ],
      "tags": [
      {
        "id": '#(postResponse.idValue)',
        "name": "Sparrow"
      }
      ],
      "status": "available"
      }
      """
    When method put
    Then status 200
    # To use the embedded expression value inside json path + postResponse.idValue +
    * def tagsArray = karate.jsonPath(response,"$.tags")
    And match tagsArray[0].name == "Sparrow"
    And print "postResponse.responseValue.id--->",postResponse.responseValue.id
    And print "postResponse.idValue--->",postResponse.idValue
    And match postResponse.responseValue.id == postResponse.idValue
