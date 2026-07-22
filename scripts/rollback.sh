#!/usr/bin/env bash
set -euo pipefail

RELEASE="${1:-}"
NAMESPACE="${2:-dev}"
REVISION="${3:-}"

if [[ -z "${RELEASE}" ]]; then
  echo "Usage: $0 <release-name> [namespace] [revision]"
  echo "Example: $0 service-a dev 2"
  exit 1
fi

echo "Helm history for ${RELEASE} in namespace ${NAMESPACE}:"
helm history "${RELEASE}" --namespace "${NAMESPACE}"

if [[ -n "${REVISION}" ]]; then
  echo "Rolling back ${RELEASE} to revision ${REVISION}..."
  helm rollback "${RELEASE}" "${REVISION}" \
    --namespace "${NAMESPACE}" \
    --wait \
    --timeout 5m
else
  echo "Rolling back ${RELEASE} to the previous revision..."
  helm rollback "${RELEASE}" \
    --namespace "${NAMESPACE}" \
    --wait \
    --timeout 5m
fi

kubectl rollout status deployment/"${RELEASE}-${RELEASE}" \
  --namespace "${NAMESPACE}" \
  --timeout=180s

echo "Rollback completed."
