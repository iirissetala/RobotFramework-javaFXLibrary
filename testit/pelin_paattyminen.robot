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
Voiton jalkeen teksti paivittyy
    ${napit}    Find All    .button
    Click On    ${napit}[0]
    Click On    ${napit}[3]
    Click On    ${napit}[4]
    Click On    ${napit}[5]
    Click On    ${napit}[8]
    ${ilmoitus}    Find    .label
    Node Should Have Text    ${ilmoitus}    Loppu! 
    
Voiton jalkeen ei voi enaa tehda siirtoja
    ${napit}    Find All    css=Button
    Click On    ${napit}[0]
    ${ilmoitukset}    Find All    css=Label
    Log List    ${ilmoitukset}
    Node Should Have Text    ${ilmoitukset}[0]    Loppu!
    Node Should Have Text    ${ilmoitukset}[1]    Peli on loppu, ei siirtoja
    
    
    