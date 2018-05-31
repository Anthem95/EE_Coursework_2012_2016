%-------------------------------------------------------------------
%Created: 09/05/2014 by Elizabeth Brennan & Jacqueline Decker (All Rights Reserved)
%
%Revision History:  None
%
%Purpose: To calculate the fundamental period and the pulse width of a
%signal. 
%
%Variables: 
%   x - input vector of signal sample
%   t - input vector of time values corresponding to x
%   t0 - output value of signal period
%   tau - output value of pulse width
%   
%   q - vector used to store thresholded values to filter wavelength
%   TransPoints - vector that stores transition points between high and low
%   points in the signal
%   tau_avg - average of the 3 tau values
%   t0_avg - average of the 3 period values
%
%function [t0 tau] = Find_T0_tau( t,x )
%-------------------------------------------------------------------
function [ t0 tau ] = Find_T0_tau( t,x )

t0 = []; %initial conditions
tau = [];
t0_avg = [];
tau_avg = [];

TP = .6; % threshold percentage
if length(t) <= 1;  return;  end
if length(t) ~= length(x); return; end

maxHigh = find(max(x)); %Find the maximum value present in x to get a feel for where the high (with noise) is
thresholdHigh = maxHigh*TP; %Set TP percent of the high as the threshold test for a high or low signal
q = ( x >= thresholdHigh); %Create a vector where anything over the threshold is represented as a 1 and everything else as a 0

% Now try and find  boundaries between high and low
boundaries = abs(q - [q(2:length(q)) 0]); % subtract the shifted vector from orig

% find the indeces of the transition points.
TransPoints = find(boundaries);

% determining transition points, index locations
b1 = TransPoints(1);
b2 = TransPoints(2);
b3 = TransPoints(3);

% actual time intervals
t1 = t(b1);
t2 = t(b2);
t3 = t(b3);


% Finding length of the Period t0. A period has 3 transition points:
% high-low, low-high, high-low. 
t0_1 = abs(t3 - t1);

% finding pulse width tau: 1 of 2 possibilities. t0 = t2 - t1, or t3 - t2.
% You know which it is by compariing it to the TotalRatio. 

A = q((b1+1):b2);

%checking between the first 2 transition points to see how many points are there
highBtw1_2 = sum(A); 

if highBtw1_2> 0
    tau_1 = abs(t2 - t1); %tau is time difference between these points; pulse width.
    tau_avg = [tau_1]; %keep for averaging
    
    % Grab more points for avg
    if (length(TransPoints) >= 5)
        tau_2 = abs(t(TransPoints(4)) - t(TransPoints(3)));
        t0_2 = abs(t(TransPoints(5)) - t(TransPoints(3)));
        
        tau_avg = [tau_1 tau_2];
        t0_avg = [t0_1 t0_2];
    end
    
    if (length(TransPoints) >= 7)
        tau_3 = abs(t(TransPoints(6)) - t(TransPoints(5)));
        t0_3 = abs(t(TransPoints(7)) - t(TransPoints(5)));
        
        tau_avg = [tau_1 tau_2 tau_3];
        t0_avg = [t0_1 t0_2 t0_3];
    end
else %high occurs between transPoints 2 and 3
    tau_1 = abs(t3 - t2);
    tau_avg = [tau];

    % repeat previous if loop for the different transition points.
    if (length(TransPoints) >= 5)
        tau_2 = abs(t(TransPoints(5)) - t(TransPoints(4)));
        t0_2 = abs(t(TransPoints(5)) - t(TransPoints(3)));
        
        tau_avg = [tau_1 tau_2];
        t0_avg = [t0_1 t0_2];
    end
    
    if (length(TransPoints) >= 7)
        tau_3 = abs(t(TransPoints(7)) - t(TransPoints(6)));
        t0_3 = abs(t(TransPoints(7)) - t(TransPoints(5)));
        
        tau_avg = [tau_1 tau_2 tau_3];
        t0_avg = [t0_1 t0_2 t0_3];
    end    
    
    
end    

tau = sum(tau_avg)/length(tau_avg)
t0 = sum(t0_avg)/length(t0_avg)

end

