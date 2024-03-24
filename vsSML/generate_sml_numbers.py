#! /usr/bin/python3

import os 
import subprocess
import re
import statistics as stat
import numpy as np
import scipy.stats
import pandas as pd
import sys
import matplotlib.pyplot as plt
import argparse

WORKDIR=os.path.dirname(__file__)

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, abs(m-h), abs(m+h)


parser = argparse.ArgumentParser()
parser.add_argument("--run",nargs='?',const="full", help = "specify the input size [small], defaults to full", type=str)
parser.add_argument("--verbose", nargs='?',const=True, help = "specify if you want the output to be verbose.", type=bool)
arguments = parser.parse_args()

executables = []

iterations = 9

rootdir = WORKDIR
#setting this to large input for now. Maybe we should have a Ghc version of the smaller inputs?
rootdirGibbon = os.path.join(os.path.split(WORKDIR)[0], "vsGibbon/")

if arguments.verbose: 
    print("Gibbon root dir: ")
    print(rootdirGibbon)

# Provide "--quick" flag for the kick-the-tires stage
# if not (((len(sys.argv) == 2) and (sys.argv[1] == "--small")) or (len(sys.argv) == 1) ):
#     print("Error: invalid arguments.")
#     print("Usage: python3 generate_ghc_numbers.py [--small]")
#     exit(1) 

# if(len(sys.argv) == 2):
#     runMode = sys.argv[1]
# else: 
#     runMode = "--full"

runMode = arguments.run 

if runMode == "small":
    rootdir = rootdir + "/small/"
    rootdirGibbon = rootdirGibbon + "/small/"
else: 
    rootdir = rootdir + "/large/"
    rootdirGibbon = rootdirGibbon + "/large/"

smlFiles = [
     
     'layout1FilterBlogs.sml',
     'layout2FilterBlogs.sml',
     'layout3FilterBlogs.sml',
     'layout4FilterBlogs.sml',
     'layout5FilterBlogs.sml',
     'layout7FilterBlogs.sml',
     'layout8FilterBlogs.sml',

     'layout1ContentSearch.sml',
     'layout2ContentSearch.sml',
     'layout3ContentSearch.sml',
     'layout4ContentSearch.sml',
     'layout5ContentSearch.sml',
     'layout7ContentSearch.sml',
     'layout8ContentSearch.sml',

     'layout1TagSearch.sml',
     'layout2TagSearch.sml',
     'layout3TagSearch.sml',
     'layout4TagSearch.sml',
     'layout5TagSearch.sml',
     'layout7TagSearch.sml',
     'layout8TagSearch.sml'
     
]


Sml_filter = []
ErrorBarSmlLb_filter = []
ErrorBarSmlUb_filter = []

Sml_content = []
ErrorBarSmlLb_content = []
ErrorBarSmlUb_content = []

Sml_tag = []
ErrorBarSmlLb_tag = [] 
ErrorBarSmlUb_tag = []


# Compile all Ghc binaries.
def compile_with_sml():

        for file in smlFiles:

            file_path = rootdir + file

            file_without_sml_extension = file.replace(".sml", '')
            
            if arguments.verbose:
                print("Compile " + file + "...")
            
            mlton_command = subprocess.run(["mlton", file_path])

            if arguments.verbose:
                print("The Mlton exit code was %d" % mlton_command.returncode)
                print()

            executables.append(file_without_sml_extension)


def time_sml():
    Timings = {}

    for file in executables:
            
            if arguments.verbose:
                print()
                print("Running the binary " + str(file))
                print()

            file_stats = rootdir + "/" + file + ".txt"

            run_times = []
            for k in range(iterations):
                
                cmd =  "(" + "cd " + rootdir + " && " + "(" + "./" + file  + " > " + file_stats + ")" + ")"
                ghc_binary_cmd = subprocess.call(cmd, shell=True)

                data = open(file_stats, 'r').read()
                if arguments.verbose:
                    print(data)
                    
                self_time = re.findall("\d+", str(data))
                
                if arguments.verbose:
                    print(self_time)
                
                run_times.append(float(self_time[0]) / 1000000000)

            average = stat.mean(run_times)
            median  = stat.median(run_times)
            a , l, u = mean_confidence_interval(run_times)
            tupleTimes = (average, median, (l, u))
            if arguments.verbose:
                print(tupleTimes)
            Timings[file] = tupleTimes

            if "FilterBlogs" in file: 
                 Sml_filter.append(average)
                 ErrorBarSmlLb_filter.append(l)
                 ErrorBarSmlUb_filter.append(u)
            elif "ContentSearch" in file: 
                 Sml_content.append(average)
                 ErrorBarSmlLb_content.append(l)
                 ErrorBarSmlUb_content.append(u)
            elif "TagSearch" in file:
                 Sml_tag.append(average)
                 ErrorBarSmlLb_tag.append(l)
                 ErrorBarSmlUb_tag.append(u)
            
            if arguments.verbose:
                print()

