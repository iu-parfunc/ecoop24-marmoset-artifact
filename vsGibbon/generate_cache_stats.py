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
import json

iterations = 9
inf_buffer_size = 10000000000

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, m-h, m+h

rootdir = "/root/vsGibbon/large/"
papi_dir = "/root/vsGibbon/large/papi_hl_output/"

# Was thinking to make compile and run separate but not important right now.
#compileTrue = sys.argv[2]
#executeTrue = sys.argv[3]

executables = []

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

    
for file in gibbonFiles: 
        
            file_path = rootdir + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            #print("Compile " + file + "...")
            gibbon_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--enable-papi", file_path]
        
            c = subprocess.Popen(gibbon_cmd)
            c.wait()
            output, error = c.communicate()
        
            #if error is None: 
            #    print("Compiled " + file + " succesfully!")
                
            executables.append(file_without_haskell_extension + ".exe")
            
            #print()



    
for file in marmosetFiles: 

            file_path = rootdir + file
            
            file_without_haskell_extension = file_path.replace(".hs", '')
            
            solver_binary_name = file_without_haskell_extension + "Solver"
            greedy_binary_name = file_without_haskell_extension + "Greedy"
            
            executables.append(solver_binary_name)
            executables.append(greedy_binary_name)
        
            #print("Compile " + file + " with solver optimization..." )
            solver_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--opt-layout-global", "--opt-layout-use-solver", "--enable-papi", file_path, "-o", solver_binary_name]
        
            c = subprocess.Popen(solver_cmd)
            c.wait()
            output, error = c.communicate()
        
            #if error is None: 
            #    print("Compiled " + file + " succesfully!")
                
            #print()
            
            #print("Compile " + file + " with greedy optimization..." )
            greedy_cmd = ["gibbon", "--no-gc", "--to-exe", "--packed", "--opt-layout-global", "--enable-papi", file_path, "-o", greedy_binary_name]
        
            c = subprocess.Popen(greedy_cmd)
            c.wait()
            output, error = c.communicate()
        
            #if error is None: 
            #    print("Compiled " + file + " succesfully!")   
            #print()
            
            
papi_tot_ins = 0
papi_tot_cyc = 0
papi_l2_dcm = 0            

cacheStatsCache = {}

for file in executables:
    
    cmd2 = ["rm", "-rf", papi_dir]
    c1 = subprocess.Popen(cmd2, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    c1.wait()
    
    cmd =  [file , "--inf-buffer-size", str(inf_buffer_size), "--iterate", "9"]
    c = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
    c.wait()
    output, error = c.communicate()
        
    if not os.path.exists(papi_dir):
        cmd =  [file, "--iterate", "9"]
        c = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        c.wait()

    if not os.path.exists(papi_dir):
        print("Papi did not output any stats!")
        print("Check if the following hardware counters are available: PAPI_L2_DCM,PAPI_TOT_INS, PAPI_TOT_CYC")
        exit(1)

    file_name = os.listdir(papi_dir)[0]
    file_path = os.path.join(papi_dir, file_name)
    fl = open(file_path)
    
    data = json.load(fl)
    
    stats = data['threads']['0']['regions']
    
    if len(stats) == iterations:
        for i in range(0, iterations):
            
            iter_stats = stats[str(i)]
            papi_tot_ins += int(iter_stats['PAPI_TOT_INS'])
            papi_tot_cyc += int(iter_stats['PAPI_TOT_CYC'])
            papi_l2_dcm += int(iter_stats['PAPI_L2_DCM'])

    tot_ins_avg = papi_tot_ins / iterations
    papi_tot_cyc = papi_tot_cyc / iterations
    papi_l2_dcm_avg = papi_l2_dcm / iterations

    #print(f + " : " + "ins : {}, cyc : {}, l2 dcm : {}".format(tot_ins_avg, papi_tot_cyc, papi_l2_dcm_avg))

    f = file.replace(rootdir, "")
    cacheStatsCache[f] = (tot_ins_avg, papi_tot_cyc, papi_l2_dcm_avg)

    papi_tot_ins = 0
    papi_tot_cyc = 0
    papi_l2_dcm = 0
    
    fl.close()



df = pd.DataFrame(cacheStatsCache, index = ['TOT_INS', 'TOT_CYC', 'PAPI_L2_DCM'])


print("Print Table8a: ")
print()
Table8a = [
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
print(df[Table8a])
print()
#save to csv file 
Table8aOut = df[Table8a]
Table8aOut.to_csv(rootdir + 'Table8a.csv')


print("Print Table8b: ")
print()
Table8b = [
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
print(df[Table8b])
print()
#save to csv file 
Table8bOut = df[Table8b]
Table8bOut.to_csv(rootdir + 'Table8b.csv')

print("Print Table8c: ")
print()
Table8c = [
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
print(df[Table8c])
print()
#save to csv file 
Table8cOut = df[Table8c]
Table8cOut.to_csv(rootdir + 'Table8c.csv')
    
    
    
