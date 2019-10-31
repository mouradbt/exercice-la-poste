*** Settings ***
Resource          ../platform-config.robot

*** Keywords ***
open-browser-to-page
    [Documentation]    ce keyword permet le choix du navigateur et du mode de lancement "avec ou sans graphique"
    ...
    ...    le choix de paramètres suivants permet:
    ...
    ...    1- ${browser} = Chrome : permet le lancement des scripts sur le navigateur GoogleChrome
    ...     \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ = FireFox : permet le lancement des scripts sur le navigateur FireFox
    ...     \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ = IE: permet le lancement des scripts sur le navigateur InternetExploer
    ...    2- ${headless} = true : le lancement des scripts en mode sans graphique
    ...     \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ =false: le lancement des scripts avec graphique
    Set Selenium Timeout    ${seleniumTimeout}
    Run Keyword If    '${browser}' == 'Chrome'    open-chrome-browser-to-page
    ...    ELSE IF    '${browser}' == 'Firefox'    open-firefox-browser-to-page
    ...    ELSE IF    '${browser}' == 'IE'    open-ie-browser-to-page

open-firefox-browser-to-page
    Run Keyword If    '${headless}'=='true'    open-firefox-browser-to-page-headless-mode
    ...    ELSE IF    '${headless}'=='false'    open-firefox-browser-local-mode

open-ie-browser-to-page
    Run Keyword If    '${headless}'=='true'    open-ie-browser-to-page-headless-mode
    ...    ELSE IF    '${headless}'=='false'    open-ie-browser-local-mode

open-chrome-browser-local-mode
    open browser    ${url-laPoste}    ${browser}
    Maximize Browser Window

open-chrome-browser-to-page
    Run Keyword If    '${headless}'=='true'    open-chrome-browser-to-page-headless-mode
    ...    ELSE IF    '${headless}'=='false'    open-chrome-browser-local-mode

open-firefox-browser-to-page-headless-mode
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${firefox_options}    add_argument    --disable-extensions
    Call Method    ${firefox_options}    add_argument    --headless
    Call Method    ${firefox_options}    add_argument    --disable-gpu
    Call Method    ${firefox_options}    add_argument    --no-sandbox
    Create Webdriver    ${browser}    firefox_options=${firefox_options}
    Go To    ${url-laPoste}

open-firefox-browser-local-mode
    open browser    ${url-laPoste}    ${browser}
    Maximize Browser Window

open-ie-browser-to-page-headless-mode
    ${IE_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${IE_options}    add_argument    --disable-extensions
    Call Method    ${IE_options}    add_argument    --headless
    Call Method    ${IE_options}    add_argument    --disable-gpu
    Call Method    ${IE_options}    add_argument    --no-sandbox
    Create Webdriver    ${browser}    IE_options=${IE_options}
    Go To    ${url-laPoste}

open-chrome-browser-to-page-headless-mode
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    ${browser}    chrome_options=${chrome_options}
    Go To    ${url-laPoste}

open-ie-browser-local-mode
    open browser    ${url-laPoste}    ${browser}
    Maximize Browser Window
