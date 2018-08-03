clear all;
close all;
load('inv_param.mat')

% impulse response of the inversed pendulum
figure(1);
t = 0:0.005:1.0;
[output, t] = impulse(sys_tf, t);
impulse(sys_tf, t)
z = output(:, 1);
phi = output(:, 2);
theta = -phi;

title('Open-Loop Impulse Response')
cdip_anime
save_avi('sample.avi', 10, frame)