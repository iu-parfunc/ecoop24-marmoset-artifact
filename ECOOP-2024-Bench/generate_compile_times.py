import subprocess
import time
import statistics
import numpy as np
import scipy
import re
import os
import matplotlib.pyplot as plt

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

# --------------------------------------- Filter blogs ----------------------------------------------
#Marmoset Filter Blogs
tot_filter = []
tot_std_ub_filter = []
tot_std_lb_filter = []

solver_filter = []
solver_std_ub_filter = []
solver_std_lb_filter = []

#Gibbon Filter Blogs
tot_compile_gibbon_filter = []
gibbon_ub_filter = []
gibbon_lb_filter = []


#Marmoset Greedy Filter Blogs
tot_compile_greedy_filter = []
greedy_lb_filter = []
greedy_ub_filter = []

# ------------------------------------- Content Search -----------------------------------------------------------

#Marmoset
tot_content = []
tot_std_lb_content = []
tot_std_ub_content = []

solver_content = []

solver_std_lb_content = []
solver_std_ub_content = []

#Gibbon
tot_compile_gibbon_content = []
gibbon_lb_content = []
gibbon_ub_content = []

#marmoset greedy 
tot_compile_greedy_content = []
greedy_lb_content = [] 
greedy_ub_content = []

# ------------------------------------------- Tag Search -----------------------------------------------------------------

#Marmoset
tot_tag = []
tot_std_lb_tag = []
tot_std_ub_tag = []

solver_tag = []

solver_std_lb_tag = []
solver_std_ub_tag = []

#Gibbon
tot_compile_gibbon_tag = []
gibbon_lb_tag = []
gibbon_ub_tag = []

#marmoset greedy 
tot_compile_greedy_tag = []
greedy_lb_tag = []
greedy_ub_tag = []


# Compile all Gibbon binaries.
for file in gibbonFiles: 
        
            file_path = rootdir + file
            
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

            if "Filter" in file: 
                tot_compile_gibbon_filter.append(m)
                gibbon_ub_filter.append(ub)
                gibbon_lb_filter.append(lb)
            elif "Content" in file:
                tot_compile_gibbon_content.append(m)
                gibbon_ub_content.append(ub)
                gibbon_lb_content.append(lb)
            elif "TagSearch" in file:
                tot_compile_gibbon_tag.append(m)
                gibbon_ub_tag.append(ub)
                gibbon_lb_tag.append(lb)
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
for file in marmosetFiles: 
        
            file_path = rootdir + file
            
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

            if "Filter" in file: 
                tot_filter.append(m)
                tot_std_lb_filter.append(lb)
                tot_std_ub_filter.append(ub)

                solver_filter.append(mm)
                solver_std_lb_filter.append(lbb)
                solver_std_ub_filter.append(ubb)
            elif "Content" in file:
                tot_content.append(m)
                tot_std_lb_content.append(lb)
                tot_std_ub_content.append(ub)

                solver_content.append(mm)
                solver_std_lb_content.append(lbb)
                solver_std_ub_content.append(ubb)
            elif "TagSearch" in file:
                tot_tag.append(m)
                tot_std_lb_tag.append(lb)
                tot_std_ub_tag.append(ub)

                solver_tag.append(mm)
                solver_std_lb_tag.append(lbb)
                solver_std_ub_tag.append(ubb)



            print()
            
            
            
            
# Compile all Marmoset greedy binaries.
for file in marmosetFiles: 

            file_path = rootdir + file
            
            iterTimes = []
            
            for i in range(0, iterations):
                start = time.time()
                gibbon_cmd_haskell = subprocess.run(["gibbon", "--packed", "--no-gc", "--opt-layout-global", "--to-exe", file_path])
                elapsed = time.time()
                iterTimes.append(float(elapsed-start))

            m, lb, ub = mean_confidence_interval(iterTimes)
            median = statistics.median(iterTimes)
            print(file + " (Greedy Times) : " + "Median: {}, Mean: {}, lb: {}, ub: {}".format(median, m, lb, ub))
            if "Filter" in file: 
                tot_compile_greedy_filter.append(m)
                greedy_lb_filter.append(lb)
                greedy_ub_filter.append(ub)
            elif "Content" in file:
                tot_compile_greedy_content.append(m)
                greedy_lb_content.append(lb)
                greedy_ub_content.append(ub)
            elif "TagSearch" in file:
                tot_compile_greedy_tag.append(m)
                greedy_lb_tag.append(lb)
                greedy_ub_tag.append(ub)
            print()
            
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# FilterBlogCompileTimes
width = 0.25
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

t_compile_filter = [element1 - element2 for (element1, element2) in zip(tot_filter, solver_filter)]

error_compile_ub_filter = [element1 - element2 for (element1, element2) in zip(tot_std_ub_filter, solver_std_ub_filter)]
error_compile_lb_filter = [element1 - element2 for (element1, element2) in zip(tot_std_lb_filter, solver_std_lb_filter)]

delta_error_compile_filter = [abs(element1 - element2) for (element1, element2) in zip(error_compile_ub_filter, error_compile_lb_filter)]
delta_error_solver_filter  = [0] * 7

fig, ax = plt.subplots()

delta_error_gibbon_filter = [element1 - element2 for (element1, element2) in zip(gibbon_ub_filter, gibbon_lb_filter)]
delta_error_greedy_filter = [element1 - element2 for (element1, element2) in zip(greedy_ub_filter, greedy_lb_filter)]

plt.ylim([0, 6])

