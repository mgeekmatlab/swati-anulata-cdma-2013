commandwindow; 
cwd=pwd; 
cd([matlabroot '\toolbox\matlab\winfun\private']); 
fileassoc('add',{'.m','.M','.mat','.fig','.p','.mdl',['.' mexext]}); 
cd(cwd); 
disp('Changed Windows file associations. FIG, M, MAT, MDL, MEX, and P files are now associated with MATLAB.')