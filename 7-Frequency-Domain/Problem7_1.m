%% P7.1: Draw the straight-line approximation and sketch the Bode magnitude
% and phase diagrams for each of the following transfer functions.

%% P7.1(a):
% The poles of the system
p1 = -1;
p2 = -10;
% The transfer function of the system
s = tf('s');
G = 1 / ((s-p1)*(s-p2));
% Since there are two stable poles, we expect a decrease of -20 dB/d at the 
% absolute value of each of the two pole locations.
% There is a constant gain of 20log(1/10) = -20 dB.
% Plotting the magnitude and phase of the system
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of system in P7.1(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');

%% P7.1(g):
% The poles of the system
p1 = -1;
% The zeros of the system
z1 = -10;
% The transfer function of the system
s = tf('s');
G = (s-z1) / (s-p1)^2;
% Since there is one stable pole, we expect a decrease of -20 dB/d at the 
% absolute value of the pole. There is a constant gain of 20log(10) = +20.
% Plotting the magnitude and phase of the system
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of system in P7.1(g)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+10)}{(s+1)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');

%% P7.1(j):
% This system is a continuous second-order system with the parameters
w_n = sqrt(10);
zeta = 0.1 / (2*w_n);
% The real parts of the poles of the system
p1 = -zeta*w_n;
p1 = -w_n*(zeta + sqrt(zeta^2 + 1));
p2 = -w_n*(zeta - sqrt(zeta^2 + 1));
% The zeros of the system
z1 = -10;
% The transfer function of the system
s = tf('s');
G = (s-z1) / ((s-p1)^2);
G = (s-z1) / ((s^2 + 0.1*s + 10)^2);
%G = (s-z1) / ((s-p1)*(s-p2));
%G = (s-z1) / (s*(s+3.162));
% Since there are two stable repeated poles, we expect a decrease of 
% -40 dB/d at the absolute value of the pole.
% Plotting the magnitude and phase of the system
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of system in P7.1(j)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+10)}{(s^2 + 0.1s + 10)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');