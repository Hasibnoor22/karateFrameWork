Feature: Updating Phone API


	@updatePhone
  Scenario: Update Phone number
    Given url appURL
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def postRequest = callonce read("phoneAPI.feature")
    * def phoneID = postRequest.response.id
    * def primarypersonID = postRequest.idValue
    * param primaryPersonId = primarypersonID
    * path "api/accounts/update-account-phone"
    * request
      """
      {
      "id": "#(phoneID)",
      "phoneNumber": "202-101-5555",
      "phoneExtension": "519",
      "phoneTime": "Day",
      "phoneType": "Home"
      }
      """
    * method put
    * print response
    * status 200