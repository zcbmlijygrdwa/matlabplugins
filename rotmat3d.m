function rot = rotmat3d(roll,pitch,yaw)
t = roll;
Rx = [1 0 0; 0 cos(t) -sin(t); 0 sin(t) cos(t)];

t = pitch;
Ry = [cos(t) 0 sin(t); 0 1 0; -sin(t) 0 cos(t)];

t = yaw;
Rz = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];

rot = Rx*Ry*Rz;
end