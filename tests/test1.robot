*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Test Teardown   Close Browser

*** Test Cases ***
Validate Unsuccessful Login
    Open the browser with the Mortgage payment url
    Fill the login form
    Wait until it checks and display error message
    Verify error message is correct

*** Variables ***
${URL}                   https://rahulshettyacademy.com/loginpagePractise/
${Error_Message_Login}   css=.alert-danger

*** Keywords ***
Open the browser with the Mortgage payment url
    Open Browser    ${URL}    Chrome

Fill the login form
    Input Text      id=username    rahulshettyacademy1
    Input Text      id=password    learning
    Click Button    id=signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}    

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.