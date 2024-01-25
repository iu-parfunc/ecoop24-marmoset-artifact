# Ubuntu 22
FROM ubuntu:22.04 
ARG DEBIAN_FRONTEND=noninteractive
ENV USERNAME=root
SHELL ["/bin/bash", "-c"]


# install dependencies
RUN apt-get update && \
    apt-get -y install --no-install-recommends software-properties-common && \
    apt-get -y install --no-install-recommends \
    libgc-dev \
    python3 python3-dev python3-setuptools python-is-python3 python3-pip \
    libgmp-dev \
    build-essential \
    uthash-dev \
    vim \ 
    wget \
    curl \ 
    git  \ 
    libtinfo-dev

RUN wget --no-check-certificate https://mirror.racket-lang.org/installers/7.5/racket-7.5-x86_64-linux.sh
RUN chmod +x racket-7.5-x86_64-linux.sh
RUN ./racket-7.5-x86_64-linux.sh


# update path
USER ${USERNAME}
WORKDIR /${USERNAME}
ENV PATH="/${USERNAME}/.local/bin:/${USERNAME}/.cabal/bin:/${USERNAME}/.ghcup/bin:$PATH"
RUN echo "export PATH=${PATH}" >> /${USERNAME}/.profile

#install ghcup
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=9.4.6 BOOTSTRAP_HASKELL_CABAL_VERSION=3.8.1.0 BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh

# update cabal package list
RUN cabal update

ARG RUST=1.71.0

# install rustup, rustc, and cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=${RUST}

RUN . "$HOME/.cargo/env"

# download and build gibbon layout branch
RUN git clone https://github.com/iu-parfunc/gibbon.git /gibbon
RUN cd /gibbon && git checkout layout_changes
RUN cd /gibbon && cd gibbon-compiler && cabal v2-build

#Install PAPI 
RUN wget https://github.com/icl-utk-edu/papi/archive/refs/tags/papi-7-1-0-t.tar.gz
RUN mkdir papi
RUN tar -xvzf papi-7-1-0-t.tar.gz -C papi
RUN cd papi && cd papi-papi-7-1-0-t && cd src && ./configure && make -j10 && make install

ENV PATH="$PATH:/gibbon/dist-newstyle/build/x86_64-linux/ghc-9.4.6/gibbon-0.3/x/gibbon/build/gibbon"
RUN cd /gibbon && (source set_env.sh)

#Python dependencies
RUN pip install cplex
RUN pip install docplex
RUN pip install statistics
RUN pip install numpy
RUN pip install scipy

#cabal packages 
RUN cabal install --lib timeit random vector

ADD ECOOP-2024-Bench ./ECOOP-2024-Bench
ADD Ghc ./Ghc

ENV PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC,PAPI_L2_DCM"
 

CMD ["bash"]
