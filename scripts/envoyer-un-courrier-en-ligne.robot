*** Settings ***
Resource          ../keywords/chose-browser-and-running-mode.robot
Resource          ../keywords/send-a-postal-mail-online.robot

*** Test Cases ***
envoyer-un-courrier-en-ligne-rediger-sur-le-site-de-la-poste
    [Documentation]    ce scénario permet l'envoi d'un courrier en ligne télécharger depuis votre ordinateur.
    ...    Etapes suivie au cours du scénario:
    ...
    ...    1- accéder à la page web de la poste
    ...    2- cliquer sur le menu "envoyer un colis ou un courrier
    ...    3- cliquer sur envoyer un courrier
    ...    4- choisir l'option lettre en ligne
    ...    5- accéder à la page pour choisir le type de courrier à envoyer
    ...    6- choisir l'option rédiger votre mail
    ...    7- choisir les options "couleur, format d'impression et adresse du destinataire"
    ...    8- saisir le nom de la lettre
    ...    9- ajouter un destinataire
    ...    10- télécharger le document pour vérifier son contenu et valider le courrier
    ...    11- ajouter le courrier au panier
    ...    12- se connecter avec votre compte la poste et saisir vos coordonnées
    ...    13- valider votre demande
    [Tags]    run
    open-browser-to-page
    envoyer-un-courrier
    rediger-votre-texte
    choisir-les-options-et-le-nom-de-la-lettre
    ajouter-un-destinataire
    telecharger-le-document-et-valider-votre-courrier
    ajouter-au-panier
    finaliser-ma-commande
    [Teardown]    Close Browser

envoyer-un-courrier-en-ligne-telecharger-depuis-mon-ordinateur
    [Documentation]    ce scénario permet l'envoi d'un courrier en ligne télécharger depuis votre ordinateur.
    ...    Etapes suivie au cours du scénario:
    ...
    ...    1- accéder à la page web de la poste
    ...    2- cliquer sur le menu "envoyer un colis ou un courrier
    ...    3- cliquer sur envoyer un courrier
    ...    4- choisir l'option lettre en ligne
    ...    5- accéder à la page pour choisir le type de courrier à envoyer
    ...    6- télécharger le courrier depuis votre ordinateur "le fichier ne dépasse pas les 7 Mo
    ...    7- choisir les options "couleur, format d'impression et adresse du destinataire"
    ...    8- saisir le nom de la lettre
    ...    9- ajouter un destinataire
    ...    10- télécharger le document pour vérifier son contenu et valider le courrier
    ...    11- ajouter le courrier au panier
    ...    12- se connecter avec votre compte la poste et saisir vos coordonnées
    ...    13- valider votre demande
    [Tags]    run
    open-browser-to-page
    envoyer-un-courrier
    telecharger-votre-courrier
    choisir-les-options-et-le-nom-de-la-lettre
    ajouter-un-destinataire
    telecharger-le-document-et-valider-votre-courrier
    ajouter-au-panier
    finaliser-ma-commande
    [Teardown]    Close Browser
