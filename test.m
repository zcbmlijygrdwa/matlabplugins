clear all;
% close all;

cam_t = [-4,5,5]'
cam_r = [2.7,0.15,-1.7]

rot = rotmat3d(cam_r(1),cam_r(2),cam_r(3))
t = cam_t


K = camProjMat(609,609,305,225)

points3d = [1,0,0;
    0,-1,0;
    -1,0,0;
    0,2,0;
    0,5,0;];

points3d = [-0.33,0.1,0;
    0.33,0.1,0;
    0.33,0.6,0;
    -0.33,1.2,0];

numOfP = size(points3d,1);

points3d = [points3d,ones(size(points3d,1),1)]'

trans = [rot,t];

 trans = [trans;zeros(1,4)];
 trans(4,4) = 1
trans = inv(trans);
trans = trans(1:3,:);

new_points3d = trans*points3d;

points2d = K*(new_points3d)

img = zeros(450,610);

for i = 1:size(points2d,2)
    points2d(:,i) = points2d(:,i)/points2d(3,i);
    tx = int32(points2d(1,i));
    ty = int32(points2d(2,i));
    if(tx>0&&ty>0&&tx<=610&&ty<=450)
       img(ty,tx) = 1; 
    end
end


imshow(img)


