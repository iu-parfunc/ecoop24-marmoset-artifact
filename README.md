# ECOOP 2024 artifact instructions 

To build the artifact, we have provided a convenient dockerfile.

## Machine Requirements 

Although all the experiments are single-threaded, some benchmarks have large input parameters which 
require a machine with large RAM. Ideally, a machine with >100GB RAM would be ideal to run the 
experiments.  

## How to build the dockerfile

To build the dockerfile -- CMD1

```
DOCKER_BUILDKIT=1 docker image build -t gibbon -f Dockerfile .
```

Once the build is finished, the session can be invoked via -- CMD2

```
docker run -t -i gibbon
```

## Automated scripts / other instructions

The following is the structure of the environment. 

1.All the benchmarks in the evaluation for gibbon and marmoset reside in ECOOP-2024-Bench.

2.The benchmarks for the Ghc comparison reside in the folder Ghc. 


We have provided 4 scripts to help automate the task of getting the numbers. 

```
1. ~/ECOOP-2024-Bench/generate_runtimes.py        -- Generates all the runtimes similar to Tables 1-7 for gibbon, marmoset-greedy and marmoset-solver

2. ~/ECOOP-2024-Bench/generate_compile_times.py   -- Generates the compile times for as shown in Figure 10.

3. ~/ECOOP-2024-Bench/generate_cache_stats.py     -- Generates the statistics for cache as shown in Table 8.

4. ~/Ghc/ghc/generate_ghc_numbers.py -- Generates the runtimes for Ghc. Figure 9. 
```

After executing CMD2 and entering the session, execute the following commands to source the environment necessary to run the experiments. 

```
1.cd /gibbon 

2.source set_env.sh 
```

Next, use python3 to run the provided scripts to get the numbers. 
The script prints the numbers for each benchmark file. 
For example, python3 generate_runtimes.py to generate the runtimes.
Provided is the mapping from file name to Benchmarks in the paper.

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
- [ ] TODO: the number for manyFuns.hs needs special handling since it runs multiple experiments in the pipeline. 
- [ ] Use the README template from ECOOP.
- [ ] If there is time, merge the figure generation scripts for compile time and ghc to the above to generate figures automatically.
- [ ] Remove manual instructions, try to add sourcing environments etc. in the python script. 
- [ ] Presentation of numbers that the script outputs can be improved but only if time permits.
- [ ] Remove all dbgPrint statements in the compiler. (Low priority)
