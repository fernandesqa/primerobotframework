*** Settings ***

Resource    ../../config/package.robot

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


Dado que o cliente esteja na tela de cadastro
    # Ir para a página de criação de usuário
    Go To    https://automacaocombatista.herokuapp.com/users/new
    # Aguarde o título Novo Usuário ser apresentado
    Wait Until Element Is Visible    xpath=//h5[text()='Novo Usuário!!']

E preencher os campos
    # Preenche os campos do formulário
    Input Text    user_name    ${NOVO_USUARIO.nome}
    Input Text    user_lastname    ${NOVO_USUARIO.sobrenome}
    Input Text    user_email    ${NOVO_USUARIO.email}
    Input Text    user_address   ${NOVO_USUARIO.endereco}
    Input Text    user_university    ${NOVO_USUARIO.universidade}
    Input Text    user_profile    ${NOVO_USUARIO.profissao}
    Input Text    user_gender    ${NOVO_USUARIO.genero}
    Input Text    user_age    ${NOVO_USUARIO.idade}

E preencher todos os campos menos o email
    Input Text    user_name    ${NOVO_USUARIO.nome}
    Input Text    user_lastname    ${NOVO_USUARIO.sobrenome}
    Input Text    user_address   ${NOVO_USUARIO.endereco}
    Input Text    user_university    ${NOVO_USUARIO.universidade}
    Input Text    user_profile    ${NOVO_USUARIO.profissao}
    Input Text    user_gender    ${NOVO_USUARIO.genero}
    Input Text    user_age    ${NOVO_USUARIO.idade}

Quando clicar em Criar
    # Clica no botão Criar
    Click Element    xpath=//input[@type="submit"]

Então deve ser apresentada a mensagem "Usuário croado com sucesso"
    # Aguarda a mensagem de sucesso ser exibida
    Wait Until Element Is Visible    xpath=//p[text()="Usuário Criado com sucesso"]
    
    Page Should Contain    ${NOVO_USUARIO.nome}
    Page Should Contain    ${NOVO_USUARIO.sobrenome}
    Page Should Contain    ${NOVO_USUARIO.email}
    Page Should Contain    ${NOVO_USUARIO.endereco}
    Page Should Contain    ${NOVO_USUARIO.universidade}
    Page Should Contain    ${NOVO_USUARIO.profissao}
    Page Should Contain    ${NOVO_USUARIO.genero}
    Page Should Contain    ${NOVO_USUARIO.idade}

Então deve ser apresentada a mensagem "Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank"
    Wait Until Element Is Visible    xpath=//li[text()="Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank"]
    Page Should Contain Element    xpath=//li[text()="Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank"]

Acessar a página home do site Automation Pratice
    Go To    http://automationpractice.com/index.php
Digitar o nome do produto Blouse no campo de Pesquisar
    # Aguarda o campo de pesquisa estar habilitado
    Wait Until Element Is Enabled    search_query_top
    # Inputa dado no campo
    Input Text    search_query_top    Blouse
Clicar no botão Pesquisar
    Click Button    xpath=//button[@name="submit_search"]
Conferir se o produto Blouse foi listado no site
    Wait Until Element Is Visible    css=.product_list
    Scroll Element Into View    css=.product_list