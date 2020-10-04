#!/usr/bin/env nextflow

query       = "s3://nextflow-tower-test/test/sequencing_data/"
seqname_prefix   = ""
seqname_suffix   = ".fq.gz"
seqname_middle   = ""
refbwaindex = "s3://nextflow-tower-test/test/IGC/index/bwa/"

seqdataChannel = Channel.fromFilePairs("${query}/${seqname_prefix}*${seqname_middle}{1,2}${seqname_suffix}", flat: false)
refbwaindexChannel      = Channel.fromPath("${refbwaindex}/*")

process map {
    
	input:
		set val(sampleid), file(read1), file(read2) from seqdataChannel
		file hostbwaallindex from hostbwaindexChannel.collect()
	
	output:
		file "test.sam"
        
	script:
		hostbwaallindex_base = hostbwaallindex[0].toString() - ~/.amb?/ - ~/.ann?/ - ~/.bwt?/ - ~/.pac?/ - ~/.sa?/
        """
        bwa mem -t1 "${refbwaallindex_base}" ${read1} ${read2} > test.sam
        """
        
}
