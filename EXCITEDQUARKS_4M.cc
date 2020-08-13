#include "Rivet/Analysis.hh"
#include "Rivet/Projections/FinalState.hh"
#include "Rivet/Projections/ChargedFinalState.hh"
#include "Rivet/Projections/FastJets.hh"
#include "Rivet/Math/Vector4.hh"

namespace Rivet {


  /// @brief Just measures a few observables as a demo
  class EXCITEDQUARKS_4M : public Analysis {
  public:

    /// Constructor
    DEFAULT_RIVET_ANALYSIS_CTOR(EXCITEDQUARKS_4M);


    /// @name Analysis methods
    //@{

    /// Set up projections and book histograms
    void init() {
      // Projections
      const FinalState cnfs;
      const ChargedFinalState cfs(cnfs);
      const FourMomentum fm;
      declare(cnfs, "FS");
      declare(cfs, "CFS");
      declare(fm, "FourMomentum")

      // Histograms
      book(_histTot , "TotalMult", 100, -0.5, 99.5);
      book(_histChTot , "TotalChMult", 50, -1.0, 99.0);
      book(_histPt , "TotalPt", 100, -0.0, 200.0);
      book(_histEta , "TotalEta", 50, -5.0, 5.0);
      book(_histE , "TotalE", 100, 0.0, 7000.0);
      book(_histPhi , "TotalPhi", 10, -3.2, 3.2);
    }


    /// Do the analysis
    void analyze(const Event& event) {
      const FinalState& cnfs = apply<FinalState>(event, "FS");
      MSG_INFO("Total mult. = " << cnfs.size()); 
      _histTot->fill(cnfs.size());


      const Particles& cparticles = apply<FinalState>(event, "CFS").particles();
      MSG_DEBUG("Total charged multiplicity = " << cparticles.size());
      _histChTot->fill(cparticles.size());

      const FourMomentum& fm = apply<FourMomentum>(event, "FourMomentum");
	for (const Particle& p : cnfs.particles()) {
	  MSG_DEBUG("pT = " << fm.pT());
	  MSG_DEBUG("eta = " << fm.eta());
	  MSG_DEBUG("phi = " << fm.phi());
	  MSG_DEBUG("E = " << fm.E());
      	  _histPt->fill(fm.pT());
	  _histEta->fill(fm.eta());
	  _histPhi->fill(fm.phi());
	  _histE->fill(fm.E());
        }	  
    }


    /// Finalize
    void finalize() {
      normalize(_histTot); normalize(_histChTot); normalize(_histPt); 
      normalize(_histEta); normalize(_histPhi); normalize(_histE); 
    }

    //@}


    //@{
    /// Histograms
    Histo1DPtr _histTot, _histChTot, _histPt, _histEta, _histPhi, _histE;
    //@}

  };


  // The hook for the plugin system
  DECLARE_RIVET_PLUGIN(EXCITEDQUARKS_4M);

}
