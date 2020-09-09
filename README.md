# excitedquarks-rivet
#### Rivet routine to plot the four momentum of excited quarks. The following Rivet analysis are present: 
- MCR_EXCITEDQUARKS_P.cc : uses the Particle class to obtain the 4-momentum of the events
- MCR_EXCITEDQUARKS_4M.cc : uses the FourMomentum class to obtain the 4-momentum of the events
- MCR_EXCITEDQUARKS_M.cc : uses the MCR_EXCITEDQUARKS_P.cc as a base but also plots the invariant mass of the leading dijet system 
#### The steps to obtain and run the Rivet analysis are as follow: 
- [Setup](#Setup)
- [Install the projects](#Installtheprojects)
- [Event generation](#eventgeneration)
- [Rivet analysis](#rivetanalysis)
- [Yoda plots](#yodaplots)

## Setup
Pull the docker container containing Pythia:
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
## Install the projects
Create directories for the repository
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
Run Pythia:
```bash
docker run -it -u $(id -u $USER) -v $PWD:$PWD -w $PWD --env="RIVET_ANALYSIS_PATH=." mcnetschool/tutorial:pythia-1.0.0
```
Use the Sacriface interface for Pythia to generate the events. The following code will generate 10 000 events of the processes ![equation](http://www.sciweavers.org/tex2img.php?eq=ug%20%5Crightarrow%20u%5E%2A%20%5Crightarrow%20ug&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0) and ![equation](http://www.sciweavers.org/tex2img.php?eq=dg%20%5Crightarrow%20d%5E%2A%20%5Crightarrow%20dg&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0). After running the code, a pythia.hepmc file will be produced. 
```bash

run-pythia --collision-energy 14000 -c "ExcitedFermion:dg2dStar = on" -c "ExcitedFermion:ug2uStar = on" -c "4000001:m0 = 2000" -c "4000002:m0 = 2000" -c "ExcitedFermion:Lambda = 2000" -c "ExcitedFermion:coupF = 1.0" -c "ExcitedFermion:coupFprime = 1.0" -c "ExcitedFermion:coupFcol = 1.0" -c "4000001:mayDecay = on" -c "4000002:mayDecay = on" -c "PhaseSpace:pTHatMin=30" -n 10000

```
## Run the Rivet analysis:
The procedure is the same for any of the .cc files, the MCR_EXCITEDQUARKS_P.cc is used as example.
Compile the analysis and then run it on the already produced pythia.hempc file
```bash
$ rivet-buildplugin MCR_EXCITEDQUARKS_P.cc
$ rivet --analysis=MCR_EXCITEDQUARKS_P pythia.hepmc 
``` 
## Yoda plots
Produce the plots using Yoda:
```bash
rivet-mkhtml --pwd Rivet.yoda:'Title=PYTHIA 8.2'
```
The plots will be saved to a new directory: rivet-plots/MCR_EXCITEDQUARKS_P .
###The following plots will be produced: 
- Number of events vs Invariant mass of the leading dijet system
- Number of events vs Particle energy
- Number of events vs Particle pseudorapidity
- Number of  events vs Particle azimuthal angle
- Number of events vs Particle transverse momentum
- vs Total multiplicity
- vs Total charged multiplicity

