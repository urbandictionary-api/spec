#!/usr/bin/env bash


# This script runs Swagger API codegen CLI and generated Python SDK using provided config.
#
# It is expected that `urbandictionary-api.yaml`is available in the script folder.
#

SPEC_FILE="urbandictionary-api.yaml"
CONFIG_FILE="python.json"

cp "../../${SPEC_FILE}" "./${SPEC_FILE}"

docker run --rm -it -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
  -i /local/${SPEC_FILE} \
  -l python \
  -o /local/sdk \
  -c /local/"${CONFIG_FILE}"
