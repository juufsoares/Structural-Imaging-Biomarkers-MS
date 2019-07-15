%-----------------------------------------------------------------------
% Job saved on 11-Mar-2019 19:55:56 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Extraction Values of Interest (Total Lesion Volume, Number of Lesions)

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

for i=1:64
    
    if(i<10)
        a=['0',num2str(i)];
    else
        a=num2str(i);
    end
    
    %CNT
    data_maps=dir(['C:\MSCLEROSIS\Lesion_Maps\CNT\CNT',a, '-FLAIR','\*.nii']);
    
    %MSC
    %data_maps=dir(['C:\MSCLEROSIS\Lesion_Maps\MSC\MSC',a, '-FLAIR','\*.nii']);
    
    for l=1:size(data_maps)
        
        names=[data_maps(l).name];
        pattern='ples';
        data_plm=startsWith(names, pattern);
        
        if (data_plm==1)
             d{1,1}=[data_maps(l).folder,'\',data_maps(l).name];
        end
    end
    
matlabbatch{i}.spm.tools.LST.tlv.data_lm =d;
matlabbatch{i}.spm.tools.LST.tlv.bin_thresh = 0.5;
end