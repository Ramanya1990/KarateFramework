@deleteRequest
Feature: To validate delete Request using Stripe Request

  Background: 
    * def var_authorization = "Bearer sk_test_51ImHzpSAhqr0eqTZyRzLKB1cerahO7m0JHPkDCrVR6cxFTihNZr8TM8U3Cp1uTHpmylzppmmunxGjj7YDZUW38V500x2DZ3mTl"
	
  Scenario: To validate the delete Request after creating using post request
    #Create the customer using post request
    #Delete the customer using delete keyword and path parameter
    #Verify the customer id is deleted using get request
    * def responseValue = call read("../postRequest/PostRequestStripe.feature") {"urlValue" : "https://api.stripe.com/v1/customers","var_authorization" : "#(var_authorization)"}
    Given print "Response id value------->",responseValue.responsevalue.id
    * def idValue = responseValue.responsevalue.id
    Given url "https://api.stripe.com/v1/customers/" +idValue
    And header Authorization = var_authorization
    When method delete
    Then status 200
    Given url "https://api.stripe.com/v1/customers/" +idValue
    And header Authorization = var_authorization
    When method get
    Then status 200
    Then match response.deleted == true