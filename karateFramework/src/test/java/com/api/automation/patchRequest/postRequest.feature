@postRequest
Feature: To create the order in paypal feature
  
  Scenario: To create the order using post with paypal
  	Given url "https://api-m.sandbox.paypal.com/"
    Given path "v2/checkout/orders"
    #headers keyword can also be used for sending multiple header values
    And header Authorization = accessAuthtoken
    And header Content-Type =  "application/json"
    #request keyword to send the body
    And request {"intent": "CAPTURE","purchase_units": [{"amount": {"currency_code": "USD","value": "100.00"}}]}
    Then method post
    Then status 201
  	* def responseValue = response