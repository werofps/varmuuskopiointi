#!/bin/bash

# Tulostaa onnistumisviestin
onnistui() {
    echo "[OK] $1"
}

# Tulostaa virheilmoituksen
virhe() {
    echo "[VIRHE] $1"
}

# Tarkistaa löytyykö hakemisto
tarkista_hakemisto() {
    if [ ! -d "$1" ]; then
        virhe "Hakemistoa ei löytynyt: $1"
        return 1
    fi

    return 0
}

# Näyttää olemassa olevat varmuuskopiot
nayta_backupit() {
    if [ ! -d "$KOHDE" ]; then
        virhe "Varmuuskopiohakemistoa ei löytynyt."
        return 1
    fi

    echo
    echo "Varmuuskopiot:"
    echo "-----------------------"

    if [ -z "$(ls -A "$KOHDE" 2>/dev/null)" ]; then
        echo "Varmuuskopioita ei vielä ole."
    else
        ls -lh "$KOHDE"
    fi
}
