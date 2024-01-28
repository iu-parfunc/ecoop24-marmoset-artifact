# ECOOP 2024 artifact Marmoset

Title of the submitted paper:

> Optimizing Layout of Recursive Data Types with Marmoset

## Metadata to provide during artifact submission in HotCRP

**No need to provide them again in the submission**

- Although the experiments are single threaded, they will require a machine with a large RAM for the large input set. 
  Ideally, greater than 150GB would be good to run the large input set. For the smaller input set, a machine with a 
  RAM in the range of 16GB-32GB should be sufficient.

- The output shown in Table 8 requires access to hardware counters via PAPI. 
  In a docker, as far as we are aware, PAPI cannot get permissions to access the hardware counters.
  For that reason, we have provided manual instructions to build and install the required dependencies.

  TODO: (Artem) what is a reasonable minimum? We can't expect all evaluators to have 100 Gb RAM.

- The small input provided for gibbon and and ghc will run within 30 minutes. The large input can take a few hours to run. 

- Known compatibility issues of the container/VM -- NONE
  
- Which badges do you claim for your artifact? Functional? Reusable? Available? -- We seek all three, that is, Functional, Reusable and Available. 

## Quick-start guide (Kick-the-tires phase)

The artifact is bundled as an OCI container created with Docker (Dockerfile is available).

