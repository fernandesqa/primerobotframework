*** Settings ***
Resource          ../../config/package.robot
Library           FakerLibrary

*** Keywords ***
Acessar a tela de login
    Wait Until Element Is Visible    ${HOME_PAGE.link_signin}
    Click Element    ${HOME_PAGE.link_signin}

Inserir um novo e-mail na área Create Account
    ${FAKE_EMAIL}    FakerLibrary.Free Email
    Wait Until Element Is Enabled    ${AUTHENTICATION_PAGE.input_email_create}
    Input Text    ${AUTHENTICATION_PAGE.input_email_create}    ${FAKE_EMAIL}

Clicar no botão Create an account
    Click Element    ${AUTHENTICATION_PAGE.button_create_an_account}

Preencher o formulário de cadastro e concluir o registro
    ${FAKE_FIRST_NAME}    FakerLibrary.Name Male
    Wait Until Element Is Enabled    ${ACCOUNT_CREATION_PAGE.radio_male_gender}
    Click Element    ${ACCOUNT_CREATION_PAGE.radio_male_gender}
    Input Text    ${ACCOUNT_CREATION_PAGE.input_first_name}    ${FAKE_FIRST_NAME}
