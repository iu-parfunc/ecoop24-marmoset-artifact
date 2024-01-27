import os 
import subprocess
import re
import statistics as stat
import numpy as np
import scipy.stats
import pandas as pd
import sys
import matplotlib.pyplot as plt

def mean_confidence_interval(data, confidence=0.95):
    a = 1.0 * np.array(data)
    n = len(a)
    m, se = np.mean(a), scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return m, m-h, m+h


executables = []

iterations = 9

rootdir = "/root/vsGHC/"
#setting this to large input for now. Maybe we should have a Ghc version of the smaller inputs?
rootdirGibbon = "/root/vsGibbon/"


# Provide "--quick" flag for the kick-the-tires stage
if not (((len(sys.argv) == 2) and (sys.argv[1] == "--small")) or (len(sys.argv) == 1) ):
    print("Error: invalid arguments.")
    print("Usage: python3 generate_ghc_numbers.py [--small]")
    exit(1) 

if(len(sys.argv) == 2):
    runMode = sys.argv[1]
else: 
    runMode = "--full"

if runMode == "--small":
    rootdir = rootdir + "/small/"
    rootdirGibbon = rootdirGibbon + "/small/"
else: 
    rootdir = rootdir + "/large/"
    rootdirGibbon = rootdirGibbon + "/large/"

ghcFiles = [
     
     'layout1FindBlogs.hs',
     'layout2FindBlogs.hs',
     'layout3FindBlogs.hs',
     'layout4FindBlogs.hs',
     'layout5FindBlogs.hs',
     'layout7FindBlogs.hs',
     'layout8FindBlogs.hs',

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


Ghc_filter = []
ErrorBarGhcLb_filter = []
ErrorBarGhcUb_filter = []

Ghc_content = []
ErrorBarGhcLb_content = []
ErrorBarGhcUb_content = []

Ghc_tag = []
ErrorBarGhcLb_tag = [] 
ErrorBarGhcUb_tag = []


# Compile all Ghc binaries.
def compile_with_ghc():

        for file in ghcFiles:

            file_path = rootdir + file

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

            file_stats = rootdir + "/" + file + ".txt"

            run_times = []
            for k in range(iterations):
                
                cmd =  "(" + "cd " + rootdir + " && " + "(" + "./" + file  + " > " + file_stats + ")" + ")"
                ghc_binary_cmd = subprocess.call(cmd, shell=True)

                data = open(file_stats, 'r').read()
                self_time = re.findall("iter time: (.*)", data)
                run_times.append(float(self_time[0]))

            average = stat.mean(run_times)
            median  = stat.median(run_times)
            a , l, u = mean_confidence_interval(run_times)
            tupleTimes = (average, median, (l, u))
            print(tupleTimes)
            Timings[file] = tupleTimes

            if "FindBlogs" in file: 
                 Ghc_filter.append(average)
                 ErrorBarGhcLb_filter.append(l)
                 ErrorBarGhcUb_filter.append(u)
            elif "ContentSearch" in file: 
                 Ghc_content.append(average)
                 ErrorBarGhcLb_content.append(l)
                 ErrorBarGhcUb_content.append(u)
            elif "TagSearch" in file:
                 Ghc_tag.append(average)
                 ErrorBarGhcLb_tag.append(l)
                 ErrorBarGhcUb_tag.append(u)

            print()

compile_with_ghc()
time_ghc()


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

Ghc_filter = [x//Marmoset_Median_filter for x in Ghc_filter]
ErrorBarGhcLb_filter = [x//Marmoset_LB_filter for x in ErrorBarGhcLb_filter] 
ErrorBarGhcUb_filter = [x//Marmoset_UB_filter for x in ErrorBarGhcUb_filter]

delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarGhcUb_filter, ErrorBarGhcLb_filter)]
plt.ylim([0, 6])

# Stacked bar chart, marmoset
ax.bar(values , Ghc_filter, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig(rootdir + 'SpeedupMarmosetGhcFilterBlogs.pdf', dpi=4000, format='pdf', bbox_inches='tight')
 
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

Ghc_content = [x//Marmoset_Median_content for x in Ghc_content]
ErrorBarGhcLb_content = [x//Marmoset_LB_content for x in ErrorBarGhcLb_content] 
ErrorBarGhcUb_content = [x//Marmoset_UB_content for x in ErrorBarGhcUb_content]

delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarGhcUb_content, ErrorBarGhcLb_content)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Ghc_content, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig(rootdir + 'SpeedupMarmosetGhcContentSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')

 

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
table6b = pd.read_csv(rootdirGibbon + "Table6c.csv")

column = table6b.iloc[:,8]
Marmoset_Median_tag = column[0]
Marmoset_UB_tag     = column[2]
Marmoset_LB_tag     = column[3]

Ghc_tag = [x//Marmoset_Median_tag for x in Ghc_tag]
ErrorBarGhcLb_tag = [x//Marmoset_LB_tag for x in ErrorBarGhcLb_tag] 
ErrorBarGhcUb_tag = [x//Marmoset_UB_tag for x in ErrorBarGhcUb_tag]


delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarGhcUb_tag, ErrorBarGhcLb_tag)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Ghc_tag, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig(rootdir + 'SpeedupMarmosetGhcTagSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')
plt.show()
