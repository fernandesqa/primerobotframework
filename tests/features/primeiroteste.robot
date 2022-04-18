*** Settings ***
Documentation    Aqui estarão todos os testes iniciais do curso de Robot Framework Básico

Resource    ../../src/config/package.robot

*** Variables ***
&{PESSOA}    
...    nome=Lucas    
...    sobrenome=Fernandes    
...    idade=31    
...    cpf=12345678925    
...    rg=451287934

@{FRUTAS}
...    abacaxi
...    caju
...    morango
...    pera

*** Test Cases ***
Cenario 1: Imprimir dicionario no console
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}

Cenario 2: Imprimir lista de frutas no console
    [Tags]    lista
    Log To Console    \n${FRUTAS[0]}
    Log To Console       ${FRUTAS[1]}
    Log To Console       ${FRUTAS[2]}
    Log To Console       ${FRUTAS[3]}

Cenario 3: Somar dois números
    [Tags]    Somar
    Somar os números "25" e "5"

Cenario 4: Criar um e-mail
    [Tags]    Email 
    Criar um e-mail    ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.idade}

Cenario 5: Contar de 0 a 9
    [Tags]    Contar
    Contar de 0 a 9

Cenario 6: Percorrer a lista de frutas
    [Tags]    frutas
    Percorrer a lista de frutas    @{FRUTAS}

Cenario 7: Informe em qual número estou
    [Tags]    numero
    Informar em qual numero estou

Cenario 8: Tomar decisões
    [Tags]    decisoes
    Tomar decisões    Ramon    

*** Keywords ***
Somar dois números
    [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]    ${SOMA}

Somar os números "${NUM_A}" e "${NUM_B}"
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}
    [Return]    ${SOMA}

Criar um e-mail
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    ${EMAIL}    Catenate    SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
    Log To Console    ${EMAIL}
    [Return]    ${EMAIL}

Contar de 0 a 9
    FOR    ${contador}    IN RANGE   0    10
        Log To Console  ${contador}
    END        

Percorrer a lista de frutas
    [Arguments]    @{FRUTAS}  
    FOR    ${counter}    IN     @{FRUTAS}  
      Log To Console    ${counter}
    END

Informar em qual numero estou
    FOR    ${contador}    IN RANGE   0    11
        IF    ${contador} == 5 or ${contador} == 8
            ${FRASE}    Catenate    SEPARATOR=    Estou no número ${contador}
            Log To Console  ${FRASE}
        END
    END        

Tomar decisões
    [Arguments]    ${NOME}
    IF    "${NOME}"=="Maria"
        Log To Console    Vou fazer isso aqui só quando for a Maria!
    ELSE IF    "${NOME}"=="João"
        Log To Console    Vou fazer isso aqui só quando for o João!
    ELSE  
        Log To Console    Vou fazer isso aqui só quando for qualquer outra pessoa!
    END


 

