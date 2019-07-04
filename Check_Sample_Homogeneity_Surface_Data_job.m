%-----------------------------------------------------------------------
% Job saved on 04-Jul-2019 03:46:20 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%MS SBM
% Júlia Soares| July 2019

% Sample Homogeneity Values of Cortical Thickness and Gyrification 

% Data is organized by groups: 64 Controls (CNT) and 59 MS patients (MSC) 

for i=1:59 %64 to run controls; 59 to run MS patients 
    
    if (i<10)
        
        a=['0', num2str(i)];
    else
        a=num2str(i);
    end
    
    %No filled T1-MPRAGE 
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE\surf', '\*.gii']);
    %MSC
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_no_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE\surf', '\*.gii']);
    
    %Filled T1-MPRAGE
    %CNT
    %data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\CNT\MEAN_MPRAGE\CNT', a, '_MEAN_MPRAGE_FILLED\surf', '\*.gii']);
    %MSC
    data=dir(['C:\MSCLEROSIS\nifti_segmented_CAT12_filling\MSC\MEAN_MPRAGE\MSC', a, '_MEAN_MPRAGE_FILLED\surf', '\*.gii']);
    for j=1:size(data)
        name=data(j).name;
        pattern='mesh.gyrification'; %insert 'mesh.thickness' for cortical thickness or 'mesh.gyrification' for gyrification 
        flag=contains(name, pattern);
        if(flag==1)
            images{i,1}=[data(j).folder, '\', data(j).name];
        end
    end
matlabbatch{1}.spm.tools.cat.stools.check_mesh_cov.data_surf = {
                                                                images
                                                                }';
matlabbatch{1}.spm.tools.cat.stools.check_mesh_cov.data_xml = {''};
matlabbatch{1}.spm.tools.cat.stools.check_mesh_cov.c = {};
end