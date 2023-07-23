*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}               https://scouts-test.futbolkolektyw.pl/en
${BROWSER}                 Chrome
${SIGNINBUTTON}            xpath=//span[starts-with(@class,'MuiButton-label')]
${EMAILINPUT}              xpath=//*[@id='login']
${PASSWORDINPUT}           xpath=//*[@id='password']
${PAGELOGO}                xpath=//main/div[3]/div[1]/div/div[1]
${ADDAPLAYERBUTTON}        xpath=//*/div[2]/div/div/a/button/span[1]
${EMAILPLAYERINPUT}        xpath=//*[@name='email']
${NAMEINPUT}               xpath=//*[@name='name']
${SURNAMEINPUT}            xpath=//*[@name='surname']
${AGEINPUT}                xpath=//*[@name='age']
${MAINPOSITIONINPUT}       xpath=//*[@name='mainPosition']
${LEGDROPDOWNBUTTON}       xpath=//*[@id='mui-component-select-leg']
${LEFTLEGDROPDOWNBUTTON}   xpath=//*[@data-value='left']
${MAINPAGEBUTTON}          xpath=//div/div/div/ul[1]/div[1]/div[2]/span
${SUBMITBUTTON}            xpath=//*/div[3]/button[1]/span[1]
${LASTCREATEDPLAYER}       xpath=//*/div[3]/div/div/a[1]/button/span[1]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Add a player button
    Type in player email
    Type in Name
    Type in Surname
    Type in Age
    Type in Main Position
    Click on the Submit button
    Click on the Main Page button
    Assert Last created player
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in

Type in email
    Input Text   ${EMAILINPUT}   user07@getnada.com

Type in password
    Input Text  ${PASSWORDINPUT}    Test-1234

Click on the Sign in button
    Click Element   ${SIGNINBUTTON}

Click on the Add a player button
    Wait Until Page Contains Element    ${ADDAPLAYERBUTTON}
    Click Element       ${ADDAPLAYERBUTTON}

Type in player email
    Wait Until Element Is Visible    ${EMAILPLAYERINPUT}
    Input Text      ${EMAILPLAYERINPUT}     ewa.loki@o2.pl

Type in Name
    Input Text      ${NAMEINPUT}        Ewa

Type in Surname
    Input Text      ${SURNAMEINPUT}     Kowalska

Type in Age
    Input Text      ${AGEINPUT}       10.12.2002

Type in Main Position
    Input Text      ${MAINPOSITIONINPUT}       365

Click on the Submit button
    Wait Until Page Contains Element    ${SUBMITBUTTON}
    Click Element       ${SUBMITBUTTON}

Click on the Main Page button
    Wait Until Page Contains Element    ${MAINPAGEBUTTON}
    Click Element    ${MAINPAGEBUTTON}

Assert Last created player
    Wait Until Keyword Succeeds    1 min    1 sec   Wait Until Element Is Visible    ${LASTCREATEDPLAYER}
    Element Text Should Be    ${LASTCREATEDPLAYER}    EWA KOWALSKA
    Capture Page Screenshot    C:/Users/Anita/Documents/GitHub/panelscout_robotframework/screenshots/add_a_player_screenshot.png
