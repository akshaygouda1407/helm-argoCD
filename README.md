# Helm Argo CD Microservices Lab

A complete starter lab containing:

- Three Spring Boot microservices
- Dockerfiles for each service
- Helm charts for each service
- Shared Helm library helpers
- Argo CD applications for dev, QA, and production
- GitHub Actions CI/CD workflow
- Deployment verification and rollback scripts
- Production incident RCA template

## Services

| Service | Default Port | Endpoint |
|---|---:|---|
| service-a | 8081 | `/api/service-a` |
| service-b | 8082 | `/api/service-b` |
| service-c | 8083 | `/api/service-c` |

All services expose:

- `/actuator/health`
- `/actuator/info`
- `/actuator/prometheus`

## Local Build

```bash
cd services/service-a
mvn clean package
java -jar target/service-a-1.0.0.jar
```

Repeat for service-b and service-c.

## Docker Build

```bash
docker build -t YOUR_DOCKERHUB_USERNAME/service-a:latest services/service-a
docker build -t YOUR_DOCKERHUB_USERNAME/service-b:latest services/service-b
docker build -t YOUR_DOCKERHUB_USERNAME/service-c:latest services/service-c
```

## Helm Validation Without Kubernetes

```bash
helm lint helm/service-a
helm lint helm/service-b
helm lint helm/service-c

helm template service-a helm/service-a
helm template service-b helm/service-b
helm template service-c helm/service-c
```

## Install With Helm

```bash
kubectl create namespace dev

helm upgrade --install service-a helm/service-a \
  --namespace dev \
  --set image.repository=YOUR_DOCKERHUB_USERNAME/service-a \
  --set image.tag=latest

helm upgrade --install service-b helm/service-b \
  --namespace dev \
  --set image.repository=YOUR_DOCKERHUB_USERNAME/service-b \
  --set image.tag=latest

helm upgrade --install service-c helm/service-c \
  --namespace dev \
  --set image.repository=YOUR_DOCKERHUB_USERNAME/service-c \
  --set image.tag=latest
```

## Argo CD

Replace the placeholder Git repository URL in the files under `argocd/`.

```bash
kubectl apply -f argocd/dev/
kubectl apply -f argocd/qa/
kubectl apply -f argocd/production/
```

## GitHub Secrets Required

Configure these repository secrets:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

The workflow builds all three services, pushes images, validates Helm charts, and updates environment values.

## Scripts

```bash
chmod +x scripts/*.sh
./scripts/verify-deployment.sh dev
./scripts/rollback.sh service-a dev
```
