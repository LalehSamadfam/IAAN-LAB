#!/bin/bash

subjectlist=subjectlist.txt

while read -r subject;
do
    mkdir -p hcp/$subject
    mkdir -p hcp/$subject/T1w
    mkdir -p hcp/$subject/rfMRI_REST1_LR/

    aws s3 cp s3://hcp-openaccess/HCP/$subject/T1w/T1w_acpc_dc_restore_brain.nii.gz hcp/$subject/T1w  --region us-east-1
    aws s3 cp s3://hcp-openaccess/HCP/$subject/T1w/aparc+aseg.nii.gz hcp/$subject --region us-east-1
    aws s3 cp s3://hcp-openaccess/HCP/$subject/MNINonLinear/Results/rfMRI_REST1_LR/rfMRI_REST1_LR.nii.gz hcp/$subject/rfMRI_REST1_LR --region us-east-1

done < $subjectlist