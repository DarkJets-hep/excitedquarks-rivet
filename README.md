# excitedquarks-rivet
Rivet routine to plot the four momentum of excited quarks. There are two Rivet analysis: MCR_EXCITEDQUARKS_P.cc and MCR_EXCITEDQUARKS_4M.cc. The first one uses the Particle class to obtain the 4-momentum of the events whereas the second one uses the FourMomentum class to do the same. 
- [Installation](#installation)
- [Setup](#Setup)
- [Event generation](#eventgeneration)
- [Rivet analysis](#rivetanalysis)
- [Yoda plots](#yodaplots)

## Installation
## Setup
## Event generation
Use the Sacriface interface for Pythia to generate the events. The following code will generate 10 000 events of the processes ![equation](http://www.sciweavers.org/tex2img.php?eq=ug%20%5Crightarrow%20u%5E%2A%20%5Crightarrow%20ug&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0) and ![equation](http://www.sciweavers.org/tex2img.php?eq=dg%20%5Crightarrow%20d%5E%2A%20%5Crightarrow%20dg&bc=White&fc=Black&im=jpg&fs=12&ff=modern&edit=0). After running the code, a pythia.hepmc file will be produced. 
```bash

run-pythia --collision-energy 14000 -c "ExcitedFermion:dg2dStar = on" -c "ExcitedFermion:ug2uStar = on" -c "4000001:m0 = 2000" -c "4000002:m0 = 2000" -c "ExcitedFermion:Lambda = 2000" -c "ExcitedFermion:coupF = 1.0" -c "ExcitedFermion:coupFprime = 1.0" -c "ExcitedFermion:coupFcol = 1.0" -c "4000001:mayDecay = on" -c "4000002:mayDecay = on" -c "PhaseSpace:pTHatMin=30" -n 10000

```

## Rivet analysis
#### Pull the MCR_EXCITEDQUARKS_P.cc, MCR_EXCITEDQUARKS_P.plot file from Git
## Run the Rivet analysis:
#### Make an empty rivet analysis with the name MCR_EXCITEDQUARKS_P
```bash
rivet-mkanalysis MCR_EXCITEDQUARKS_P
```  
#### Open the MCR_EXCITEDQUARKS_P.cc file with a text editor and paste there the content from the file with the same name pulled from Git.
```bash
nano MCR_EXCITEDQUARKS_P 
```
#### Compile the analysis and then run it on the already produced pythia.hempc file
```bash
rivet-buildplugin RivetCUSTOM.so MCR_EXCITEDQUARKS_P.cc
rivet --analysis=MCR_EXCITEDQUARKS_P pythia.hepmc 
``` 
## Yoda plots

#### Open the MCR_EXCITEDQUARKS_P.plot file with a text editor and paste there the content from the file with the same name pulled from Git
```bash
nano MCR_EXCITEDQUARKS_P.plot
```  
#### Produce the plots using Yoda:
```bash
rivet-mkhtml --pwd Rivet.yoda
```
The plots will be saved in a folder named "rivet-plots". 

