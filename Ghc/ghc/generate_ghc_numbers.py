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
for subdir, dirs, files in os.walk(rootdir):
    
    print("subdir: " + str(subdir))
    print("dirs: " + str(dirs))
    print("files: " + str(files))
    
    for file in files: 
        
        if ".hs" in file and file in ghcFiles:
        
            file_path = subdir + file
            
            file_without_haskell_extension = file.replace(".hs", '')
            print("Compile " + file + "...")

            ghc_cmd_haskell = subprocess.run(["ghc", "-O3", file_path])
            print("The exit code for the haskell command was %d" % ghc_cmd_haskell.returncode)
            print()

            executables.append(file_without_haskell_extension)



Timings = {}

for file in executables: 

        print()
        print("Running the binary " + str(file))
        print()

        file_stats = file + ".txt"

        try:
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
        except:
                tupleTimes = (-1, -1)
                Timings[file] = tupleTimes

        print()



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

#Ghc = [(0.225395476/Marmoset_Median),(0.225769255/Marmoset_Median),(0.214234569/Marmoset_Median), (0.223801856/Marmoset_Median), (0.211657778/Marmoset_Median), (0.218405599/Marmoset_Median), (0.230497711/#Marmoset_Median)] 
#ErrorBarGhcLb = [(0.22429329448170157/Marmoset_UB),(0.22459338544449045/Marmoset_UB),(0.212920461807541/Marmoset_UB), (0.22280862150748224/Marmoset_UB), (0.2101991556628915/Marmoset_UB), (0.21738497102868323/#Marmoset_UB), (0.22989495707724106/Marmoset_UB)]
#ErrorBarGhcUb = [(0.22756159240718735/Marmoset_LB),(0.2267582294443984/Marmoset_LB),(0.21495953797023679/Marmoset_LB), (0.2253176862702956/Marmoset_LB), (0.21630266855933072/Marmoset_LB), (0.219801701193539/#Marmoset_LB), (0.2316596989227589/Marmoset_LB)] 

delta_error_ghc = [abs(element1 - element2) for (element1, element2) in zip(ErrorBarGhcUbFilter, ErrorBarGhcLbFilter)]
plt.ylim([0, 6])

# Stacked bar chart, marmoset
ax.bar(values , Ghc, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

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

Ghc = [(3.626187277/Marmoset_Median),(3.57383524/Marmoset_Median),(3.684741551/Marmoset_Median), (3.632958663/Marmoset_Median), (3.638080366/Marmoset_Median), (3.585630508/Marmoset_Median), (3.599035579/Marmoset_Median)] 

ErrorBarGhcLb = [(3.584182679694473/Marmoset_UB),(3.497106889117984/Marmoset_UB),(3.5843370635607665/Marmoset_UB), (3.5480737523985537/Marmoset_UB), (3.5766176723174516/Marmoset_UB), (3.5249513016925893/Marmoset_UB), (3.53552073656425/Marmoset_UB)]

ErrorBarGhcUb = [(3.700556361416638/Marmoset_LB),(3.6252115513264593/Marmoset_LB),(3.7325632782170115/Marmoset_LB), (3.700484465823669/Marmoset_LB), (3.6950645536825486/Marmoset_LB), (3.6559300227518547/Marmoset_LB), (3.655430860991307/Marmoset_LB)] 

delta_error_ghc = [element1 - element2 for (element1, element2) in zip(ErrorBarGhcUb, ErrorBarGhcLb)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Ghc, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

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

Ghc = [(12.196863463/Marmoset_Median),(12.110002843/Marmoset_Median),(14.40740848/Marmoset_Median), (12.310711557/Marmoset_Median), (14.252560143/Marmoset_Median), (14.252560143/Marmoset_Median), (14.252560143/Marmoset_Median)] 

ErrorBarGhcLb = [(11.808613241352441/Marmoset_UB),(11.759131672706282/Marmoset_UB),(14.308582698203264/Marmoset_UB), (12.227651187984256/Marmoset_UB), (14.111179461701267/Marmoset_UB), (14.158143463814984/Marmoset_UB), (12.229775082548432/Marmoset_UB)]

ErrorBarGhcUb = [(13.083980757758669/Marmoset_LB),(13.477219183293716/Marmoset_LB),(14.56685479979674/Marmoset_LB), (12.385758416904634/Marmoset_LB), (14.407891856076512/Marmoset_LB), (14.361631075073905/Marmoset_LB), (12.589485113007125/Marmoset_LB)] 

delta_error_ghc = [element1 - element2 for (element1, element2) in zip(ErrorBarGhcUb, ErrorBarGhcLb)]
plt.ylim([0, 8])

# Stacked bar chart, marmoset
ax.bar(values , Ghc, yerr = delta_error_ghc , width=width, ecolor = 'black', color= 'blue', error_kw=dict(lw=1, capsize=2, capthick=1))

plt.xticks(values, groups, color='black', rotation=25, fontweight='normal', fontstyle='italic', fontsize='36', horizontalalignment='center')

plt.xlabel("Layout Name", fontsize='36')
plt.ylabel("Speedup", fontsize ='36')

plt.yticks(fontsize='32')

plt.axhline(y=1, color='r', linestyle='--', lw=2)

fig.set_size_inches(16, 5)                                                                                                                                    
plt.savefig('SpeedupMarmosetGhcTagSearch.pdf', dpi=4000, format='pdf', bbox_inches='tight')
plt.show() 
