%-----------------------------------------------------------------------
% Job saved on 20-Mar-2019 13:42:11 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS SBM
% Júlia Soares| July 2019

% Extraction of Surface Parameters from filled T1 images 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59 %64 for controls 
    
    if (i<10)
        a=['0',num2str(i)];
    else
        a=num2str(i);
    end
 
  
%CNT    
%data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\CNT\MEAN_MPRAGE\CNT', a,'_MEAN_MPRAGE_FILLED\surf']);
%MSC
data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\MSC\MEAN_MPRAGE\MSC', a,'_MEAN_MPRAGE_FILLED\surf']);

for j=3:size(data)
    names=data(j).name;
    pattern='lh.thickness';%lh.gyrification
    flag=startsWith(names,pattern);
    if (flag==1)
        data_surf{1,1}=[data(j).folder,'\',data(j).name];

matlabbatch{i}.spm.tools.cat.stools.surfresamp.data_surf =data_surf;
matlabbatch{i}.spm.tools.cat.stools.surfresamp.merge_hemi = 1;
matlabbatch{i}.spm.tools.cat.stools.surfresamp.mesh32k = 1;
matlabbatch{i}.spm.tools.cat.stools.surfresamp.fwhm_surf = 20; %15 thickness
matlabbatch{i}.spm.tools.cat.stools.surfresamp.nproc = 0;
    end
end
end