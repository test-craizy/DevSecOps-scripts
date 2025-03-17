#!/bin/bash
set -e  # Hace que el script falle si un comando falla

# Manejo de errores: Captura el código de error y la línea
trap 'catch $? $LINENO' EXIT

catch() {
  if [ "$1" != "0" ]; then
    # Si hay un error, se muestra el mensaje
    if [ -n "$ERROR_MESG" ]; then
      echo "::error line=$2::$ERROR_MESG"
    else
      echo "::error line=$2::Se ha producido un error desconocido"
    fi
  fi
}

ERROR_MESG=""

error_msg() {
    local MSG="$1"
    ERROR_MESG="$MSG"
}
