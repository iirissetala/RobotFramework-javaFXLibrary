*** Settings ***
Library    Remote    http://localhost:8270    WITH NAME    JavaFXLibrary
Library    Collections

Suite Setup    Avaa sovellus
Suite Teardown    Close Javafx Application

*** Variables ***
${fxristinolla}    C:\\Users\\iisetala\\Omat jar tiedostot\\FXRistinolla.jar    

*** Keywords ***
Avaa sovellus
    Launch Javafx Application    ${fxristinolla} 
        
*** Test Cases ***
Napin painalluksesta teksti muuttuu
    ${napit}    Find All    .button
    Log List    ${napit}
    Click On    ${napit}[5]
    Node Should Have Text    ${napit}[5]    X 
    Node Should Not Have Text    ${napit}[5]    O
    Capture image    ${napit}[5]
    
Varatun paikan napin klikkaus antaa ilmoituksen
    ${napit}    Find All    .button
    Click On    ${napit}[5]
    ${ilmoitukset}    Find All   .label  
    Node Should Have Text    ${ilmoitukset}[0]    Vuoro: O
    Node Should Have Text    ${ilmoitukset}[1]    Ruutu on jo varattu, valitse toinen ruutu
    Capture Image    
    
Nappeihin tulee oikea merkki ja vuoro paivittyy
    ${napit}    Find All    .button
    ${ilmoitukset}    Find All    .label
    Click On    ${napit}[0]
    Node Should Have Text    ${napit}[0]    O
    Node Should Have Text    ${ilmoitukset}[0]    Vuoro: X
    Click On     ${napit}[4]
    Node Should Have Text    ${napit}[4]    X
    Node Should Have Text    ${ilmoitukset}[0]    Vuoro: O
    Node Should Have Text    ${napit}[1]    ${SPACE}
    Capture Image
    
    
    
    