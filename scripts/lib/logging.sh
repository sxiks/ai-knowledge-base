#!/usr/bin/env bash

###############################################################################
# Logging
###############################################################################

readonly LOG_INFO="[INFO]"
readonly LOG_OK="[ OK ]"
readonly LOG_WARN="[WARN]"
readonly LOG_FAIL="[FAIL]"

log_info() {
    printf '%s %s\n' "$LOG_INFO" "$1"
}

log_success() {
    printf '%s %s\n' "$LOG_OK" "$1"
}

log_warning() {
    printf '%s %s\n' "$LOG_WARN" "$1"
}

log_error() {
    printf '%s %s\n' "$LOG_FAIL" "$1" >&2
}

log_title() {
    printf '\n%s\n' "$1"
}

die() {
    log_error "$1"
    exit 1
}