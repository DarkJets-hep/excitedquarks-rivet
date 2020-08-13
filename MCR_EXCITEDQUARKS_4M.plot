BEGIN PLOT /MCR_EXCITEDQUARKS_4M/TotalMult
Title= Total Multiplicity
XLabel= Total number of particles
YLabel=$1/ \sigma \, \mathrm{d}\sigma/\mathrm{d}N_\text{tot}$
# + any additional plot settings you might like, see make-plots documentation
END PLOT

# ... add more histograms as you need them ...
BEGIN PLOT /MCR_EXCITEDQUARKS_4M/TotalChMult
Title= Total Charged Multiplicity
XLabel= Total number of charged particles
YLabel= $1/ \sigma \, \mathrm{d}\sigma/\mathrm{d}N_\text{ch}$
# + any additional plot settings you might like, see make-plots documentation
END PLOT


BEGIN PLOT /MCR_EXCITEDQUARKS_4M/Pt
Title= Particle Transverse Momentum
XLabel= Transverse momentum [GeV]
YLabel= Number of events
# + any additional plot settings you might like, see make-plots documentation
END PLOT


BEGIN PLOT /MCR_EXCITEDQUARKS_4M/Eta
Title= Particle Pseudorapidity
XLabel= Pseudorapidity
YLabel= Number of events
# + any additional plot settings you might like, see make-plots documentation
END PLOT


BEGIN PLOT /MCR_EXCITEDQUARKS_4M/E
Title= Particle Energy
XLabel= Energy [GeV]
YLabel= Number of events
# + any additional plot settings you might like, see make-plots documentation
END PLOT


BEGIN PLOT /MCR_EXCITEDQUARKS_4M/Phi
Title= Particle Azimuthal Angle
XLabel= Azimuthal angle [rad]
YLabel= Number of events
# + any additional plot settings you might like, see make-plots documentation
END PLOT
