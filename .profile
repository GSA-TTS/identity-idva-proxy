#!/bin/bash

allow_acl=$(echo "$VCAP_SERVICES" | jq -r '."user-provided"?[]? | select(.name == "outbound-proxy-acl") | .credentials.allow_acl')

# Export proxy url variable only if the "allow_acl" variable is not empty
if [ -n "$allow_acl" ]; then
  echo "$allow_acl" > allow.acl
  echo ".profile script automatically set allow.acl from user service"
else
  echo ".profile script did not find allow acl information in VCAP_SERVICES"
fi
