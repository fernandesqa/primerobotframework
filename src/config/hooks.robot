*** Settings ***
Documentation     Aqui estarão presentes todos os arquivos para inicialização e finalização de testes
Resource          package.robot

*** Keywords ***
Abrir navegador
    Open Browser    about:blank    ${CONFIG.BROWSER_NAME}
    GO TO    ${CONFIG.URL}
    # Maximizar a tela do navegador
    Maximize Browser Window

Fechar navegador
    # pós teste finalizado
    Close Browser
