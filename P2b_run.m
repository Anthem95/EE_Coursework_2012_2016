% P2b_run.m
% Jacqueline Decker
% 03/17/2016
% Mobile Robotics (ECE 4226)
% Project 2
%
% Purpose: This script contains a plot of each data set with downsampling.
%          There should be a total of 36 plots, with 6 data sets with 6
%          plots per set. 
%
close; clear; clc;
load qe_data;

% down sampling rates
Ndown = [10, 30, 50, 70, 100, 150];

for m = 1:6
    N = Ndown(m);
    fprintf('Displaying plots with downsampling rate: %3d. \n', N)
% declare tdelta in seconds
tdelta = 1;

% Produce all of the QuadEncoder Outputs for all 6 datasets
% Data Set qe1
xA1 = qe1(:,1);
xB1 = qe1(:,2);
yA1 = qe1(:,3);
yB1 = qe1(:,4);

xA1down = xA1(1:N:end);
xB1down = xB1(1:N:end);
yA1down = yA1(1:N:end);
yB1down = yB1(1:N:end);
t1down = t1(1:N:end);
PlotPath(t1down, xA1down, xB1down, yA1down, yB1down, tdelta);

fprintf('Data Set: 1. \n')
pause(5);

% Data Set qe2
xA2 = qe2(:,1);
xB2 = qe2(:,2);
yA2 = qe2(:,3);
yB2 = qe2(:,4);

xA2down = xA2(1:N:end);
xB2down = xB2(1:N:end);
yA2down = yA2(1:N:end);
yB2down = yB2(1:N:end);
t2down = t2(1:N:end);
PlotPath(t2down, xA2down, xB2down, yA2down, yB2down, tdelta);
fprintf('Data Set: 2. \n')
pause(5)

% Data Set qe3
xA3 = qe3(:,1);
xB3 = qe3(:,2);
yA3 = qe3(:,3);
yB3 = qe3(:,4);

xA3down = xA3(1:N:end);
xB3down = xB3(1:N:end);
yA3down = yA3(1:N:end);
yB3down = yB3(1:N:end);
t3down = t3(1:N:end);
PlotPath(t3down, xA3down, xB3down, yA3down, yB3down, tdelta);
fprintf('Data Set: 3. \n')
pause(5);

% Data Set qe4
xA4 = qe4(:,1);
xB4 = qe4(:,2);
yA4 = qe4(:,3);
yB4 = qe4(:,4);

xA4down = xA4(1:N:end);
xB4down = xB4(1:N:end);
yA4down = yA4(1:N:end);
yB4down = yB4(1:N:end);
t4down = t4(1:N:end);
PlotPath(t4down, xA4down, xB4down, yA4down, yB4down, tdelta);
fprintf('Data Set: 4. \n')
pause(5);

% Data Set qe5
xA5 = qe5(:,1);
xB5 = qe5(:,2);
yA5 = qe5(:,3);
yB5 = qe5(:,4);

xA5down = xA5(1:N:end);
xB5down = xB5(1:N:end);
yA5down = yA5(1:N:end);
yB5down = yB5(1:N:end);
t5down = t5(1:N:end);
PlotPath(t5down, xA5down, xB5down, yA5down, yB5down, tdelta);
fprintf('Data Set: 5. \n')
pause(5);

% Data Set qe6
xA6 = qe6(:,1);
xB6 = qe6(:,2);
yA6 = qe6(:,3);
yB6 = qe6(:,4);

xA6down = xA6(1:N:end);
xB6down = xB6(1:N:end);
yA6down = yA6(1:N:end);
yB6down = yB6(1:N:end);
t6down = t6(1:N:end);
PlotPath(t6down, xA6down, xB6down, yA6down, yB6down, tdelta);
fprintf('Data Set: 6. \n')
pause(5);


end