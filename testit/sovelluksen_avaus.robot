*** Settings ***
Library    Remote    http://localhost:8270    WITH NAME    JavaFXLibrary
Suite Setup    Avaa sovellus
Suite Teardown    Close Javafx Application

*** Variables ***
${ristinolla}    C:\\Users\\iisetala\\Desktop\\Ristinolla.jar
${klikkilaskuri}    C:\\Users\\iisetala\\Desktop\\Klikkilaskuri_javaFX.jar
${fxristinolla}    C:\\Users\\iisetala\\Desktop\\FXRistinolla.jar


*** Keywords ***
Avaa sovellus
    Launch Javafx Application    ${fxristinolla}  
        
Ikkunalista konsoliin
    ${ikkunat}=    List Windows 
    Log To Console    ${ikkunat} 
    Log    ${ikkunat}

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
    \    Node Should Not Have Text    .button    X
    \    Node Should Not Have Text    .button    O
    
    
    

    
    