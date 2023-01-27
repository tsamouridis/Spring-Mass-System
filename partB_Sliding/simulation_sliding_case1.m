% simulation of sliding method control of the system for unknown parameters
% of function f
clear all; close all; clc;

time_span = [0,15];
k = 5;
m = 1;
mu = 0.75;
g = 9.81;
system_parameters = [k, m ,mu, g];
initial_conditions = [-5 3 0 -6 4; 0 0 -5 6 6];
[~, num_of_initial_conditions] = size(initial_conditions);

options = odeset('Refine',2);
xd = @(t)2+sin(2.5*t)+2*cos(1.25*t);
for i = 1:num_of_initial_conditions
    [t,x] = ode45(@(t, x) odefun_sliding_case1(t, x, system_parameters), time_span, initial_conditions(:, i), options);
    
    figure(i);
    top_title = sprintf('Initial Conditions: $ (x_1, x_2) = (%d m, %d m/sec) $', initial_conditions(1, i), initial_conditions(2, i));
    sgtitle(top_title,'fontsize', 14, 'interpreter', 'latex')
    subplot(2,1,1) 
    plot(t, xd(t), 'LineWidth', 2, 'color', 'green');
    hold on;
    plot(t, x(:,1), 'color','blue') 
    hold on
    plot(t, x(:,2), 'color','red')
    title('System Behaviour in time','fontsize', 14, 'interpreter', 'latex');
    xlabel('Time (sec)','fontsize', 14, 'interpreter', 'latex');
    ylabel('$ x (m)$','fontsize', 14, 'interpreter', 'latex');
    legend('$x_d(t) $', '$ x_1 $','$ x_2 $','interpreter', 'latex')
    grid on;

    subplot(2,1,2)
    plot(x(:,1), x(:,2))
    axis equal
    title('Phase-plane Portrait','fontsize', 14, 'interpreter', 'latex');
    ylabel('$ x_2 (\frac{m}{sec})$','fontsize', 14, 'interpreter', 'latex');
    xlabel('$ x_1 (m)$','fontsize', 14, 'interpreter', 'latex');
    hold on;
    plot(x(1,1), x(1,2), 'bo')
    plot(x(end,1), x(end,2), 'bx')
    legend('Path', 'start', 'finish', 'interpreter', 'latex')
    grid on;
end

