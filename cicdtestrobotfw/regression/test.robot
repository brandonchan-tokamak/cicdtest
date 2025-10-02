*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SITE_URL}       https://brandonchan-tokamak.github.io/cicdtest/

*** Test Cases ***
Page Title Should Be Correct
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --remote-debugging-port=9222
    Create WebDriver    Chrome    options=${options}
    Go To    ${SITE_URL}
    Title Should Be    CI/CD Test Website
    Close Browser