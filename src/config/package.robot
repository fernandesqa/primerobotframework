*** Settings ***
Documentation     Aqui ficarão todas as dependências
Library           SeleniumLibrary
##########################################
#                 Keywords    #
##########################################
Resource          ../auto/keywords/kws_webrobot.robot
Resource          ../auto/keywords/register.robot
##########################################
#                 Config    #
##########################################
Resource          hooks.robot
Variables         hooks.yaml
Variables         ../auto/data/register.yaml
##########################################
#                 Pages    #
##########################################
Resource          ../auto/pages/home.robot
Resource          ../auto/pages/authentication.robot
Resource          ../auto/pages/accountcreation.robot
