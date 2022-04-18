*** Settings ***
Documentation    Aqui estarão todos testes autoatizados do módulo de automação web
Library    SeleniumLibrary

Resource    ../../src/config/package.robot

Test Setup    Abrir navegador
Test Teardown    Fechar navegador
*** Variables ***
&{NOVO_USUARIO}
...    nome=Lucas
...    sobrenome=Fernandes
...    email=lucas@fernandes.com
...    endereco=rua das flores
...    universidade=usp
...    profissao=Analista de Testes
...    genero=Masculino
...    idade=31

*** Test Cases ***
Cenário 1: Criar usuário com sucesso
    [Tags]    abre_nav
    Dado que o cliente esteja na tela de cadastro
    E preencher os campos
    Quando clicar em Criar
    Então deve ser apresentada a mensagem "Usuário croado com sucesso"

Cenário 2: Tentar cadastrar novo usuário sem email
    [Tags]    ct_2
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos menos o email
    Quando clicar em Criar
    Então deve ser apresentada a mensagem "Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank"





