*** Settings ***
Resource          ../platform-config.robot

*** Variables ***
${bouton-envoyer-un-courrier-locator}    css=[class="lpi-Parts_envoyer"]
${envoyer-un-courrier-locator}    xpath=//em[contains(text(),'un courrier')]
${envoyer-une-lettre-en-ligne}    css=[href="/lettre-en-ligne"]
${accèder-a-la-page-de-lettre-en-ligne}    css=[href="/envoi-de-courrier-en-ligne/lettre-en-ligne/telecharger-document?action=reprise"]
${bouton-parcourir}    ${EMPTY}
${parcourir}      css=[type="file"]
${chemin-du-fichier}    ${CURDIR}/Test-Plan.docx
${telecharger-le-fichier}    css=[id="submitUploadFile"]
${valider-le-courrier-saisie}    css=[id="LELStep1ValiderModele"]
${redigez-votre-texte-locator}    css=[id="LELStep1RedigerCourrier"]
${choisir-le-mode-avec-couleur}    xpath=//label[contains(text(),'Couleur')]
${nom-de-la-lettre-locator}    css=[id="name_doc"]
${valider-les-options}    css=[id="LELStep2OptionsValider"]
${ajouter-des-destinataires-locator}    css=[id="LELStep3AjouterDestinataires"]
${inserer-cette-destinataire}    css=[id="AjouterDestinataireInsererAdressePart"]
${gender}         css=[id="civiliteMr"]
${destinataire-nom-locator}    css=[id="lastName"]
${destinataire-prenom-locator}    css=[id="firstName"]
${destinataire-appartement-etage-locator}    css=[id="appartement"]
${destinataire-batiment-immeuble-locator}    css=[id="batiment"]
${destinataire-numero-et-libelle-de-voie-locator}    css=[id="numLibelle"]
${destinataire-lieu-dit-ou-BP-locator}    css=[id="lieuDit"]
${destinataire-code-postal-locator}    css=[id="codePostal"]
${destinataire-localite-locator}    css=[id="localite"]
${destinataire-pays}    css=[ id="countryPart"] [value="tn"]
${valider-vos-destinataires}    css=.btn-send.validation
${telecharger-le-document}    css=[id="docLinkId"]
${valider-votre-courrier}    css=[id="confirme"]
${valider-votre-recapitulatif}    css=[id="LELStep4Valider"]
${ajouter-au-panier}    css=[id="LELStep4RecapAjouterPanier"]
${finaliser-ma-commande}    css=[id="panierStep1FinaliserCommande"]
${ajouter-votre-adresse-de-facturation}    css=[id="addbillingaddress"]
${donner-un-nom-a-cette-adresse-locator}    css=[id="addressName"]
${votre-civilité}    css=[id="civiliteMr"]
${adresse-mail-locator}    css=.text[id="j_username"]
${adresse-mail-password-locator}    css=[placeholder="Mot de passe"][type="password"]
${authentification-adresse-mail-la-poste}    css=[id="authentificationEnvoyer"]
${coordonnees-validation}    css=[id="continuer"]

*** Keywords ***
envoyer-un-courrier
    Wait Until Page Contains Element    ${bouton-envoyer-un-courrier-locator}
    Click Element    ${bouton-envoyer-un-courrier-locator}
    Wait Until Element Is Visible    ${envoyer-un-courrier-locator}
    Click Element    ${envoyer-un-courrier-locator}
    Click Element    ${envoyer-une-lettre-en-ligne}
    Click Element    ${accèder-a-la-page-de-lettre-en-ligne}

telecharger-votre-courrier
    Wait Until Page Contains Element    xpath=//h1[@class='typo-din title2 title-color']
    Choose File    ${parcourir}    ${chemin-du-fichier}
    Click Element    ${telecharger-le-fichier}

rediger-votre-texte
    Wait Until Page Contains Element    xpath=//h1[@class='typo-din title2 title-color']
    Click Element    ${redigez-votre-texte-locator}
    Wait Until Page Contains Element    css=.picto_wysiwyg
    ${mail-to-edit}=    Generate Random String    length=500    chars=[LETTERS][NUMBERS]
    send    ${mail-to-edit}
    Click Element    ${valider-le-courrier-saisie}

