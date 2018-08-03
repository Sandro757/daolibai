## Inverted Pendulum Animation Tools

This Inverted Pendulum simulation is based on the tutorial available at:
http://ctms.engin.umich.edu/

Using these codes, you can see the pendulum animation and save it as an AVI file. 

The original code of "cdip_anime.m" is available  at [here](http://www.maizuru-ct.ac.jp/control/kawata/study/book_ip/files1.html).

### Description

"inv_param.mat" contains the parameters and transfer functions of the inverted pendulum. They are based on the  [Control Tutorials](http://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum&section=SimulinkModeling).

"cdip_anime.m" draws the inverted pendulum animation. To draw the animation, you need four parameters: "t", "z", "theta" and "Lp". 

* "t": time(second)
* "z": cart position
* "theta": pendulum clockwise angle from vertical (up)
* "Lp": length of the pendulum

After running "cdip_anime", you can save the animation as .avi file by 'save_avi' command.

If you want to convert .avi file into .mp4 for uploading to twitter, run the following command on your terminal:

```bash
for filename in *.avi; do ffmpeg -i $filename -strict -2 ${filename%.avi}.mp4; done
```

### Sample Code

**example.m:**

```matlab
clear all;
close all;
load('inv_param.mat')

% impulse response of the inversed pendulum
figure(1);
t = 0:0.001:1.0;
[output, t] = impulse(sys_tf, t);
impulse(sys_tf, t)
z = output(:, 1);
phi = output(:, 2);
theta = -phi;
title('Open-Loop Impulse Response')

cdip_anime
save_avi('sample.avi', 10, frame)
```