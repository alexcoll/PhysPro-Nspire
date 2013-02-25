#!/bin/bash

function EXIT (){
    unset ARGS
}

ARGS="$@"

if [[ "$ARGS" == *"-b"* ]]; then
    echo "Backing up..."
    cd ..
    endTime=$(date +%F_%H.%M.%S)
    backupName="PhysPro-"$endTime".tar.bz2"
    tar -jcvf $backupName "PhysPro-Nspire"
    --mv $backupName bk/
    cd PhysPro-Nspire/
    echo "Backup complete"
fi

if [[ "$ARGS" == *"-luna"* ]]; then
    echo "Building PhysPro-Nspire..."

    echo "Building the database"
    cat database/*.lua > build/big/database.big.lua

    # echo "Building the analysis"
    # cat analysis/*.lua > /build/big/analysis.big.lua

    echo "Building the FormulaPro core"
    cat FormulaPro/*.lua > build/big/formulapro.big.lua

    echo "Building the reference"
    cat reference/*.lua > build/big/reference.big.lua

    echo "Building the libraries"
    cat lib/*.lua > build/big/lib.big.lua

    echo "Creating the whole thing..."
    cd build/big/
    cat database.big.lua lib.big.lua formulapro.big.lua reference.big.lua ../../main.lua > ../PhysPro.big.lua
    cd ..
    cp PhysPro.big.lua PhysPro_src.lua.tns
    # wine luna/luna.exe PhysPro.big.lua PhysPro-Nspire.tns
    luna PhysPro.big.lua PhysPro-Nspire.tns
    echo "Done building PhysPro"
elif [[ "$ARGS" == *"-etk"* ]]; then
    echo "Error: Not done with this part yet."
fi

if [[ "$ARGS" == *"-o"* ]]; then
    open PhysPro-Nspire.tns
fi

echo "Done. Enjoy!"

