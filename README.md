# ECOOP 2024 artifact Marmoset

Title of the submitted paper:
Optimizing Layout of Recursive Data Types with Marmoset

## Metadata to provide during artifact submission in HotCRP

**No need to provide them again in the submission**

- OS and resource (CPU, memory, disk, GPU) used by the authors to run the artifact -- Although the experiments are 
single threaded, they will require a machine with a large RAM. Ideally, greater than 100MB would be good to run 
the experiments.

- Estimation of the required hardware resources for evaluation. In case the evaluation takes multiple days or requires huge resources, please provide a scaled-down evaluation -- We plan to 
provide 2 modes, a quick mode and a full mode ? 

- Known compatibility issues of the container/VM -- NONE
  
- Which badges do you claim for your artifact? Functional? Reusable? Available? -- We seek all three, that is, Functional, Reusable and Available. 

## Quick-start guide (Kick-the-tires phase)

The artifact is bundled as an OCI container created with Docker (Dockerfile is available).

### Machine Requirements 

Although all the experiments are single-threaded, some benchmarks have large input parameters, which 
require a machine with large RAM. Ideally, a machine with >100GB RAM would be used to run the 
experiments. 

### How to build the dockerfile

(Optionally, if don't use our image) Build the Dockerfile (we call it `CMD1`)

```
DOCKER_BUILDKIT=1 docker image build -t marmoset -f Dockerfile .
```

Once you get the image, start the session as follows (`CMD2`):

```
docker run --rm -ti marmoset
```

### Automated scripts / other instructions

Structure of the environment. 

1. All the benchmarks in the evaluation for Gibbon and Marmoset reside in the `ECOOP-2024-Bench` directory.

2. The benchmarks for the GHC comparison reside in the `Ghc` directory. 

We provide 4 scripts, which map on figures in the paper as follows:

1. `~/ECOOP-2024-Bench/generate_runtimes.py` — generates the run times  for Gibbon, Marmoset-greedy, and Marmoset-solver, `Tables 1-7`

2. `~/ECOOP-2024-Bench/generate_compile_times.py` — generates the compile times, `Figure 10`.

3. `~/ECOOP-2024-Bench/generate_cache_stats.py` — generates the statistics for cache, `Table 8`.

4. `~/Ghc/ghc/generate_ghc_numbers.py` — generates the run times for GHC, `Figure 9`.


After executing `CMD2` and entering the session, use `python3` to run the provided scripts to get the numbers. 
The script prints the numbers for each benchmark file. 
For example, `python3 generate_runtimes.py` generates the run times
(you need to `cd` in the corresponding directory first). 
Provided is the mapping from file name to benchmarks in the paper.

```
Table1: Layout1PowerList.hs, Layout2PowerList.hs 

Table2: Layout1ListLen.hs, Layout2ListLen.hs 

Table3: eval_r.hs and eval_l.hs 

Table4: TreeAddOne*.hs, TreeCopy*.hs, TreeExpo*.hs 

Table5: TreeRightMost_l.hs and TreeRightMost_r.hs 

Table6: layoutxFilterBlogs.hs, layoutxContentSearch.hs and layoutxTagSearch.hs where x is the layout -- 1, 2, 3, 4, 5, 7, 8 respectively in the same order as in Table 6.

Table7: manyFuncs.hs 
```

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


-------------------------------------------------------

TODOs (In order of priority): 

- [x] Write the script for Ghc.
- [x] TODO: the number for manyFuns.hs needs special handling since it runs multiple experiments in the pipeline. 
- [ ] I forgot to add the Misaligned examples from the Binary Tree, only one i guess, Misaligned pre since the Misaligned post was giving memory errors.
- [ ] Use the README template from ECOOP.
- [x] If there is time, merge the figure generation scripts for compile time to generate figures automatically.
- [ ] If there is time, merge the figure generation scripts for ghc to the above to generate figures automatically.
- [x] Remove manual instructions, try to add sourcing environments etc. in the python script. 
- [x] Presentation of numbers that the script outputs can be improved but only if time permits.
- [x] Remove all dbgPrint statements in the compiler. (Low priority)







