#!/usr/bin/env bash


# This script runs Swagger API codegen CLI and generated Python SDK using provided config.
#
# It is expected that `urbandictionary-api.yaml`is available in the script folder.
#

SPEC_FILE="urbandictionary-api.yaml"
CONFIG_FILE="python.json"

cp "../../${SPEC_FILE}" "./${SPEC_FILE}"
mkdir -p sdk

GENERATOR_CMD="generate -i /local/${SPEC_FILE} -g python-experimental -o /local/sdk -c /local/${CONFIG_FILE}"
docker run --rm -it -v ${PWD}:/local openapitools/openapi-generator-cli ${GENERATOR_CMD}
