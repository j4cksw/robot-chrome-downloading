*** Settings ***
Library    Selenium2Library
Library    OperatingSystem

*** Test Case ***
Download success
    Open Chrome with download options
    Click Link    Download
    Wait Until Created    /Users/JackSW/Downloads/sample.zip
    Remove File    /Users/JackSW/Downloads/sample.zip
    Close All Browsers

*** Keywords ***
Open Chrome with download options
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}=    Create Dictionary    profile.default_content_settings.popups=0
    ${options._experimental_options['prefs']}=  Set Variable  ${prefs}  

    Create WebDriver  Chrome  chrome_options=${options}

    Go to    http://localhost:8080