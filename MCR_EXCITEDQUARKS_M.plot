BEGIN PLOT /MCR_EXCITEDQUARKS_M/TotalMult
Title= Total Multiplicity
XLabel= Total number of particles
YLabel=$1/ \sigma \, \mathrm{d}\sigma/\mathrm{d}N_\text{tot}$
YMax= 0.1
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT

# ... add more histograms as you need them ...
BEGIN PLOT /MCR_EXCITEDQUARKS_M/TotalChMult
Title= Total Charged Multiplicity
XLabel= Total number of charged particles
YLabel= $1/ \sigma \, \mathrm{d}\sigma/\mathrm{d}N_\text{ch}$
YMax= 0.1
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT


BEGIN PLOT /MCR_EXCITEDQUARKS_M/Pt
Title= Particle Transverse Momentum
XLabel= Transverse momentum [GeV]
YLabel= Number of events
YMax= 10000000
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT


BEGIN PLOT /MCR_EXCITEDQUARKS_M/dijet_M
Title= Invariant mass of the dijet system
XLabel= Invariant mass [GeV]
YLabel= Number of events
YMax= 1000
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT

BEGIN PLOT /MCR_EXCITEDQUARKS_M/Phi
Title= Particle Azimuthal Angle
XLabel= Azimuthal angle [rad]
YLabel= Number of events
YMax= 10000000
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT

BEGIN PLOT /MCR_EXCITEDQUARKS_M/E
Title= Particle Energy
XLabel= Energy [GeV]
YLabel= Number of events
YMax= 10000000
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT

BEGIN PLOT /MCR_EXCITEDQUARKS_M/Eta
Title= Particle Pseudorapidity
XLabel= Pseudorapidity [rad]
YLabel= Number of events
YMax= 100000000
LegendAlign= r
# + any additional plot settings you might like, see make-plots documentation
END PLOT

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/TotalMult
\uput{2pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{2pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{2pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL 

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/TotalChMult
\uput{1pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{1pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{1pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/dijet_M
\uput{1pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{1pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{1pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/E
\uput{1pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{1pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{1pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/Eta
\uput{1pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{1pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{1pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/Pt
\uput{1pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{1pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{1pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL

BEGIN SPECIAL /MCR_EXCITEDQUARKS_M/Phi
\uput{1pt}[180]{0}(0.91,0.83){pp, $\sqrt{s} = 7 \, TeV$}
\uput{1pt}[180]{0}(0.3,0.83){$\textcolor{darkgray}{ug \rightarrow u* \rightarrow ug}$}
\uput{1pt}[180]{0}(0.3,0.9){$\textcolor{darkgray}{dg \rightarrow d* \rightarrow dg}$}
END SPECIAL
