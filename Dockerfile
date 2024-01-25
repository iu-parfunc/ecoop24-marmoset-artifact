# Ubuntu 22
FROM ubuntu:22.04 
ARG DEBIAN_FRONTEND=noninteractive
ENV USERNAME=root

# install basic system dependencies
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

# update path
USER ${USERNAME}
WORKDIR /${USERNAME}
ENV PATH="/${USERNAME}/.local/bin:/${USERNAME}/.cabal/bin:/${USERNAME}/.ghcup/bin:$PATH"
RUN echo "export PATH=${PATH}" >> /${USERNAME}/.profile

# Main Gibbon dependencies: Racket, Haskell, Rust

# install Racket
RUN wget --no-check-certificate https://mirror.racket-lang.org/installers/7.5/racket-7.5-x86_64-linux.sh && \
    chmod +x racket-7.5-x86_64-linux.sh && \
    ./racket-7.5-x86_64-linux.sh

# install the Haskell toolchain (ghcup, GHC, Cabal)
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=9.4.6 BOOTSTRAP_HASKELL_CABAL_VERSION=3.10.2.1 BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh && \
    cabal update


# install the Rust toolchain (rustup, rustc, cargo)
ARG RUST=1.71.0
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=${RUST} && \
    echo "source $HOME/.cargo/env" >> ~/.bashrc

# Gibbon: download and build the layout branch (Marmoset), build Gibbon's RTS
RUN git clone https://github.com/iu-parfunc/gibbon.git /gibbon && \
    cd /gibbon && \
    git checkout layout_changes && \
    cd gibbon-compiler && cabal v2-build exe:gibbon && \
                          cabal v2-install exe:gibbon && cd .. && \
    . $HOME/.cargo/env && \
    make -f gibbon-rts/Makefile && \
    echo "pushd /gibbon; source ./set_env.sh; popd;" >> ~/.bashrc

# install PAPI
RUN wget https://github.com/icl-utk-edu/papi/archive/refs/tags/papi-7-1-0-t.tar.gz && \
    mkdir papi && \
    tar -xvzf papi-7-1-0-t.tar.gz -C papi && \
    cd papi && cd papi-papi-7-1-0-t && cd src && \
    ./configure && make -j10 && make install
ENV PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC,PAPI_L2_DCM"

# Python packages: the ILP solver, benchmark runner
RUN pip install cplex docplex statistics numpy scipy pandas pyarrow matplotlib

# Haskell packages: benchmark dependencies
RUN cabal install --lib timeit random vector

# Add benchmark sources
ADD ECOOP-2024-Bench ./ECOOP-2024-Bench
ADD Ghc ./Ghc

ENTRYPOINT ["bash"]
