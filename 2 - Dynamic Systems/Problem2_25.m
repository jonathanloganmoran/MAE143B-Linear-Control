% From P2.18, the ODE
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w

% Load data given in P2.25
g = 10;                             % m/s^2
r = 1;                              % m
m1 = 1000;                          % kg
m2 = 800;                           % kg
b1 = 120;                           % kgm^2/s
b2 = 120;                           % kgm^2/s
J1 = 20;                            % kgm^2
J2 = 20;                            % kgm^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));      % kgm^2
b = (b1 + b2);                      % kgm^2/s
w = g*r*(m1 - m2);                  % kgm^2/s

%% The feedback controller: \tau(t) = K(\bar{v_1} - v_1(t)) can be used to
% control the ascent and descent speed of the mass m_1 in the elevator
% discussed in P2.18 and P2.19. Calculate and solve a differential equation
% that describes the closed-loop response of the elevator.


% Desired vertical velocity
v_1_bar = 2;                                    % m/s
%% Using data from P2.19, select a controller gain, K, with which the 
% time-constant of the elevator is approximately 5s.

% Time constant in the form TC_{CL} = \frac{-1}{\lambda}
% solved for K when TC_{CL} = 5s
K = (a - 5*b)/(5*r);                        % kgm

% Particular closed-loop solution in time-domain
lambda = -(b + K*r)/a;
v_tilde = (r/(b + K*r))*(K*v_1_bar + w);

%% Calculate the closed-loop steady-state error between the desired vertical
% velocity, \bar{v_1} = 2 m/s, and v_1(t).

% Computing the steady-state error in the form:
% \lim_{t \leftarrow \infty} e_{ss} = \bar{v_1} - v_1(t) 
%                                   = \bar{v_1} - \tilde{v_1}

% Desired vertical velocity
v_1_bar = 2;                                    % m/s

e_ss = v_1_bar - (r/(b + K*r))*(K*v_1_bar + w);   % m/s

% Open-loop time constant
lambda_OL = a/b;
TC_OL = -1/lambda_OL;

%% Plot the response v_1(t) when v_1(0) = 0 m/s, 1 m/s, and -1 m/s
% Time interval
t = linspace(0, 60, 200);

% Plotting the response of the system in P2.22 with m_2 = 800kg
figure;
subplot(1,2,1);
for v0_1 = [0, 1, -1]
    % Complete closed-loop solution in time-domain
    v_1t = v_tilde*(1 - exp(lambda*t)) + v0_1*exp(lambda*t);
    plot(t, v_1t);
    grid on;
    hold on;
end
title('Linear velocity of elevator model (Problem 2.23)', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m/s$', 'interpreter', 'latex');
legend('$v_1(0) = 0 m/s$', '$v_1(0) = 1 m/s$', '$v_1(0) = -1 m/s$',  'interpreter', 'latex', location='southeast');
subtitle('$m_2 = 800 kg, \tau = K(\bar{v_1} -v_1(t)) Nm$', 'interpreter', 'latex');

% For previous value of torque from P2.21
tau_bar = b*v_1_bar;
v_tilde = (r/b)*(tau_bar + g*r*(m1 - m2));
subplot(1,2,2);
for v0_1 = [0, 1, -1]
    % Complete solution in time-domain
    v_1t = v_tilde*(1-exp(lambda*t)) + v0_1*exp(lambda*t);
    plot(t, v_1t);
    grid on;
    hold on;
end
title('Linear velocity of elevator model (Problem 2.23)', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m/s$', 'interpreter', 'latex');
legend('$v_1(0) = 0 m/s$', '$v_1(0) = 1 m/s$', '$v_1(0) = -1 m/s$',  'interpreter', 'latex', location='southeast');
subtitle('$m_2 = 800 kg, \tilde{\tau} = 480 Nm$', 'interpreter', 'latex');
