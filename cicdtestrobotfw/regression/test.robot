*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SITE_URL}       https://brandonchan-tokamak.github.io/cicdtest/

*** Test Cases ***
Page Title Should Be Correct
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create WebDriver    Chrome    options=${options}
    Go To    ${SITE_URL}
    Title Should Be    CI/CD Test Website
    Close Browser
