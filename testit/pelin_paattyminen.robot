*** Settings ***
Library    Remote    http://localhost:8270    WITH NAME    JavaFXLibrary
Suite Setup    Avaa sovellus
Suite Teardown    Close Javafx Application

*** Variables ***
${fxristinolla}    C:\\Users\\iisetala\\Desktop\\FXRistinolla.jar

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
    Sleep    2s
    ${ilmoitus}    Find    .label
    Node Should Have Text    ${ilmoitus}    Loppu! 
    
Voiton jalkeen ei voi enaa tehda siirtoja
    ${napit}    Find All    css=Button
    Click On    ${napit}[0]
    Sleep    2s
    ${ilmoitukset}    Find All    css=Label
    Node Should Have Text    ${ilmoitukset}[0]    Loppu!
    Node Should Have Text    ${ilmoitukset}[1]    Peli on loppu, ei siirtoja
    
    
    