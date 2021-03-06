@deleteRequest @ignore
Feature: Delete the pet in the swagger API
  
  Scenario: Delete the pet in the swagger API after creating and Validate it is deleted
  #Create the pet using post request
  #Delete the pet using delete keyword and path parameter
  #Verify the pet id is deleted using get request
  * def postResponse = call read("../putRequest/CreatePetAPI2.feature"){urlValue:"https://petstore.swagger.io/v2/pet",_contentType:"application/json",_status:"available"}
  * def idValue = postResponse.idValue
  Given url "https://petstore.swagger.io/pet/" +idValue
  And header Accept =  "application/json"
  When method delete
  Then status 200
  #Validating using get method
  Given url "https://petstore.swagger.io/pet/" +idValue
  And header Accept =  "application/json"
  When method get
  Then status 404
 