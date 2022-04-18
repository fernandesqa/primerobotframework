*** Settings ***
Resource         ../../src/config/package.robot

Test Setup       Abrir navegador
Test Teardown    Fechar navegador

*** Test Case ***
Registrar um novo usuário
    Acessar a tela de login
    Inserir um novo e-mail na área Create Account
    Clicar no botão Create an account
    Preencher o formulário de cadastro e concluir o registro

