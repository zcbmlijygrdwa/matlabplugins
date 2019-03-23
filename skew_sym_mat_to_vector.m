function v = skew_sym_mat_to_vector(s)

% 3X3 skew-symmetric from 1X3 vector
%     [0 -a3 a2
%     a3 0 -a1
%     -a2 a1 0];
% fan dui cheng ju zheng
v = [s(3,2) s(1,3) s(2,1)];
end