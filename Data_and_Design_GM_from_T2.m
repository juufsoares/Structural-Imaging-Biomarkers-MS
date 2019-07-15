% MS GM Classification (T2 images)

% Júlia Soares| July 2019

% Data and Design for PRoNTo  

% Data is organized by groups: 59 Controls (CNT) and 56 MS patients (MSC)

% Group (1)=MS patients; Group (2)= Controls

%% MSC
load('PRT.mat');
data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_T2_FLAIR\Classification\GM\MSC','\*.nii']);
for j=1:size(data)
    scan=[data(j).folder, '\', data(j).name];
    PRT.group(1).subject(j).subj_name = ['S',num2str(j)];
    PRT.group(1).subject(j).modality=PRT.group(1).subject(1).modality;
    PRT.group(1).subject(j).modality.scans=scan;
end

%% CNT
load('PRT.mat');
data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_T2_FLAIR\Classification\GM\CNT','\*.nii']);
for j=1:size(data)
    scan=[data(j).folder, '\', data(j).name];
    PRT.group(2).subject(j).subj_name = ['S',num2str(j)];
    PRT.group(2).subject(j).modality=PRT.group(1).subject(1).modality;
    PRT.group(2).subject(j).modality.scans=scan;
end
   

