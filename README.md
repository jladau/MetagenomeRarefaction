# Nestedness
Software for rarefying metagenomes using an analytic approach rather than re-assembling metagenomes. As inputs this software takes: 

1. A HDF5 biom file (http://biom-format.org/documentation/format_versions/biom-2.1.html) containing the read depths of each gene in a set of metagenomes. As metadata in the biom file, each metagenome should be annotated with its mean read length and total number of reads (assembled and unassembled) under the fields 'mean_read_length' and 'total_reads', respectively. Each gene should be annotated with its length, under the field 'gene_length'. An example file is included at test-data/test-metagenomes.biom

2. A comma-delimited text file mapping read depth to the probability of assembly, with the headers 'READ_DEPTH' and 'PROBABILITY_OF_ASSEMBLY'. An example file is included at ref/probability-of-assembly-vs-depth.csv.

A test script, main-test.sh, is provided in the this directory. To run it, update the variable sIODir on the third line to point to the directory containing the script, and run the command 'bash main-test.sh'. Output will be written to the test-output directory; it can be compared with the correct output in the test-output-correct directory. Complete documentation of all available arguments can be obtained by uncommenting line 39 of the script, or in the doc/help.txt file. Compiled Java binaries are included in the bin directory. Source code is available in the following GitHub repository: https://github.com/jladau/JavaSource.

## Dependencies
This software requires Java Runtime Environment (JRE) version 1.6 or greater. On many Apple systems, even if JRE 1.6 or greater is installed, the default version for running applications may be 1.5. The Java version can be checked by typing 'java -version' into a terminal. If an updated version is installed but is not being used, a few updates will need to be made; namely you might try typing the following commands in a terminal:

<pre><code>
sudo rm /usr/bin/java
sudo ln -s /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java /usr/bin
</code></pre>

More information on correcting the Java version can be found here: http://stackoverflow.com/questions/12757558/installed-java-7-on-mac-os-x-but-terminal-is-still-using-version-6.

Additionally, to convert JSON formatted biom files to HDF5 formatted files, the biom binaries (http://biom-format.org/index.html) must be installed to enable the 'biom convert' terminal command.
