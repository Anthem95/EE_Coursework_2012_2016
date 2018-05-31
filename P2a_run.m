% P2a_run.m
% Jacqueline Decker
% 03/17/2016
%
% Purpose: This script utilizes the function QuadEncoderDemod, which takes
%          signal vectors for single dimensions and outputs the
%          corresponding accumulated quadrature encoder output count and
%          all the places where an illegal state change occurs. This is
%          done for both the x and y dimensions for each A and B pair of
%          signals. The process is reiterated 6 times with the given data,
%          to generate a plot that gives an estimate of the path of the
%          robot. There will be a pause between each position plot as they
%          are generated in sequence. There is no downsampling in this
%          script.
% 
close; clear; clc;
load qe_data;

% declare tdelta in seconds
tdelta = 1;

% Produce all of the QuadEncoder Outputs for all 6 datasets
% Data Set qe1
xA1 = qe1(:,1);
xB1 = qe1(:,2);
yA1 = qe1(:,3);
yB1 = qe1(:,4);

PlotPath(t1, xA1, xB1, yA1, yB1, tdelta);
fprintf('Moving to next data set. \n')
pause(5);

% Data Set qe2
xA2 = qe2(:,1);
xB2 = qe2(:,2);
yA2 = qe2(:,3);
yB2 = qe2(:,4);

PlotPath(t2, xA2, xB2, yA2, yB2, tdelta);

% Data Set qe3
xA3 = qe3(:,1);
xB3 = qe3(:,2);
yA3 = qe3(:,3);
yB3 = qe3(:,4);

PlotPath(t3, xA3, xB3, yA3, yB3, tdelta);
fprintf('Moving to next data set. \n')
pause(5);

% Data Set qe4
xA4 = qe4(:,1);
xB4 = qe4(:,2);
yA4 = qe4(:,3);
yB4 = qe4(:,4);

PlotPath(t4, xA4, xB4, yA4, yB4, tdelta);
fprintf('Moving to next data set. \n')
pause(5);

% Data Set qe5
xA5 = qe5(:,1);
xB5 = qe5(:,2);
yA5 = qe5(:,3);
yB5 = qe5(:,4);

PlotPath(t5, xA5, xB5, yA5, yB5, tdelta);
fprintf('Moving to next data set. \n')
pause(5);

% Data Set qe6
xA6 = qe6(:,1);
xB6 = qe6(:,2);
yA6 = qe6(:,3);
yB6 = qe6(:,4);

PlotPath(t6, xA6, xB6, yA6, yB6, tdelta);
fprintf('Moving to next data set. \n')
pause(5);





