%This parts detects if the input image is color or grayscale. If it is a
%color image, then converts it into grayscale.
if(size(size(image),2)==3)
imageGray = rgb2gray(image); %Convert RGB image or colormap to grayscale
else
    if(size(size(image),2)==2)
        imageGray = image;
    else
        disp('read image error.');
        return;
    end
end