% MS GM Classification (filled T1 images)

% Júlia Soares| July 2019

% Data and Design for PRoNTo  

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC)

% Group (1)=MS patients; Group (2)= Controls 

load('PRT.mat');
for i=1:59
    
    if(i<10)
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %MSC
    
    %mwp1 
    PRT.group(1).subject(i).subj_name = ['S',num2str(i)];
    PRT.group(1).subject(i).modality=PRT.group(1).subject(1).modality;
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\MSC\MEAN_MPRAGE\MSC', a,'_MEAN_MPRAGE_FILLED\mri','\*.nii']);
    for j=1:size(data) 
        names = [data(j).name];
        pattern='mwp1';
        flag=startsWith(names,pattern);
        if (flag==1)
            scan=[data(j).folder,'\',data(j).name];
        
            PRT.group(1).subject(i).modality.scans=scan;
        end
    
    end
  
end 

for i=1:64
    
    %CNT
    
    %mwp1
    PRT.group(2).subject(i).subj_name = ['S',num2str(i)];
    PRT.group(2).subject(i).modality=PRT.group(2).subject(1).modality;
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\VBM\mwp1\CNT','\*.nii']);
    for j=1:size(data)
        
         image = [data(j).folder,'\',data(j).name];
         PRT.group(2).subject(i).modality.scans=image;
    end
end