# ECOOP 2024 artifact Marmoset

Title of the submitted paper:

> Optimizing Layout of Recursive Data Types with Marmoset

## Quick-start guide (Kick-the-tires phase)

The artifact is bundled as an OCI container created with Docker (Dockerfile is available).
The Docker image is `tar`red as `marmosetArtifact.tar`
The image can be added to the local Docker store as follows:
  
```
docker load --input marmosetArtifact.tar
```

Alternatively, you can build the image with the Dockerfile

```
DOCKER_BUILDKIT=1 docker image build -t marmoset -f Dockerfile .
```

Once you get the image, start the session as follows (so called `CMD1`):

```
docker run --rm -ti marmoset
```

For the kick-the-tires stage, execute the following commands upon entering the container:

```
cd vsGibbon
./generate_runtimes.py --run quick
```

This should take about a minute and at the end print the contents equivalent to
the contents of Tables 1 and 2 in the paper. The `quick` mode is specifically
developed for the kick-the-tires stage.

## Overview 

* type of artifact — code, in particular:
  - source files of the Gibbon compiler with our extension to it called Marmoset;
  - Gibbon binaries including Marmoset;
  - Python and Bash scripts to run Gibbon, Marmoset and GHC to reproduce the main
    tables and figures of the paper.

* format — Marmoset is implemented in Haskell (like the rest of Gibbon). The
  scripts produce a combination of `.csv` and `.pdf` files holding the data in
  the tables and figures. Also, the benchmark programs discussed in the paper
  are stored as files with the `.hs` extension.

* location in the container — After entering the container via the instructions
  provided above, the structure of the container is as follows. The default
  working directory and the `$HOME` in the container is `/root`. The `run.sh`
  script in this directory may serve as a master script to run either the
  `small` set of inputs or the full set (the default). The two folders
  `~/vsGibbon`, `~/vsGHC` and `~/vsSML` contain benchmarks to evaluate Marmoset against
  Gibbon, GHC and standard ML, following the Evaluation section of the paper. The
  `~/marmoset` directory contains the Gibbon compiler with the Marmoset
  extension. The code is pre-built and available in `$PATH` as `gibbon`
  (Marmoset is activated by `gibbon` flags).

## For authors claiming an available badge

