%-----------------------------------------------------------------------
% Job saved on 09-Dec-2018 00:58:58 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Calculating mean of T1 images 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

 for i=1:59 %64 controls
     
    if(i<10)
        a=['0',num2str(i)];
    else
        a=num2str(i);
        
    end
    
    %CNT
    %data=dir(['C:\MSCLEROSIS\MRI_NIFTI\CNT\MPRAGE\CNT', a, '-MPRAGE','\*.nii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\MRI_NIFTI\MSC\MPRAGE\MSC', a, '-MPRAGE','\*.nii']);
    
    for j=1:size(data,1)
        c{j,1}=[data(j).folder,'\',data(j).name];
    end
    
    %create new folder
    %newDICOMfolder = ['C:\MSCLEROSIS\MRI_NIFTI\CNT\MEAN_MPRAGE\CNT',a,'_MEAN_MPRAGE'];
    newDICOMfolder = ['C:\MSCLEROSIS\MRI_NIFTI\MSC\MEAN_MPRAGE\MSC',a,'_MEAN_MPRAGE'];
    mkdir(newDICOMfolder);
    
    %name=['mean_CNT', a, '_MPRAGE'];
    name=['mean_MSC', a, '_MPRAGE'];
    
    matlabbatch{i}.spm.util.imcalc.input = c ;
    matlabbatch{i}.spm.util.imcalc.output = name;
    matlabbatch{i}.spm.util.imcalc.outdir = {newDICOMfolder};
    matlabbatch{i}.spm.util.imcalc.expression = 'mean(X)';
    matlabbatch{i}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{i}.spm.util.imcalc.options.dmtx = 1;
    matlabbatch{i}.spm.util.imcalc.options.mask = 0;
    matlabbatch{i}.spm.util.imcalc.options.interp = 1;
    matlabbatch{i}.spm.util.imcalc.options.dtype = 4;
    
end