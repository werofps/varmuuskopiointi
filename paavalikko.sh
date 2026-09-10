#!/bin/bash

# Tarkistetaan asetustiedosto
if [ ! -f "./config.env" ]; then
    echo "[VIRHE] config.env puuttuu."
    exit 1
fi

source ./config.env

# Tarkistetaan funktiotiedosto
if [ ! -f "./funktiot.sh" ]; then
    echo "[VIRHE] funktiot.sh puuttuu."
    exit 1
fi

source ./funktiot.sh

while true
do
    clear

    echo "================================"
    echo "     VARMUUSKOPIOINTITYÖKALU"
    echo "================================"
    echo
    echo "1. Tee varmuuskopio"
    echo "2. Näytä varmuuskopiot"
    echo "3. Näytä asetukset"
    echo "4. Lopeta"
    echo

    read -p "Valitse toiminto (1-4): " valinta

    case "$valinta" in

        1)
            echo
            ./varmuuskopio.sh
            echo
            read -p "Paina Enter jatkaaksesi..."
            ;;

        2)
            nayta_backupit
            echo
            read -p "Paina Enter jatkaaksesi..."
            ;;

        3)
            echo
            echo "Varmuuskopioitava hakemisto:"
            echo "$LAHDE"
            echo
            echo "Varmuuskopioiden sijainti:"
            echo "$KOHDE"
            echo
            read -p "Paina Enter jatkaaksesi..."
            ;;

        4)
            echo
            echo "Ohjelma lopetetaan."
            exit 0
            ;;

        *)
            echo
            virhe "Virheellinen valinta. Valitse 1-4."
            sleep 2
            ;;

    esac
done
