@patchRequest
Feature: Feature to validate the paypal API with patch request

  Background: 
    #	Scenario: To get the Access token of paypal API
    Given url "https://api-m.sandbox.paypal.com/"
    And path "v1/oauth2/token"
    #call keyword is used for the java script function
    And header Authorization = call read('../basic-auth.js') { username: 'AQNO4losvC5wwn6ktzzPrHJZ4yVH8u69VQfxS40-Qo803iAO4v-dYJYX5i-rBBvVf4l7N67o36kK9Fef', password: 'EHYy9r9cI0ensPG_SVKqh9aCMhCOKe9Rv7354fEDa95fUod1YTi0IOSsHW0K8ty8LbUTbSIb0fQHfsON' }
    And header Content-Type = 'application/x-www-form-urlencoded; charset=utf-8'
    And form field grant_type = 'client_credentials'
    When method post
    Then status 200
    And def accesstoken = "Bearer "+response.access_token
    And print "access token---->",accesstoken

  Scenario: To Update an order using patch Request
    #calling post feature and getting the order id
    * def postResponse = call read("postRequest.feature") {accessAuthtoken: "#(accesstoken)" }
    When print "orderId--->",postResponse.responseValue.id
    * def value = postResponse.responseValue.id
    * def urlValue = call read("basic-url.js"){base: 'v2/checkout/orders/',idValue: "#(value)"}
    When print "url--->",urlValue
    # Calling the get method
    Given path urlValue
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    Then method get
    Then status 200
    * def getResponse = response
    And print "getResponse--------",getResponse
    #Calling the patch for sample website
    Given url "https://reqres.in/api/users/2"
    And header Content-Type = "application/json"
    And request {"email": "#(getResponse.purchase_units[0].payee.email_address)"}
    When method patch
    Then status 200