choisir-les-options-et-le-nom-de-la-lettre
    Wait Until Page Contains Element    css=[id="color"]
    Click Element    ${choisir-le-mode-avec-couleur}
    ${nom-de-la-lettre}    Generate Random String    length=8    chars=[LETTERS][NUMBERS]
    Input Text    ${nom-de-la-lettre-locator}    ${nom-de-la-lettre}
    Click Element    ${valider-les-options}

ajouter-un-destinataire
    Wait Until Page Contains Element    ${ajouter-des-destinataires-locator}
    Click Element    ${ajouter-des-destinataires-locator}
    Wait Until Page Contains Element    ${inserer-cette-destinataire}
    click element    ${gender}
    ${destinataire-nom}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-nom-locator}    ${destinataire-nom}
    ${destinataire-prenom}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-prenom-locator}    ${destinataire-prenom}
    ${destinataire-appartement-etage}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-appartement-etage-locator}    ${destinataire-appartement-etage}
    ${destinataire-batiment-immeuble}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-batiment-immeuble-locator}    ${destinataire-batiment-immeuble}
    ${destinataire-numero-et-libelle-de-voie}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-numero-et-libelle-de-voie-locator}    ${destinataire-numero-et-libelle-de-voie}
    ${destinataire-lieu-dit-ou-BP}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-lieu-dit-ou-BP-locator}    ${destinataire-lieu-dit-ou-BP}
    ${destinataire-code-postal}    Generate Random String    length=5    chars=[NUMBERS]
    Input Text    ${destinataire-code-postal-locator}    ${destinataire-code-postal}
    ${destinataire-localite}    Generate Random String    length=8     chars=[LETTERS]
    Input Text    ${destinataire-localite-locator}    ${destinataire-localite}
    Click Element    ${destinataire-pays}
    Click Element    ${inserer-cette-destinataire}
    Wait Until Element Is Visible    ${valider-vos-destinataires}
    Click Element    ${valider-vos-destinataires}

telecharger-le-document-et-valider-votre-courrier
    Wait Until Page Contains Element    ${telecharger-le-document}
    Click Element    ${telecharger-le-document}
    Click Element    ${valider-votre-courrier}
    click element    ${valider-votre-recapitulatif}

ajouter-au-panier
    Wait Until Page Contains Element    ${ajouter-au-panier}
    Click Element    ${ajouter-au-panier}

finaliser-ma-commande
    Wait Until Page Contains Element    ${finaliser-ma-commande}
    Click Element    ${finaliser-ma-commande}
    connecter-vous-a-votre-compte-la-poste
    Wait Until Page Contains Element    ${ajouter-votre-adresse-de-facturation}
    Click Element    ${ajouter-votre-adresse-de-facturation}
    Wait Until Page Contains Element    ${donner-un-nom-a-cette-adresse-locator}
    ${nom-d-adresse}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${donner-un-nom-a-cette-adresse-locator}    ${nom-d-adresse}
    Click Element    ${votre-civilité}
    ${destinataire-nom}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-nom-locator}    ${destinataire-nom}
    ${destinataire-prenom}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-prenom-locator}    ${destinataire-prenom}
    ${destinataire-appartement-etage}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-appartement-etage-locator}    ${destinataire-appartement-etage}
    ${destinataire-batiment-immeuble}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-batiment-immeuble-locator}    ${destinataire-batiment-immeuble}
    ${destinataire-numero-et-libelle-de-voie}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-numero-et-libelle-de-voie-locator}    ${destinataire-numero-et-libelle-de-voie}
    ${destinataire-lieu-dit-ou-BP}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-lieu-dit-ou-BP-locator}    ${destinataire-lieu-dit-ou-BP}
    ${destinataire-code-postal}    Generate Random String    length=5    chars=[NUMBERS]
    Input Text    ${destinataire-code-postal-locator}    ${destinataire-code-postal}
    ${destinataire-localite}    Generate Random String    length=8     chars=[LETTERS][NUMBERS]
    Input Text    ${destinataire-localite-locator}    ${destinataire-localite}
    Click Element    ${destinataire-pays}
    Click Element    css=[id="AjouterDestinataireInsererAdressePart"]
    Click Element    ${coordonnees-validation}

connecter-vous-a-votre-compte-la-poste
    Wait Until Page Contains Element    ${adresse-mail-locator}
    Input Text    ${adresse-mail-locator}    ${compte-mail-la-poste}
    Input Password    ${adresse-mail-password-locator}    ${password-mail-la-poste}
    Click Element    ${authentification-adresse-mail-la-poste}
