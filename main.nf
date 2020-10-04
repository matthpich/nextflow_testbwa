#!/usr/bin/env nextflow

refbwaindex = "s3://nextflow-tower-test/test/IGC/index/bwa/"

refbwaindexChannel      = Channel.fromPath("${refbwaindex}/*")

process ls {
    
	input:
		file hostbwaallindex from refbwaindexChannel.collect()
        
        """
        ls -lha
        """
        
}
