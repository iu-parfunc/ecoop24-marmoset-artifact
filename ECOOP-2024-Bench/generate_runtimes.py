import subprocess
import time
import statistics
import numpy as np
import pandas as pd
import scipy
import re
import os
import sys

iterations = 9
inf_buffer_size = 10000000000

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, m-h, m+h

rootdir = "/root/ECOOP-2024-Bench/"


# Was thinking to make compile and run separate but not important right now.
#compileTrue = sys.argv[2]
#executeTrue = sys.argv[3]

if (len(sys.argv) < 2):
    print("Error: not enough arguments passed.")
    print("Usage: python3 generate_runtimes.py (quick|full)")
    exit(1) 

# One of two, quick mode and full mode. 
runMode = str(sys.argv[1])
print(runMode)

#quick mode runs the microbenchmarks 
#full mode runs the full suite

executables = []

gibbonFiles = [
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
    'layout7TagSearch.hs',
    'layout2ContentSearch.hs',
    'TreeRightMost_l.hs',
    'layout2FilterBlogs.hs',
    'manyFuncs.hs',
    'layout1PowerList.hs',
    'TreeCopyPre.hs',
    'TreeAddOneIn.hs',
    'layout4TagSearch.hs',
    'layout1ListLen.hs',
    'TreeCopyPost.hs',
    'layout8ContentSearch.hs',
    'TreeRightMost_r.hs',
    'TreeAddOnePost.hs',
    'layout1ContentSearch.hs',
    'TreeCopyIn.hs',
    'layout7ContentSearch.hs',
    'layout3TagSearch.hs',
    'layout2PowerList.hs',
    'layout5ContentSearch.hs',
    'layout4FilterBlogs.hs',
    'layout5FilterBlogs.hs',
    'layout5TagSearch.hs',
    'layout7FilterBlogs.hs',
    'layout1FilterBlogs.hs',
    'TreeExpoPost.hs'
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

if runMode == "quick":
    filesToEvaluate = gibbonFilesQuickRun
    filesToEvaluateMarmoset = marmosetFilesQuickRun
else: 
    filesToEvaluate = gibbonFiles
    filesToEvaluateMarmoset = marmosetFiles

# Compile all Gibbon binaries.
for subdir, dirs, files in os.walk(rootdir):
    
    #print("subdir: " + str(subdir))
    #print("dirs: " + str(dirs))
    #print("files: " + str(files))
    
    
    for file in files: 
        
        if ".hs" in file and file in filesToEvaluate:
        
            file_path = subdir + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            print("Compile " + file + "...")
            gibbon_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", file_path]
        
            c = subprocess.Popen(gibbon_cmd)
            c.wait()
            output, error = c.communicate()
        
            if error is None: 
                print("Compiled " + file + " with gibbon succesfully!")
                
            executables.append(file_without_haskell_extension + ".exe")
            
            print()

# Compile all Marmoset binaries.
for subdir, dirs, files in os.walk(rootdir):
    
    #print("subdir: " + str(subdir))
    #print("dirs: " + str(dirs))
    #print("files: " + str(files))
    
    
    for file in files: 
        
        if ".hs" in file and file in filesToEvaluateMarmoset:
        
            file_path = subdir + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            
            solver_binary_name = file_without_haskell_extension + "Solver"
            greedy_binary_name = file_without_haskell_extension + "Greedy"
            
            executables.append(solver_binary_name)
            executables.append(greedy_binary_name)
        
            print("Compile " + file + " with solver optimization..." )
            solver_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--opt-layout-global", "--opt-layout-use-solver", file_path, "-o", solver_binary_name]
        
            c = subprocess.Popen(solver_cmd)
            c.wait()
            output, error = c.communicate()
        
            if error is None: 
                print("Compiled " + file + " with solver succesfully!")
                
            print()
            
            print("Compile " + file + " with greedy optimization..." )
            greedy_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--opt-layout-global", file_path, "-o", greedy_binary_name]
        
            c = subprocess.Popen(greedy_cmd)
            c.wait()
            output, error = c.communicate()
        
            if error is None: 
                print("Compiled " + file + " with greedy optimization succesfully!")
                
                
            print()



runTimeCache = {}

#Run all executables
for file in executables:

        print("Running " + str(file) + "...")
        
        runtimeFile = file + ".txt"
        
        cmd =  [file , "--inf-buffer-size", str(inf_buffer_size), "--iterate", "9"]
        
        writeFileHandle = open(runtimeFile, "w")
        
        try:
            c = subprocess.Popen(cmd, stdout=writeFileHandle, stderr=subprocess.PIPE, universal_newlines=True)
            c.wait()
            output, error = c.communicate()
            if error is not None:
                cmd =  [file , "--iterate", "9"]
                c = subprocess.Popen(cmd, stdout=writeFileHandle, stderr=subprocess.PIPE, universal_newlines=True)
                c.wait()
        except:
            print("Error could not run file!")

        writeFileHandle.close()
        readFileHandle = open(runtimeFile, "r")
        fileLines = readFileHandle.readlines()

        if "manyFuncs" not in file:
            iterTimes = []
            mean = 0.0
            median = 0.0
            for lines in fileLines:
                search = re.match("itertime: (-?\ *[0-9]+\.?[0-9]*(?:[Ee]\ *-?\ *[0-9]+)?)", lines)
                #print(search)
                if search is not None:
                    iterTimes.append(float(search.groups()[0]))
            #print(iterTimes)
            mean = np.mean(iterTimes)
            median = np.median(iterTimes)
            a, l, u = mean_confidence_interval(iterTimes)
            
            #print(str(file) + "(mean:{0}, median:{1}, lower:{2}, upper:{3})".format(str(mean), str(median), str(l), str(u)))
            #store the stats for a file as a tuple, (mean,median,upperbound,lowerbound)

            fileName = str(file).replace(rootdir, "")
            runTimeCache[fileName] = (mean, median, u, l)
            
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

                mean = np.mean(iterTimes)
                median = np.median(iterTimes)
                a, l, u = mean_confidence_interval(iterTimes)

                #print(str(file) + " " + str(cpass) + " " + "(mean:{0}, median:{1}, lower:{2}, upper:{3})".format(str(mean), str(median), str(l), str(u)))
                
                passName = str(file).replace(".exe", "") + "-" + str(cpass)
                #store the stats for a file as a tuple, (mean,median,upperbound,lowerbound)
                fileName = passName.replace(rootdir, "")
                runTimeCache[fileName] = (mean, median, u, l)


                if functionsToParse == []: 
                    break
 
            readFileHandle.close()


#make the table once all the data is collected. 

df = pd.DataFrame(runTimeCache, index = ['mean', 'median', 'upperbound', 'lowerbound'])

Table1 = ["layout1PowerList.exe", "layout2PowerList.exe"] 
print("Print Table1: ")
print()
print(df[Table1])
print()
#save to csv file 
Table1Out = df[Table1]
Table1Out.to_csv('Table1.csv')

print("Print Table2: ")
print()
Table2 = ["layout1ListLen.exe", "layout2ListLen.exe", "layout2ListLenGreedy", "layout2ListLenSolver"]
print(df[Table2])
print()
#save to csv file 
Table2Out = df[Table2]
Table2Out.to_csv('Table2.csv')

if runMode == "quick":
    print("Finished running quick mode!")
    exit(0)


print("Print Table3: ")
print()
Table3 = ["eval_l.exe", "eval_r.exe", "eval_lGreedy", "eval_lSolver"]
print(df[Table3])
print()
#save to csv file 
Table3Out = df[Table3]
Table3Out.to_csv('Table3.csv')


print("Print Table4a: ")
print()
Table4a = ["TreeAddOnePre.exe", "TreeAddOnePost.exe", "TreeAddOneIn.exe", "TreeAddOnePreGreedy", "TreeAddOnePreSolver"]
print(df[Table4a])
print()
#save to csv file 
Table4aOut = df[Table4a]
Table4aOut.to_csv('Table4a.csv')

print("Print Table4b: ")
print()
Table4b = ["TreeExpoPre.exe", "TreeExpoPost.exe", "TreeExpoIn.exe", "TreeExpoPreGreedy", "TreeExpoPreSolver"]
print(df[Table4b])
print()
#save to csv file 
Table4bOut = df[Table4b]
Table4bOut.to_csv('Table4b.csv')

print("Print Table4c: ")
print()
Table4c = ["TreeCopyPre.exe", "TreeCopyPost.exe", "TreeCopyIn.exe", "TreeCopyPreGreedy", "TreeCopyPreSolver"]
print(df[Table4c])
print()
#save to csv file 
Table4cOut = df[Table4c]
Table4cOut.to_csv('Table4c.csv')

print("Print Table5: ")
print()
Table5 = [
    "TreeRightMost_l.exe",
    "TreeRightMost_r.exe",
    "TreeRightMost_lGreedy",
    "TreeRightMost_lSolver"
]
print(df[Table5])
print()
#save to csv file 
Table5Out = df[Table5]
Table5Out.to_csv('Table5.csv')


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
print(df[Table6a])
print()
#save to csv file 
Table6aOut = df[Table6a]
Table6aOut.to_csv('Table6a.csv')


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
print(df[Table6b])
print()
#save to csv file 
Table6bOut = df[Table6b]
Table6bOut.to_csv('Table6b.csv')

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
print(df[Table6c])
print()
#save to csv file 
Table6cOut = df[Table6c]
Table6cOut.to_csv('Table6c.csv')

print("Print Table7a: ")
print()
Table7a = [
    "manyFuncs-FilterBlogs",
    "manyFuncsGreedy-FilterBlogs",
    "manyFuncsSolver-FilterBlogs"
]
print(df[Table7a])
print()
#save to csv file 
Table7aOut = df[Table7a]
Table7aOut.to_csv('Table7a.csv')

print("Print Table7b: ")
print()
Table7b = [ 
    "manyFuncs-EmphKeyword",
    "manyFuncsGreedy-EmphKeyword",
    "manyFuncsSolver-EmphKeyword" 
]
print(df[Table7b])
print()
#save to csv file 
Table7bOut = df[Table7b]
Table7bOut.to_csv('Table7b.csv')

print("Print Table7c: ")
print()
Table7c = [
    "manyFuncs-EmphKeywordInTag", 
    "manyFuncsGreedy-EmphKeywordInTag",
    "manyFuncsSolver-EmphKeywordInTag"
]
print(df[Table7c])
print()
#save to csv file 
Table7cOut = df[Table7c]
Table7cOut.to_csv('Table7c.csv')

print("Finished running full mode!")