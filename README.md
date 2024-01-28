# ECOOP 2024 artifact Marmoset

Title of the submitted paper:

> Optimizing Layout of Recursive Data Types with Marmoset

## Quick-start guide (Kick-the-tires phase)

The artifact is bundled as an OCI container created with Docker (Dockerfile is available).

- The docker image is compressed as `marmosetArtifact.tar` (provided in the Zenodo link)
- The image can be easily loaded via the following command.
  
```
docker load --input marmosetArtifact.tar
```

Next, to run the image, execute the following command. 

```
docker run --rm -ti marmoset
```

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

This should take about a minute and at the end print the contents equivalent to
the contents of Tables 1 and 2 in the paper. The `--quick` mode is specifically
developed for the kick-the-tires stage.

## Overview 

* type of artifact - We have provided a pre-built docker image, including source files that 
  can be used to build the docker image from source. The readme consists of all the information 
  required to build the image. 

* format - The output is produced as a combination of .csv files and .pdf files. 
  These contain Tables and figures from the papers. 
  The artifact constists of .py, .sh scripts. 
  The source files are in haskell .hs format. 
  The source of Marmoset (The framework) is available `marmoset.tar` in the source files.
  We also have a README.md.

* location in the container/VM - After entering the container via the instructions provided earlier, the structure 
  of the container is as follows. The base of the container is mounted at /root. 
  The run.sh script in this folder may serve as a master script to run the `--small` set of inputs or the full by default. 
  We have two folders, vsGibbon and vsGHC. These contain benchmarks to evaluate marmoset against Gibbon and GHC. 
  These folders contain .py scripts that can be invoked individually to run the desired experiments as before. 
  There are two sub-folders in each of these folders that contain `small` and `large` benchmarks respectively.

  Below are detailed instructions. 

### Structure

All scripts and benchmarks reside in one of the two directories in the container:

1. `~/vsGibbon` — evaluation for Gibbon and Marmoset (all tables and Figure 10).

2. `~/vsGHC` — evaluation for GHC and Marmoset (Figure 9).

Four Python scripts map on the figures and tables in the paper as follows:

1. `~/vsGibbon/generate_runtimes.py` — generates the run times  for Gibbon, Marmoset-greedy, and Marmoset-solver, `Tables 1-7`

2. `~/vsGibbon/generate_compile_times.py` — generates the compile times, `Figure 10`.

3. `~/vsGibbon/generate_cache_stats.py` — generates the statistics for cache, `Table 8`.
   
4. `~/vsGHC/generate_ghc_numbers.py` — generates the run times for GHC, `Figure 9`.

Script [3] has no effect inside the container, and we provide direction for
optionally running it outside Docker below. The other three scripts can be ran
sequentially by one master script called `~/run.sh`. The master script accept
the `--small` flag, as well as scripts [1] and [4], so that the results can be
reproduced at a smaller scale on an average consumer machine.

After executing `CMD1` and entering the session, use either the master script
`~/run.sh` or
`python3` to run the individual scripts and reproduce the figures and tables.
For example, `python3 generate_runtimes.py` generates the run times for Gibbon
and Marmoset, stores them in a CSV files (you need to `cd vsGibbon` first). 
Provided below is the mapping from file name to benchmarks in the paper.


The statistics for greedy and solver are given by file names appended with text "Greedy" and "Solver" respectively.

### Approximate Timings

1. `~/vsGibbon/generate_runtimes.py`
  - `--small` mode: <10 minutes
  - default mode: <60 minutes

2. `~/vsGibbon/generate_compile_times.py`
  - default mode: <10 minutes

3. `~/vsGibbon/generate_cache_stats.py`
  - default mode: <30 minutes

4. `~/vsGHC/generate_ghc_numbers.py`
  - `--small` mode: ~15 minutes
  - default mode: ~100 minutes

### CSV files

1. `~/vsGibbon/generate_runtimes.py`
  - `--small` mode: .csv files are written to `~/vsGibbon/small`
  - default mode: .csv files are written to `~/vsGibbon/large`

