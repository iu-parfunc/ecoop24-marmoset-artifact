#! /usr/bin/python3

import subprocess
import time
import statistics
import numpy as np
import pandas as pd
import scipy
import re
import os
import sys
import argparse

iterations = 72
inf_buffer_size = 10000000000

WORKDIR=os.path.dirname(__file__)

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, abs(m-h), abs(m+h)

rootdir = WORKDIR


parser = argparse.ArgumentParser()
parser.add_argument("--run",nargs='?',const="full", help = "specify the input size [quick | small], defaults to full", type=str)
parser.add_argument("--verbose", nargs='?',const=True, help = "specify if you want the output to be verbose.", type=bool)
arguments = parser.parse_args()

# Provide "--quick" flag for the kick-the-tires stage
# if not (((len(sys.argv) == 2) and ( (sys.argv[1] == "--quick") or (sys.argv[1] == "--small"))) or (len(sys.argv) == 1)):
#     print("Error: invalid arguments.")
#     print("Usage: python3 generate_runtimes.py [--quick|--small]")
#     exit(1) 

# if (len(sys.argv) == 2):
#     runMode = sys.argv[1]
# else: 
#     runMode = "--full"

#runMode = "full"
#if len(sys.argv) == 2:
#    runMode = "quick"

runMode = arguments.run

#quick mode runs the microbenchmarks 
#full mode runs the full suite

executables = []

gibbonFiles = [
    'layout3TagSearch.hs',
    'layout5TagSearch.hs',
    'layout7TagSearch.hs',
    'TreeCopyIn.hs',
    'TreeCopyPre.hs',
    'TreeCopyPost.hs',
    'layout1ListLen.hs',
    'eval_r.hs',
    'layout3FilterBlogs.hs',
    'TreeExpoPre.hs',
    'layout1TagSearch.hs',
    'layout2ListLen.hs',
    'layout8TagSearch.hs',
    'layout2TagSearch.hs',
    'layout8FilterBlogs.hs',
    'TreeExpoIn.hs',
    'layout4ContentSearch.hs',
    'layout3ContentSearch.hs',
    'eval_l.hs',
    'TreeAddOnePre.hs',
    'layout2ContentSearch.hs',
    'TreeRightMost_l.hs',
    'layout2FilterBlogs.hs',
    'manyFuncs.hs',
    'layout1PowerList.hs',
    'TreeAddOneIn.hs',
    'layout4TagSearch.hs',
    'layout8ContentSearch.hs',
    'TreeRightMost_r.hs',
    'TreeAddOnePost.hs',
    'layout1ContentSearch.hs',
    'layout7ContentSearch.hs',
    'layout2PowerList.hs',
    'layout5ContentSearch.hs',
    'layout4FilterBlogs.hs',
    'layout5FilterBlogs.hs',
    'layout7FilterBlogs.hs',
    'layout1FilterBlogs.hs',
    'TreeExpoPost.hs',
    'TreeAddOnePrePost.hs',
    'TreeCopyPrePost.hs',
    'TreeExpoPrePost.hs',
    'TreeAddOnePostPre.hs', 
    'TreeCopyPostPre.hs',
    'TreeExpoPostPre.hs'
]

#runs powerlist, listen, and eval tree. 
gibbonFilesQuickRun = [
    'layout1ListLen.hs',
    'layout2ListLen.hs',
    'layout1PowerList.hs',
    'layout2PowerList.hs'
]

marmosetFiles = [
    'eval_r.hs',
    'TreeExpoPre.hs',
    'layout2ListLen.hs',
    'layout8TagSearch.hs',
    'layout8FilterBlogs.hs',
    'TreeAddOnePre.hs',
    'layout8ContentSearch.hs',
    'TreeRightMost_l.hs',
    'manyFuncs.hs',
    'TreeCopyPre.hs',
    'layout1PowerList.hs'
]

marmosetFilesQuickRun = [
    'layout2ListLen.hs',
    'layout1PowerList.hs'
]


filesToEvaluate = [] 
filesToEvaluateMarmoset = []

rootdirPath = ""
if runMode == "quick":
    filesToEvaluate = gibbonFilesQuickRun
    filesToEvaluateMarmoset = marmosetFilesQuickRun
    rootdirPath = rootdir + "/small/"
elif runMode == "small":
    filesToEvaluate = gibbonFiles
    filesToEvaluateMarmoset = marmosetFiles
    rootdirPath = rootdir + "/small/"
else: 
    filesToEvaluate = gibbonFiles
    filesToEvaluateMarmoset = marmosetFiles
    rootdirPath = rootdir + "/large/"

