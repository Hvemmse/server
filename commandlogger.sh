#!/bin/bash

# Lag en variabel for stedet du vil lagre loggene
LOG_DIR="/path/to/log/directory"

# Opprett en loggfil med dato som navn
LOG_FILE="$LOG_DIR/$(date +%Y-%m-%d_%H-%M-%S).log"

# Funksjon for å logge kommandoer og output
log_command() {
    # Logg kommandoen
    echo "Command: $1" >> "$LOG_FILE"
    echo "Output:" >> "$LOG_FILE"
    # Kjør kommandoen og logg output
    eval "$1" >> "$LOG_FILE" 2>&1
    echo "--------------------------------------------------" >> "$LOG_FILE"
}

# Kjør funksjonen med kommandoen som argument
log_command "$@"
