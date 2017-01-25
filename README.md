# docker-ljudge
Dockernize [`@quark-zju/ljudge`](https://github.com/quark-zju/ljudge) project

## Usage
To make a judge, follow these steps.

### 1. Make `Dockerfile`
```
FROM kyungw00k/ljudge:0.6.1

# INSTALL COMPILERS
RUN apt-get install -y -q \
    build-essential \
    fpc \
    gawk \
    gccgo \
    clang \
    clang++ \
    gcj-jdk \
    ghc \
    golang \
    lua5.2 \
    mono-mcs \
    ocaml \
    luajit \
    dmd \
    openjdk-7-jdk \
    perl \
    php5-cli \
    python2.7 \
    python3 \
    racket \
    rake \
    ruby \
    valac

RUN apt-get clean &&\
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# ADD NON-ROOT USER
ENV USERNAME ljudge
RUN groupadd $USERNAME \
  && useradd --gid $USERNAME --shell /bin/bash --create-home $USERNAME

# CONFIGURATION FOR RUNNING LRUN
RUN gpasswd -a $USERNAME lrun
```

### 2. Build
```
docker build -t my-sample-docker-ljudge .
```

### 3. Run
```
docker run --privileged my-sample-docker-ljudge ljudge
```

## Thanks to
- [@quark-zju](https://github.com/quark-zju/)
