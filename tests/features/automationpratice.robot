*** Settings ***
Resource         ../../src/config/package.robot

Test Setup       Abrir navegador
Test Teardown    Fechar navegador


*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site Automation Pratice
    Digitar o nome do produto Blouse no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir se o produto Blouse foi listado no site