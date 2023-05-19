@Regression
Feature: End 2 End Account Testing

Background: Api Setup
		And def tokenfeature = callonce read('GenerateToken.feature')
		* def token = tokenfeature.response.token
		Given url "https://tek-insurance-api.azurewebsites.net"
		
Scenario: Create Account with Random Email
    * def dataGenerator = Java.type('api.data.GenerateData')
    * def autoEmail = dataGenerator.getEmail()
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + token
    And request
      """
      {
      "email": "#(autoEmail)",
      "firstName": "Nawidak",
      "lastName": "Qand",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Software Tester",
      "dateOfBirth": "1998-02-27"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail
    * def id = response.id

 		Given path "/api/accounts/add-account-address"
 		And header Authorization = "Bearer " + token
 		And param primaryPersonId = id
 		And request
 		"""
 		{
  "addressType": "Home",
  "addressLine1": "2451, lincolin rd",
  "city": "Arlington",
  "state": "NY",
  "postalCode": "25482",
  "countryCode": "+1",
  "current": true
}
 		""" 
 		When method post
 		Then status 201
 		And print response

			Given path "/api/accounts/add-account-car"
			And header Authorization = "Bearer " + token
			And param primaryPersonId = id
			And request
 		"""
 		{
  "make": "BMW",
  "model": "330",
  "year": "2020",
  "licensePlate": "KING"
}
 		"""
 		When method post
 		Then status 201
 		
 		Given path "/api/accounts/add-account-phone"
 		And header Authorization = "Bearer " + token
    And param primaryPersonId = id
 		And request
 		"""
 		{
  "phoneNumber": "5487895623",
  "phoneExtension": "Verizon",
  "phoneTime": "Morning",
  "phoneType": "Home"
}
 		"""
 		When method post 
 		Then status 201
 		And print response
 		
