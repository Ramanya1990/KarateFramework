Feature: Post Request to create the customer in Stripe API

  Scenario: Create a customer using post Request using stripe API
    Given url urlValue
    And header Authorization = var_authorization
    And header Content-Type =  "application/json"
    And params {"email" : "postrequest@gmail.com","name" : "postsample","description" : "Post Request"}
    When method post
    Then status 200
    * def responsevalue = response
    Then print "Response ------->",responsevalue.id
