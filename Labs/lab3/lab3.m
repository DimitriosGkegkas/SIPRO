close all;
clear;  % Clears all variables from the workspace
clc;    % Clears the command window
addpath('./lab3');

w0 = 2;
G = 1;
anum = 0.3;
Ts = 0.1;

num = G*w0^2;
den = [1 0 w0^2];

% A = [0 -w0^2; 1 0]
% B = [(w0^2)*G; 0]
% C = [0 1]
% D = 0

transferC = tf(num, den);
% stateSpaceC = ss(A,B,C,D)
[Ac, Bc, Cc, Dc, Ec] = ssdata(transferC);

transferD = c2d(transferC, Ts);
[numD,denD] = tfdata(transferD);
numD = cell2mat(numD);
denD = cell2mat(denD);
[Ad, Bd, Cd, Dd, Ed] = dssdata(transferD);
stateSpaceD = ss(Ad, Bd, Cd, Dd, Ts);

disp("Continues time system")
transferC
tic
    [t, X] = ode45(@(t,y) navettecontinue(t,y,Ac,Bc), [0, 8], [0, 0]);
toc
disp("Discrete time system")
transferC
tic
    [N, Xe] = ore(@(n, xe) navettediscrete(n,xe,Ad, Bd,Ts), [0, 8/Ts], [0, 0]);
toc


% Create a new figure
figure;

% Plot the first dataset [t, X]
plot(t, (Cc*X'), 'b-', 'LineWidth', 2); % 'b-' represents a blue line
hold on; % Hold the current plot
% Plot the second dataset [N, Xe]
plot(N*Ts, (Cd*Xe'), 'r--', 'LineWidth', 2); % 'r--' represents a red dashed line

% Add labels and a legend
xlabel('Time (t) or Number (N)');
ylabel('Value (X or Xe)');
legend('Dataset continues', 'Dataset discret');

% Customize the plot further if needed
title('Combined Plot of Two Datasets');
grid on; % Add grid lines

% Turn off the 'hold on' mode (optional, if you don't want to overlay more data)
hold off;