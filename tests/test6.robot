*** Settings ***
Documentation   To validate Login form
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser     
Library         ../customLibraries/Shop.py
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/Confirmation Page.robot

*** Variables ***
@{listofProducts}      iphone X    Nokia Edge
${country_name}        India

*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    SMOKE
    LandingPage.Fill the login form   ${User_Name}    ${Invalid_Password}
    LandingPage.Wait until element is located in the page   
    LandingPage.Verify error message is correct

End to end ecommerce test
    [Tags]    REGRESSION
    LandingPage.Fill the login form   ${User_Name}    ${Valid_Password}
    ShopPage.Wait until element is located in the page
    ShopPage.Verify card titles in the shop page
    Add items to cart and checkout       ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    Confirmation Page.Enter the Country and select terms    ${country_name}
    Confirmation Page.Purchase the Product and Confirm the Purchase
