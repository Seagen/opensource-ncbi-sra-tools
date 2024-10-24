#!/bin/bash

bin_dir=$1

echo "testing expected output for fastq-dump --split-3"

TEMPDIR=.

mkdir -p actual

output=$(NCBI_SETTINGS=${TEMPDIR}/tmp.mkfg \
	PATH="${bin_dir}:$PATH" \
	SRATOOLS_TESTING=2 \
	SRATOOLS_IMPERSONATE=fastq-dump \
	${bin_dir}/sratools --split-3 SRR390728 2>actual/split_3.stderr ; \
	diff expected/split_3.stderr actual/split_3.stderr)

res=$?
if [ "$res" != "0" ];
	then echo "Driver tool test split_3 FAILED, res=$res output=$output" && exit 1;
fi

echo Driver tool test split_3 is finished