%-----------------------------------------------------------------------
% Job saved on 11-Jan-2019 20:57:53 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS SBM
% Júlia Soares| July 2019

% Extraction of Surface Parameters

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59 %64 for controls
  
    if(i<10)
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE\surf\lh.central.mean_CNT', a, '_MPRAGE.gii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE\surf\lh.central.mean_MSC', a, '_MPRAGE.gii']);
   
    for j=1:size(data,1)
        c{1,1}=[data(j).folder,'\',data(j).name];
    end 
    
matlabbatch{i}.spm.tools.cat.stools.surfextract.data_surf =c;
matlabbatch{i}.spm.tools.cat.stools.surfextract.GI = 1;
matlabbatch{i}.spm.tools.cat.stools.surfextract.FD = 1;
matlabbatch{i}.spm.tools.cat.stools.surfextract.SD = 1;
matlabbatch{i}.spm.tools.cat.stools.surfextract.nproc = 2;
end