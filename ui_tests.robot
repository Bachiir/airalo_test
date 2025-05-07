*** Settings ***
Library           SeleniumLibrary
Resource          variables.robot

*** Test Cases ***
Search And Verify Japan Esim
    Open Browser    ${UI_BASE_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@placeholder='Search data packs for 200+ countries and regions']
    Input Text    //input[@placeholder='Search data packs for 200+ countries and regions']    Japa
    sleep   5s
    Wait Until Element Is Visible    xpath=//ul//li[contains(., "Japan")]
    Click Element     xpath=//ul//li[contains(., "Japan")]
    Wait Until Page Contains Element   //div[@class='store-container']//div[2]//a[1]//div[1]//div[3]//div[1]//button[1]
    Click Element    //div[@class='store-container']//div[2]//a[1]//div[1]//div[3]//div[1]//button[1]
    Wait Until Page Contains    Moshi Moshi
    Page Should Contain    Japan
    Page Should Contain    1 GB
    Page Should Contain    7 days
    Page Should Contain    4.50
    Close Browser
