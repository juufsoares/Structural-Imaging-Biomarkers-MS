%-----------------------------------------------------------------------
% Job saved on 12-Dec-2018 12:45:57 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Coregistration of T1 images

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC) 

for i=1:59  %64 controls
    
    if(i<10)
        a=[('0',num2str(i))];
    else
        a=num2str(i);
    end
    
    %CNT
    %data=dir(['C:\MSCLEROSIS\MRI_NIFTI\CNT\MPRAGE\CNT', a, '-MPRAGE','\*.nii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\MRI_NIFTI\MSC\MPRAGE\MSC', a, '-MPRAGE','\*.nii']);
    
    for j=1:size(data,1)
        c{1,1}=[data(1).folder,'\',data(1).name];
        d{1,1}=[data(2).folder,'\',data(2).name];
    
    end
matlabbatch{i}.spm.spatial.coreg.estwrite.ref = c;
matlabbatch{i}.spm.spatial.coreg.estwrite.source = d;
matlabbatch{i}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{i}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{i}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{i}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{i}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{i}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{i}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{i}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
end