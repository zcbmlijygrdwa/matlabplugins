function convertToVideo(test_case_idx)

params = paramManager(test_case_idx);
%1 for liptracking2
%2 for liptracking3
%３ for liptracking3

outputVideo = VideoWriter([params.directory,'.avi']);
filename = [params.directory,'.gif'];
outputVideo.FrameRate = 24;
open(outputVideo)
for i = params.startFrame:params.endFrame
    prog = (i-params.startFrame)/(params.endFrame-params.startFrame)
    
    try
    img = imread(['outputs\case_' num2str(test_case_idx+1) '\lt_' num2str(test_case_idx+1) '_' num2str(i) '.png']);
    catch
        continue;
    end
    writeVideo(outputVideo,img);
    
      % Write to the GIF File 
      [imind,cm] = rgb2ind(img,256);
      if i == params.startFrame
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0); 
      end 
end
close(outputVideo);