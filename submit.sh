#!/bin/sh

njobs=5
mkdir -p JOBS

for i in `seq 0 $(($njobs-1))`
do

echo $i
jobi=job$i
mkdir JOBS/$jobi
mkdir JOBS/$jobi/ana
mkdir JOBS/$jobi/output
mkdir JOBS/$jobi/error
mkdir JOBS/$jobi/log

cp ampt JOBS/$jobi
cp input.ampt JOBS/$jobi
cp exec.sh JOBS/$jobi
sed "37i cd /afs/cern.ch/work/d/ddevetak/condor-ampt/Ampt-v1.26t9b-v2.26t9b/JOBS/$jobi" JOBS/$jobi/exec.sh > JOBS/$jobi/exec
rm JOBS/$jobi/exec.sh
chmod +x JOBS/$jobi/exec
cp run.sub JOBS/$jobi/run$i.sub

cd JOBS/$jobi
condor_submit run$i.sub
sleep 2
cd ../..

done



