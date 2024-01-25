import subprocess
import time
import statistics
import numpy as np
import scipy
import re
import os

iterations = 9

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, m-h, m+h

rootdir = "/root/ECOOP-2024-Bench/"

gibbonFiles = [

    'layout1FilterBlogs.hs',
    'layout2FilterBlogs.hs',
    'layout3FilterBlogs.hs',
    'layout4FilterBlogs.hs',
    'layout5FilterBlogs.hs',
    'layout7FilterBlogs.hs',
    'layout8FilterBlogs.hs',

    'layout1ContentSearch.hs',
    'layout2ContentSearch.hs',
    'layout3ContentSearch.hs',
    'layout4ContentSearch.hs',
    'layout5ContentSearch.hs',
    'layout7ContentSearch.hs',
    'layout8ContentSearch.hs',

    'layout1TagSearch.hs',
    'layout2TagSearch.hs',
    'layout3TagSearch.hs',
    'layout4TagSearch.hs',
    'layout5TagSearch.hs',
    'layout7TagSearch.hs',
    'layout8TagSearch.hs'
]

marmosetFiles = [

    'layout8FilterBlogs.hs',
    'layout8ContentSearch.hs',
    'layout8TagSearch.hs'

]



# Compile all Gibbon binaries.
for subdir, dirs, files in os.walk(rootdir):
    
    for file in files: 
        
        if ".hs" in file and file in gibbonFiles:
        
            file_path = subdir + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            
            iterTimes = []
            for i in range(0, iterations):
                start = time.time()
                gibbon_cmd = subprocess.run(["gibbon", "--packed", "--no-gc", "--to-exe", file_path])
                elapsed = time.time()
                iterTimes.append(float(elapsed-start))
            
            m, lb, ub = mean_confidence_interval(iterTimes)
            median = statistics.median(iterTimes) 
            print("Gibbon Time: " + file + " : " + "Median: {}, Mean: {}, lb: {}, ub: {}".format(median, m, lb, ub))
            print()
            
            
            
            
def parse_solver_times(array):
    
    solver_times = []
    for line in array:

        result = re.findall("iter time: ((\d+).(\d+))", line)
        #print(result)
        if not result == []:
            #print(float(result[0][0]))
            solver_times.append(float(result[0][0]))

    return sum(solver_times)
            

# Compile all Marmoset binaries.
for subdir, dirs, files in os.walk(rootdir):
    
    for file in files: 
        
        if ".hs" in file and file in marmosetFiles:
        
            file_path = subdir + file
            
            iterTimes = []
            solver_times = []
            
            for i in range(0, iterations):
                file_handle = open("solver_compile_stats.txt", "w")
                start = time.time()
                gibbon_cmd_haskell = subprocess.run(["gibbon", "--packed", "--no-gc", "--opt-layout-use-solver", "--opt-layout-global", "--to-exe", file_path], stdout=file_handle, stderr=file_handle)
                elapsed = time.time()
                file_handle.close()
                iterTimes.append(float(elapsed-start)) 
                read_file_handle = open("solver_compile_stats.txt", "r")
                lines = read_file_handle.readlines()
                read_file_handle.close()
                solver_time = parse_solver_times(lines)
                #print()
                #print(solver_time)
                #print()
                solver_times.append(solver_time)
                #print()
           
            #print(iterTimes)
            #print(solver_times)
           
            file_handle.close()
            read_file_handle.close()
           
            m, lb, ub = mean_confidence_interval(iterTimes)
            median = statistics.median(iterTimes)
           
            mm, lbb, ubb = mean_confidence_interval(solver_times)
            mediann = statistics.median(solver_times)
            print(file + " (total_solver_time) : " + "Median: {}, Mean: {}, lb: {}, ub: {}".format(median, m, lb, ub))
            print(file + " (only_solver_time) : " + "Median: {}, Mean: {}, lb: {}, ub: {}".format(mediann, mm, lbb, ubb))
            print()
            
            
            
            
# Compile all Marmoset binaries.
for subdir, dirs, files in os.walk(rootdir):
    
    for file in files: 
        
        if ".hs" in file and file in marmosetFiles:
            
            file_path = subdir + file
            
            iterTimes = []
            
            for i in range(0, iterations):
                start = time.time()
                gibbon_cmd_haskell = subprocess.run(["gibbon", "--packed", "--no-gc", "--opt-layout-global", "--to-exe", file_path])
                elapsed = time.time()
                iterTimes.append(float(elapsed-start))

            m, lb, ub = mean_confidence_interval(iterTimes)
            median = statistics.median(iterTimes)
            print(file + " (Greedy Times) : " + "Median: {}, Mean: {}, lb: {}, ub: {}".format(median, m, lb, ub))
            print()
            
