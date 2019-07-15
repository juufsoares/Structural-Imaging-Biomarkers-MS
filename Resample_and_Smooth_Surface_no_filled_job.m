%-----------------------------------------------------------------------
% Job saved on 13-Jan-2019 00:56:33 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS SBM
% Júlia Soares| July 2019

% Extraction of Surface Parameters from no filled T1 images 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59 %64 for controls 
    
    if(i<10)
        a=strcat('0', num2str(i));
    else
        a=num2str(i);
    end
    
    %thickness
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE\surf\lh.thickness.mean_CNT', a, '_MPRAGE']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE\surf\lh.thickness.mean_MSC', a, '_MPRAGE']);
    
    %gyrification
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE\surf\lh.gyrification.mean_CNT', a, '_MPRAGE']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE\surf\lh.gyrification.mean_MSC', a, '_MPRAGE']);
    
    for j=1:size(data,1)
        c{1,1}=[data.folder,'\',data.name];
    end
    
matlabbatch{i}.spm.tools.cat.stools.surfresamp.data_surf =c; 
matlabbatch{i}.spm.tools.cat.stools.surfresamp.merge_hemi = 1;
matlabbatch{i}.spm.tools.cat.stools.surfresamp.mesh32k = 1;
matlabbatch{i}.spm.tools.cat.stools.surfresamp.fwhm_surf = 20; %15 cortical thickness, 20 gyrification
matlabbatch{i}.spm.tools.cat.stools.surfresamp.nproc = 0;

end
    