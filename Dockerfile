FROM python:3

# Base build deps + tools
RUN set -eux; \
    apt-get update; \
    apt-get -y install --no-install-recommends \
        ca-certificates \
        curl \
        gfortran \
        openmpi-bin libopenmpi-dev \
        libblas-dev liblapack-dev \
        cmake \
        git \
    ; \
    rm -rf /var/lib/apt/lists/*

# --- Install newer doxygen from Debian testing (pin only doxygen*) ---
RUN set -eux; \
    echo "deb http://deb.debian.org/debian testing main" > /etc/apt/sources.list.d/testing.list; \
    printf "Package: *\nPin: release a=stable\nPin-Priority: 900\n\nPackage: doxygen doxygen-doc doxygen-latex doxygen-gui\nPin: release a=testing\nPin-Priority: 1001\n" > /etc/apt/preferences.d/doxygen-testing; \
    apt-get update; \
    apt-get -y install --no-install-recommends doxygen; \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements-dev.txt ./

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -r requirements-dev.txt