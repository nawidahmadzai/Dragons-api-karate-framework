@Regression
Feature: Plans Verify Test

  Background: setup for test
    And def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Verify Plans or API
    Given path "/api/plans/get-all-plan-code"
    And header Authorization = "Bearer " + token
    When method get
    Then status 200
    And print response