# Stacked bar chart, gibbon
ax.bar(values, tot_compile_gibbon_filter, yerr = delta_error_gibbon_filter, width=width, ecolor = 'black', color= 'green', error_kw=dict(lw=1, capsize=2, capthick=1))

#Stacked bar chart greedy 
ax.bar(values + width, tot_compile_greedy_filter, yerr = delta_error_greedy_filter , width=width, ecolor = 'black', color= 'yellow', error_kw=dict(lw=1, capsize=2, capthick=1))

# Stacked bar chart, marmoset
ax.bar(values + width*2 , t_compile_filter, yerr = delta_error_solver_filter , width=width, ecolor = 'black', color= 'blue')
ax.bar(values + width*2, solver_filter, yerr = delta_error_compile_filter , width=width, ecolor = 'black', bottom = t_compile_filter, color= 'red', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Time in Seconds", fontsize ='36')

plt.yticks(fontsize='32')

Legend = ['gibbon', 'marmoset greedy', 'marmoset - (solver + IO) ', 'solver + IO']

ax.legend(Legend, loc = 2, fontsize=32)

fig.set_size_inches(16, 8)                                                                                                                                    
plt.savefig('FilterBlogCompileTimes.pdf', dpi=4000, format='pdf', bbox_inches='tight')


#---------------------------------------------------------------------------------------------------------------------------------------------------------------
# ContentSearchCompileTimes
width = 0.25
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

t_compile_content = [element1 - element2 for (element1, element2) in zip(tot_content, solver_content)]

delta_error_compile_content = [element1 - element2 for (element1, element2) in zip(tot_std_ub_content, tot_std_lb_content)]
delta_error_solver_content  = [0] * 7

delta_error_gibbon_content = [element1 - element2 for (element1, element2) in zip(gibbon_ub_content, gibbon_lb_content)]
delta_error_greedy_content = [element1 - element2 for (element1, element2) in zip(greedy_ub_content, greedy_lb_content)]

plt.ylim([0, 14])

# Stacked bar chart, gibbon
ax.bar(values, tot_compile_gibbon_content, yerr = delta_error_gibbon_content, width=width, ecolor = 'black', color= 'green', error_kw=dict(lw=1, capsize=2, capthick=1))

#Stacked bar chart greedy 
ax.bar(values + width, tot_compile_greedy_content, yerr = delta_error_greedy_content, width=width, ecolor = 'black', color= 'yellow', error_kw=dict(lw=1, capsize=2, capthick=1))

# Stacked bar chart, marmoset
ax.bar(values + width*2 , t_compile_content, yerr = delta_error_solver_content , width=width, ecolor = 'black', color= 'blue')
ax.bar(values + width*2, solver_content, yerr = delta_error_compile_content , width=width, ecolor = 'black', bottom = t_compile_content, color= 'red', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Time in Seconds", fontsize ='36')

plt.yticks(fontsize='32')

Legend = ['gibbon', 'marmoset greedy', 'marmoset - (solver + IO) ', 'solver + IO']

ax.legend(Legend, loc = 2, fontsize=32)

fig.set_size_inches(16, 8)                                                                                                                                    
plt.savefig('ContentSearchCompileTimes.pdf', dpi=4000, format='pdf', bbox_inches='tight')


#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#TagSearchCompileTimes
width = 0.25
groups = ['hiadctb', 'ctbhiad', 'tbchiad', 'tcbhiad', 'btchiad', 'bchiadt', 'cbiadht']
values = np.arange(len(groups))

fig, ax = plt.subplots()

t_compile_tag = [element1 - element2 for (element1, element2) in zip(tot_tag, solver_tag)]

error_compile_ub_tag = [element1 - element2 for (element1, element2) in zip(tot_std_ub_tag, solver_std_ub_tag)]
error_compile_lb_tag = [element1 - element2 for (element1, element2) in zip(tot_std_lb_tag, solver_std_lb_tag)]

delta_error_compile_tag = [element1 - element2 for (element1, element2) in zip(tot_std_ub_tag, tot_std_lb_tag)]
delta_error_solver_tag  = [0] * 7

delta_error_gibbon_tag = [element1 - element2 for (element1, element2) in zip(gibbon_ub_tag, gibbon_lb_tag)]
delta_error_greedy_tag = [element1 - element2 for (element1, element2) in zip(greedy_ub_tag, greedy_lb_tag)]

plt.ylim([0, 16])

# Stacked bar chart, gibbon
ax.bar(values, tot_compile_gibbon_tag, yerr = delta_error_gibbon_tag , width=width, ecolor = 'black', color= 'green', error_kw=dict(lw=1, capsize=2, capthick=1))

#Stacked bar chart greedy 
ax.bar(values + width, tot_compile_greedy_tag, yerr = delta_error_greedy_tag , width=width, ecolor = 'black', color= 'yellow', error_kw=dict(lw=1, capsize=2, capthick=1))

# Stacked bar chart, marmoset
ax.bar(values + width*2 , t_compile_tag, yerr = delta_error_solver_tag , width=width, ecolor = 'black', color= 'blue')
ax.bar(values + width*2, solver_tag, yerr = delta_error_compile_tag , width=width, ecolor = 'black', bottom = t_compile_tag, color= 'red', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Time in Seconds", fontsize ='36')

plt.yticks(fontsize='32')

Legend = ['gibbon', 'marmoset greedy', 'marmoset - (solver + IO) ', 'solver + IO']

ax.legend(Legend, loc = 2, fontsize=32)


fig.set_size_inches(16, 8)                                                                                                                                    
plt.savefig('TagSearchCompileTimes.pdf', dpi=4000, format='pdf', bbox_inches='tight')

# comment out for silent mode
plt.show()