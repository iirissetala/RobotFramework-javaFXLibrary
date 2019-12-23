*** Settings ***
Library    Remote    http://localhost:8270    WITH NAME    JavaFXLibrary
Suite Setup    Avaa sovellus
Suite Teardown    Close Javafx Application

*** Variables ***
${fxristinolla}    C:\\Users\\iisetala\\Desktop\\FXRistinolla.jar

*** Keywords ***
Avaa sovellus
    Launch Javafx Application    ${fxristinolla} 
    
Kaikissa napeissa X tai O
    ${napit}    Find All    .button
    :FOR    ${nappi}    IN    @{napit}
    \    Node Should Not Have Text    ${nappi}     X || O  
           
*** Test Cases ***
Tasapelin jalkeen ei tyhjia nappeja
    ${napit}    Find All    .button
    Click On    ${napit}[0]
    Click On    ${napit}[1]
    Click On    ${napit}[2]
    Click On    ${napit}[3]
    Click On    ${napit}[4]
    Click On    ${napit}[6]
    Click On    ${napit}[5]
    Click On    ${napit}[8]
    Click On    ${napit}[7]
    Kaikissa napeissa X tai O
    
Tasapelin jalkeen oikea ilmoitus
    ${ilmoitukset}    Find All    .label
    Node Should Have Text    ${ilmoitukset}[0]    Tasapeli!
    ${nappi}    Find    .button
    Click On    ${nappi}
    Node Should Have Text    ${ilmoitukset}[1]    Peli on loppu, ei siirtoja