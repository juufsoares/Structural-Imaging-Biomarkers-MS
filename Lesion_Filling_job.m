%-----------------------------------------------------------------------
% Job saved on 27-Feb-2019 16:57:11 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Sample Homogeneity Values 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:59 %64 for controls
    
    if (i<10)
        
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %CNT
    %data_mprage=dir(['C:\MSCLEROSIS\MRI_NIFTI\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE','\*.nii']);
    
    %MSC
    data_mprage=dir(['C:\MSCLEROSIS\MRI_NIFTI\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE','\*.nii']);
    
    for j=1:size(data_mprage)
        c{1,1}=[data_mprage(j).folder,'\',data_mprage(j).name];
    end
    
    %CNT
    %data_maps=dir(['C:\MSCLEROSIS\Lesion_Maps\CNT\CNT',a, '-FLAIR','\*.nii']);
    
    %MSC
    data_maps=dir(['C:\MSCLEROSIS\Lesion_Maps\MSC\MSC',a, '-FLAIR','\*.nii']);
    
    for l=1:size(data_maps)
        
        b=[data_maps(l).name];
        pattern='ples';
        data_plm=startsWith(b, pattern);
        
        if (data_plm==1)
             d{1,1}=[data_maps(l).folder,'\',data_maps(l).name];
        end
    end
 
matlabbatch{i}.spm.tools.LST.filling.data = c;
matlabbatch{i}.spm.tools.LST.filling.data_plm = d;
matlabbatch{i}.spm.tools.LST.filling.html_report = 1;

end