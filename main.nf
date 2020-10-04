#!/usr/bin/env nextflow

//refbwaindex = "s3://nextflow-tower-test/test/IGC/index/bwa/"
refbwaindex = "s3://nextflow-tower-test/test/dummy_reference/index/bwa/"

refbwaindexChannel      = Channel.fromPath("${refbwaindex}/*")

process ls {
    
	input:
		file hostbwaallindex from refbwaindexChannel.collect()
        
        """
        ls -lha
        """
        
}
