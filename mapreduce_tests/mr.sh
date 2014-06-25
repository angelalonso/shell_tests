#!/bin/bash
# Based on https://github.com/erikfrey/bashreduce/blob/master/br

TMPDIR="`pwd`/temp"
JOBID="`uuidgen`"
JOBPATH="$TMPDIR/br_job_$JOBID"
NODEPATH="$TMPDIR/br_node_$JOBID"
echo $JOBID


