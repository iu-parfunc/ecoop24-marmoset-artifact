import os 
import subprocess
import re
import statistics as stat
import numpy as np
import scipy.stats

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, m-h, m+h


executables = []

iterations = 9

rootdir = "/root/Ghc/ghc/"

ghcFiles = ['layout2FindBlogs.hs', 'layout1TagSearch.hs', 'layout8TagSearch.hs', 'layout4FindBlogs.hs', 'layout5FindBlogs.hs', 'layout1ContentSearch.hs', 'layout2ContentSearch.hs', 'layout1FindBlogs.hs', 'layout8ContentSearch.hs', 'layout4TagSearch.hs', 'layout5TagSearch.hs', 'layout7FindBlogs.hs', 'layout3TagSearch.hs', 'layout8FindBlogs.hs', 'layout2TagSearch.hs', 'layout3FindBlogs.hs', 'layout5ContentSearch.hs', 'layout3ContentSearch.hs', 'layout4ContentSearch.hs', 'layout7TagSearch.hs', 'layout7ContentSearch.hs']


# Compile all Ghc binaries.
def compile_with_ghc():
    for subdir, dirs, files in os.walk(rootdir):

        print("subdir: " + str(subdir))
        print("dirs: " + str(dirs))
        print("files: " + str(files))

        for file in files:

            if ".hs" in file and file in ghcFiles:

                file_path = subdir + file

                file_without_haskell_extension = file.replace(".hs", '')
                print("Compile " + file + "...")

                ghc_cmd_haskell = subprocess.run(["ghc", "-O2", file_path])
                print("The GHC exit code was %d" % ghc_cmd_haskell.returncode)
                print()

                executables.append(file_without_haskell_extension)

def time_ghc():
    Timings = {}

    for file in executables:

            print()
            print("Running the binary " + str(file))
            print()

            file_stats = file + ".txt"

            run_times_except = []
            for k in range(iterations):
                cmd =  "(" + "cd " + rootdir + " && " + "(" + "./" + file  + " > " + file_stats + ")" + ")"

                print(cmd)
                ghc_binary_cmd = subprocess.call(cmd, shell=True)

                data = open(file_stats, 'r').read()
                self_time = re.findall("iter time: (.*)", data)

                print()
                print(self_time)
                run_times_except.append(float(self_time[0]))

            print("The timings for the binary " + str(file) + "are: ")
            print(run_times_except)
            print()

            average_except = stat.mean(run_times_except)
            median_except  = stat.median(run_times_except)
            a , l, u = mean_confidence_interval(run_times_except)
            tupleTimes = (average_except, median_except, (l, u))
            print(tupleTimes)
            Timings[file] = tupleTimes

            print()

compile_with_ghc()
time_ghc()
