function imcompress(file1,scale,file2)
i1 = imread(file1);
imwrite( imresize(i1,scale),file2);
end

