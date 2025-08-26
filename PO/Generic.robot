*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The system specific keywords created here form our own
...              domain specific language (DSL) for web testing. They utilize
...              SeleniumLibrary keywords to perform actions on the web.
Library          SeleniumLibrary
Library          String
Library          Collections



*** Variables ***
${URL}                   https://rahulshettyacademy.com/loginpagePractise/    
${User_Name}             rahulshettyacademy
${Invalid_Password}      learning2
${Valid_Password}        learning
${Error_Message_Login}   css=.alert-danger

*** Keywords ***

Open the browser with the Mortgage payment url
    Open Browser    ${URL}  
    
Fill the login form
    [Arguments]     ${username}    ${password}
    Input Text      id=username    ${username}
    Input Password  id=password    ${password} 
    Click Button    id=signInBtn

Wait until element is located in the page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible  ${page_locator}



