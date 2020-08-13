# excitedquarks-rivet
Rivet routine to plot the four momentum of excited quarks. There are two Rivet analysis: MCR_EXCITEDQUARKS_P.cc and MCR_EXCITEDQUARKS_4M.cc. The first one uses the Particle class to obtain the 4-momentum of the events whereas the second one uses the FourMomentum class to do the same. 

# Generate the events using the Sacrifice interface for Pythia:

$ run-pythia --collision-energy 14000 -c "ExcitedFermion:dg2dStar = on" -c "ExcitedFermion:ug2uStar = on" -c "4000001:m0 = 2000" -c "4000002:m0 = 2000" -c "ExcitedFermion:Lambda = 2000" -c "ExcitedFermion:coupF = 1.0" -c "ExcitedFermion:coupFprime = 1.0" -c "ExcitedFermion:coupFcol = 1.0" -c "4000001:mayDecay = on" -c "4000002:mayDecay = on" -c "PhaseSpace:pTHatMin=30" -n 10000

*After the code above is run, a pythia.hepmc file will be generated. 

# Instructions on how to run the MCR_EXCITEDQUARKS_P Rivet analysis (the procedure is the same for MCR_EXCITEDQUARKS_4M):
  # 1. Pull the MCR_EXCITEDQUARKS_P.cc, MCR_EXCITEDQUARKS_P.plot file from Git
  # 2. Run the Rivet analysis:
$ rivet-mkanalysis MCR_EXCITEDQUARKS_P
$ nano MCR_EXCITEDQUARKS_P 
  *When you open the MCR_EXCITEDQUARKS_P.cc file paste there the content from the file with the same name pulled from Git
$ rivet-buildplugin RivetCUSTOM.so MCR_EXCITEDQUARKS_P.cc
$ rivet --analysis=MCR_EXCITEDQUARKS_P pythia.hepmc 
  # 3. Produce the plots using Yoda: 
$ nano MCR_EXCITEDQUARKS_P.plot
  *When you open the MCR_EXCITEDQUARKS_P.plot file paste there the content from the file with the same name pulled from Git
$ rivet-mkhtml --pwd Rivet.yoda


