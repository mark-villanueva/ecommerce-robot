from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.selLib = None

    def _get_selenium_library(self):
        if not self.selLib:
            self.selLib = BuiltIn().get_library_instance('SeleniumLibrary')
        return self.selLib

    @keyword
    def hello_world(self):
        BuiltIn().log_to_console("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        selLib = self._get_selenium_library()
        i = 1
        productsTitles = selLib.get_webelements("css=.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                selLib.click_element("xpath=(//*[@class='card-footer'])[" + str(i) + "]/button[contains(., 'Add')]")
            i = i + 1
            
        selLib.wait_until_element_is_visible("css=li.active a")
        selLib.click_link("css=li.active a")

