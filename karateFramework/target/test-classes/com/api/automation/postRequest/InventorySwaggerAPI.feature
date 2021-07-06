Feature: Access to pet store

  Background: 
    Given url "https://petstore.swagger.io/v2"
    * def testdata = read("testdata.csv")

  #We can pass the value of data to secenaio name only in karate framework as below
  Scenario Outline: Access to petstore order using inverntory API in swagger <Method>
    Given path '<Endpoint>'
    And header Content-Type =  '<ContentType>'
    #using embedded expression passsing the data from data driven
    And request {"id": '#(id)',"petId": '#(petId)',"quantity": '#(quantity)',"shipDate": "2021-06-23T09:08:47.927Z","status": "placed","complete": true}
    When method <Method>
    Then status <StatusCode>

    Examples: 
      | Endpoint                         | Method | ContentType      | StatusCode | id | petId | quantity |
      | /store/order                     | post   | application/json |        200 |  0 |     0 |        2 |
      | /store/order/9223127596080638362 | get    | application/json |        200 |    |       |          |
      | /store/order                     | post   | application/json |        200 |  0 |     1 |        3 |
      | /store/order/92231275            | get    | application/json |        404 |    |       |          |

  Scenario Outline: Finds pets based on status in swagger <Status>
    Given path "/pet/findByStatus"
    And header Accept =  '<ContentType>'
    #And form field status = '<Status>'
    #query parameter using param keyword
    And param status = '<Status>'
    When method <Method>
    Then status <StatusCode>

    Examples: 
      | Status    | Method | ContentType      | StatusCode |
      | avaliable | get    | application/json |        200 |
      | pending   | get    | application/json |        200 |
      | sold      | get    | application/json |        200 |

  Scenario Outline: Finds pets based on status in swagger using external csv file <Status>
    Given path "/pet/findByStatus"
    And header Accept =  '<ContentType>'
    And form field status = '<Status>'
    When method <Method>
    Then status <StatusCode>

    Examples: 
      #| testdata |
			#We can also read directly the csv file in examples
			|read("testdata.csv")|