compile_with_sml()
time_sml()

if arguments.verbose: 
    print(Sml_filter)
    print(ErrorBarSmlLb_filter)
    print(ErrorBarSmlUb_filter)
    print(Sml_content)
    print(ErrorBarSmlLb_content)
    print(ErrorBarSmlUb_content)
    print(Sml_tag)
    print(ErrorBarSmlLb_tag)
    print(ErrorBarSmlUb_tag)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#GHC VS GIBBON SPEEDUPS Filter Blogs
width = 0.4
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

#Marmoset
#Use the csv file to get the marmoset runtimes? for not let this be hardcoded but make sure to 
#read that csv file.  

if not os.path.exists(rootdirGibbon + "Table6a.csv"):
    print("Marmoset data for Table6a does not exist")
    exit(1)

#read csv file 
table6a = pd.read_csv(rootdirGibbon + "Table6a.csv")

column = table6a.iloc[:,8]
Marmoset_Median_filter = column[0]
Marmoset_UB_filter     = column[2]
Marmoset_LB_filter     = column[3]

Sml_filter = [x//Marmoset_Median_filter for x in Sml_filter]
ErrorBarSmlLb_filter = [x//Marmoset_LB_filter for x in ErrorBarSmlLb_filter] 
ErrorBarSmlUb_filter = [x//Marmoset_UB_filter for x in ErrorBarSmlUb_filter]

delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarSmlUb_filter, ErrorBarSmlLb_filter)]
plt.ylim([0, 6])

# Stacked bar chart, marmoset
ax.bar(values , Sml_filter, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig(rootdir + 'SpeedupMarmosetSmlFilterBlogs.pdf', dpi=4000, format='pdf', bbox_inches='tight')
 
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#GHC VS GIBBON SPEEDUPS Content Search
width = 0.4
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

#Marmoset
if not os.path.exists(rootdirGibbon + "Table6b.csv"):
    print("Marmoset data for Table6b does not exist")
    exit(1)

#read csv file 
table6b = pd.read_csv(rootdirGibbon + "Table6b.csv")

column = table6b.iloc[:,8]
Marmoset_Median_content = column[0]
Marmoset_UB_content     = column[2]
Marmoset_LB_content     = column[3]

Sml_content = [x//Marmoset_Median_content for x in Sml_content]
ErrorBarSmlLb_content = [x//Marmoset_LB_content for x in ErrorBarSmlLb_content] 
ErrorBarSmlUb_content = [x//Marmoset_UB_content for x in ErrorBarSmlUb_content]

delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarSmlUb_content, ErrorBarSmlLb_content)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Sml_content, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig(rootdir + 'SpeedupMarmosetSmlContentSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')

 

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#GHC VS GIBBON SPEEDUPS Tag Search
width = 0.4
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

#Marmoset
if not os.path.exists(rootdirGibbon + "Table6c.csv"):
    print("Marmoset data for Table6c does not exist")
    exit(1)

#read csv file 
table6c = pd.read_csv(rootdirGibbon + "Table6c.csv")

column = table6c.iloc[:,8]
Marmoset_Median_tag = column[0]
Marmoset_UB_tag     = column[2]
Marmoset_LB_tag     = column[3]

Sml_tag = [x//Marmoset_Median_tag for x in Sml_tag]
ErrorBarSmlLb_tag = [x//Marmoset_LB_tag for x in ErrorBarSmlLb_tag] 
ErrorBarSmlUb_tag = [x//Marmoset_UB_tag for x in ErrorBarSmlUb_tag]


delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarSmlUb_tag, ErrorBarSmlLb_tag)]
plt.ylim([0, 40])

# Stacked bar chart, marmoset
ax.bar(values , Sml_tag, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig(rootdir + 'SpeedupMarmosetSmlTagSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')
plt.show()
