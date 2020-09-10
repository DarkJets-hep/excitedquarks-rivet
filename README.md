# excitedquarks-rivet
#### Rivet routine to plot the four momentum of excited quarks. The following Rivet analysis are present: 
- MCR_EXCITEDQUARKS_M.cc : uses the Particle class to obtain the 4-momentum of the events and the invariant mass of the leading dijet system 
#### The steps to obtain and run the Rivet analysis are as follow: 
- [Setup](#Setup)
- [Install the projects](#Installtheprojects)
- [Event generation](#eventgeneration)
- [Rivet analysis](#rivetanalysis)
- [Yoda plots](#yodaplots)

## Setup
Install Docker on your pc:
```bash
https://www.docker.com/products/docker-desktop
```
Pull the docker container containing Pythia 8.2:
```bash
docker pull mcnetschool/tutorial:pythia-1.0.0
```
Get updates (for Ubuntu systems):
```bash
$ sudo apt-get update
$ sudo apt-get install mercurial
```

Get updates (for Mac):
```bash
$ brew install mercurial
```
Clone the repository: 
```bash
hg clone https://bitbucket.org/Patrick_K_2016/mcnet-tutorial-vietnam
```
Install Rivet 3.0.2: 
```bash
https://rivet.hepforge.org/trac/wiki/GettingStarted
```
## Install the projects
Create an empty directory where the project will be stored
```bash
mkdir excitedquarks-rivet
```
Access the directory
```bash
cd excitedquarks-rivet
```
Fetch the latest versions of the projects
```bash
$ cd excitedquarks-rivet
$ git init
$ git pull https://github.com/DarkJets-hep/excitedquarks-rivet.git
```
## Event generation
Run Pythia in the same directory (excitedquarks-rivet):
```bash
docker run -it -u $(id -u $USER) -v $PWD:$PWD -w $PWD --env="RIVET_ANALYSIS_PATH=." mcnetschool/tutorial:pythia-1.0.0
```
Use the Sacriface interface for Pythia to generate the events. The following code will generate 10 000 events of the processes ![equation](http://www.sciweavers.org/tex2img.php?eq=ug%20%5Crightarrow%20u%5E%2A%20%5Crightarrow%20ug&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0) and ![equation](http://www.sciweavers.org/tex2img.php?eq=dg%20%5Crightarrow%20d%5E%2A%20%5Crightarrow%20dg&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0).
```bash

run-pythia --collision-energy 14000 -c "ExcitedFermion:dg2dStar = on" -c "ExcitedFermion:ug2uStar = on" -c "4000001:m0 = 2000" -c "4000002:m0 = 2000" -c "ExcitedFermion:Lambda = 2000" -c "ExcitedFermion:coupF = 1.0" -c "ExcitedFermion:coupFprime = 1.0" -c "ExcitedFermion:coupFcol = 1.0" -c "4000001:mayDecay = on" -c "4000002:mayDecay = on" -c "PhaseSpace:pTHatMin=30" -n 10000

```
Details on the generation code: 
```bash
run-pythia --collision-energy 14000 #Sets the center of mass energy to be 14 TeV 
-c "ExcitedFermion:dg2dStar = on" #Sets on the process dg → d* → dg
-c "ExcitedFermion:ug2uStar = on" #Sets on the process ug → u* → ug
-c "4000001:m0 = 2000" #Sets the mass of the excited down quark to be 2 TeV
-c "4000002:m0 = 2000" #Sets the mass of the excited up quark to be 2 TeV
-c "ExcitedFermion:Lambda = 2000" #Sets the compositeness scale Lambda to be 2 TeV 
#The following 3 lines allows couplings to other particles:
-c "ExcitedFermion:coupF = 1.0" #Sets the strength f of the SU(2) coupling
-c "ExcitedFermion:coupFprime = 1.0" #Sets the strength f' of the U(1) coupling
-c "ExcitedFermion:coupFcol = 1.0" #Sets the strength f_c of the SU(3) coupling
-c "4000001:mayDecay = on" #Allows decay of the excited down quark
-c "4000002:mayDecay = on" #Allows decay of the excited up quark
-c "PhaseSpace:pTHatMin=30" #Sets the minimum cut on the momentum transfer of the interaction to be 30 GeV
-n 10000 #Sets the number of events to be generated to be 10000
```
After running the code, a pythia.hepmc file will be produced. 

## Run the Rivet analysis:
The procedure is the same for any of the .cc files, the MCR_EXCITEDQUARKS_M.cc is used as example.
Compile the analysis and then run it on the already produced pythia.hempc file
```bash
$ rivet-buildplugin MCR_EXCITEDQUARKS_M.cc
$ rivet --analysis=MCR_EXCITEDQUARKS_M pythia.hepmc 
``` 
## Yoda plots
Produce the plots using Yoda:
```bash
rivet-mkhtml --pwd Rivet.yoda:'Title=PYTHIA 8.2'
```
The plots will be saved to a new directory: rivet-plots/MCR_EXCITEDQUARKS_M .
#### The following plots will be produced: 
- Number of events vs Particle energy
- Number of events vs Particle pseudorapidity
- Number of  events vs Particle azimuthal angle
- Number of events vs Particle transverse momentum
- Total multiplicity
- Total charged multiplicity
- Number of events vs Invariant mass of the leading dijet system
