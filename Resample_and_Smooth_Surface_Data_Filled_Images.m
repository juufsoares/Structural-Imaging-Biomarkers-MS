% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'C:\MSCLEROSIS\Scripts\Resample_and_Smooth_Surface_Data_Filled_Images_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'PET');
spm_jobman('run', jobs, inputs{:});