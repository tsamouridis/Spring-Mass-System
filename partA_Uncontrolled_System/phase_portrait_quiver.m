% Phase-Portrait of the system using MATLAB's function quiver
clc; close all; clear all;

k = 5;
m = 1;
mu = 0.75;
g = 9.81;

[x1, x2] = meshgrid(-10:10, -10:10);
x1_dot = sqrt(k/m)*x2;
x2_dot = -sqrt(m/k)*mu*g*sign2(sqrt(k/m)*x2, x1)-sqrt(k/m)*x1;
quiver(x1, x2, x1_dot, x2_dot)
title('Phase-plane Portrait','fontsize', 14, 'interpreter', 'latex');
ylabel('$ x_2 ( \frac{m}{sec \cdot rad})$','fontsize', 14, 'interpreter', 'latex');
xlabel('$ x_1 (m)$','fontsize', 14, 'interpreter', 'latex');
grid on;
axis equal