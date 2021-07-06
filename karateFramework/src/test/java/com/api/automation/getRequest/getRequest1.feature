#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@getRequest @postRequest
Feature: To verify the get request of the application
  I want to use this template for my feature file

  Background: 
    Given url "https://petstore.swagger.io"
    And print "***********Background executed*********"

  @tag1
  Scenario: To validate the get request is returning JSON body
    Given path "/v2/store/inventory"
    When method get
    Then status 200

  Scenario: To validate the get request is returning JSON body using and path
    And path "/v2/store/inventory"
    When method get
    Then status 200

  Scenario: To validate the get request is returning JSON body with headers
    And path "/v2/store/inventory"
    And headers ContentType = "application/json"
    When method get
    Then status 200
    And print response
    And match response ==
      """
      {"sold":6,"bicexa":1,"string":243,"unavailable":1,"availabel":2,"pending":7,"available":711,"free":1,"magire":1}
      """

  Scenario: To validate the get request is returning JSON negative case
    And path "/v2/store/inventory"
    And headers ContentType = "application/json"
    When method get
    Then status 200
    And print response
    And match response !=
      """
      {"sold":6,"bicexa":1,"string":243,"unavailable":1,"availabel":2,"pending":6,"available":711,"free":1}
      """

  Scenario: To validate the get request is returning JSON validate inside JSON
    And path "/v2/store/inventory"
    And headers ContentType = "application/json"
    When method get
    Then status 200
    And print response
    And match response contains deep {"sold":6}
    And match header  Content-Type == "application/json"
