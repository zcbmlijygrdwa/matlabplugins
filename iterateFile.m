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
        %imwrite(S,[currentFolderName '\' num2str(index) '_real.jpg']);\
        figure(1);imshow(S);
pause(0.1)
    end
end