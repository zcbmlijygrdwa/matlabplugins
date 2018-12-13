function output = skew_sym_mat(v)

% 3X3 skew-symmetric from 1X3 vector
% fan dui cheng ju zheng
a1 = v(1);
a2 = v(2);
a3 = v(3);

output = [0 -a3 a2
          a3 0 -a1
          -a2 a1 0];
end