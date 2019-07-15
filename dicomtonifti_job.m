%-----------------------------------------------------------------------
% Job saved on 08-Dec-2018 14:25:25 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%----------------------------------------------------------------------
% MS Preprocessing

% Júlia Soares| July 2019

% Conversion from DICOM to NIfTI format 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59 % 64 to run controls, 59 to run MS patients
   
    if(i<10)
        a=['0',num2str(i)];
    else
        a=num2str(i);
    end
    
    %T1-MPRAGE 
    %data_MSC=dir(['C:\MSCLEROSIS\raw_MRI\MSC\MPRAGE\MSC', a, '-MPRAGE','\*.dcm']);
    %data_CNT=dir(['C:\MSCLEROSIS\raw_MRI\CNT\MPRAGE\CNT', a, '-MPRAGE','\*.dcm']);
    
    %T2-FLAIR
    %data_MSC=dir(['C:\MSCLEROSIS\raw_MRI\MSC\FLAIR\MSC', a, '-FLAIR','\*.dcm']);
    %data_CNT=dir(['C:\MSCLEROSIS\raw_MRI\CNT\FLAIR\CNT', a, '-FLAIR','\*.dcm']);
   
    for j=1:size(data_MSC,1)
        c{j,1}=[imgs(j).folder,'\',imgs(j).name];
    end
    matlabbatch{i}.spm.util.import.dicom.data = c;
    matlabbatch{i}.spm.util.import.dicom.root = 'flat';
    newDICOMfolder = ['C:\MSCLEROSIS\MRI_NIFTI\MSC\FLAIR\MSC',a,'-FLAIR'];
    %newDICOMfolder = ['C:\MSCLEROSIS\MRI_NIFTI\MSC\MPRAGE\MSC',a,'-MPRAGE'];
    %newDICOMfolder = ['C:\MSCLEROSIS\MRI_NIFTI\CNT\MPRAGE\CNT',a,'-MPRAGE'];
    %newDICOMfolder = ['C:\MSCLEROSIS\MRI_NIFTI\CNT\MPRAGE\CNT',a,'-MPRAGE'];
    mkdir(newDICOMfolder);
    matlabbatch{i}.spm.util.import.dicom.outdir = {newDICOMfolder};
    matlabbatch{i}.spm.util.import.dicom.protfilter = '.*';
    matlabbatch{i}.spm.util.import.dicom.convopts.format = 'nii';
    matlabbatch{i}.spm.util.import.dicom.convopts.meta = 0;
    matlabbatch{i}.spm.util.import.dicom.convopts.icedims = 0;

end