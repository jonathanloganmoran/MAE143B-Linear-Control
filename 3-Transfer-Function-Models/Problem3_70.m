% From P2.18, the ODE
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w

% Load data given in P3.70
g = 10;                 % m/s^2
r = 1;                  % m
m1 = 1000;              % kg
m2 = 800;               % kg
b1 = 120;               % kgm^2/s
b2 = 120;               % kgm^2/s
J1 = 20;                % kgm^2
J2 = 20;                % kgm^2
T = 480;                % Nm = kgm^2/s^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));
b = (b1 + b2);
w = g*r*(m1 - m2);

% Time interval
t = linspace(0, 200, 300);

% Transfer function G(s) in P3.63 and P3.64
s = tf('s');
G1 = r / (a*s + b);

% Transfer function G(s) in P3.66
num = r/a;
G2 = (r/a) / (s^2 + (b/a)*s);

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));
b = (b1 + b2);
w = g*r*(m1 - m2);

% Unit step reference input signal in P3.63
u1 = (T + w)*heaviside(t);
% Unit step reference input signal in P3.64
u2 = (T*cos((a/b)*(pi/180)*t) + w).*heaviside(t);
% Unit step reference input signal in P3.64 with different \omega
u3 = (T*cos(0.4*t) + w).*heaviside(t);
% Unit step reference input signal in P3.64 with different \omega
u4 = (T*cos(2*t) + w).*heaviside(t);
% Unit step reference input signal in P3.66
u5 = (T + w)*heaviside(t);

% System response in time-domain
y1 = lsim(G1, u1, t);
y2 = lsim(G1, u2, t);
y3 = lsim(G1, u3, t);
y4 = lsim(G1, u4, t);
y5 = lsim(G2, u5, t);

% Plot configuration for P3.63 and P3.64
figure;
plot(t, y1);
hold on;
plot(t, y2);
hold on;
plot(t, y3);
hold on;
plot(t, y4);
grid on;
xlabel('${t}(s)$', 'interpreter', 'latex');
ylabel('${v_1}(t) m/s$', 'interpreter', 'latex');
legend('$\tau(t) = \tilde{\tau}$','$\tau(t) = \tilde{\tau}cos(\omega t), \omega = \frac{a}{b}\cdot\frac{\pi}{180} \simeq 0.15$', '$\tau(t) = \tilde{\tau}cos(\omega t), \omega = 0.4$', '$\tau(t) = \tilde{\tau}cos(\omega t), \omega = 2.0$', 'location', 'southeast', 'interpreter', 'latex');
title("$\textrm{Elevator's linear velocity for torque input reference (Problem 3.70)}$", 'Interpreter', 'latex');
subtitle('$m_2 = 800 kg$', 'interpreter', 'latex');

% Plot configuration for P3.66
figure;
plot(t, y5);
grid on;
xlabel('${t}(s)$', 'interpreter', 'latex');
ylabel('${x_1}(t) m$', 'interpreter', 'latex');
legend('$\tau(t) = \tilde{\tau}cos(\omega t)$', 'location', 'southeast', 'interpreter', 'latex');
title("$\textrm{Elevator's linear position for torque input reference (Problem 3.70)}$", 'interpreter', 'latex');
subtitle('$m_2 = 800 kg$', 'interpreter', 'latex');