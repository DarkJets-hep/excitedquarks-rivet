#include "Rivet/Analysis.hh"
#include "Rivet/Projections/FinalState.hh"
#include "Rivet/Projections/ChargedFinalState.hh"
#include "Rivet/Projections/FastJets.hh"
#include "Rivet/Math/Vector4.hh"

namespace Rivet {


  /// @brief Just measures a few observables as a demo
  class MCR_EXCITEDQUARKS_M : public Analysis {
  public:

    /// Constructor
    DEFAULT_RIVET_ANALYSIS_CTOR(MCR_EXCITEDQUARKS_M);


    /// @name Analysis methods
    //@{

    /// Set up projections and book histograms
    void init() {
      // Projections
      const FinalState cnfs;
      const ChargedFinalState cfs(cnfs);
      declare(cnfs, "FS");
      declare(cfs, "CFS");
      //FastJets jets;
      declare(FastJets(cnfs, FastJets::ANTIKT, 1.0), "Jets");
      // Histograms
      book(_histTot ,"TotalMult", 50, -0.0, 1500.0);
      book(_histChTot ,"TotalChMult", 50, -0.0, 700.0);
      book(_histPt ,"Pt", 100, -0.0, 1300.0);
      book(_histEta ,"Eta", 100, -16.0, 16.0);
      book(_histE ,"E", 100, -0.0, 5500.0);
      book(_histPhi ,"Phi", 100, -1.0, 7.4);
      //book(_histM_leadjet , "lead_jet_M", 100, 0.0, 500.0);
      //book(_histM_subleadjet , "sublead_jet_M", 100, 0.0, 500.0);
      book(_histM_dijet , "dijet_M", 100, -0.0, 7000.0);
    }


    /// Do the analysis
    void analyze(const Event& event) {
	  const FinalState& cnfs = apply<FinalState>(event, "FS");
	  MSG_DEBUG("Total mult. = " << cnfs.size());	
          _histTot->fill(cnfs.size());
	  const Particles& cparticles = apply<FinalState>(event, "CFS").particles();
     	  MSG_DEBUG("Total charged multiplicity = " << cparticles.size());
          _histChTot->fill(cparticles.size());
	  const Jets& jets = apply<FastJets>(event, "Jets").jetsByPt(); 
	  double mjj = (jets[0].momentum()+jets[1].momentum()).mass();
	  _histM_dijet->fill(mjj/GeV);
	  for (const Particle& p : cnfs.particles()) {
		MSG_DEBUG("pT = " << p.pT());
		MSG_DEBUG("eta = " << p.eta());
		MSG_DEBUG("phi = " << p.phi());
		MSG_DEBUG("E = " << p.E());
		_histPt->fill(p.pT());
		_histEta->fill(p.eta());
		_histPhi->fill(p.phi());
		_histE->fill(p.E());
	  }
    }


    /// Finalize
    void finalize() {
      normalize(_histTot); 
      //normalize(_histPt); 
      normalize(_histChTot); 
      //normalize(_histEta); normalize(_histPhi); normalize(_histE); 
    }

    //@}


    //@{
    /// Histograms
    Histo1DPtr _histTot, _histChTot,  _histM_dijet,  _histPt, _histEta, _histPhi, _histE;
    //@}

  };


  // The hook for the plugin system
  DECLARE_RIVET_PLUGIN(MCR_EXCITEDQUARKS_M);

}


