*** Settings ***
Documentation    All the page objects and keyboards of Shop page.
...
...              The system specific keywords created here form our own
...              domain specific language (DSL) for web testing. They utilize
...              SeleniumLibrary keywords to perform actions on the web.
Library          SeleniumLibrary
Resource        ../PO/Generic.robot

*** Variables ***
${Shop_Page_Load}     css=.nav-link
${country_location}   //a[text()='San Marino']


*** Keywords ***

Enter the Country and select terms
    [Arguments]    ${country_name}
    Input Text     country     ${country_name}
    Wait Until Page Contains Element          //a[text()='${country_name}']    15s
    Click Element   //a[text()='${country_name}']
    Click Element   css=.checkbox label

Purchase the Product and Confirm the Purchase
    Click Button    css=.btn-success
    Page Should Contain    Success!