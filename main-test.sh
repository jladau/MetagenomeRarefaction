#!/bin/bash

#Directory containing this script
sIODir=$HOME/Documents/Research/Java/Distribution/MetagenomeRarefaction

#Directory with Java compiled java binaries
sJavaDir=$sIODir/bin

#Path to file mapping from read depth to probability of assembly
sProbabilityOfAssemblyFcnPath=$sIODir/ref/probability-of-assembly-vs-depth.csv

#Metagenome rarefaction depth
iMetagenomeRarefactionDepth=1000000

#Mean read length
iMeanReadLength=300

#NOTE: for complete list of arguments and documentation, refer to doc/help.txt

cd $sIODir

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
	--sRarefactionMode=mean \
	--sRarefactionCurveOutputPath=$sIODir/test-output/test-metagenomes-rarefaction-curves.csv
biom convert -i test-output/test-metagenomes-rarefied.json -o test-output/test-metagenomes-rarefied.biom --to-hdf5
biom convert -i test-output/test-metagenomes-rarefied.json -o test-output/test-metagenomes-rarefied.tsv --to-tsv

#echo 'Printing help file...'
#java -cp $sJavaDir/MetagenomeRarefaction.jar gov.doe.jgi.MetagenomeRarefier.MetagenomeRarefierLauncher --help

