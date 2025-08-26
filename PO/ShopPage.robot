*** Settings ***
Documentation    All the page objects and keyboards of Shop page.
...
...              The system specific keywords created here form our own
...              domain specific language (DSL) for web testing. They utilize
...              SeleniumLibrary keywords to perform actions on the web.
Library          SeleniumLibrary

*** Variables ***
${Shop_Page_Load}        css=.nav-link

*** Keywords ***
Wait until element is located in the page
    Wait Until Element Is Visible  ${Shop_Page_Load}

Verify card titles in the shop page
    @{expectedList} =  Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =  Get WebElements    css=.card-title
    FOR   ${element}    IN    @{elements}
          ${text} =  Get Text    ${element}
            Log    ${text}
        Should Contain    ${expectedList}    ${text}
    END

Add to cart
    [Arguments]   ${cardName}
    ${elements} =  Get WebElements    css=.card-title
    ${index}=   Set Variable    1
    FOR   ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=   Evaluate   ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button 