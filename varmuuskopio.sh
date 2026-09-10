#!/bin/bash

# Ladataan asetukset
if [ ! -f "./config.env" ]; then
    echo "[VIRHE] config.env puuttuu."
    exit 1
fi

source ./config.env

# Ladataan funktiot
if [ ! -f "./funktiot.sh" ]; then
    echo "[VIRHE] funktiot.sh puuttuu."
    exit 1
fi

source ./funktiot.sh

# Tarkistetaan lähdekansio
if ! tarkista_hakemisto "$LAHDE"; then
    exit 1
fi

# Luodaan backup-kansio tarvittaessa
if [ ! -d "$KOHDE" ]; then
    mkdir -p "$KOHDE"

    if [ $? -ne 0 ]; then
        virhe "Backup-kansion luominen epäonnistui."
        exit 1
    fi
fi

# Luodaan varmuuskopiolle nimi päivämäärän ja ajan perusteella
AIKA=$(date +"%Y-%m-%d_%H-%M-%S")

TIEDOSTO="$KOHDE/backup_$AIKA.tar.gz"

echo
echo "Varmuuskopioidaan:"
echo "$LAHDE"
echo
echo "Kohteeseen:"
echo "$TIEDOSTO"
echo

tar -czf "$TIEDOSTO" "$LAHDE" 2>/dev/null

if [ $? -eq 0 ]; then
    onnistui "Varmuuskopiointi onnistui."
    echo "Luotu tiedosto: $TIEDOSTO"
else
    virhe "Varmuuskopiointi epäonnistui."
    exit 1
fi
