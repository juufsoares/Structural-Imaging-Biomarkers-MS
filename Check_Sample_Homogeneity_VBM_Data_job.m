%-----------------------------------------------------------------------
% Job saved on 03-Jul-2019 16:58:38 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

% MS VBM
% Júlia Soares| July 2019

% Sample Homogeneity Values 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC) 
% mwp1=normalized modulated segments of Grey Matter (GM)for T1-weighted
% images
% mwp2=normalized modulated segments of White Matter (WM) for T1-weighted
% images
% mwc1=normalized modulated segments of GM for T2-weighted images
% mwc2=normalized modulated segments of WM for T2-weighted images 

for i=1:59 %64 to run controls; 59 to run MS patients 
    
    if (i<10)
        
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %No filled T1-MPRAGE 
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE\mri', '\*.nii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE\mri', '\*.nii']);
    
    
    %Filled T1-MPRAGE
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE_FILLED\mri', '\*.nii']);
    %MSC
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE_FILLED\mri', '\*.nii']);

    %T2-FLAIR
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_SPM_T2_FLAIR\CNT\CNT', a, '-FLAIR', '\*.nii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_SPM_T2_FLAIR\MSC\MSC', a, '-FLAIR', '\*.nii']);
    for j=1:size(data)
        name=data(j).name;
        pattern='mwp2'; %T1 images: insert mwp1 for GM or mwp2 for WM; T2 images: insert mwc1 for GM or mwc2 for WM 
        flag=startsWith(name, pattern);
        if(flag==1)
            images{i,1}=[data(j).folder, '\', data(j).name];
        end
    end
matlabbatch{1}.spm.tools.cat.tools.check_cov.data_vol = {images};                                                     
matlabbatch{1}.spm.tools.cat.tools.check_cov.data_xml = {''};
matlabbatch{1}.spm.tools.cat.tools.check_cov.gap = 3;
matlabbatch{1}.spm.tools.cat.tools.check_cov.c = {};
        
end