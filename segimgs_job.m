%-----------------------------------------------------------------------
% Job saved on 13-Dec-2018 17:13:18 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Segmentation of T1 Images 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:64 
    
    if(i<10)
        a=['0',num2str(i)];
    else
        a=num2str(i);
    end
    
    %no filled T1-MPRAGE
    %CNT
    %data=dir(['C:\MSCLEROSIS\MRI_NIFTI\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE','\*.nii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\MRI_NIFTI\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE','\*.nii']);
    
    %filled T1-MPRAGE
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\CNT\MEAN_MPRAGE\CNT', a,'_MEAN_MPRAGE_FILLED','\*.nii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\MSC\MEAN_MPRAGE\MSC', a,'_MEAN_MPRAGE_FILLED','\*.nii']);
    
    for j=1:size(data,1)
        c{j,1}=[data(j).folder,'\',imgs(j).name];
    end
    
matlabbatch{i}.spm.tools.cat.estwrite.data = c;
matlabbatch{i}.spm.tools.cat.estwrite.nproc = 0;
matlabbatch{i}.spm.tools.cat.estwrite.opts.tpm = {'C:\MatLab\spm12\tpm\TPM.nii'};
matlabbatch{i}.spm.tools.cat.estwrite.opts.affreg = 'mni';
matlabbatch{i}.spm.tools.cat.estwrite.opts.biasstr = 0.5;
matlabbatch{i}.spm.tools.cat.estwrite.extopts.APP = 1070;
matlabbatch{i}.spm.tools.cat.estwrite.extopts.LASstr = 0.5;
matlabbatch{i}.spm.tools.cat.estwrite.extopts.gcutstr = 0;
matlabbatch{i}.spm.tools.cat.estwrite.extopts.registration.darteltpm = {'C:\MatLab\spm12\toolbox\cat12\templates_1.50mm\Template_1_IXI555_MNI152.nii'};
matlabbatch{i}.spm.tools.cat.estwrite.extopts.registration.shootingtpm = {'C:\MatLab\spm12\toolbox\cat12\templates_1.50mm\Template_0_IXI555_MNI152_GS.nii'};
matlabbatch{i}.spm.tools.cat.estwrite.extopts.registration.regstr = 0;
matlabbatch{i}.spm.tools.cat.estwrite.extopts.vox = 1.5;
matlabbatch{i}.spm.tools.cat.estwrite.extopts.restypes.fixed = [1 0.1];
matlabbatch{i}.spm.tools.cat.estwrite.output.surface = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.ROImenu.atlases.neuromorphometrics = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.ROImenu.atlases.lpba40 = 0;
matlabbatch{i}.spm.tools.cat.estwrite.output.ROImenu.atlases.cobra = 0;
matlabbatch{i}.spm.tools.cat.estwrite.output.ROImenu.atlases.hammers = 0;
matlabbatch{i}.spm.tools.cat.estwrite.output.GM.native = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.GM.mod = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.GM.dartel = 2;
matlabbatch{i}.spm.tools.cat.estwrite.output.WM.native = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.WM.mod = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.WM.dartel = 2;
matlabbatch{i}.spm.tools.cat.estwrite.output.bias.warped = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.jacobian.warped = 1;
matlabbatch{i}.spm.tools.cat.estwrite.output.warps = [1 1];
end

