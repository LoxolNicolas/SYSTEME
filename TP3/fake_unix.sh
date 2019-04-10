#!/bin/bash

ListeChoix="DFCEMSQ"
REP_DEF=$PWD

NO_FILES_LIST=`ls --all | grep .no`

function Permission
{
    for i in $NO_FILES_LIST
    do
        PERM=`echo $i | cut -d_ -f2`
        ListeChoix=`echo $Listechoix | tr -d $i` 
    done
}

function AfficherMenu
{
echo "----------------------------------------------
     |                                             |
     |                Bonjour $USER:               |   
     |                                             |      
     |                                             |
     |        Répertoire par défaut $REP_DEF:      |
     |                                             |
     |                                             |
     |                                             |
     | D) Afficher l’espace disque occupé          |
     |                                             |
     | F) Fixer le répertoire par défaut           |
     |                                             |
     | C) Créer un répertoire                      |
     |                                             |
     | E) Editer un texte                          |
     |                                             |
     | M) Envoyer un mail                          |
     |                                             |
     | S) Envoyer un fichier par mail              |
     |                                             |
     | Q) Se déconnecter                           |
     |                                             |
     ----------------------------------------------|
          votre choix (D, F, C, E, M, S, Q) ?" > menu

cat menu 
}

function SaisirChoix
{
    read -p "Saisissez votre choix : " CHOIX

    while [[ $ListeChoix != *$CHOIX* ]]
    do
        read -p "Saisissez votre choix : " CHOIX
    done
}



function AfficherEspaceUtilise 
{
    du -h $HOME
}

function FixerRepertoireDefaut 
{
    read -p "Saisir le nouveau repertoire" NOUV_REP

    if [ -d  $NOUV_REP ]; then
        REP_DEF=$NOUV_REP
    else
        echo "Non de repertoire incorrecte"
    fi 
}

function CreerRepertoire
{
    read -p "Saisir le nom du repertoire a creer" REP

    mkdir $REP $PWD    
}

function EditerTexte 
{
    read -p "Saisir le nom du fichier a modifier" FICH

    gedit $FICH    
}

function Mail
{
    read -p "Saisir le sujet a traiter" SUJET
    read -p "Saisir l'adresse email du destinataire" ADR_MAIL
    echo -e "Veillez entrez . pour quitter le mail\n"

    mail -s $SUJET $ADR_MAIL
}

function switch
{
    case "$CHOIX" in
        "D")
            AfficherEspaceUtilise
        ;;
        "F")
            FixerRepertoireDefaut
        ;;
        "C")
            CreerRepertoire
        ;;
        "E")
            EditerTexte
        ;;
        "S")
            echo "vbn"
            Mail
        ;;
    esac
}

#Permission

while [ "$CHOIX" != "Q" ]
do
    AfficherMenu
    SaisirChoix
    switch           
done

reset