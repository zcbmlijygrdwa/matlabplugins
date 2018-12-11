function pm = camProjMat(fx,fy,cx,cy)
    pm = [fx, 0 , cx
          0,  fy, cy,
          0,   0,  1];
end