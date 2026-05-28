Testado em Win11 + wsl ubuntu

## Build
```bash
docker build -t trype -f Dockerfile .
```

## Run Trivy
```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v trivy-cache:/root/.cache/trivy -v grype-cache:/root/.cache/grype trype trivy image <IMAGE_NAME:?TAG>
```

## Run Grype
```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v trivy-cache:/root/.cache/trivy -v grype-cache:/root/.cache/grype trype grype <IMAGE_NAME:?TAG>
```
