*** Settings ***
Documentation   To validate Login form
Test Setup      Open the browser with the Mortgage payment url
#Test Teardown   Close Browser
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot

*** Test Cases ***
Validate Unsuccessful Login
    LandingPage.Fill the login form   ${User_Name}    ${Invalid_Password}
    LandingPage.Wait until element is located in the page   
    LandingPage.Verify error message is correct

Validate Cards display in the Shopping Page
    Generic.Fill the login form   ${User_Name}    ${Valid_Password}
    ShopPage.Wait until element is located in the page
    ShopPage.Verify card titles in the shop page
    ShopPage.Add to cart   Nokia Edge

Select the Form and navigate to Child Window
    Fill the login details and login form
