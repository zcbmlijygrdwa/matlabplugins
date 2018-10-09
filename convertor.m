%create folder
currentFolderName = ['modified'];

if ~exist(currentFolderName)
    mkdir(currentFolderName);
end

directory = 'testsets\centerfaces';
allnames=struct2cell(dir(strcat(pwd,'\',directory,'\*.pgm')));
namelist = ones(size(allnames,2),1);
[k,len]=size(allnames);

%resultsRecords = [];
for index=1:size(namelist,1)
    
    if(namelist(index)==1)
        %realDir = strcat(directory,'\*.jpg');
        fileName1=allnames{1,index};
        disp('==========================');
        disp(['Processing real image:' fileName1 '...'  num2str(100*index/size(namelist,1)) '%']);
        S=imread([directory '\' fileName1]);
        [pathstr,name,ext] = fileparts([directory '\' fileName1]);
        imwrite(S,[currentFolderName '\' name 'centerfaces.jpg']);
    end
end
