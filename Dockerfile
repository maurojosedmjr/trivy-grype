FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      wget \
      curl \
      apt-transport-https \
      gnupg \
      lsb-release \
      ca-certificates \
      docker.io && \
    rm -rf /var/lib/apt/lists/*

# =========================
# TRIVY
# =========================
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
    gpg --dearmor -o /usr/share/keyrings/trivy.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" \
    > /etc/apt/sources.list.d/trivy.list

RUN apt-get update && \
    apt-get install -y trivy && \
    rm -rf /var/lib/apt/lists/*

# =========================
# GRYPE
# =========================
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | \
    sh -s -- -b /usr/local/bin

WORKDIR /workspace

CMD ["/bin/bash"]
