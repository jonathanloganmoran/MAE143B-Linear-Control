%% P6.8: Use the root locus method to determine a proper feedback
% controller that can stabilize the SISO systems with poles and zeros
% shown in Fig. 6.25.


%% Pole-zero plot shown in Fig. 6.25(b)
z1 = 1;
p1 = -1;
s = tf('s');
G = (s-z1) / (s-p1);
% Plotting the pole-zero plot of the open-loop system:
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
xlim([-2.5 2.5]);
title('Pole-zero plot of open-loop system in Fig. 6.25(b)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s-1}{s+1}$', 'interpreter', 'latex');
% Plotting the root locus of the closed-loop system:
Kp = -2;                % A.S. when k < 1
K = Kp;                 % The proportional gain controller
sys = G*K;          
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-2.5 2.5]);
title('Root locus of closed-loop system in Fig. 6.25(b)', 'interpreter', 'latex');
subtitle('$K(s) = K_p, G(s) = \frac{s-1}{s+1}$', 'interpreter', 'latex');
legend('$K_p = -2$', 'interpreter', 'latex');
%% P6.8: Is the transfer-function of the controller asymptotically stable?
% The controller K(s) = Kp is asymptotically stable for values of Kp < 1.

%% Pole-zero plot shown in Fig. 6.25(c)
p1 = 1;
p2 = 2;
s = tf('s');
G = 1 / ((s-p1)*(s-p2));
% Plotting the pole-zero plot of the open-loop system:
figure;
subplot(2, 1, 1);
pzplot(G);
xlim([-2.5 2.5]);
axis equal;
title('Pole-zero plot of open-loop system in Fig. 6.25(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s-1)(s-2)}$', 'interpreter', 'latex');
% Plotting the root locus of the closed-loop system:
Kp = 1;                 % A.S. when Kp > 1
pk = 4;                 % A.S. when pk > 0
K = Kp * (s/(s+pk));    % The controller K(s)
sys = G*K;
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-5 5]);
title('Root-locus of closed-loop system in Fig. 6.25(c)', 'interpreter', 'latex');
subtitle('$K(s) = K_p \frac{s}{s + p_k}, G(s) = \frac{1}{(s-1)(s-2)}$', 'interpreter', 'latex');
legend('$K_p = 1, p_k = 4$', 'interpreter', 'latex');
%% P6.8: Is the transfer-function of the controller asymptotically stable?
% The controller K(s) = K_p*s / (s + \alpha) for values of alpha, K_p > 0.

%% Pole-zero plot shown in Fig. 6.25(f)
z1 = 0;
p1 = 0 + 1j;
p2 = 0 - 1j;
s = tf('s');
G = (s-z1) / ((s-p1)*(s-p2));
% Plotting the pole-zero plot of the open-loop system:
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
xlim([-2.5 2.5]);
title('Pole-zero plot of open-loop system in Fig. 6.25(f)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s}{s^2 + 1}$', 'interpreter', 'latex');
% Plotting the root locus of the closed-loop system:
Kp = 1;                 % A.S. when Kp > 0
K = Kp;                 % The proportional gain controller
sys = G*K;
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-6 2]);
title('Root locus of closed-loop system in Fig. 6.25(f)', 'interpreter', 'latex');
subtitle('$K(s) = K_p, G(s) = \frac{s}{s^2 + 1}$', 'interpreter', 'latex');
legend('$K_p = 1$', 'interpreter', 'latex');

%% P6.8: Is the transfer-function of the controller asymptotically stable?
% The controller K(s) = K_p is asymptotically stable for values of K_p > 0.