2. `~/vsGibbon/generate_cache_stats.py`
  - default mode: .csv files are written to `~/vsGibbon/large`: It outputs three .csv files for Table 8.


#### Explanation of .csv files and mapping to tables in the paper. 

- Table1: `Table1.csv`
  * List/foo maps to -- layout1PowerList.exe
  * List'/foo' maps to -- layout2PowerList.exe

- Table2: `Table2.csv`
  * List maps to -- layout2ListLen.exe
  * List' maps to -- layout1ListLen.exe 
  * M_Greedy maps to file -- layout2ListLenGreedy 
  * M_Solver maps to file -- layout2ListLenSolver
  
- Table3: `Table3.csv`
  * lr maps to file -- eval_l.exe 
  * rl maps to file -- eval_r.exe 
  * M_Greedy maps to file -- eval_rGreedy
  * M_Solver maps to file -- eval_lSolver
  
- Table4a: `Table4a.csv` (Add One Tree)
  * Misaligned_pre maps to file -- TreeAddOnePrePost.exe 
  * Aligned_pre maps to file -- TreeAddOnePre.exe
  * Aligned_in maps to file -- TreeAddOneIn.exe
  * Aligned_post maps to file -- TreeAddOnePost.exe
  * M_Greedy maps to file -- TreeAddOnePreGreedy 
  * M_Solver maps to file -- TreeAddOnePreSolver

- Table4b: `Table4b.csv` (Exponentiation Tree)
  * Misaligned_pre maps to file -- TreeExpoPrePost.exe
  * Aligned_pre maps to file -- TreeExpoPre.exe
  * Aligned_in maps to file -- TreeExpoIn.exe 
  * Aligned_post maps to file -- TreeExpoPost.exe
  * M_Greedy maps to file -- TreeExpoPreGreedy
  * M_Solver maps to file -- TreeExpoPreSolver

- Table4c: `Table4c.csv` (Copy Tree)
  * Misaligned_pre maps to file -- TreeCopyPrePost.exe 
  * Aligned_pre maps to file -- TreeCopyPre.exe
  * Aligned_in maps to file -- TreeCopyIn.exe
  * Aligned_post maps to file -- TreeCopyPost.exe
  * M_Greedy maps to file -- TreeCopyPreGreedy
  * M_Solver maps to file -- TreeCopyPreSolver

- Table5: `Table5.csv`
  * lr maps to file -- TreeRightMost_l.exe
  * rl maps to file -- TreeRightMost_r.exe
  * M_Greedy maps to file -- TreeRightMost_lGreedy
  * M_Solver maps to file -- TreeRightMost_lSolver
  
- Table6a: `Table6a.csv` (Filter Blogs)
  * hiadctb maps to file -- layout1FilterBlogs.exe
  * ctbhiad maps to file -- layout2FilterBlogs.exe
  * tbchiad maps to file -- layout3FilterBlogs.exe
  * tcbhiad maps to file -- layout4FilterBlogs.exe
  * btchiad maps to file -- layout5FilterBlogs.exe
  * bchiadt maps to file -- layout7FilterBlogs.exe
  * cbiadht maps to file -- layout8FilterBlogs.exe
  * M_Greedy maps to file -- layout8FilterBlogsGreedy
  * M_Solver maps to file -- layout8FilterBlogsSolver
  
- Table6b: `Table6b.csv` (Emph Content)
  * hiadctb maps to file -- layout1ContentSearch.exe
  * ctbhiad maps to file -- layout2ContentSearch.exe
  * tbchiad maps to file -- layout3ContentSearch.exe
  * tcbhiad maps to file -- layout4ContentSearch.exe
  * btchiad maps to file -- layout5ContentSearch.exe
  * bchiadt maps to file -- layout7ContentSearch.exe
  * cbiadht maps to file -- layout8ContentSearch.exe
  * M_Greedy maps to file -- layout8ContentSearchGreedy
  * M_Solver maps to file -- layout8ContentSearchSolver

