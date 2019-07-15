clc%-----------------------------------------------------------------------
% Job saved on 23-Feb-2019 22:46:44 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Lesion Probability Maps of T1 images 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59
    
    if i<10
        a=strcat('0',num2str(i));
    else
        a=num2str(i);
    end
    
    %CNT
    %data_flair=dir(['C:\MSCLEROSIS\Lesion_Maps\CNT\CNT', a, '-FLAIR','\*.nii']);
    
    %MSC
    data_flair=dir(['C:\MSCLEROSIS\Lesion_Maps\MSC\MSC', a, '-FLAIR','\*.nii']);
    
    for j=1:size(data_flair)
        c{1,1}=[data_flair(j).folder,'\',data_flair(j).name];
    end
    
    %CNT
    %data_mprage=dir(['C:\MSCLEROSIS\MRI_NIFTI\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE','\*.nii']);
    
    %MSC
    data_mprage=dir(['C:\MSCLEROSIS\MRI_NIFTI\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE','\*.nii']);
    
    for k=1:size(data_mprage)
        d{1,1}=[data_mprage(k).folder,'\',data_mprage(k).name];
    end
    
matlabbatch{i}.spm.tools.LST.lpa.data_F2 = c;
matlabbatch{i}.spm.tools.LST.lpa.data_coreg = d;
matlabbatch{i}.spm.tools.LST.lpa.html_report = 1;
end