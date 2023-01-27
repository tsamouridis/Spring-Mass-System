% Phase-Portrait of the system
clear all; clc; close all;

syms x1;
syms x2;

k = 5;
m = 1;
mu = 0.75;
g = 9.81;

c_list = 1:10;
figure;
for c = c_list
    hold on
    fplot(sqrt(-(x1+m*mu*g/k)^2+c), 'linewidth', 2);
end
title('Phase-plane Portrait for $x_2 > 0$','fontsize', 14, 'interpreter', 'latex');
ylabel('$ x_2 ( \frac{m}{sec \cdot rad})$','fontsize', 14, 'interpreter', 'latex');
xlabel('$ x_1 (m)$','fontsize', 14, 'interpreter', 'latex')
grid on;
legend_cell = cellstr(num2str(c_list', '%d'));
lgd = legend(legend_cell);
title(lgd,'constant $ c_1 $ values', 'interpreter', 'latex')
axis equal

figure;
for c = c_list
    hold on
    fplot(-sqrt(-(x1-m*mu*g/k)^2+c), 'linewidth', 2);
end
title('Phase-plane Portrait for $x_2 < 0$','fontsize', 14, 'interpreter', 'latex');
ylabel('$ x_2 ( \frac{m}{sec \cdot rad})$','fontsize', 14, 'interpreter', 'latex');
xlabel('$ x_1 (m)$','fontsize', 14, 'interpreter', 'latex')
grid on;
legend_cell = cellstr(num2str(c_list', '%d'));
lgd = legend(legend_cell);
title(lgd,'constant $ c_2 $ values', 'interpreter', 'latex')
axis equal



