% Simulation of the systems behavior without any control input
clear all; close all; clc;

time_span = [0, 5];
k = 5;
m = 1;
mu = 0.75;
g = 9.81;
omega = sqrt(k/m);
system_parameters = [k, m ,mu, g];
initial_positions = [-5 3 0 -6 4];
initial_velocities = [0 0 -5 6 6]./omega;
initial_conditions = [initial_positions; initial_velocities];
[~, num_of_initial_conditions] = size(initial_conditions);

% calculations for the quiver plot
[x1, x2] = meshgrid(-10:10, -10:10);
x1_dot = sqrt(k/m)*x2;
x2_dot = -sqrt(m/k)*mu*g*sign2(sqrt(k/m)*x2, x1)-sqrt(k/m)*x1;
options = odeset('Refine',100);

for i = 1:num_of_initial_conditions
    [t,x] = ode15s(@(t, x) odefun(t, x, system_parameters), time_span, initial_conditions(:, i), options);
    
    figure(i);
    top_title = sprintf('Initial Conditions: $ (x_1, x_2) = (%d m, %d m/(sec * rad)) $', initial_conditions(1, i), initial_conditions(2, i));
    sgtitle(top_title,'fontsize', 14, 'interpreter', 'latex')
    subplot(2,1,1) 
    plot(t,x(:,1),t,x(:,2))
    title('Solution in time','fontsize', 14, 'interpreter', 'latex');
    xlabel('Time (sec)','fontsize', 14, 'interpreter', 'latex');
    ylabel('$ x (m)$','fontsize', 14, 'interpreter', 'latex');
    legend('$ x_1 = position  $','$ x_2  = \frac{velocity}{frequency} $', 'interpreter', 'latex')
    grid on;

    subplot(2,1,2)
    plot(x(:,1), x(:,2))
    axis equal
    title('Phase-plane Portrait','fontsize', 14, 'interpreter', 'latex');
    xlabel('$ x_2 (\frac{m}{sec \cdot rad})$','fontsize', 14, 'interpreter', 'latex');
    ylabel('$ x_1 (m)$','fontsize', 14, 'interpreter', 'latex');
    hold on;
    quiver(x1, x2, x1_dot, x2_dot)
    plot(x(1,1), x(1,2), 'bo')
    plot(x(end,1), x(end,2), 'bx')
    legend('Path','Field', 'start', 'finish', 'interpreter', 'latex')
    grid on;
end

