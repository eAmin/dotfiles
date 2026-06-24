#!/bin/bash
set -e

USERNAME="" # set your username
PASSWORD="" # set your passowrd
SECRET_FILE="$HOME/.totp" # the totp secret should be present in this file, oauthtool read this file to create totp password 
CONFIG="/etc/openvpn/client/con1.conf" # copy you config file to openvpn-client folder

TMP_AUTH="/tmp/openvpn-auth.$$.txt"

trap 'rm -f "$TMP_AUTH"' EXIT

if [ ! -f "$SECRET_FILE" ]; then
    echo "❌ فایل secret پیدا نشد: $SECRET_FILE"
    exit 1
fi

SECRET=$(cat "$SECRET_FILE" | tr -d ' \n\t')
OTP=$(oathtool --totp -b --time-step-size=30s "$SECRET")
COMBINED="${PASSWORD}${OTP}"

echo "$USERNAME" > "$TMP_AUTH"
echo "$COMBINED" >> "$TMP_AUTH"
chmod 600 "$TMP_AUTH"

echo "✅ OTP جنریت شد → وصل می‌شم..."
exec sudo openvpn --config "$CONFIG" --auth-user-pass "$TMP_AUTH" --auth-retry interact
