Feature: API Test Security Section

Scenario: Create token with valid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor" , "password": "tek_supervisor"}
When method post
Then status 200
And print response

Scenario: Validate token with invalid username
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor1" , "password": "tek_supervisor"}
When method post
Then status 400
And print response
And assert response.errorMessage == "User not found"

Scenario: Validate token with valid username and invalid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor" , "password": "tekk_supervisor"}
When method post
Then status 400
And print response
And assert response.errorMessage == "Password Not Matched"
And assert response.httpStatus == " BAD_REQUEST"