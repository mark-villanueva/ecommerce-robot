*** Settings ***
Documentation    All the page objects and keyboards of Landing page.
...
...              The system specific keywords created here form our own
...              domain specific language (DSL) for web testing. They utilize
...              SeleniumLibrary keywords to perform actions on the web.
Library          SeleniumLibrary

*** Variables ***
${Error_Message_Login}   css=.alert-danger

*** Keywords ***
Fill the login form
    [Arguments]     ${username}    ${password}
    Input Text      id=username    ${username}
    Input Password  id=password    ${password} 
    Click Button    id=signInBtn

Wait until element is located in the page
    Wait Until Element Is Visible  ${Error_Message_Login}

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password. 

Fill the login details and login form
    Input Text      id=username    rahulshettyacademy
    Input Password  id=password    learning
    Click Element   css=input[value='user']    
    Wait Until Element Is Visible     css=.modal-body     
    Click Element   id=okayBtn
    Click Element   id=okayBtn
    Wait Until Element Is Not Visible   css=.modal-body
    Select From List By Value   css=select.form-control    teach
    Select Checkbox   id=terms
    Checkbox Should Be Selected   id=terms
    Click Button   id=signInBtn
