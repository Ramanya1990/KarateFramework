@getRequest @postRequest
Feature: Feature to validate the paypal API
  I want to use this template for my feature file

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

  Scenario: To get the order details of paypal API
    Given path "v2/checkout/orders/2HV686674X523971Y"
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    Then method get
    Then status 200

  Scenario: To create the order using paypal
    Given path "v2/checkout/orders"
    #headers keyword can also be used for sending multiple header values
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    #request keyword to send the body
    And request {"intent": "CAPTURE","purchase_units": [{"amount": {"currency_code": "USD","value": "100.00"}}]}
    Then method post
    Then status 201

  Scenario: To create the order with request body from external file using paypal
    Given path "v2/checkout/orders"
    #headers keyword can also be used for sending multiple header values
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    #request keyword to send the body
    #read the externl file to read the json body
    * def body = read("data/PostData.json")
    And request body
    Then method post
    Then status 201

  Scenario: create the order with request body and verify response schema using paypal
    Given path "v2/checkout/orders"
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    * def body = read("data/PostData.json")
    And request body
    Then method post
    Then status 201
    Then match response ==
      """
      {
      "id": #string,
      "status": #string,
      "links": #[] #object
      }
      """

  Scenario: To create the order using paypal with embedded expressions
    * def currencycode = "USD"
    * def currencyvalue = "200.00"
    Given path "v2/checkout/orders"
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    #Way to express the embedded expression is #(currencycode)
    And request {"intent": "CAPTURE","purchase_units": [{"amount": {"currency_code": '#(currencycode)',"value": '#(currencyvalue)'}}]}
    Then method post
    Then status 201

   Scenario: create the order with request body and validate complex schema using paypal
    Given path "v2/checkout/orders"
    * def linksSchema = {"href": "#string","rel": "#string","method": "#string"}
		* def mainSchema = {"id": "#string","status": "#string","links":"#[] ##(linksSchema)"}
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    * def body = read("data/PostData.json")
    And request body
    Then method post
    Then status 201
    Then match response == "#(mainSchema)"
    
    Scenario: To get the order details and validate the complex schema paypal API
    Given path "v2/checkout/orders/2HV686674X523971Y"
    * def linksSchema = {"href": "#string","rel": "#string","method": "#string"}
		* def purchaseSchema = { "reference_id": "#string","amount": {"currency_code": "#string","value": "#string"},"payee": {"email_address": "#string","merchant_id": "#string"}}
		* def mainSchema = {"id": "#string","intent": "#string","status": "#string","purchase_units":"#[] ##(purchaseSchema)","create_time": "#string","links":"#[] ##(linksSchema)"}
    And header Authorization = accesstoken
    And header Content-Type =  "application/json"
    Then method get
    Then status 200
    Then match response == mainSchema
    
        
     