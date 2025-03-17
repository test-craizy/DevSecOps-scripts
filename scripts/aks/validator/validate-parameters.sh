#!/bin/bash

# Capturar parámetros pasados al script
scriptPath="$1"
certificadoHV="$2"
certificadoAG="$3"
certificadoCA="$4"

# Cargar archivos fuente correctamente
source "./$scriptPath/trycatch.sh"
source "./$scriptPath/tool.sh"
source "./$scriptPath/validator.sh"

# Validar Certificado HV
if [ "$certificadoHV" == "true" ]; then
    params='[{"key":"lib.hv.cert.domain","value":"'"$(lib.hv.cert.domain)"'"},
    {"key":"lib.hv.puerto","value":"'"$(lib.hv.puerto)"'"},
    {"key":"lib.hv.cert.filename","value":"'"$(lib.hv.cert.filename)"'"},
    {"key":"lib.hv.cert.alias","value":"'"$(lib.hv.cert.alias)"'"},
    {"key":"lib.hv.keystore","value":"'"$(lib.hv.keystore)"'"},
    {"key":"lib.hv.cert.password","value":"'"$(lib.hv.cert.password)"'"},
    {"key":"common.encrypt.password","value":"'"$(common.encrypt.password)"'"}]'            

    empty_validator "$params" "La variable en la librería está vacía o no existe. Necesaria para la creación del certificado HV."
fi

# Validar Certificado AG
if [ "$certificadoAG" == "true" ]; then
    params='[{"key":"lib.ag.cert.filename","value":"'"$(lib.ag.cert.filename)"'"},
    {"key":"lib.ag.port","value":"'"$(lib.ag.port)"'"},
    {"key":"lib.project.ag.domain","value":"'"$(lib.project.ag.domain)"'"},
    {"key":"lib.ag.cert.alias","value":"'"$(lib.ag.cert.alias)"'"},
    {"key":"lib.ag.keystore","value":"'"$(lib.ag.keystore)"'"},
    {"key":"lib.ag.cert.password","value":"'"$(lib.ag.cert.password)"'"}]'

    empty_validator "$params" "La variable en la librería está vacía o no existe. Necesaria para la creación del certificado AG."
fi

# Validar Certificado CA
if [ "$certificadoCA" == "true" ]; then
    params='[{"key":"lib.caapi.cert.filename","value":"'"$(lib.caapi.cert.filename)"'"},
    {"key":"lib.caapi.puerto","value":"'"$(lib.caapi.puerto)"'"},
    {"key":"lib.caapi.cert.domain","value":"'"$(lib.caapi.cert.domain)"'"},
    {"key":"lib.caapi.cert.alias","value":"'"$(lib.caapi.cert.alias)"'"},
    {"key":"lib.aks.caapi.keystore","value":"'"$(lib.aks.caapi.keystore)"'"},
    {"key":"lib.caapi.cert.password","value":"'"$(lib.caapi.cert.password)"'"}]'

    empty_validator "$params" "La variable en la librería está vacía o no existe. Necesaria para la creación del certificado CA."
fi

# Obtener valores de entorno sin usar `${{ ... }}`
INGRESS_VALUE=$(lib.project."$AKS".ig || true)
SUBDOMAIN=$(lib.project."$AKS".ag.subdomain || true)

# Exportar variables para GitHub Actions en $GITHUB_ENV
echo "INGRESS_VALUE=$INGRESS_VALUE" >> $GITHUB_ENV
echo "SUBDOMAIN=$SUBDOMAIN" >> $GITHUB_ENV
