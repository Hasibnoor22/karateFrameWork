Feature: Phone API

	
	@phoneTest
  Scenario: Adding Phone number
    Given url appURL
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def postRequest = callonce read("EndToEnd.feature")
    * def idValue = postRequest.response.id
    * param primaryPersonId = idValue
    * path "api/accounts/add-account-phone"
    * request
      """
      {
      "id": 0,
      "phoneNumber": "202-101-2299",
      "phoneExtension": "519",
      "phoneTime": "Day",
      "phoneType": "Home"
      }
      """
      * method post 
      * print response
      * status 201
      
      
