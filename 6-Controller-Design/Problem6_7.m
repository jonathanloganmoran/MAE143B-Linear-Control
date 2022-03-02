%% P6.7: Sketch the root locus for the SISO systems.

%% Pole-zero plot shown in Fig. 6.25(a):
p1 = -1; 
p2 = -2;
s = tf('s');
G = 1 / ((s-p1)*(s-p2));
% Plotting the pole-zero plot of the system
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
title('Pole-zero plot of open-loop system in Fig. 6.25(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+2)}$', 'interpreter', 'latex');
% Plotting the root locus of the system
subplot(2, 1, 2);
rlocusplot(G);
xlim([-2.5 2.5]);
axis equal;
title('Root locus of system in Fig. 6.25(a)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s+1)(s+2)}$', 'interpreter', 'latex');

%% Pole-zero plot shown in Fig. 6.25(c):
p1 = 1; 
p2 = 2;
s = tf('s');
G = 1 / ((s-p1)*(s-p2));
% Plotting the pole-zero plot of the system
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
title('Pole-zero plot of open-loop system in Fig. 6.25(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s-1)(s-2)}$', 'interpreter', 'latex');
% Plotting the root-locus of the system
subplot(2, 1, 2);
rlocusplot(G);
xlim([-2.5 2.5]);
axis equal;
title('Root locus of system in Fig. 6.25(c)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{1}{(s-1)(s-2)}$', 'interpreter', 'latex');

%% Pole-zero plot shown in Fig. 6.25(h):
z1 = 0;
p1 = -2;
p2 = 0 + 1j;
p3 = 0 + -1j;
syms s;
s = tf('s');
G = (s-z1) / ((s-p1)*(s-p2)*(s-p3));
% Plotting the pole-zero plot of the system
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
xlim([-2.5 2.5]);
title('Pole-zero plot of open-loop system in Fig. 6.25(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s}{(s+2)(s^2 + 1)}$', 'interpreter', 'latex');
% Plotting the root locus of the system
subplot(2, 1, 2);
rlocusplot(G);
axis equal;
xlim([-2.5 2.5]);
title('Root locus of system in Fig. 6.25(h)', 'interpreter', 'latex');
subtitle('$G(s) = \frac{s}{(s+2)(s^2 + 1)}$', 'interpreter', 'latex');