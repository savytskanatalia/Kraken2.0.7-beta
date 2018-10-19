# Kraken2.0.7-beta
Kraken is a taxonomic sequence classifier that assigns taxonomic labels to DNA sequences. 
Additional information and manual can be found here: http://ccb.jhu.edu/software/kraken/MANUAL.html#installation

Kraken2.0.7-beta edited from the original source : https://www.github.com/DerrickWood/kraken2/archive/v2.0.7-beta.tar.gz by Derrick Wood
Taxonomy was downloaded separately, based on the links in the script file for this purpose.
As suggested elsewhere by the developers, it is better to make a custom library in any case. 
The docker file does NOT include ncbi-blast+ installation, thus, while databases/library .fna files will be uploaded, masking will be failed. To mask them, a separate docker image for ncbi-blast+ is suggested to be installed and all .fna library files masked with an output format indicated to be fasta.


To run paired-end .fastq-s

kraken2 --db $YOUR_DB --paired --classified-out $NAME#.fastq --unclassified-out $NAME#.fastq --output $NAME.tsv --report  $NAME.tsv --use-names  --threads 30  $1.fastq $2.fastq
