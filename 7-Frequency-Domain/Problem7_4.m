%% P7.4: Use the Nyquist stability criterion to decide whether the rational
% transfer functions in P7.1 are stable under negative unit feedback. If
% not, is there a gain for which the closed-loop system can be made
% asymptotically stable? Draw the corresponding root locus diagrams and
% compare them.

% For the closed-loop systems, assume unit feedback, i.e., \alpha = 1, and
% consider the number of encirclements at the point \frac{-1}{\alpha}.

%% P7.1(a)
% The transfer function of the open-loop system
s = tf('s');
G = 1 / ((s+1)*(s+10));         % The feedforward transfer function
% The closed-loop system formed by the controller K(s)
Kp = 1;                         % The proportional gain
K = Kp;                         % The controller K(s)
sys = K*G;                      % The closed-loop system L(s)
% sys = feedback(G, K, -1);     % The closed-loop system under negative FB
% Verifying the stability of the system with Nyquist stability criterion
figure;
subplot(2, 1, 1);
nyquistplot(sys);
axis equal;
grid on;
title('Nyquist plot of the closed-loop system in P7.1(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+10)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = 0.
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in P7.1(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+10)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% We see that the root-locus of the system is entirely on the LHP. Since
% Z < 0, the system is stable. Furthermore, since N = P = 0, the
% closed-loop system is stable under negative unit feedback, i.e., at
% \alpha = 1, and closed-loop stable for all values of \alpha > 0.

%% P7.1(g):
% The transfer function of the open-loop system
G = (s+10)/((s+1)^2);           % The feedforward transfer function
% The closed-loop system formed by the controller K(s)
Kp = 1;                         % The proportional gain
K = Kp;                         % The controller K(s)
sys = K*G;                      % The closed-loop system L(s)
% Verifying the stability of the system with Nyquist stability criterion
figure;
subplot(2, 1, 1);
nyquistplot(sys);
axis equal;
grid on;
title('Nyquist plot of the closed-loop system in P7.1(g)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s+1)^2}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = 0.
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in P7.1(g)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s+1)^2}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% From the root-locus plot we see that the asymptotes lie in the LHP.
% Therefore, the system is stable for all values of \alpha > 0. 
% Since N = P = 0, the closed-loop system is stable under negative unit 
% feedback, i.e., at \alpha = 1.

%% P7.1(h):
% The transfer function of the open-loop system
G = (s+1)/(s*(s+10));           % The feedforward transfer function
% The closed-loop system formed by the controller K(s)
Kp = 1;                         % The proportional gain
K = Kp;                         % The controller K(s)
sys = K*G;                      % The closed-loop system L(s)
% Verifying the stability of the system with Nyquist stability criterion
figure;
subplot(2, 1, 1);
nyquistplot(sys);
axis equal;
grid on;
title('Nyquist plot of the closed-loop system in P7.1(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+1}{s(s+10)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = 0.
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in P7.1(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+1}{s(s+10)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% Since the root-locus is entirely on the RHP, the system is stable for all
% values of \alpha > 0. Furthermore, the closed-loop system is stable under 
% negative unit feedback, i.e., at \alpha = 1, as N = P = 0.
% Calculating the gain margin of the closed-loop system
gm = allmargin(sys).GainMargin
% The gain margin has a value of inf, meaning that the closed-loop system
% under negative unit feedback is stable for values of \alpha  > 0.

%% P7.1(j):
% The transfer function of the open-loop system
G = (s+10)/((s^2 + 0.1*s+1)^2); % The feedforward transfer function
% The closed-loop system formed by the controller K(s)
Kp = 1;                         % The proportional gain
K = Kp;                         % The controller K(s)
sys = K*G;                      % The closed-loop system L(s)
% Verifying the stability of the system with Nyquist stability criterion
figure;
subplot(2, 1, 1);
nyquistplot(sys);
axis equal;
grid on;
title('Nyquist plot of the closed-loop system in P7.1(j)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s^2 + 0.1s +10)^2}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = -2.
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in P7.1(j)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s+10}{(s^2 + 0.1s +10)^2}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% Since there exist two clockwise encirclements, the closed-loop system
% under negative unit feedback, i.e., at \alpha = 1, is unstable.
% Calculating the gain margin of the closed-loop system
gm = allmargin(sys).GainMargin
% The gain margin has a value of 0.001, meaning that the closed-loop system
% under negative unit feedback is stable for values of \alpha < 0.001. 