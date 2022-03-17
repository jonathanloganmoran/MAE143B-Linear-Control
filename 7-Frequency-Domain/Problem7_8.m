%% P7.8: Find the minimum-phase rational transfer function that matches the
% Bode magnitude diagrams in Fig. 7.33. The straight-line approximations
% are plotted as thin lines.

%% Fig. 7.33(a):
% The starting magnitude at infinity is -20 dB.
% From \omega = 0.1 to 1: slope is zero.
% Assume that a starting slope of zero means no poles/zeros at origin.
% From \omega = 1 to 10: slope is +20 dB/d.
z1 = -1;                % The zero at s = -1 that contributes +20 dB/d.
% From \omega = 10 to 100: slope is +0 dB/d.
p1 = -10;               % The pole at s = -10 that contributes -20 dB/d.
% The constant gain \beta that satisfies:
% 20log(\beta) = 20log(|G(j\omega|) = -20.
beta = 1/10;
% The value K from the normalized transfer function
K = 1/(-1*p1);
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% The transfer function of the minimum-phase system
s = tf('s');
G = beta*(s-z1)/(K*(s-p1));
% Plotting the magnitude of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'PhaseVisible', 'off');
grid on;
title('Magnitude plot of minimum-phase system in Fig. 7.33(a)', 'interpreter', 'latex');
subtitle('$G(s) = \betaK\frac{(s+1)}{(s+10)}, \beta=\frac{1}{10}, K=10$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('\omega', 'interpreter', 'latex');

%% Fig. 7.33(f):
% The starting magnitude is 0 dB: slope is -20 dB/d.
p1 = 0;                 % The pole at s = 0 that contributes -20 dB/d.
% From \omega = 10 to 100: slope is -40 dB/d.
p2 = -10;               % The pole at s = -10 that contributes -20 dB/d.
% The constant gain \beta that satisfies:
% 20log(\beta) = 20log(|G(j\omega|) = 0.
beta = 1;
% The value of K from the normalized transfer function
K = 1/(-1*p2);
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% The transfer function of the minimum-phase system
G = beta*1/(K*(s-p1)*(s-p2));
% Plotting the magnitude of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'PhaseVisible', 'off');
grid on;
title('Magnitude plot of minimum-phase system in Fig. 7.33(f)', 'interpreter', 'latex');
subtitle('$G(s) = \betaK\frac{1}{s(s+10)}, K=10, \beta = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('\omega', 'interpreter', 'latex');

%% Fig. 7.33(h):
% The starting magnitude is 20 dB: slope is +20 dB/d.
% From \omega = 1 to 10: slope is -40 dB/d.
% Possibility #1: Stable repeated pole at \omega = 1.
p1 = -1;                % The pole at s = -1 that contributes -20 dB/d.
p2 = -1;                % The pole at s = -1 that contributes -20 dB/d.
% Possibility #2: Second-order (stable) complex poles at \omega_{n} = 1.
w_n = 1;
% Since there is a peaking effect at \omega = 1, it must be the case that
% \zeta < 1. Therefore, we have the second-order complex conjugate pair.
% From \omega = 10 to 100: slope is -20 dB/d.
z1 = -10;               % The zero at s = -10 that contributes +20 dB/d.
% The constant gain \beta that satisfies:
% 20log(K) = 20log(|G(j\omega|) = 20.
beta = 10;
% The value of K from the normalized transfer function
K = 1/(-1*z1);
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% To estimate the value \zeta, we solve 20log(|G(1j)|) ~ 36, where 36 is
% the approximate peak value shown in the magnitude plot in Fig. 7.33(h).
% We have |G(1j)| = 10^(36/20) 
% \rightarrow \frac{\sqrt(1^2 + 10^2)}{2\zeta} = 10^(36/20)
%    \implies \zeta = \frac{\sqrt{101}}{2*10^(36/20)}
%             \zeta \approx 0.08.
zeta = 0.08;
% The transfer function of the minimum-phase system
s = tf('s');
G = beta*(s-z1)/(K*(s^2 + 2*zeta*s + 1));
% Plotting the magnitude of the minimum-phase system
figure;
h = bodeplot(G);
setoptions(h, 'PhaseVisible', 'off');
grid on;
title('Magnitude plot of minimum-phase system in Fig. 7.33(h)', 'interpreter', 'latex');
subtitle('$G(s) = \betaK\frac{(s+10)}{s^2 + 2\zeta s + 1}, K=10, \beta=10, \zeta = 0.08$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('\omega', 'interpreter', 'latex');