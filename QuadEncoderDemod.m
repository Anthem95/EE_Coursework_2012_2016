% Jacqueline Decker
% 03/17/2016
% Mobile Robotics, ECE 4226
% Purpose: To simulate the movement of a robot that has a ball wheel with
%          two shaft encoders in the x and y directions. The simulation
%          takes into consideration the effects of slow sampling speed on
%          movement estimation.
%
% Inputs: A & B are signal vectors for a single dimension (x & y). These
%         vectors must be the same size and only have a high and low
%         amplitude values.
%
% Outputs: cV and eV are the output vectors, they are the same size as A.
%          cV is the count vector, it gives the accumulated quadrature
%          encoder output count. eV is to be all zero except where illegal
%          state changes occur (illegal meaning invalid, the sensors didn't
%          properly pick up a state change).
%
% function [cV eV] = QuadEncoderDemod(A,B)

function [cV eV] = QuadEncoderDemod(A,B)
cV = [];
eV = [];
a = size(A); b = size(B);
if (a(1) ~= b(1)) 
    sprintf('Invalid vectors. A & B must be the same length.')
    return;
end

Num = []; State = [];
lowerA = round(min(A));
upperA = round(max(A));
lowerB = round(min(B));
upperB = round(max(B));

for n = 1:length(A)

        % make A & B into binary thresholded amplitudes to 
        % simplify transition identification
        if (A(n) < (1+ lowerA))
            A(n) = 0;
        elseif (A(n) > (upperA -1))
            A(n) = 1;
        end

        if (B(n) < (1+ lowerB))
            B(n) = 0;
        elseif (B(n) > (upperB -1))
            B(n) = 1;
        end

        % classify the Num & State
        if ((A(n) == B(n)) && (A(n) == 1))
            Num(n) = 3;
            State(n) = 0;
        elseif ((A(n) == 1) && (B(n) == 0))
            Num(n) = 2;
            State(n) = 1;
        elseif ((A(n) == 0) && (B(n) == 0))
            Num(n) = 0;
            State(n) = 2;
        else
            Num(n) = 1;
            State(n) = 3;
        end
        
        % check state change order for illegal state changes forwards &
        % backwards
        if (n == 1)
            eV(1) = 0;
        else
            if ((State(n - 1)== 0) && (State(n) == 2))
                eV(n) = 1;
            elseif ((State(n - 1)== 2) && (State(n) == 0))
                eV(n) = 1;
            elseif ((State(n - 1)== 1) && (State(n) == 3))
                eV(n) = 1;
            elseif ((State(n - 1)== 3) && (State(n) == 1))
                eV(n) = 1;
            else
                eV(n) = 0;
            end
        end
    end

    % I honestly have no idea what the "accumulated quadrature encoder
    % output count" is, so I'm just doing this:
    cV = Num;
    
    
end

