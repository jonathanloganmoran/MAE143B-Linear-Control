%% P7.9: Find the minimum-phase rational transfer function that matches the
% Bode phase diagrams in Fig. 7.34. The straight-line approximations are
% plotted as thin lines.

%% Fig. 7.34(b):
% Since we start at 0 degrees, there are no poles/zeros at the origin.
% From \omega = 0.1 to 1: slope is -45 deg/d.
p1 = -1;                % The pole at s = -1 that contributes -45 deg/d.
% From \omega = 1 to 10: slope is 0 deg/d.
z1 = -10;               % The zero at s = -10 that contributes +45 deg/d.
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% The transfer function of the minimum-phase system
s = tf('s');
G = (s-z1) / (s-p1);
% Plotting the phase of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(b)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+1)}{(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('$\omega$', 'interpreter', 'latex');

%% Fig. 7.34(c):
% The starting phase from infinity is -180 degrees. Since each pole at the
% origin contributes -90 degrees, we have two poles at the origin.
p1 = 0;                 % The pole at s = 0 that contributes -90 deg.
p2 = 0;                 % The pole at s = 0 that contributes -90 deg.
% From \omega = 0.1 to 1: slope is +45 deg/d.
z1 = -1;                % The zero at s = -1 that contributes +45 deg/d.
% From \omega = 1 to 10: slope is 0 deg/d.
p3 = -10;               % The pole at s = -10 that contributes -45 deg/d.
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% The transfer function of the minimum-phase system
s = tf('s');
G = (s-z1) / ((s-p1)*(s-p2)*(s-p3));
% Plotting the phase of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+1)}{s^2(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('$\omega$', 'interpreter', 'latex');

%% Fig. 7.34(f):
% The starting phase from infinity is -90 degrees. Since each pole at the
% origin contributes -90 degrees, we have one pole at the origin.
p1 = 0;                 % The pole at s = 0 that contributes -90 deg.
% From \omega = 1 to 10: slope is -45 deg/d.
p2 = -1;                % The pole at s = -10 that contributes -45 deg/d.
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% The transfer function of the minimum-phase system
s = tf('s');
G = 1 / ((s-p1)*(s-p2));
% Plotting the phase of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(f)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{s(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('$\omega$', 'interpreter', 'latex');