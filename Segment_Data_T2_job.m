%-----------------------------------------------------------------------
% Job saved on 09-May-2019 16:26:48 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Segmentation of T2 images 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59 %64 for controls
    
    if (i<10)
        a=['0',num2str(i)];
    else
        a=num2str(i);
    end
    
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_T2_FLAIR\CNT\CNT', a, '-FLAIR','/*.img']);
    
    %MSC
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_T2_FLAIR\MSC\MSC', a, '-FLAIR','/*.img']);
    
    for j=1:size(data)
        names=data(j).name;
        pattern='ss';
        flag=startsWith(names,pattern);
        if (flag==1)
            c{1,1}=[data(j).folder, '\', data(j).name];
        end
    end
   
matlabbatch{i}.spm.spatial.preproc.channel.vols = c;
matlabbatch{i}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{i}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{i}.spm.spatial.preproc.channel.write = [0 1];
matlabbatch{i}.spm.spatial.preproc.tissue(1).tpm = {'C:\Users\Julia\Documents\MATLAB\Toolboxes\spm12\tpm\TPM.nii,1'};
matlabbatch{i}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{i}.spm.spatial.preproc.tissue(1).native = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(1).warped = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(2).tpm = {'C:\Users\Julia\Documents\MATLAB\Toolboxes\spm12\tpm\TPM.nii,2'};
matlabbatch{i}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{i}.spm.spatial.preproc.tissue(2).native = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(2).warped = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(3).tpm = {'C:\Users\Julia\Documents\MATLAB\Toolboxes\spm12\tpm\TPM.nii,3'};
matlabbatch{i}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{i}.spm.spatial.preproc.tissue(3).native = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(3).warped = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(4).tpm = {'C:\Users\Julia\Documents\MATLAB\Toolboxes\spm12\tpm\TPM.nii,4'};
matlabbatch{i}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{i}.spm.spatial.preproc.tissue(4).native = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(4).warped = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(5).tpm = {'C:\Users\Julia\Documents\MATLAB\Toolboxes\spm12\tpm\TPM.nii,5'};
matlabbatch{i}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{i}.spm.spatial.preproc.tissue(5).native = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(5).warped = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(6).tpm = {'C:\Users\Julia\Documents\MATLAB\Toolboxes\spm12\tpm\TPM.nii,6'};
matlabbatch{i}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{i}.spm.spatial.preproc.tissue(6).native = [1 1];
matlabbatch{i}.spm.spatial.preproc.tissue(6).warped = [1 1];
matlabbatch{i}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{i}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{i}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{i}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{i}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{i}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{i}.spm.spatial.preproc.warp.write = [1 1];
end
