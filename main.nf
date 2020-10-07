#!/usr/bin/env nextflow

refbwaindex = "s3://nextflow-tower-test/test/IGC/index/bwa/"
//refbwaindex = "s3://nextflow-tower-test/test/dummy_reference/index/bwa/"

refbwaindexChannel      = Channel.fromPath("${refbwaindex}/*")

process ls {
    
	input:
		file refbwaindex from refbwaindexChannel.collect()
        
        """
	pwd
	echo "============"
        ls -lha
	echo "============"
	ls -lha /tmp
	echo "============"
	ls -lha /
	echo "============"
	df -h
	echo "============"
	ls -lha /etc/hosts
        """
        
}
