*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/login
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//span[starts-with(@class,'MuiButton-label')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${ERRORMESSAGE}      xpath=//*/div/div[1]/div[3]/span

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in invalid password
    Click on the Submit button
    Assert error message
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in

Type in email
    Input Text   ${EMAILINPUT}   user07@getnada.com

Type in invalid password
    Input Text  ${PASSWORDINPUT}    Test4321

Click on the Submit button
    Click Element   ${SIGNINBUTTON}

Assert error message
    Wait Until Page Contains Element     ${ERRORMESSAGE}    timeout=5s
    Element Text Should Be     ${ERRORMESSAGE}    Identifier or password invalid.
    Capture Page Screenshot     C:/Users/Anita/Documents/GitHub/panelscout_robotframework/screenshots/error_message_screenshot.png
