% MS GM Classification (no filled T1 images)

% Júlia Soares| July 2019

% Data and Design for PRoNTo  

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

% Group (1)=MS patients; Group (2)= Controls 

load('PRT.mat'); %insert path for PRT.mat
% MS patients
for i=1:59 
    
    if(i<10)
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %insert path of normalized modulated GM segments of MS patients
    data=['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE\mri\mwp1mean_MSC', a, '_MPRAGE.nii'];
    PRT.group(1).subject(i).subj_name = ['S',num2str(i)];
    PRT.group(1).subject(i).modality=PRT.group(1).subject(1).modality;
    PRT.group(1).subject(i).modality.scans=data;
    
end 

% controls
for i=1:64
    
    if(i<10)
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %insert path of normalized modulated GM segments of controls 
    data=['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE\mri\mwp1mean_CNT', a, '_MPRAGE.nii'];
    PRT.group(2).subject(i).subj_name = ['S',num2str(i)];
    PRT.group(2).subject(i).modality=PRT.group(2).subject(1).modality;
    PRT.group(2).subject(i).modality.scans=data;
   
end
