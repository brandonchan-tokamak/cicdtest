*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SITE_URL}       https://brandonchan-tokamak.github.io/cicdtest/

*** Test Cases ***
Click Button and Verify Contents
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create WebDriver    Chrome    options=${options}
    Go To    ${SITE_URL}
    Title Should Be    CI/CD Test Website
    Sleep    2s
    Click Element    id:testBtn
    Sleep    2s
    Close Browser