# Compile all Gibbon binaries.
for file in filesToEvaluate: 
        
            file_path = rootdirPath + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            if arguments.verbose:
                print("Compile " + file + "...")
            gibbon_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", file_path]
        
            c = subprocess.Popen(gibbon_cmd)
            c.wait()
            output, error = c.communicate()
            
            if arguments.verbose:
                if error is None: 
                    print("Compiled " + file + " with gibbon succesfully!")
                
            executables.append(file_without_haskell_extension + ".exe")
            
            if arguments.verbose:
                print()

# Compile all Marmoset binaries.
for file in filesToEvaluateMarmoset: 
        
            file_path = rootdirPath + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            
            solver_binary_name = file_without_haskell_extension + "Solver"
            greedy_binary_name = file_without_haskell_extension + "Greedy"
            
            executables.append(solver_binary_name)
            executables.append(greedy_binary_name)
            
            if arguments.verbose:
                print("Compile " + file + " with solver optimization..." )

            solver_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--opt-layout-global", "--opt-layout-use-solver", file_path, "-o", solver_binary_name]
        
            c = subprocess.Popen(solver_cmd)
            c.wait()
            output, error = c.communicate()
            
            if arguments.verbose:
                if error is None: 
                    print("Compiled " + file + " with solver succesfully!")

            if arguments.verbose:    
                print()
            
            if arguments.verbose:
                print("Compile " + file + " with greedy optimization..." )

            greedy_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--opt-layout-global", file_path, "-o", greedy_binary_name]
        
            c = subprocess.Popen(greedy_cmd)
            c.wait()
            output, error = c.communicate()
            
            if arguments.verbose:
                if error is None: 
                    print("Compiled " + file + " with greedy optimization succesfully!")
                
            if arguments.verbose:    
                print()



runTimeCache = {}

#Run all executables
for file in executables:
        
        if arguments.verbose:
            print("Running " + str(file) + "...")
        
        runtimeFile = file + ".txt"

        writeFileHandle = open(runtimeFile, "w")
        
        if "RightMost" not in file:

            cmd =  [file , "--inf-buffer-size", str(inf_buffer_size), "--iterate", str(iterations)]

            c = subprocess.Popen(cmd, stdout=writeFileHandle, stderr=subprocess.PIPE, universal_newlines=True)
            c.wait()
            output, error = c.communicate()
        
            if arguments.verbose:
                print(output)
                print(error)
                print(c)

            if c.returncode != 0:
                cmd =  [file , "--iterate", str(iterations)]
                c = subprocess.Popen(cmd, stdout=writeFileHandle, stderr=subprocess.PIPE, universal_newlines=True)
                c.wait()
        else:

            for i in range(iterations):
                cmd =  [file , "--inf-buffer-size", str(inf_buffer_size), "--iterate", "1"]

                c = subprocess.Popen(cmd, stdout=writeFileHandle, stderr=subprocess.PIPE, universal_newlines=True)
                c.wait()
                output, error = c.communicate()

                if arguments.verbose:
                    print(output)
                    print(error)
                    print(c)

                if c.returncode != 0:
                    cmd =  [file , "--iterate", "1"]
                    c = subprocess.Popen(cmd, stdout=writeFileHandle, stderr=subprocess.PIPE, universal_newlines=True)
                    c.wait()

        writeFileHandle.close()
        readFileHandle = open(runtimeFile, "r")
        fileLines = readFileHandle.readlines()

        if "manyFuncs" not in file:
            iterTimes = []
            mean = 0.0
            median = 0.0
            for lines in fileLines:
                search = re.match("itertime: (-?\ *[0-9]+\.?[0-9]*(?:[Ee]\ *-?\ *[0-9]+)?)", lines)
                if arguments.verbose:
                    print(search)
                if search is not None:
                    iterTimes.append(float(search.groups()[0]))
            
            if (iterTimes != []):
                iterTimes = iterTimes[1:iterations]

            if arguments.verbose:
                print("Here are the iterTimes\n")        
                print(iterTimes)
            
            mean = 0
            median = 0
            q1 = 0 
            q3 = 0 
            a = 0
            l = 0
            u = 0
            if (iterTimes != []):
                mean = np.mean(iterTimes)
                median = np.median(iterTimes)
                q1 = np.percentile(iterTimes, 25)
                q3 = np.percentile(iterTimes, 75)
                a, l, u = mean_confidence_interval(iterTimes)
            
            if arguments.verbose:
                print(str(file) + "(mean:{0}, median:{1}, lower:{2}, upper:{3}, q1:{4}, q3:{5})".format(str(mean), str(median), str(l), str(u), str(q1), str(q3)))
            
            #store the stats for a file as a tuple, (mean,median,upperbound,lowerbound)
            fileName = str(file).replace(rootdirPath, "")
            runTimeCache[fileName] = (mean, median, u, l, q1, q3)
            
            readFileHandle.close()
        elif "manyFuncs" in file: 

            functionsToParse = ["EmphKeyword:\n", "EmphKeywordInTag:\n", "FilterBlogs:\n"]
            while True:
                flag = False
                iterTimes = []
                mean = 0.0
                median = 0.0
                cpass = ""
                for lines in fileLines:
                    
                    if lines in functionsToParse:
                        flag = True
                        cpass = lines.replace(":\n", "")
                        functionsToParse.remove(lines)

                    if flag:  
                        search = re.match("itertime: (-?\ *[0-9]+\.?[0-9]*(?:[Ee]\ *-?\ *[0-9]+)?)", lines)
                        if search is not None:
                            iterTimes.append(float(search.groups()[0]))

                    if flag and lines == "END\n":
                        break
                
                mean = 0
                median = 0 
                q1 = 0 
                q3 = 0
                a = 0
                l = 0
                u = 0

                if (iterTimes != []):
                    iterTimes = iterTimes[1:iterations]

                if (iterTimes != []):
                    mean = np.mean(iterTimes)
                    median = np.median(iterTimes)
                    q1 = np.percentile(iterTimes, 25)
                    q3 = np.percentile(iterTimes, 75)
                    a, l, u = mean_confidence_interval(iterTimes)

                if arguments.verbose:  
                    print(str(file) + " " + str(cpass) + " " + "(mean:{0}, median:{1}, lower:{2}, upper:{3})".format(str(mean), str(median), str(l), str(u)))
                
                passName = str(file).replace(".exe", "") + "-" + str(cpass)
                #store the stats for a file as a tuple, (mean,median,upperbound,lowerbound)
                fileName = passName.replace(rootdirPath, "")
                runTimeCache[fileName] = (mean, median, u, l, q1, q3)


                if functionsToParse == []: 
                    break
 
            readFileHandle.close()


