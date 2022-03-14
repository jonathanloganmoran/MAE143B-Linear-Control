

%% P7.1(h):
% The poles of the system
p1 = 0;
p2 = -10;
% The zeros of the system
z1 = -1;
% The transfer function of the system
s = tf('s');
G = (s-z1)/((s-p1)*(s-p2));
% Plotting the Nyquist plot of the minimum-phase system
figure;
subplot(2, 1, 1);
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of minimum-phase system in P7.1(g)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s+1)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The transfer function of the system
K = 1;
G = (s-z1)/((s-p1)*(s-p2) + K);
% Plotting the Nyquist plot of the minimum-phase system
subplot(2, 1, 2);
nyquistplot(G);
grid on;
title('Nyquist (polar) plot of minimum-phase system in P7.1(g)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s+1)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');