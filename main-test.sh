#!/bin/bash

#NOTES:
#This script runs rarefaction for an example set of metagenomes.
#Output is written to the test-output/ directory, and should be identical to the output in the test-output-correct/ directory.
#If the command line interface (CLI) for working with BIOM files is installed (http://biom-format.org), then the output can be reformatted to HDF5 or TSV format by uncommenting the last two lines of this script.
#The contents of the help file can be displayed by uncommenting line 25 (it is also available in doc/help.txt)
#Additional information, inlcuding documentation on dependencies, is available in the README.md file

#Directory containing this script
sIODir=$HOME/Documents/Research/Java/Distribution/MetagenomeRarefaction

#Directory with Java compiled java binaries
sJavaDir=$sIODir/bin

#Path to file mapping from read depth to probability of assembly
sProbabilityOfAssemblyFcnPath=$sIODir/ref/probability-of-assembly-vs-depth.csv

#Metagenome rarefaction depth
iMetagenomeRarefactionDepth=1000000

cd $sIODir

#echo 'Printing help file...'
#java -cp $sJavaDir/MetagenomeRarefaction.jar gov.doe.jgi.MetagenomeRarefier.MetagenomeRarefierLauncher --help > doc/help.txt

echo 'Initializing...'
rm -fr test-output
mkdir test-output

echo 'Rarefying...'
java -cp $sJavaDir/MetagenomeRarefaction.jar gov.doe.jgi.MetagenomeRarefier.MetagenomeRarefierLauncher \
	--iMetagenomeRarefactionDepth=$iMetagenomeRarefactionDepth \
	--sBIOMPath=$sIODir/test-data/test-metagenomes.biom \
	--sOutputPath=$sIODir/test-output/test-metagenomes-rarefied.json \
	--iRandomSeed=1234 \
	--sProbabilityOfAssemblyFcnPath=$sProbabilityOfAssemblyFcnPath \
	--sOutputMode=probability_assembly
#biom convert -i test-output/test-metagenomes-rarefied.json -o test-output/test-metagenomes-rarefied.biom --to-hdf5
#biom convert -i test-output/test-metagenomes-rarefied.json -o test-output/test-metagenomes-rarefied.tsv --to-tsv




