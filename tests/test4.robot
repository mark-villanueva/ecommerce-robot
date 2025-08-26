*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Unsuccessful Login

*** Variables ***
${URL}                   https://rahulshettyacademy.com/loginpagePractise/  
${Error_Message_Login}   css=.alert-danger

*** Test Cases ***        username        password
Invalid username          dsahed          learning
Invalid password          rahulshetty     ploudfg
Special characters        rahulshetty@#   learn$ing


*** Keywords ***
Fill the login form
    [Arguments]     ${username}    ${password}
    Input Text      id=username    ${username}
    Input Password  id=password    ${password} 
    Click Button    id=signInBtn

Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open the browser with the Mortgage payment url
    Fill the login form    ${username}    ${password}
    Wait until it checks and display error message    
    Verify error message is correct

Open the browser with the Mortgage payment url
    Open Browser    ${URL}    Chrome

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}    

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.