#make the table once all the data is collected. 

df = pd.DataFrame(runTimeCache, index = ['mean', 'median', 'upperbound', 'lowerbound', 'lower_median', 'upper_median'])

Table1 = ["layout1PowerList.exe", "layout2PowerList.exe"] 
print("Print Table1: ")
print()
Table1Out = df[Table1].copy()
Table1Out['Speedup'] = Table1Out["layout1PowerList.exe"] / Table1Out["layout2PowerList.exe"]
print(Table1Out)
print()
#save to csv file 
Table1Out.to_csv(rootdirPath + 'Table1.csv')

print("Print Table2: ")
print()
Table2 = ["layout2ListLen.exe", "layout1ListLen.exe", "layout2ListLenGreedy", "layout2ListLenSolver"]
Table2Out = df[Table2].copy()
Table2Out['Speedup'] = Table2Out["layout2ListLen.exe"] / Table2Out["layout2ListLenSolver"]
print(Table2Out)
print()
#save to csv file 

Table2Out.to_csv(rootdirPath + 'Table2.csv')

if runMode == "quick":
    exit(0)


print("Print Table3: ")
print()
Table3 = ["eval_l.exe", "eval_r.exe", "eval_rGreedy", "eval_rSolver"]
Table3Out = df[Table3].copy()
Table3Out['Speedup'] = Table3Out["eval_r.exe"] / Table3Out["eval_rSolver"]
print(Table3Out)
print()
#save to csv file 
Table3Out = df[Table3]
Table3Out.to_csv(rootdirPath + 'Table3.csv')


print("Print Table4a: ")
print()
Table4a = ["TreeAddOnePrePost.exe", "TreeAddOnePostPre.exe", "TreeAddOnePre.exe", "TreeAddOneIn.exe", "TreeAddOnePost.exe", "TreeAddOnePreGreedy", "TreeAddOnePreSolver"]
Table4aOut = df[Table4a].copy()
Table4aOut["Speedup"] = Table4aOut["TreeAddOnePrePost.exe"] / Table4aOut["TreeAddOnePreSolver"]
print(Table4aOut)
print()
#save to csv file 
Table4aOut.to_csv(rootdirPath + 'Table4a.csv')

print("Print Table4b: ")
print()
Table4b = ["TreeExpoPrePost.exe", "TreeExpoPostPre.exe", "TreeExpoPre.exe", "TreeExpoIn.exe", "TreeExpoPost.exe", "TreeExpoPreGreedy", "TreeExpoPreSolver"]
Table4bOut = df[Table4b].copy()
Table4bOut["Speedup"] = Table4bOut["TreeExpoPrePost.exe"] / Table4bOut["TreeExpoPreSolver"]
print(Table4bOut)
print()
#save to csv file
Table4bOut.to_csv(rootdirPath + 'Table4b.csv')

