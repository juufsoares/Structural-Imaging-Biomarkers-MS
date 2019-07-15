%-----------------------------------------------------------------------
% Job saved on 07-Jul-2019 04:19:06 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% MS VBM
% Júlia Soares| July 2019

% Estimate TIV, GM, WM Values 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)
for i=1:59 %64 to run controls ; 59 to run MS patients 
    
    if(i<10)
        
       a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %Controls
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE_FILLED\report', '\*.xml']);
    %MS patients
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE_FILLED\report', '\*.xml']);
    for j=1:size(data)
        xml_file{i,1}=[data(j).folder, '\', data(j).name];
    end

matlabbatch{1}.spm.tools.cat.tools.calcvol.data_xml = xml_file;
matlabbatch{1}.spm.tools.cat.tools.calcvol.calcvol_TIV = 0;
matlabbatch{1}.spm.tools.cat.tools.calcvol.calcvol_name = 'TIV.txt';
end
