clear all;
close all;

M = 0.5;  % mass of the cart
m = 0.2;  % mass of the pendulum
b = 0.1;  % coefficient of friction for cart
l = 0.3;  % length to pendulum center of mass
Lp = l * 2; % full length of the pendulum
g = 9.8;
I = 0.006;  % mass moment of inertia of the pendulum

% transfer function
q = (M+m)*(I+m*l^2)-(m*l)^2;
s = tf('s');

P_cart = (((I+m*l^2)/q)*s^2 - (m*g*l/q))/(s^4 + (b*(I + m*l^2))*s^3/q ...
    - ((M + m)*m*g*l)*s^2/q - b*m*g*l*s/q);  % X(s) / U(s)

P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q ...
    - ((M + m)*m*g*l)*s/q - b*m*g*l/q);  % Phi(s) / U(s)

sys_tf = [P_cart ; P_pend];

inputs = {'u'};
outputs = {'x'; 'phi'};

set(sys_tf,'InputName',inputs)
set(sys_tf,'OutputName',outputs)


% state space

den = I * (M + m) + M * m * l^2;  % denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/den  (m^2*g*l^2)/den   0;
     0      0              0           1;
     0 -(m*l*b)/den       m*g*l*(M+m)/den  0];
B = [     0;
     (I+m*l^2)/den;
          0;
        m*l/den];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'u'};
outputs = {'x'; 'phi'};

sys_ss = ss(A, B, C, D, 'statename', states, 'inputname', inputs, 'outputname', outputs)    

save('inv_param.mat')