(Optionally, if don't use our image) Build the image with the Dockerfile

```
DOCKER_BUILDKIT=1 docker image build -t marmoset -f Dockerfile .
```

Once you get the image, start the session as follows (so called `CMD1`):

```
docker run --rm -ti marmoset
```

For the kick-the-tires stage, execute the following commands upon entering the
container:

``` shellsession
cd vsGibbon
python3 generate_runtimes.py --quick
```

This should a few minutes and at the end print the contents equivalent to
the contents of Tables 1 and 2 in the paper.

### Overview

All scripts and benchmarks reside in one of the two directories in the container:

1. `~/vsGibbon` — evaluation for Gibbon and Marmoset (all tables and Figure 10).

2. `~/vsGHC` — evaluation for GHC and Marmoset (Figure 9).

Four Python scripts map on the figures and tables in the paper as follows:

1. `~/vsGibbon/generate_runtimes.py` — generates the run times  for Gibbon, Marmoset-greedy, and Marmoset-solver, `Tables 1-7`

2. `~/vsGibbon/generate_compile_times.py` — generates the compile times, `Figure 10`.

3. `~/vsGibbon/generate_cache_stats.py` — generates the statistics for cache, `Table 8`.
   
4. `~/vsGHC/generate_ghc_numbers.py` — generates the run times for GHC, `Figure 9`.


After executing `CMD1` and entering the session, use `python3` to run the provided scripts to reproduce the figures and tables.
For example, `python3 generate_runtimes.py` generates the run times for Gibbon and Marmoset, stores them in a CSV files
(you need to `cd` in the corresponding directory first).

TODO: (Artem) document CSV outputs (location, ect.). Also see the overview section below.

TODO: (Artem) is this still needed if we just print a table in the end? I think not.

The statistics for greedy and solver are given by file names appended with text "Greedy" and "Solver" respectively.

## Overview: What does the artifact comprise?

Please list for each distinct component of your artifact:

* type of artifact (data, code, proof, etc.)
* format (e.g., CSV, source code, binary, etc.)
* location in the container/VM

## For authors claiming an available badge

We offer to publish the artifact on [DARTS](https://drops.dagstuhl.de/opus/institut_darts.php), in which case the available badge will be issued automatically.
If you agree to publishing your artifact under a Creative Commons license, please indicate this here.

In case you would like to publish your artifact under different licensing conditions on Zenodo, please state under which license will the artifact be published?

## For authors claiming a functional or reusable badge

For **all** experimental claims made in the paper, please:
* Quote/reference the experimental claim
* Explain how this claim can be reproduced with the artifact

For example: “The data in table 1 can be obtained by running script ‘generate_table1.sh’”

Please note: we highly advise authors to provide a push-button evaluation (cf. call for artifacts).

## For authors claiming a reusable badge

If some parts of your artifacts contains software:
- is your implementation open-source?
- how to recompile the software?

If you use benchmarks: are the benchmarks public and open-source?

Please list any reuse scenarios that you envision for your artifact, i.e., state how the artifact can be reused or repurposed beyond its role in the submitted paper. Example:

* “The implementation can easily be modified to use a different algorithm than the one described in section 4.1 of our paper by implementing a corresponding module. We provide an interface specification in ...”

## Miscellaneous 

- The output from `~/vsGibbon/generate_runtimes.py` is written to csv files and stdout. 
  However, the output written to stdout may be compressed (```...``` between the tables would suggest a compressed output).
  The user may try to minimize the terminal to see the full output. However, the csv files will have the full
  output. 

- Some scripts output .pdf files, these can be transferred out of the docker container using [```docker cp```](https://docs.docker.com/engine/reference/commandline/container_cp/)
  command; in order to view them. 

### Build Marmoset and PAPI outside Docker for generating Table 8

Install dependencies to build marmoset on Ubunut 22.04

```
 $ sudo apt-get update 
 $ sudo apt-get install software-properties-common 
 $ sudo apt-get install libgc-dev 
 $ sudo apt-get install libgmp-dev 
 $ sudo apt-get install build-essential 
 $ sudo apt-get install uthash-dev 
 $ sudo apt-get install vim wget curl
```

Install Racket 

```
 $ wget --no-check-certificate https://mirror.racket-lang.org/installers/7.5/racket-7.5-x86_64-linux.sh
 $ chmod +x racket-7.5-x86_64-linux.sh
 $ ./racket-7.5-x86_64-linux.sh
```

Install haskell, cabal and stack using ghcup 

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=9.4.6 BOOTSTRAP_HASKELL_CABAL_VERSION=3.8.1.0 BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh
```

Install rust 

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=1.71.0
```

Build marmoset (untar provided marmoset.tar)

```
$ tar -xf marmoset.tar
$ cd marmoset && source set_env.sh
$ cd gibbon-compiler && cabal v2-build exe:gibbon && cabal v2-install exe:gibbon
```

Install PAPI

```
$ wget https://github.com/icl-utk-edu/papi/archive/refs/tags/papi-7-1-0-t.tar.gz && \
    mkdir papi && \
    tar -xvzf papi-7-1-0-t.tar.gz -C papi && \
    cd papi && cd papi-papi-7-1-0-t && cd src && \
    ./configure && make -j10 && make install
$ export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC,PAPI_L2_DCM"
```

- Now use ```pathto/vsGibbon/generate_cache_stats.py``` to generate the statistics for Table 8. 
- Set rootdir in the script to ```pathto/vsGibbon/```
- Set papi_dir to ```pathto/vsGibbon/papi_hl_output```

-------------------------------------------------------

TODOs (In order of priority): 

- [x] Write the script for Ghc.
- [x] TODO: the number for manyFuns.hs needs special handling since it runs multiple experiments in the pipeline. 
- [x] If there is time, merge the figure generation scripts for compile time to generate figures automatically.
- [x] Remove manual instructions, try to add sourcing environments etc. in the python script. 
- [x] Improve the presentation of numbers that the runtime script outputs 
- [x] Remove all dbgPrint statements in the compiler. (Low priority)
- [x] I forgot to add the Misaligned examples from the Binary Tree, only one i guess, Misaligned pre since the Misaligned post was giving memory errors.
- [x] If there is time, merge the figure generation scripts for ghc to the above to generate figures automatically.
- [x] Another way to make a quick experiment is to make a copy of the files in two different subdirectories, and reduce
      the input size in the files. Should be doable quickly.  
- [ ] Use the README template from ECOOP.
- [ ] Remove cache script from docker, add manual instructions to the README
