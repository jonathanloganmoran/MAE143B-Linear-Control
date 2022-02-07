% Load data given in P3.69
g = 10;                 % m/s^2
r = 1;                  % m
m1 = 1000;              % kg
m2 = 1000;              % kg
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
t = linspace(0, 100, 100);

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
% Unit step reference input signal in P3.66
u3 = (T + w)*heaviside(t);

% System response in time-domain
y1 = lsim(G1, u1, t);
y2 = lsim(G1, u2, t);
y3 = lsim(G2, u3, t);

% Plot configuration for P3.63 and P3.64
figure;
plot(t, y1);
hold on;
plot(t, y2);
grid on;
xlabel('${t}(s)$', 'interpreter', 'latex');
ylabel('${v_1}(t) m/s$', 'interpreter', 'latex');
ylim([-2 3]);
legend('$\tau(t) = \tilde{\tau}$','$\tau(t) = \tilde{\tau}cos(\omega t)$', 'interpreter', 'latex');
title("$\textrm{Elevator's linear velocity for torque input reference (Problems 3.63 and 3.64)}$", 'Interpreter', 'latex');
subtitle('$m = 1000 kg$', 'interpreter', 'latex');

% Plot configuration for P3.66
figure;
plot(t, y3);
grid on;
xlabel('${t}(s)$', 'interpreter', 'latex');
ylabel('${x_1}(t) m$', 'interpreter', 'latex');
legend('$\tau(t) = \tilde{\tau}cos(\omega t)$', 'interpreter', 'latex');
title("$\textrm{Elevator's linear position for torque input reference (Problem 3.66)}$", 'interpreter', 'latex');
subtitle('$m = 1000 kg$', 'interpreter', 'latex');