We posted the artifact on Zenodo: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10578861.svg)](https://doi.org/10.5281/zenodo.10578861)

The artifact is available under the  `Creative Commons Attribution 4.0 International` license.

## For authors claiming a functional or reusable badge

### Files structure in the container

The source files of Gibbon and Marmoset reside in `~/marmoset` (`~` is `/root`).

All scripts and benchmarks reside in one of the two directories in the container:

1. `~/vsGibbon` — evaluation for Gibbon and Marmoset (Tables 1–8 and Figure 9).

2. `~/vsSML` — evaluation for GHC and Marmoset (Figure 10).

In each of these, there are two subdirectories that contain `small` and `large`
benchmarks respectively. The two kinds of benchmark programs differ only in
sizes of inputs. The `large` variant should more faithfully reproduce the results
in the paper but requires big RAM (>100Gb).

Four Python scripts map on the figures and tables in the paper as follows:

1. `~/vsGibbon/generate_runtimes.py` — generates the run times  for Gibbon, Marmoset-greedy, and Marmoset-solver, `Tables 1-7`

2. `~/vsGibbon/generate_compile_times.py` — generates the compile times, `Figure 9`.

3. `~/vsGibbon/generate_cache_stats.py` — generates the statistics for cache, `Table 5`.
   
4. `~/vsGHC/generate_sml_numbers.py` — generates the run times for GHC, `Figure 8`.

Script [3] relies on the PAPI framework, which does not function properly inside
Docker. We provide directions for optionally running it outside the
container below in the section “Build Marmoset and PAPI outside Docker for
generating Table 8”.

The other three scripts can be ran sequentially by one master script called
`~/run.sh`. The master script accept the `small` flag, as well as scripts [1]
and [4], so that the results can be reproduced at a smaller scale on an average
consumer machine using the benchmarks in the `small` directories.

After executing `CMD1` and entering the session, use either the master script
`~/run.sh` or the individual scripts and reproduce the figures and tables. For
example, `./generate_runtimes.py` (inside `vsGibbon`) generates the run times
for Gibbon and Marmoset, prints them in a tabular form, and stores them in CSV
files. In addition to the raw run times, the script also prints out the speedups
in a separate column (the last column). In particular,

> `speedup` = (slowest Gibbon, i.e, red color in the table) / `Marmoset_solver`.

### Approximate timings

1. `~/vsGibbon/generate_runtimes.py`
    - `small` mode: <10 minutes
    - `vsSML` mode: <60 minutes
    - default mode: <60 minutes

2. `~/vsGibbon/generate_compile_times.py`
    - default mode: <10 minutes

3. `~/vsGibbon/generate_cache_stats.py`
    - default mode: <30 minutes

4. `~/vsGHC/generate_ghc_numbers.py`
    - `small` mode: ~15 minutes
    - default mode: ~100 minutes

5. `~/vsGHC/generate_sml_numbers.py`
    - default mode: ~100 minutes

### Output files

#### CSV files

1. `~/vsGibbon/generate_runtimes.py`
    - `small` mode: .csv files are written to `~/vsGibbon/small`
    - `vsSML` mode: .csv files are written to `~/vsGibbon/large_sml`
    - default mode: .csv files are written to `~/vsGibbon/large`

2. `~/vsGibbon/generate_cache_stats.py`
    - default mode: .csv files are written to `~/vsGibbon/large`: It outputs three .csv files for Table 5.

#### PDF files 

1. `~/vsGibbon/generate_compile_times.py` outputs three PDF files: 
    - `FilterBlogCompileTimes.pdf`,
    - `ContentSearchCompileTimes.pdf`, and 
    -`TagSearchCompileTimes.pdf`
    for the three compile time subfigures in Figure 10 respectively. The files will be written in the working directory.

2. `~/vsGHC/generate_ghc_numbers.py` outputs three PDF files: 
    - `SpeedupMarmosetGhcFilterBlogs.pdf`,
    - `SpeedupMarmosetGhcContentSearch.pdf`, and 
    - `SpeedupMarmosetGhcTagSearch.pdf`. 
    The files will always be written in `~/vsGHC/large` or `~/vsGHC/small`
    depending on which mode we run in.

3. `~/vsGHC/generate_sml_numbers.py` outputs three PDF files: 
    - `SpeedupMarmosetSmlFilterBlogs.pdf`,
    - `SpeedupMarmosetSmlContentSearch.pdf`, and 
    - `SpeedupMarmosetSmlTagSearch.pdf`. 
    The files will always be written in `~/vsSML/large` or `~/vsSML/small`
    depending on which mode we run in.

#### Mapping of CSV files to the tables in the paper

For every table (in some cases, section of a table) we show how the column names
in the paper map on the column names in the CSV files, which also coinside with
the names of the benchmark programs.

- Table 1: `Table1.csv`
  * `List/foo` maps to `layout1PowerList.exe`
  * `List'/foo'` maps to `layout2PowerList.exe`

  Note that the script shows extra rows for this table: the paper only shows the
  median times for Table 1, while the script treats all tables uniformly and
  prints the mean, median, and lower and upper bounds of the confidence interval.

- Table 2: `Table2.csv`
  * `List` maps to `layout2ListLen.exe`
  * `List'` maps to `layout1ListLen.exe `
  * `M_Greedy` maps to `layout2ListLenGreedy `
  * `M_Solver` maps to `layout2ListLenSolver`
  
- Table 3: `Table3.csv`
  * `lr` maps to `eval_l.exe `
  * `rl` maps to `eval_r.exe `
  * `M_Greedy` maps to `eval_rGreedy`
  * `M_Solver` maps to `eval_lSolver`
  
- Table 4, section Add One Tree: `Table4a.csv` 
  * `Misaligned_pre` maps to `TreeAddOnePrePost.exe `
  * `Aligned_pre` maps to `TreeAddOnePre.exe`
  * `Aligned_in` maps to `TreeAddOneIn.exe`
  * `Aligned_post` maps to `TreeAddOnePost.exe`
  * `M_Greedy` maps to `TreeAddOnePreGreedy `
  * `M_Solver` maps to `TreeAddOnePreSolver`

- Table 4, section Exponentiation Tree: `Table4b.csv`
  * `Misaligned_pre` maps to `TreeExpoPrePost.exe`
  * `Aligned_pre` maps to `TreeExpoPre.exe`
  * `Aligned_in` maps to `TreeExpoIn.exe `
  * `Aligned_post` maps to `TreeExpoPost.exe`
  * `M_Greedy` maps to `TreeExpoPreGreedy`
  * `M_Solver` maps to `TreeExpoPreSolver`

- Table 4, section Copy Tree: `Table4c.csv`
  * `Misaligned_pre` maps to `TreeCopyPrePost.exe `
  * `Aligned_pre` maps to `TreeCopyPre.exe`
  * `Aligned_in` maps to `TreeCopyIn.exe`
  * `Aligned_post` maps to `TreeCopyPost.exe`
  * `M_Greedy` maps to `TreeCopyPreGreedy`
  * `M_Solver` maps to `TreeCopyPreSolver`

- Table 5: `Table5.csv`
  * `lr` maps to `TreeRightMost_l.exe`
  * `rl` maps to `TreeRightMost_r.exe`
  * `M_Greedy` maps to `TreeRightMost_lGreedy`
  * `M_Solver` maps to `TreeRightMost_lSolver`
  
- Table 6, section Filter Blogs: `Table6a.csv`
  * `hiadctb` maps to `layout1FilterBlogs.exe`
  * `ctbhiad` maps to `layout2FilterBlogs.exe`
  * `tbchiad` maps to `layout3FilterBlogs.exe`
  * `tcbhiad` maps to `layout4FilterBlogs.exe`
  * `btchiad` maps to `layout5FilterBlogs.exe`
  * `bchiadt` maps to `layout7FilterBlogs.exe`
  * `cbiadht` maps to `layout8FilterBlogs.exe`
  * `M_Greedy` maps to `layout8FilterBlogsGreedy`
  * `M_Solver` maps to `layout8FilterBlogsSolver`
  
- Table 6, section Emph Content: `Table6b.csv`
  * `hiadctb` maps to `layout1ContentSearch.exe`
  * `ctbhiad` maps to `layout2ContentSearch.exe`
  * `tbchiad` maps to `layout3ContentSearch.exe`
  * `tcbhiad` maps to `layout4ContentSearch.exe`
  * `btchiad` maps to `layout5ContentSearch.exe`
  * `bchiadt` maps to `layout7ContentSearch.exe`
  * `cbiadht` maps to `layout8ContentSearch.exe`
  * `M_Greedy` maps to `layout8ContentSearchGreedy`
  * `M_Solver` maps to `layout8ContentSearchSolver`

- Table 6, section Tag Search: `Table6c.csv`
  * `hiadctb` maps to `layout1TagSearch.exe`
  * `ctbhiad` maps to `layout2TagSearch.exe`
  * `tbchiad` maps to `layout3TagSearch.exe`
  * `tcbhiad` maps to `layout4TagSearch.exe`
  * `btchiad` maps to `layout5TagSearch.exe`
  * `bchiadt` maps to `layout7TagSearch.exe`
  * `cbiadht` maps to `layout8TagSearch.exe`
  * `M_Greedy` maps to `layout8TagSearchGreedy`
  * `M_Solver` maps to `layout8TagSearchSolver`
  
- Table 7, section Filter Blogs: `Table7a.csv`
  * `Gibbon` maps to `manyFuncs-FilterBlogs`
  * `M_Greedy` maps to `manyFuncsGreedy-FilterBlogs`
  * `M_Solver` maps to `manyFuncsSolver-FilterBlogs`

- Table 7, section Emph Content: `Table7b.csv`
  * `Gibbon` maps to `manyFuncs-EmphKeyword`
  * `M_Greedy` maps to `manyFuncsGreedy-EmphKeyword`
  * `M_Solver` maps to `manyFuncsSolver-EmphKeyword`

- Table 7, section Tag Search: `Table7c.csv`
  * `Gibbon` maps to `manyFuncs-EmphKeywordInTag`
  * `M_Greedy` maps to `manyFuncsGreedy-EmphKeywordInTag`
  * `M_Solver` maps to `manyFuncsSolver-EmphKeywordInTag`

- Table 8, section Filter Blogs: `Table8a.csv` (if run outside of the docker using the cache script)
  * `hiadctb` maps to `layout1FilterBlogs.exe`
  * `ctbhiad` maps to `layout2FilterBlogs.exe`
  * `tbchiad` maps to `layout3FilterBlogs.exe`
  * `tcbhiad` maps to `layout4FilterBlogs.exe`
  * `btchiad` maps to `layout5FilterBlogs.exe`
  * `bchiadt` maps to `layout7FilterBlogs.exe`
  * `cbiadht` maps to `layout8FilterBlogs.exe`
  * `M_Greedy` maps to `layout8FilterBlogsGreedy`
  * `M_Solver` maps to `layout8FilterBlogsSolver`

- Table 8, section Content Search: `Table8b.csv`
  * `hiadctb` maps to `layout1ContentSearch.exe`
  * `ctbhiad` maps to `layout2ContentSearch.exe`
  * `tbchiad` maps to `layout3ContentSearch.exe`
  * `tcbhiad` maps to `layout4ContentSearch.exe`
  * `btchiad` maps to `layout5ContentSearch.exe`
  * `bchiadt` maps to `layout7ContentSearch.exe`
  * `cbiadht` maps to `layout8ContentSearch.exe`
  * `M_Greedy` maps to `layout8ContentSearchGreedy`
  * `M_Solver` maps to `layout8ContentSearchSolver`

- Table 8, section Tag Search: `Table8c.csv`
  * `hiadctb` maps to `layout1TagSearch.exe`
  * `ctbhiad` maps to `layout2TagSearch.exe`
  * `tbchiad` maps to `layout3TagSearch.exe`
  * `tcbhiad` maps to `layout4TagSearch.exe`
  * `btchiad` maps to `layout5TagSearch.exe`
  * `bchiadt` maps to `layout7TagSearch.exe`
  * `cbiadht` maps to `layout8TagSearch.exe`
  * `M_Greedy` maps to `layout8TagSearchGreedy`
  * `M_Solver` maps to `layout8TagSearchSolver`

### Miscellaneous 

- The output from `~/vsGibbon/generate_runtimes.py` is written to CSV files and
  stdout. However, the output written to stdout may be compressed (`...` between
  columns in the tables means compressed output). The user may try to decrease
  the font size in the terminal to see the full output. In any case, the CSV
  files have the full output.

- Some scripts output PDF files, which can be transferred out of the container using [```docker cp```](https://docs.docker.com/engine/reference/commandline/container_cp/)
  command, in order to view them. 

- `~/vsGibbon/generate_runtimes.py`, `~/vsGHC/generate_ghc_numbers.py` and `~/vsGHC/generate_sml_numbers.py` can take an additional `--verbose` flag to show extra output while the script is running.

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

## For authors claiming a reusable badge

The implementation of Marmoset is currently under review for inclusion in the
main line of the Gibbon project, which is open source. The implementation is
also available as a part of this artifact and can be obtained on Zenodo.
The way to build the code is shown in the Dockerfile, and it is identical to the standard
instructions to build Gibbon.

The benchmarks are available as the part of this artifact.

### Structure of the Marmoset implementation

Marmoset is an extension to Gibbon, an open source compiler written in Haskell.
Gibbon compiles high level programs written in a subset of Haskell to operate on
serialized data in memory. The compiler is written as a series of micro passes
that do a small amount of work. Marmoset is implemented as a combination of
passes in that pipeline. It is fairly straightforward to register and write a
pass in the compiler. Hence our framework can be extended with more complex
optimizations without substantial changes to the compiler. This makes future
research easy to build on top of the current framework. 

The solver used in Marmoset is open source, and the solver can be changed for
other solvers.

Marmoset consists of the following modules extending Gibbon (files locations
relative to `~/marmoset/gibbon-compiler/src` in the container):

- `Gibbon/Passes/ControlFlowGraph.hs` — This pass adds a static analysis to generate the control flow graph of the functions in the program.

- `Gibbon/Passes/DefinitionUseChains.hs` — This pass does a def-use, use-def chains analysis for each function.

- `Gibbon/Passes/CallGraph.hs` — This pass generates the call graph from the program.

- `Gibbon/Passes/AccessPatternsAnalysis.hs` — This pass generates a graph recording the access patterns between fields of a data constructor for each function in the program.

- `Gibbon/Passes/SolveLayoutConstrs.hs` — This pass generates the ILP constraints and calls the solver.

- `Gibbon/Passes/OptimizeADTLayout.hs` — This pass optimizes the layout of each data constructor globally.
