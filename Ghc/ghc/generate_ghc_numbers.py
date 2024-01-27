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

            run_times = []
            for k in range(iterations):
                cmd =  "(" + "cd " + rootdir + " && " + "(" + "./" + file  + " > " + file_stats + ")" + ")"

                print(cmd)
                ghc_binary_cmd = subprocess.call(cmd, shell=True)

                data = open(file_stats, 'r').read()
                self_time = re.findall("iter time: (.*)", data)

                print()
                print(self_time)
                run_times.append(float(self_time[0]))

            print("The timings for the binary " + str(file) + "are: ")
            print(run_times)
            print()

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
Marmoset_Median = 0.065
Marmoset_UB     = 0.06500446729509662
Marmoset_LB     = 0.06578108826045892

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
plt.savefig('SpeedupMarmosetGhcFilterBlogs.pdf', dpi=4000, format='pdf', bbox_inches='tight')
 
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#GHC VS GIBBON SPEEDUPS Content Search
width = 0.4
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

#Marmoset

Marmoset_Median = 0.637
Marmoset_UB     = 0.6352029703132667
Marmoset_LB     = 0.639036807464511

delta_error_ghc = [element1 - element2 for (element1, element2) in zip(ErrorBarGhcUb_content, ErrorBarGhcLb_content)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Ghc_content, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig('SpeedupMarmosetGhcContentSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')

 

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#GHC VS GIBBON SPEEDUPS Tag Search
width = 0.4
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

#Marmoset

Marmoset_Median = 2.216
Marmoset_UB     = 2.21056925710439
Marmoset_LB     = 2.2326018540067203


delta_error_ghc = [element1 - element2 for (element1, element2) in zip(ErrorBarGhcUb_tag, ErrorBarGhcLb_tag)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Ghc_tag, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig('SpeedupMarmosetGhcTagSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')
plt.show()
