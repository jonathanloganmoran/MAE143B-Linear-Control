%% P7.7: Use the Nyquist stability criterion to decide whether the rational
% transfer functions in P7.5 and P7.6 are stable under negative unit 
% feedback. If not, is there a gain for which the closed-loop system can be made
% asymptotically stable? Draw the corresponding root locus diagrams and
% compare them.

%% P7.5(a) and P7.6(a)
% The poles of the system given by the root-locus diagram in Fig. 7.32(a)
p1 = -1;
p2 = -2;
% The transfer function of the system in Fig. 7.32(a)
s = tf('s');
G = 1 / ((s-p1)*(s-p2));        % The feedforward transfer function
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
title('Nyquist plot of the closed-loop system in Fig. 7.32(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+2)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = 0.
%
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in Fig. 7.32(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+2)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% We see that the root-locus of the system is entirely on the LHP.
% Since Z < 0, the system is stable. Furthermore, the closed-loop system is
% stable under negative unit feedback as N = P = 0.
% Calculating the gain margin of the closed-loop system
gm = allmargin(sys).GainMargin
% The gain margin has a value of inf, meaning that the closed-loop system
% under negative unit feedback is stable for values of gain K > 0.

%% P7.5(c) and P7.6(c)
% The poles of the system given by the root-locus diagram in Fig. 7.32(c)
p1 = 1;
p2 = 2;
% The transfer function of the system in Fig. 7.32(c)
s = tf('s');
G = 1 / ((s-p1)*(s-p2));        % The feedforward transfer function
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
title('Nyquist plot of the closed-loop system in Fig. 7.32(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s-1)(s-2)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = 0. 
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in Fig. 7.32(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s-1)(s-2)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% We see that the root-locus of the system is entirely on the RHP. There
% are P = 2 poles of the system that exist on the RHP. 
% The closed-loop system is not stable under negative unit feedback as
% N = 0 \neq P.

%% P7.5(h) and P7.6(h)
% The poles of the system given by the root-locus diagram in Fig. 7.32(h)
p1 = -2;
p2 = 0 - 1j;
p3 = 0 + 1j;
% The zeros of the system given by the root-locus diagram in Fig. 7.32(h)
z1 = 0;
% The transfer function of the system in Fig. 7.32(h)
s = tf('s');
G = (s-z1) / ((s-p1)*(s-p2)*(s-p3));
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
title('Nyquist plot of the closed-loop system in Fig. 7.32(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s}{(s-2)(s^2 + 1)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The number of encirclements of the point -1 + 0j is N = P - Z = 0. 
% Comparing this to the root-locus diagram
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
grid on;
title('Root-locus plot of the closed-loop system in Fig. 7.32(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s}{(s-2)(s^2 + 1)}, K(s) = Kp, Kp = 1$', 'interpreter', 'latex');
% We see that the root-locus of the system is entirely on the RHP. There
% are P = 2 poles of the system that exist on the RHP. 
% The closed-loop system is not stable under negative unit feedback as
% N = 0 \neq P.
% Calculating the gain margin of the closed-loop system
gm = allmargin(sys).GainMargin
% The gain margin has a value of inf, meaning that the closed-loop system
% under negative unit feedback is stable for values of gain K > 0.