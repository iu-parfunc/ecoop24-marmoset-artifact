# ECOOP 2024 artifact instructions 

The artifact is bundled as an OCI container created with Docker (Dockerfile is available).

## Machine Requirements 

Although all the experiments are single-threaded, some benchmarks have large input parameters, which 
require a machine with large RAM. Ideally, a machine with >100GB RAM would be used to run the 
experiments. 

## How to build the dockerfile

(Optionally, if don't use our image) Build the Dockerfile (we call it `CMD1`)

```
DOCKER_BUILDKIT=1 docker image build -t gibbon -f Dockerfile .
```

Once you get the image, start the session as follows (`CMD2`):

```
docker run --rm -ti gibbon
```

## Automated scripts / other instructions

Structure of the environment. 

1. All the benchmarks in the evaluation for Gibbon and Marmoset reside in the `ECOOP-2024-Bench` directory.

2. The benchmarks for the GHC comparison reside in the `Ghc` directory. 

We provide 4 scripts, which map on figures in the paper as follows:

1. `~/ECOOP-2024-Bench/generate_runtimes.py` — generates the run times  for Gibbon, Marmoset-greedy, and Marmoset-solver, `Tables 1-7`

2. `~/ECOOP-2024-Bench/generate_compile_times.py` — generates the compile times, `Figure 10`.

3. `~/ECOOP-2024-Bench/generate_cache_stats.py` — generates the statistics for cache, `Table 8`.

4. `~/Ghc/ghc/generate_ghc_numbers.py` — generates the run times for GHC, `Figure 9`.

After executing `CMD2` and entering the session, execute the following commands to source the environment necessary to run the experiments. 

```
1.cd /gibbon 

2.source set_env.sh 
```

Next, use `python3` to run the provided scripts to get the numbers. 
The script prints the numbers for each benchmark file. 
For example, `python3 generate_runtimes.py` generates the run times.
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

TODOs (In order of priority): 

- [x] Write the script for Ghc.
- [x] TODO: the number for manyFuns.hs needs special handling since it runs multiple experiments in the pipeline. 
- [ ] Use the README template from ECOOP.
- [ ] If there is time, merge the figure generation scripts for compile time and ghc to the above to generate figures automatically.
- [ ] Remove manual instructions, try to add sourcing environments etc. in the python script. 
- [ ] Presentation of numbers that the script outputs can be improved but only if time permits.
- [x] Remove all dbgPrint statements in the compiler. (Low priority)
