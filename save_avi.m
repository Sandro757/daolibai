function save_avi(title, framerate, frame)
% save the animation
% framerate: 10 is standard value

v = VideoWriter(title);
v.FrameRate = framerate; 

open(v);
writeVideo(v, frame);
close(v);
end
