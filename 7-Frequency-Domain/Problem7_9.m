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
% Using the same unit gain criterion from P7.6, given that no poles/zeros
% exist at the origin, we find \beta such that |G(0)| = 1, i.e.,
% \frac{10\beta}{10} = 1 \implies \beta = 1.
beta = 1;
% The value of K from the normalized transfer function
K = 1/(-1*z1);
% The transfer function of the minimum-phase system
s = tf('s');
G = beta*(s-z1) / (s-p1);
% Plotting the phase of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(b)', 'interpreter', 'latex');
subtitle('$G(s) = \beta\frac{K(s+10)}{(s+10)}, K = \frac{1}{10}, \beta = 1$', 'interpreter', 'latex');
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
% Using the same unit gain criterion from P7.6, given that there exists two
% poles/zeros at the origin, we find \beta such that |G(j1)| = 1 for the
% two poles at the origin and |G(0)| = 1 for the other poles/zeros, i.e.,
% \frac{10\beta(0+1)}{j^2(0+10)} = 1,
% \implies \frac{10\beta}{10} = 1.
beta = 1;
% The value of K from the normalized transfer function
K = 1/(-1*p3);
% The transfer function of the minimum-phase system
s = tf('s');
G = beta*(s-z1)/(K*(s-p1)*(s-p2)*(s-p3));
% Plotting the phase of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(c)', 'interpreter', 'latex');
subtitle('$G(s) = \beta K\frac{(s+1)}{s^2(s+10)}, \beta = 1, K = 10$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('$\omega$', 'interpreter', 'latex');

%% Fig. 7.34(f):
% The starting phase from infinity is -90 degrees. Since each pole at the
% origin contributes -90 degrees, we have one pole at the origin.
p1 = 0;                 % The pole at s = 0 that contributes -90 deg.
% From \omega = 1 to 10: slope is -45 deg/d.
p2 = -10;               % The pole at s = -10 that contributes -45 deg/d.
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% Using the same unit gain criterion from P7.6, given that there exists one
% pole/zero at the origin, we find \beta such that |G(j1)| = 1 for the pole
% at the origin and |G(0)| = 1 for the other poles/zeros, i.e.,
% \frac{10\beta}{10} = 1 \implies \beta = 1.
beta = 1;
% The value of K from the normalized transfer function
K = 1/(-1*p2);
% The transfer function of the minimum-phase system
s = tf('s');
G = 1 / (K*(s-p1)*(s-p2));
% Plotting the phase of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(f)', 'interpreter', 'latex');
subtitle('$G(s) = \beta K\frac{1}{s(s+10)}, \beta = 1, K = 10$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('$\omega$', 'interpreter', 'latex');