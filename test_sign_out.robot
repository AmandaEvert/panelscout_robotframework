*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//span[starts-with(@class,'MuiButton-label')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//main/div[3]/div[1]/div/div[1]
${SIGNOUTBUTTON}        xpath=//span[text()='Sign out']

*** Test Cases ***
Login to the system
    Open login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Sign out button
    Assert login page
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text  ${PASSWORDINPUT}    Test-1234
CLick on the Submit button
    Click Element   xpath=//span[starts-with(@class,'MuiButton-label')]
Assert dashboard
    Wait Until Keyword Succeeds    1 min    1 sec   Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be     Scouts panel
Click on the Sign out button
    Click Element    ${SIGNOUTBUTTON}
Assert login page
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    C:/Users/Anita/Documents/GitHub/panelscout_robotframework/screenshots/sign_out_screenshot.png

