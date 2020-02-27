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
        
Ikkunalista konsoliin
    ${ikkunat}=    List Windows 
    Log To Console    ${ikkunat} 
    Log List   ${ikkunat}

*** Test Cases ***
Listaa ikkunat
    Ikkunalista konsoliin
    
Sovellus avautuu X:n vuorolla
    ${teksti}    Find    .label    
    Node Should Have Text    .label    Vuoro: X
    Capture Image    ${teksti}
    
Kaikki napit ovat tyhjia avatessa
    ${napit}    Find All    .button
    :FOR    ${nappi}    IN    @{napit}
    \    ${teksti}=    Get Node Text    ${nappi}
    \    Should Not Contain Any    ${teksti}    X    O
    
    
    

    
    