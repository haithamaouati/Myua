#!/bin/bash

# Author: Haitham Aouati
# GitHub: github.com/haithamaouati

# Text format
normal="\e[0m"
bold="\e[1m"
faint="\e[2m"
underlined="\e[4m"
error_color="\e[1;31m"

# Dependencies check
dependencies=(figlet curl jq)
for cmd in "${dependencies[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        echo -e "${error_color}Error:${normal} '$cmd' is required but not installed. Please install it and try again." >&2
        exit 1
    fi
done

# Clear the screen
clear

print_banner() {
    figlet -f standard "Myua"
    echo -e "What's my User-Agent (UA)\n"
    echo -e " Author: Haitham Aouati"
    echo -e " GitHub: ${underlined}github.com/haithamaouati${normal}\n"
}

print_banner

API_URL="https://whatmyuseragent.com/api"
KEY="NOTREQUIED"

print_help() {
    echo "Usage: $0 -u <USER_AGENT>"
    echo ""
    echo "Options:"
    echo "  -u, --ua     Provide the User-Agent string to parse"
    echo -e "  -h, --help   Show this help message\n"
}

# Parse CLI arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -u|--ua)
            USER_AGENT="$2"
            shift 2
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            print_help
            exit 1
            ;;
    esac
done

# Check if User-Agent is provided
if [[ -z "$USER_AGENT" ]]; then
    echo -e "[!] Error: No User-Agent provided.\n"
    print_help
    exit 1
fi

# URL encode the User-Agent
ENCODED_UA=$(printf '%s' "$USER_AGENT" | jq -s -R -r @uri)

# Query the API and extract fields
RESPONSE=$(curl -s "${API_URL}?ua=${ENCODED_UA}&key=${KEY}")

# Echo each key
print_banner
echo -e "user-agent: $USER_AGENT\n"
echo "device:"
echo "  deviceType : $(echo "$RESPONSE" | jq -r '.device.deviceType')"
echo "  model      : $(echo "$RESPONSE" | jq -r '.device.model')"
echo "  brand      : $(echo "$RESPONSE" | jq -r '.device.brand')"
echo "  isMobile   : $(echo "$RESPONSE" | jq -r '.device.isMobile')"
echo "  isBot      : $(echo "$RESPONSE" | jq -r '.device.isBot')"
echo "  botInfo    : $(echo "$RESPONSE" | jq -r '.device.botInfo | @json')"

echo ""
echo "os:"
echo "  name     : $(echo "$RESPONSE" | jq -r '.os.name')"
echo "  version  : $(echo "$RESPONSE" | jq -r '.os.version')"
echo "  platform : $(echo "$RESPONSE" | jq -r '.os.platform')"
echo "  family   : $(echo "$RESPONSE" | jq -r '.os.family')"

echo ""
echo "browser:"
echo "  type           : $(echo "$RESPONSE" | jq -r '.browser.type')"
echo "  name           : $(echo "$RESPONSE" | jq -r '.browser.name')"
echo "  version        : $(echo "$RESPONSE" | jq -r '.browser.version')"
echo "  engine         : $(echo "$RESPONSE" | jq -r '.browser.engine')"
echo "  engine_version : $(echo "$RESPONSE" | jq -r '.browser.engine_version')"
echo "  family         : $(echo "$RESPONSE" | jq -r '.browser.family')"
echo ""
