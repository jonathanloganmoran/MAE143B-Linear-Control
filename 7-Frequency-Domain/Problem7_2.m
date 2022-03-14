%% P7.2: Draw the polar plots associated with the rational transfer
% functions in P7.1.

%% P7.1(a):
% The poles of the system
p1 = -1;
p2 = -10;
% Since all poles/zeros are on the LHP (have negative real parts), this
% is a minimum-phase system.
% The transfer function of the minimum-phase system
s = tf('s');
G = 1/((s-p1)*(s-p2));
% Plotting the Nyquist plot of the minimum-phase system
figure;
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of minimum-phase system in P7.1(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');

%% P7.1(g):
% The poles of the system
p1 = -1;
p2 = -1;
% The zeros of the system
z1 = -10;
% Since all poles/zeros are on the LHP (have negative real parts), this
% is a minimum-phase system.
% The transfer function of the minimum-phase system
s = tf('s');
G = (s-z1)/((s-p1)*(s-p2));
% Plotting the Nyquist plot of the minimum-phase system
figure;
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of minimum-phase system in P7.1(g)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s+1)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');

%% P7.1(j):
% The poles of the system
p1 = -0.1/2 + (sqrt(39.99)/2)*1j;
p1 = -0.1/2 - (sqrt(39.99)/2)*1j;
% The zeros of the system
z1 = -10;
% Since all poles/zeros are on the LHP (have negative real parts), this
% is a minimum-phase system.
% The transfer function of the minimum-phase system
s = tf('s');
G = (s-z1)/(((s-p1)*(s-p2))^2);
% Plotting the Nyquist plot of the minimum-phase system
figure;
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of minimum-phase system in P7.1(j)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s^2 + 0.1s + 10)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');