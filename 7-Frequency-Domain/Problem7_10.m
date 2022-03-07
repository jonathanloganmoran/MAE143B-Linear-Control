%% P7.10: Calculate the rational transfer function that simultaneously
% matches the Bode magnitude diagrams in Fig. 7.33 and the corresponding
% phase diagrams in Fig. 7.34.

%% Fig. 7.33(a) and 7.34(a):
% Recall from P7.8 the transfer function of the minimum-phase system
% matching the Bode magnitude diagram in Fig. 7.33(a).
s = tf('s');
G = (s+1) / (s+10);
% Compare the Bode phase diagram of this transfer function to the one shown
% in Fig. 7.34(a).
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of minimum-phase system from Fig. P7.8(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+1)}{(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');
% The phase diagram above matches the phase diagram shown in Fig. 7.34(a).
% Thus, the transfer function of the minimum-phase system in P7.8(a) holds.

%% Fig. 7.33(c) and 7.34(c):
% Recall from P7.9 the transfer function of the minimum-phase system
% matching the Bode phase diagram in Fig. 7.34(c).
s = tf('s');
G = (s+1) / (s^2*(s+10));
% Compare the Bode magnitude diagram of this transfer function to the one 
% shown in Fig. 7.33(c).
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of minimum-phase system from Fig. 7.34(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+1)}{s^2(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');
% The magnitude diagram above differs from the magnitude diagram shown in 
% Fig. 7.33(c).
% The starting magnitude at infinity is 0 dB (no poles/zeros at origin).
% From \omega = 0.1 to 1: slope is 0 dB/d.
% From \omega = 1 to 10: slope is -20 dB/d.
p1 = -1;                % The pole at s = -1 that contributes -20 dB/d.
% From \omega = 10 to 100: slope is -40 dB/d.
p2 = -10;               % The pole at s = -10 that contributes -20 dB/d.
% The constant gain K that satisfies 20log(K) = 20log(|G(j\omega)|) = -20
K = 1/10;
% The value alpha from the normalized transfer function
alpha = 1/(-1*p2);
% Since all poles/zeros have negative real parts, this system is
% minimum-phase.
% The transfer function of the minimum-phase system
s = tf('s');
G = K*1/(alpha*(s-p1)*(s-p2));
% Plotting the magnitude of the minimum-phase system in Fig. 7.33(c)
figure;
subplot(2, 1, 1);
h = bodeplot(G);
setoptions(h, 'PhaseVisible', 'off');
grid on;
title('Magnitude plot of minimum-phase system in Fig. 7.33(c)', 'interpreter', 'latex');
subtitle('$G(s) = K\frac{1}{(s+1)(s+10)}, K=\frac{1}{10}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('\omega', 'interpreter', 'latex');
% Plotting the phase of the minimum-phase system in Fig. 7.34(c)
subplot(2, 1, 2);
% Recall the transfer function of the minimum-phase system in P7.9(c)
G = (s+1) / (s^2*(s+10));
h = bodeplot(G);
setoptions(h, 'MagVisible', 'off');
grid on;
title('Phase plot of minimum-phase system in Fig. 7.34(c)', 'interpreter', 'latex');
subtitle('$G(s) = K\frac{s+1}{s^2(s+10)}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('$\textrm{Phase} \angle G(j\omega)$', 'interpreter', 'latex');
% Now the magnitude and phase plots of the minimum-phase systems match the
% expected diagrams in Fig. 7.33(c) and Fig. 7.34(c).

%% Fig. 7.33(h) and 7.34(h):
% Recall from P7.8 the transfer function of the minimum-phase system
% matching the Bode magnitude diagram in Fig. 7.33(h).
G = (s+10)/((s+1)^2);
% Compare the Bode phase diagram of this transfer function to the one shown 
% in Fig. 7.34(h).
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of minimum-phase system from P7.8(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{(s+10)}{(s+1)^2}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');
% The phase diagram above matches the phase diagram shown in Fig. 7.34(h).
% Thus, the transfer function of the minimum-phase system in P7.8(h) holds.