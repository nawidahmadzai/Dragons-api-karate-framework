@Smoke
Feature: Account Verify Test

Background: Setup Test URL
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Validate getting account by ID
And path "/api/token"
And request {"username" : "supervisor" , "password" : "tek_supervisor"}
When method post
Then status 200
And print response
Given path "/api/accounts/get-account"
And header Authorization = "Bearer " + response.token
And param primaryPersonId = 6810
When method get
Then status 200
And print response
And assert response.primaryPerson.email == "nawidjan1200@hotmail.com"
