% MS WM Classification (filled T1 images)

% Júlia Soares| July 2019

% Data and Design for PRoNTo  

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

% Group (1)=MS patients; Group (2)= Controls 

load('PRT.mat');
for i=1:59
    
    %MSC
    
    %mwp2
    PRT.group(1).subject(i).subj_name = ['S',num2str(i)];
    PRT.group(1).subject(i).modality=PRT.group(2).subject(1).modality;
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\VBM\mwp2\MSC','\*.nii']);
   
    for j=1:size(data)
        
        image = [data(j).folder,'\',data(j).name];
        PRT.group(1).subject(j).modality.scans=image;
    end
end

for i=1:64
    
    %CNT
    
    %mwp2
    PRT.group(2).subject(i).subj_name = ['S',num2str(i)];
    PRT.group(2).subject(i).modality=PRT.group(2).subject(1).modality;

    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\VBM\mwp2\CNT','\*.nii']);
    for j=1:size(data)
        
        image = [data(j).folder,'\',data(j).name];
        PRT.group(2).subject(j).modality.scans=image;
    end
end