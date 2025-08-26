*** Settings ***
Documentation   To validate Login form
Library         SeleniumLibrary
Library         DataDriver    file=resources/data.csv    encoding=utf-8    dialect=unix
Resource        ../PO/Generic.robot
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser
Test Template   Validate Unsuccessful Login

*** Test Cases ***
Login with invalid username ${username} and password ${password}    xyz    123456


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${username}    ${password}
    Wait until it checks and display error message
    Verify error message is correct

Open the browser with the Mortgage payment url
    Open Browser    ${URL}    Chrome

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}    

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.