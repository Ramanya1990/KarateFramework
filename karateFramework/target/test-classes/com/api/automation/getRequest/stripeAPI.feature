@getRequest @postRequest
Feature: To validate the stripe API
  I want to use this feature to validate the stripe API

  Background: 
    #creating the varaible using def keyword and * is used insted for ghekin keyword.it can be used at the def statement
    #if we create the def keyword in background then the value can be used in all the scenarios.
    * def var_authorization = "Bearer sk_test_51ImHzpSAhqr0eqTZyRzLKB1cerahO7m0JHPkDCrVR6cxFTihNZr8TM8U3Cp1uTHpmylzppmmunxGjj7YDZUW38V500x2DZ3mTl"
    #url keyword to specify the base url
    Given url "https://api.stripe.com"

  @tag1
  Scenario: To get the list of customers
    Given path "/v1/customers"
    And header Authorization = var_authorization
    #method keyword to specify the http methods
    When method get
    #status keyword to validate the status
    Then status 200
    #match keyword to validate the response like assert
    Then match response.data[1].id =="cus_JdiCefV0U3j4Bu"
    Then match response.data[0].invoice_settings.custom_fields ==null
    #validate the size of json array
    Then match response.data =='#[10]'
    #validate using the wild card character
    Then match response.data[1].preferred_locales[*] == ['india','usa']
    #validate using the contains character
    Then match response.data[1].preferred_locales[*] contains "india"
    Then match response.data[*].id contains "cus_JYQIbDIoAzoHMb"

  Scenario: To get the list of customers and validate using fazzy matcher
    Given path "/v1/customers"
    And header Authorization = var_authorization
    When method get
    Then status 200
    #validate the id tag is present in json or not
    Then match response.data[1].id == '#present'
    #validate the id tag is a string
    Then match response.data[1].id == '#string'
    Then match response.data[0].invoice_settings.custom_fields == '#null'
    Then match response.data[1].preferred_locales[*] == '#array'
    Then match response.data[0].created == '#number'
    Then match response.data[0].delinquent == '#boolean'

  Scenario: To get the list of customers and validate using complex fazzy matcher
    Given path "/v1/customers"
    And header Authorization = var_authorization
    When method get
    Then status 200
    # #? is a complex fuzzy matchers
    # _ represents the this keyword
    # .length keyword is used to get the length in java script
    Then match response.data[1].id == '#?_.length!=0'
    # #[] to verify the preferred locales is array or not then validating the values are string
    Then match response.data[1].preferred_locales[*] == '#[]#string? _.length>=3'

  Scenario: To get the list of customers and validate response using external file
    Given path "/v1/customers"
    And header Authorization = var_authorization
    When method get
    Then status 200
    #read keyword is used to read the file
    * def expectedResponse = read("../stripeAPI.json")
    * def dataSchema = "{"id": "#string","object": "#string","address": "#null","balance": "#number","created": "#number","currency": "#null","default_source": "#null","delinquent": "#boolean","description": "#string","discount": "#null","email": "#string","invoice_prefix": "#string","invoice_settings": {"custom_fields": "#null","default_payment_method": "#null","footer": "#null"},"livemode": "#boolean","metadata": {},"name": "#string","next_invoice_sequence": "#number","phone": "#null","preferred_locales": "#[] #string","shipping": "#null","tax_exempt": "#string"}"
    Then match response == expectedResponse
    
   Scenario: To particular details of customers using json path expression
    Given path "/v1/customers"
    And header Authorization = var_authorization
    When method get
    Then status 200
    Then match response.data[1].id =="cus_JdiCefV0U3j4Bu"
    Then match response.data[0].invoice_settings.custom_fields ==null
    #validate the size of json array
    Then match response.data =='#[10]'
    #validate using the wild card character
    Then match response.data[1].preferred_locales[*] == ['india','usa']
    #validate using the contains character
    Then match response.data[1].preferred_locales[*] contains "india"
    Then match response.data[*].id contains "cus_JYQIbDIoAzoHMb"
    #validate the particular value of Json using the json path expression
    * def created = karate.jsonPath(response,"$..data[?(@.id=='cus_JdiXRCPkeYDK5p')].created")
    * def email = karate.jsonPath(response,"$..data[?(@.id=='cus_JdiXRCPkeYDK5p')].email")
    Then print "Email -->", email
    Then print "created -->", created
    
    
    
