#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${1:-dev}"
SERVICES=("service-a" "service-b" "service-c")

echo "Checking namespace: ${NAMESPACE}"
kubectl get namespace "${NAMESPACE}" >/dev/null

for service in "${SERVICES[@]}"; do
  echo
  echo "Verifying ${service}..."

  kubectl rollout status deployment/"${service}-${service}" \
    --namespace "${NAMESPACE}" \
    --timeout=180s

  kubectl get pods \
    --namespace "${NAMESPACE}" \
    -l "app.kubernetes.io/name=${service}"

  kubectl get service \
    --namespace "${NAMESPACE}" \
    "${service}-${service}"
done

echo
echo "All deployments are healthy in namespace ${NAMESPACE}."
