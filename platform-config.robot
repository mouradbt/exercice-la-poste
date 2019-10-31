*** Settings ***
Library           Selenium2Library
Library           String
Library           AutoItLibrary

*** Variables ***
${url-laPoste}    https://www.laposte.fr
${headless}       false
${browser}        Chrome
${seleniumTimeout}    10s
${compte-mail-la-poste}    mourad.bentanfous@sofrecom.com
${password-mail-la-poste}    Admin@123
