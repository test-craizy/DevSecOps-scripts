#!/bin/bash
COMPONENTE_FOLDER="$1"
COMPONENTE_CERT_HV="$2"
COMPONENTE_CERT_AG="$3"
COMPONENTE_CERT_CA="$4"


# Set the absolute path to the folder
if [ -n "$COMPONENTE_FOLDER" ]; then
    echo "absolutePathFolder=${GITHUB_WORKSPACE}/$COMPONENTE_FOLDER" >> $GITHUB_ENV
    echo "absolutePathPom=${GITHUB_WORKSPACE}/$COMPONENTE_FOLDER/pom.xml" >> $GITHUB_ENV
else
    echo "absolutePathFolder=${GITHUB_WORKSPACE}" >> $GITHUB_ENV
    echo "absolutePathPom=${GITHUB_WORKSPACE}/pom.xml" >> $GITHUB_ENV
fi

# Set Maven options
echo "mavenOptions=-Xmx3072m" >> $GITHUB_ENV

# Set JDK architecture option
echo "jdkArchitectureOption=x64" >> $GITHUB_ENV

# Set whether to publish JUnit results
echo "publishJUnitResults=true" >> $GITHUB_ENV

# Set the script path
echo "scriptPath=devsecops-scripts/utils" >> $GITHUB_ENV

# Set the AKS script path
echo "AKS_SCRIPT_PATH=devsecops-scripts/scripts" >> $GITHUB_ENV

# Set the certificadoHV variable
if [ -n "$COMPONENTE_CERT_HV" ]; then
    echo "certificadoHV=$COMPONENTE_CERT_HV" >> $GITHUB_ENV  
else
    echo "certificadoHV=false" >> $GITHUB_ENV
fi

# Set the certificadoAG variable
if [ -n "$COMPONENTE_CERT_AG" ]; then
    echo "certificadoAG=$COMPONENTE_CERT_AG" >> $GITHUB_ENV
else
    echo "certificadoAG=false" >> $GITHUB_ENV
fi

# Set the certificadoCA variable
if [ -n "$COMPONENTE_CERT_CA" ]; then
    echo "certificadoCA=$COMPONENTE_CERT_CA" >> $GITHUB_ENV
else
    echo "certificadoCA=false" >> $GITHUB_ENV
fi

# Set the manifests folder name
echo "manifestsFolderName=manifests" >> $GITHUB_ENV
