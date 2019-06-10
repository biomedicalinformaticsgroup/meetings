## INTRODUCTION
- top-down proteomics (intact proteins) 
  
- bottom-up proteomics (Protein are cleaved into peptide) 
    
    - Data-dependent acquisition 
    
    the n most intense peptide features are selected for fragmentation, dynamically excluding masses that have just been previously selected. 
    
    - Data-independent acquisition
     
    a set of constant mass ranges, which do not depend on the peptides being analyzed, is isolated for fragmentation 
    
    - Targeted

    a set of key peptides from a target list, which is informative for a set of proteins or PTMs of interest, is quantitatively monitored over many samples using dedicated software 


## IDENTIFICATION AND QUANTIFICATION OF PEPTIDES, PROTEINS, AND POSTTRANSLATIONAL MODIFICATIO
 
### Liquid Chromatography-Mass Spectrometry Features (Figure 3)
- high resolution
- dimensionality
    - LC-MS intensity 
    - ion mobility
- isotopic peaks are detected
- recalibration systematic measurement errors

### Peptide Identification (Figure 4)

determining the sequence of the peptide from fragmentation spectra obtained by the mass spectrometer

- ref db for protein sequence 
    - digested in silico into peptides according to a cleavage rule 
    - expected fragment masses is calculated
    - For a given measured fragmentation spectrum, a match score is caclulated against all theoretical 
    fragmentation spectra within a specified peptide mass tolerance. 
    - The highest-scoring peptide spectrum match (PSM) is taken as a candidate  
    - control the FDR using a target–decoy approach, where a decoy database is used (designed to produce false-positive PSMs)
- De novo peptide sequencing
- peptide modification detection
    - phosphorylation. several potentially phosphorylated, mass only indicates that it is phosphorylated only once
    - modified amino acids. 
    
### Protein Inference and False Discovery Rate
assembly of peptides into a list of proteins
- The relationship between peptides and proteins is many-to-many, since upon digestion a protein gives rise 
to many peptides, but a peptide can also originate from more than one protein.
- shorter peptide is less informative, 
- Protein assembly
    - Parsimonious models (a set of proteins that is as small as possible to explain the observed peptides)
    - Statistical models
- Ideally, the output of the protein inference step is a list of protein groups. 
Each protein group contains a set of proteins that cannot be distinguished from each other based on the observed peptides.
- error expension.     
### Quantification (Figure 5)
- absolute quantification (copy numbers or concentrations of proteins within a sample)
- relative quantification (a quantitative ratio or relative change of protein concentrations between samples is desired)

##### relative quantification 
- label-free quantification (samples being compared are biochemically processed separately)
    - In label-free quantification, one faces particular challenges with normalization intensities between LC-MS runs 
    and the compatibility of quantification with prefractionation
- MS1 labeling 
    - (+)more accurate
- MS2 labeling
    - (+)multiplexing capacity(11 samples)
    - (-)the presence of coeluting peptides in the isolation window for fragmentation leads to ratio compression

#### absolute quantification
The problem that peptides of a protein have vastly different flyability 
(a term used to cover the relative efficiencies of ionization, transfer, and detection), 
making them not directly comparable for quantification, is solved by averaging over many 
peptides or selecting the most intense ones, which enriches for high flyability.
  

##DOWNSTREAM DATA ANALYSIS

### Exploratory Statistics

### Posttranslational Modifications

### Machine Learning

### Network Biology

### Multiomics Data Analysis

