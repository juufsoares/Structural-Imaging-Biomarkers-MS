%MS Subtypes Classification 

% Júlia Soares| July 2019

% Data and Design for PRoNTo  

% Group (1)=SPMS patients; Group (2)= RRMS patients 

%% Copy 100x PRT.mat initial structure with 2 groups with 1 subject each
for i=1:100
    
    a=num2str(i);
    %T1 Filled
    %GM 
    %new_folder=['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T1_Filled\GM\PRT', a, '\', 'PRT.mat'];
    %WM 
    %new_folder=['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T1_Filled\WM\PRT', a, '\', 'PRT.mat'];
    
    %T2 FLAIR
    %GM 
    %new_folder=['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T2_FLAIR\GM\PRT', a, '\', 'PRT.mat'];
    %WM 
    new_folder=['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T2_FLAIR\WM\PRT', a, '\', 'PRT.mat'];
    copyfile('C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\Initial_PRT\PRT.mat', new_folder);
    
end
%% Generate 100 PRT.mat structures with 2 groups with 8 subjects each for T1 classification, 7 subjects for GM T2 classification, 6 subjects for WM classification 
for i=1:100
    
    a=num2str(i);
    
    %T1 Filled
    %GM 
    %data=dir(['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T1_Filled\GM\PRT', a, '\*.mat']);
    %WM 
    %data=dir(['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T1_Filled\WM\PRT', a, '\*.mat']);
    
    %T2 FLAIR
    
    %GM 
    %data=dir(['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T2_FLAIR\GM\PRT', a, '\*.mat']);
    %WM 
    data=dir(['C:\Users\Julia\Documents\MATLAB\Classification\Classification_Subtypes\T2_FLAIR\WM\PRT', a, '\*.mat']);
    for j=1:size(data)
        prt_structure=[data(j).folder, '\', data(j).name];
  
        load(prt_structure);
        
        %T1 Filled
        %GM 
        %data_SPMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\filled_images\GM\SPMS', '\*.nii']);
        %WM 
        %data_SPMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\filled_images\WM\SPMS', '\*.nii']);
        
        %T2 FLAIR
        %GM 
        %data_SPMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\T2_images\GM\MSC\SPMS', '\*.nii']);
        %WM 
        data_SPMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\T2_images\WM\MSC\SPMS', '\*.nii']);
        for k=1:size(data_SPMS)
            scan_SPMS=[data_SPMS(k).folder, '\', data_SPMS(k).name];
            subj_name_SPMS=['S', num2str(k)];
            PRT.group(1).subject(k).subj_name = subj_name_SPMS;
            PRT.group(1).subject(k).modality=PRT.group(1).subject(1).modality;
            PRT.group(1).subject(k).modality.scans=scan_SPMS;
        end   
        
        
        %T1 Filled
        %GM 
        %data_RRMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\filled_images\GM\RRMS','\*.nii']);
        %WM 
        %data_RRMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\filled_images\WM\RRMS','\*.nii']);
        
        %T2 FLAIR
        %GM 
        %data_RRMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\T2_images\GM\MSC\RRMS','\*.nii']);
        %WM 
        data_RRMS=dir(['C:\MSCLEROSIS\Classification_Subtypes\T2_images\WM\MSC\RRMS','\*.nii']);
        y=datasample(data_RRMS, 6, 'Replace', false); %8-T1; 7-T2(GM), 6-T2(WM)
        for l=1:size(y)
            scan_RRMS=[y(l).folder, '\', y(l).name];
            subj_name_RRMS=['S', num2str(l)];
            PRT.group(2).subject(l).subj_name = subj_name_RRMS;
            PRT.group(2).subject(l).modality=PRT.group(1).subject(1).modality;
            PRT.group(2).subject(l).modality.scans=scan_RRMS;
       end  
    end
    save(prt_structure);
end


    