%This script save data into data.ply file
filename=[imageName1 '_' imageName2 '_' fileName '.txt'];

header1 = 'ply';
header2 = 'format ascii 1.0';
header3 = ['element vertex ' num2str(ptCloud.Count)];
header4 = 'property float x\nproperty float y\nproperty float z\nproperty uchar red\nproperty uchar green\nproperty uchar blue\nend_header';
fid=fopen(filename,'w');
fprintf(fid, [ header1 '\n' header2 '\n' header3 '\n' header4 '\n']);

for i = 1:ptCloud.Count
    fprintf(fid, '%f %f %f %d %d %d\n', ptCloud.Location(i,:)', ptCloud.Color(i,:)');
end
fclose(fid);



%OR



filename=['results.txt'];

fid=fopen(filename,'w');
for i = 1:10
    fprintf(fid, '%s %d\n', 'asd', 1);
end
fclose(fid);