print("Print Table4c: ")
print()
Table4c = ["TreeCopyPrePost.exe", "TreeCopyPostPre.exe", "TreeCopyPre.exe", "TreeCopyIn.exe", "TreeCopyPost.exe", "TreeCopyPreGreedy", "TreeCopyPreSolver"]
Table4cOut = df[Table4c].copy()
Table4cOut["Speedup"] = Table4cOut["TreeCopyPrePost.exe"] / Table4cOut["TreeCopyPreSolver"]
print(Table4cOut)
print()
#save to csv file 
Table4cOut.to_csv(rootdirPath + 'Table4c.csv')

print("Print Table5: ")
print()
Table5 = [
    "TreeRightMost_l.exe",
    "TreeRightMost_r.exe",
    "TreeRightMost_lGreedy",
    "TreeRightMost_lSolver"
]
Table5Out = df[Table5].copy()
Table5Out["Speedup"] = Table5Out["TreeRightMost_l.exe"] / Table5Out["TreeRightMost_lSolver"]
print(Table5Out)
print()
#save to csv file 
Table5Out.to_csv(rootdirPath + 'Table5.csv')


print("Print Table6a: ")
print()
Table6a = [
    "layout1FilterBlogs.exe",
    "layout2FilterBlogs.exe",
    "layout3FilterBlogs.exe",
    "layout4FilterBlogs.exe",
    "layout5FilterBlogs.exe",
    "layout7FilterBlogs.exe",
    "layout8FilterBlogs.exe",
    "layout8FilterBlogsGreedy",
    "layout8FilterBlogsSolver"
]
Table6aOut = df[Table6a].copy()
Table6aOut["Speedup"] = Table6aOut["layout7FilterBlogs.exe"] / Table6aOut["layout8FilterBlogsSolver"]
print(Table6aOut)
print()
#save to csv file 
Table6aOut.to_csv(rootdirPath + 'Table6a.csv')


print("Print Table6b: ")
print()
Table6b = [
    "layout1ContentSearch.exe",
    "layout2ContentSearch.exe",
    "layout3ContentSearch.exe",
    "layout4ContentSearch.exe",
    "layout5ContentSearch.exe",
    "layout7ContentSearch.exe",
    "layout8ContentSearch.exe",
    "layout8ContentSearchGreedy",
    "layout8ContentSearchSolver"
]
Table6bOut = df[Table6b].copy()
Table6bOut["Speedup"] = Table6bOut["layout3ContentSearch.exe"] / Table6bOut["layout8ContentSearchSolver"]
print(Table6bOut)
print()
#save to csv file
Table6bOut.to_csv(rootdirPath + 'Table6b.csv')

print("Print Table6c: ")
print()
Table6c = [
    "layout1TagSearch.exe",
    "layout2TagSearch.exe", 
    "layout3TagSearch.exe",
    "layout4TagSearch.exe",
    "layout5TagSearch.exe",
    "layout7TagSearch.exe",
    "layout8TagSearch.exe",
    "layout8TagSearchGreedy",
    "layout8TagSearchSolver"
]
Table6cOut = df[Table6c].copy()
Table6cOut["Speedup"] = Table6cOut["layout7TagSearch.exe"] / Table6cOut["layout8TagSearchSolver"]
print(Table6cOut)
print()
#save to csv file 
Table6cOut.to_csv(rootdirPath + 'Table6c.csv')

print("Print Table7a: ")
print()
Table7a = [
    "manyFuncs-FilterBlogs",
    "manyFuncsGreedy-FilterBlogs",
    "manyFuncsSolver-FilterBlogs"
]
Table7aOut = df[Table7a].copy()
Table7aOut["Speedup"] = Table7aOut["manyFuncs-FilterBlogs"] / Table7aOut["manyFuncsSolver-FilterBlogs"]
print(Table7aOut)
print()
#save to csv file
Table7aOut.to_csv(rootdirPath + 'Table7a.csv')

print("Print Table7b: ")
print()
Table7b = [ 
    "manyFuncs-EmphKeyword",
    "manyFuncsGreedy-EmphKeyword",
    "manyFuncsSolver-EmphKeyword" 
]
Table7bOut = df[Table7b].copy()
Table7bOut["Speedup"] = Table7bOut["manyFuncs-EmphKeyword"] / Table7bOut["manyFuncsSolver-EmphKeyword"]
print(Table7bOut)
print()
#save to csv file
Table7bOut.to_csv(rootdirPath + 'Table7b.csv')

print("Print Table7c: ")
print()
Table7c = [
    "manyFuncs-EmphKeywordInTag", 
    "manyFuncsGreedy-EmphKeywordInTag",
    "manyFuncsSolver-EmphKeywordInTag"
]
Table7cOut = df[Table7c].copy()
Table7cOut["Speedup"] = Table7cOut["manyFuncs-EmphKeywordInTag"] / Table7cOut["manyFuncsSolver-EmphKeywordInTag"]
print(Table7cOut)
print()
#save to csv file 
Table7cOut.to_csv(rootdirPath + 'Table7c.csv')

if arguments.verbose:
    print("Finished running full mode!")
