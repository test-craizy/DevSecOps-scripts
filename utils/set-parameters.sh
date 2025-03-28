#!/bin/bash

echo "Setting parameters..."
componente="$1"  # Se asegura de recibir el JSON como un solo string

echo "NOMBRE=$(echo "$componente" | jq -r '.nombre')" >> $GITHUB_ENV
echo "NAMESPACE=$(echo "$componente" | jq -r '.namespace')" >> $GITHUB_ENV
echo "AKS=$(echo "$componente" | jq -r '.aks')" >> $GITHUB_ENV
echo "SQUAD=$(echo "$componente" | jq -r '.squad')" >> $GITHUB_ENV
echo "REPO_VALIDATION=$(echo "$componente" | jq -r '.repoValidation')" >> $GITHUB_ENV
echo "FOLDER_VALIDATION=$(echo "$componente" | jq -r '.folderValidation')" >> $GITHUB_ENV
echo "SMOKE_FILE=$(echo "$componente" | jq -r '.smokeFile')" >> $GITHUB_ENV
echo "ACCEPTANCE_FILE=$(echo "$componente" | jq -r '.acceptanceFile')" >> $GITHUB_ENV
echo "NO_AG=$(echo "$componente" | jq -r '.noAG')" >> $GITHUB_ENV
echo "SERVICE_PORT=$(echo "$componente" | jq -r '.servicePort')" >> $GITHUB_ENV