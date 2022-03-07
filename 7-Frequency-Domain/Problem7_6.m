%% P7.6: Draw the Nyquist plots associated with the pole-zero diagrams in
% Fig. 7.32 assuming that the straight-line approximations of the magnitude
% of the frequency response have unit gain at \omega = 0 (or at \omega = 1
% if there is a pole or zero at zero).

%% Fig. 7.32(a):
% The poles of the system
p1 = -1;
p2 = -2;
% The transfer function of the system
s = tf('s');
G = 1/((s-p1)*(s-p2));
% Plotting the Nyquist plot of the system
figure;
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of system in Fig. 7.32(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+2)}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');

%% Fig. 7.32(c):
% The poles of the system
p1 = 1;
p2 = 2;
% The transfer function of the system
s = tf('s');
G = 1/((s-p1)*(s-p2));
% Plotting the Nyquist plot of the system
figure;
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of system in Fig. 7.32(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s-1)(s-2)}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');

%% Fig. 7.32(h):
% The poles of the system
p1 = -2;
p2 = 0 + 1j;
p3 = 0 - 1j;
% The zeros of the system
z1 = 0;
% The transfer function of the system
s = tf('s');
G = (s-z1)/((s-p1)*(s-p2)*(s-p3));
% Plotting the Nyquist plot of the system
figure;
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of system in Fig. 7.32(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s}{(s+1)(s^2+1)}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');