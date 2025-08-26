*** Settings ***
Documentation   To validate Login form
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser
Resource        ../PO/Generic.robot

*** Test Cases ***

Validate Child Window Functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the email id from the child window
    Switch back to parent window and enter the email in the form


*** Keywords ***
Select the link of child window
    Click Link    xpath=//a[contains(text(),'Free Access to InterviewQues/ResumeAssistance/Material')]

Verify the user is switched to child window
    Switch Window    NEW
    Wait Until Element Is Visible     css=h1    
    Element Text Should Be   css=h1    DOCUMENTS REQUEST

Grab the email id from the child window
    ${text}=    Get Text    css=.red
    ${words}=   Split String    ${text}    at
    #0 -> Please email us at
    #1 -> mentor@rahulshettyacademy.com with below template to receive response   
    ${text_split}=    Get From List    ${words}    1
    log     ${text_split}
    @{words_2}=   Split String    ${text_split}    
    #0 -> mentor@rahulshettyacademy.com
    ${email}=    Get From List   ${words_2}    0
    Set Global Variable    ${email}

Switch back to parent window and enter the email in the form
    Switch Window      MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text         id=username     ${email}
    




