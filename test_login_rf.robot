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

*** Test Cases ***
Login to the system
    Open login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
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
    Capture Page Screenshot  alert.png