- Table6c: `Table6c.csv` (Tag Search)
  * hiadctb maps to file -- layout1TagSearch.exe
  * ctbhiad maps to file -- layout2TagSearch.exe
  * tbchiad maps to file -- layout3TagSearch.exe
  * tcbhiad maps to file -- layout4TagSearch.exe
  * btchiad maps to file -- layout5TagSearch.exe
  * bchiadt maps to file -- layout7TagSearch.exe
  * cbiadht maps to file -- layout8TagSearch.exe
  * M_Greedy maps to file -- layout8TagSearchGreedy
  * M_Solver maps to file -- layout8TagSearchSolver
  
- Table7a: `Table7a.csv` (Filter Blogs)
  * Gibbon maps to -- manyFuncs-FilterBlogs
  * M_Greedy maps to -- manyFuncsGreedy-FilterBlogs
  * M_Solver maps to -- manyFuncsSolver-FilterBlogs

- Table7b: `Table7b.csv` (Emph Content)
  * Gibbon maps to -- manyFuncs-EmphKeyword
  * M_Greedy maps to -- manyFuncsGreedy-EmphKeyword
  * M_Solver maps to -- manyFuncsSolver-EmphKeyword

- Table7c: `Table7c.csv` (Tag Search)
  * Gibbon maps to -- manyFuncs-EmphKeywordInTag
  * M_Greedy maps to -- manyFuncsGreedy-EmphKeywordInTag
  * M_Solver maps to -- manyFuncsSolver-EmphKeywordInTag
  
(If run outside of the docker using the cache script) 
- Table8a: `Table8a.csv`   (Filter Blogs)
  * hiadctb maps to file -- layout1FilterBlogs.exe
  * ctbhiad maps to file -- layout2FilterBlogs.exe
  * tbchiad maps to file -- layout3FilterBlogs.exe
  * tcbhiad maps to file -- layout4FilterBlogs.exe
  * btchiad maps to file -- layout5FilterBlogs.exe
  * bchiadt maps to file -- layout7FilterBlogs.exe
  * cbiadht maps to file -- layout8FilterBlogs.exe
  * M_Greedy maps to file -- layout8FilterBlogsGreedy
  * M_Solver maps to file -- layout8FilterBlogsSolver

- Table8b: `Table8b.csv`  (Content Search)
  * hiadctb maps to file -- layout1ContentSearch.exe
  * ctbhiad maps to file -- layout2ContentSearch.exe
  * tbchiad maps to file -- layout3ContentSearch.exe
  * tcbhiad maps to file -- layout4ContentSearch.exe
  * btchiad maps to file -- layout5ContentSearch.exe
  * bchiadt maps to file -- layout7ContentSearch.exe
  * cbiadht maps to file -- layout8ContentSearch.exe
  * M_Greedy maps to file -- layout8ContentSearchGreedy
  * M_Solver maps to file -- layout8ContentSearchSolver

- Table8c: `Table8c.csv`  (Tag Search)
  * hiadctb maps to file -- layout1TagSearch.exe
  * ctbhiad maps to file -- layout2TagSearch.exe
  * tbchiad maps to file -- layout3TagSearch.exe
  * tcbhiad maps to file -- layout4TagSearch.exe
  * btchiad maps to file -- layout5TagSearch.exe
  * bchiadt maps to file -- layout7TagSearch.exe
  * cbiadht maps to file -- layout8TagSearch.exe
  * M_Greedy maps to file -- layout8TagSearchGreedy
  * M_Solver maps to file -- layout8TagSearchSolver

### Miscellaneous 

- The output from `~/vsGibbon/generate_runtimes.py` is written to CSV files and stdout. 
  However, the output written to stdout may be compressed (`...` between columns in
  the tables means compressed output).
  The user may try to minimize the font on the terminal to see the full output. However, the CSV files will have the full
  output. 

