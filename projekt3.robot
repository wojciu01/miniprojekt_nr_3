*** Settings ***
Library  Selenium2Library
Test Setup  Open Browser To Login Page
Test Teardown  Close Browser

*** Variables ***
${WEBSITE}  https://www.olx.pl/
${VALID_JOB}  QA
${VALID_CITY}  Przemyśl


*** Test Cases ***
Go To Website And Find Job Position
  Click Element  //a[@data-id="4"]
  Click Link  //a[@href='https://www.olx.pl/praca/informatyka/']
  Input text  //input[@id="search-text"]  ${VALID_JOB}
  Input text  //input[@id="cityField"]  ${VALID_CITY}
  Click Button  //input[@type="submit"]
  ${RESULT}=  Get Text  //span[@class='marker']
  Should be equal  ${RESULT}  Sprawdź poprawność albo spróbuj bardziej ogólnego zapytania

*** Keywords ***
Open Browser To Login Page
  Open Browser  ${WEBSITE}
  Maximize Browser Window

User Click
  [Arguments]  ${ELEMENT}
  Scroll Element Into View  ${ELEMENT}
  Wait Until Element is visible  ${ELEMENT}     timeout=5s
  Click Element  ${ELEMENT}
