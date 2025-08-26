*** Settings ***
Documentation    All the page objects and keyboards of Shop page.
...
...              The system specific keywords created here form our own
...              domain specific language (DSL) for web testing. They utilize
...              SeleniumLibrary keywords to perform actions on the web.
Library          SeleniumLibrary

*** Variables ***
${Shop_Page_Load}     css=.nav-link

*** Keywords ***
Verify items in the Checkout Page and proceed
    Click Button    css=.btn-success