- Some scripts output .pdf files, these can be transferred out of the docker container using [```docker cp```](https://docs.docker.com/engine/reference/commandline/container_cp/)
  command; in order to view them. 

## For authors claiming an available badge

We have made a Zenodo hosting our artifact. The Zenodo is available under the 
`Creative Commons Attribution 4.0 International` liscense. 
We have a [DOI](https://doi.org/10.5281/zenodo.10578171) for our submission.

## For authors claiming a functional or reusable badge

We have provided detailed instructions that can be used to generate the data shown in the Tables and Figures 
in the paper. We have a master script, `run.sh` that has two modes, `--small` and default, that can be used to 
generate a small input batch and a large input batch. The default batch corresponds to the numbers in the paper. 
The default invokation of the master script is `./run.sh` in `/root` in the docker container. 

## For authors claiming a reusable badge

The implementation of Marmoset is available in the open source. We will provide the link to the exact location after the 
AEC evaluation is done in order to stay anonymous. In the meantime, the source code is avilable in the Zenodo link provided. 
To re-compile the software, we have provided instructions to build Marmoset from source in this README.

The benchmarks that we evaluated in the paper will be open sourced after AEC evaluation.
In the meantime, the Zenodo link has the benchmarks available.

Marmoset is based on the open source compiler Gibbon. 
Gibbon is a compiler written in haskell that compiles high level programs written in a subset of haskell to operate on 
serialized data in memory. The compiler is written as a series of micro passes that do a small amount of work.
The marmoset passes are a combination of passes in that pipeline. It is fairly straightforward to register and write a pass in 
the compiler. Hence the framework can be easily extended with more complex optimizations without much hassle. 
This makes future research easy to build on top of the current framework.
The solver used in marmoset is open source and the solver can be changed for other open source solvers which does not 
restrict our implementation to just one available solver. We argue that this makes our framework marmoset reusable.

In particular these are the source files we added to the framework.

- Gibbon.Passes.ControlFlowGraph - This pass adds a static analysis to generate the control flow graph of the functions in the program.

- Gibbon.Passes.DefinitionUseChains - This pass does a def-use, use-def chains analysis for each function.

- Gibbon.Passes.CallGraph - This pass generates the call graph from the program.

- Gibbon.Passes.AccessPatternsAnalysis - This pass generates a graph recording the access patterns between fields of a data constructor for each function in the program.

- Gibbon.Passes.SolveLayoutConstrs - This pass generates the ILP constraints and calls the solver.

- Gibbon.Passes.OptimizeADTLayout - This pass optimizes the layout of each data constructors globally. 


### Build Marmoset and PAPI outside Docker for generating Table 8

Install dependencies to build Marmoset on Ubunut 22.04

```
 $ sudo apt-get update 
 $ sudo apt-get install software-properties-common \
                        libgc-dev \
                        libgmp-dev \
                        build-essential \
                        uthash-dev \
                        vim wget curl
```

Install Racket 

```
 $ wget --no-check-certificate https://mirror.racket-lang.org/installers/7.5/racket-7.5-x86_64-linux.sh
 $ chmod +x racket-7.5-x86_64-linux.sh
 $ ./racket-7.5-x86_64-linux.sh
```

Install the Haskell toolchain:

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=9.4.6 BOOTSTRAP_HASKELL_CABAL_VERSION=3.8.1.0 BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh
```

Install the Rust toolchain:

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=1.71.0
```

Build Marmoset:

```
$ tar -xf marmoset.tar
$ cd marmoset && source set_env.sh
$ cd gibbon-compiler && cabal v2-build exe:gibbon && cabal v2-install exe:gibbon
```

Install PAPI:

```
$ wget https://github.com/icl-utk-edu/papi/archive/refs/tags/papi-7-1-0-t.tar.gz && \
    mkdir papi && \
    tar -xvzf papi-7-1-0-t.tar.gz -C papi && \
    cd papi && cd papi-papi-7-1-0-t && cd src && \
    ./configure && make -j10 && make install
$ export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC,PAPI_L2_DCM"
```

- Run `vsGibbon/generate_cache_stats.py` to generate Table 8 of the paper.
- Set `rootdir` in the script to `pathto/vsGibbon/large/`
- Set `papi_dir` to `pathto/vsGibbon/papi_hl_output`
