% PlotPath.m
% Jacqueline Decker
% 03/17/2016
% Mobile Robotics (ECE 4226)
% Project 2
%
% Purpose: This function uses the quadrature encoder outputs for the x and
%          y directions. It plots the path of the robot. A dot should be
%          placed at every position separated by tdelta seconds. It
%          demonstrates how velocity changes as the robot moves. 
%
% Inputs: t - time vector
%         Ax, Bx - encoder outputs for the x direction from sensors A & B
%         Ay, By - encoder outputs for the y direction from sensors A & B
%         tdelta - change in time in seconds.
%
% Output: figure that displays the plotted robot path, with a dot at every
%         movement change between tdelta seconds. 

% 
function [  ] = PlotPath( t, Ax, Bx, Ay, By, tdelta )
figure;
% wheel radius = 1"
r = 1;
% # of black squares
N = 180; 
thetas = pi/N;
alpha = pi*thetas/N;

%linear movement of the wheel
d = alpha*r;

% divide the time vector by tdelta to get the # of position dots for the
% plot
%tdelta = tdelta*10,000; % speeds up the code but generates fewer plot points
n = length(t)/tdelta;

% position vector x
posx = [];
% position vector y
posy = [];

%     for m = 1:n
%         % gives the vector index for the desired delta
%         dot = m*tdelta;
%         
%         % t(dot);
%         
%         [xcV xeV] = QuadEncoderDemod(Ax,Bx);
%         [ycV yeV] = QuadEncoderDemod(Ay,By);
%         
%         % position vectors = linear movement * the count vector at given
%         % tdelta increment
%         posx(m) = d*(xcV(dot));
%         posy(m) = d*(ycV(dot));
%                 
%     end
    
 % gives the vector index for the desired delta
        m = 1:tdelta:length(t);
        
        % t(dot);
        
        [xcV xeV] = QuadEncoderDemod(Ax,Bx);
        [ycV yeV] = QuadEncoderDemod(Ay,By);
        
        % position vectors = linear movement * the count vector at given
        % tdelta increment
        posx(m) = d*(xcV(m));
        posy(m) = d*(ycV(m));


    plot(posx,posy, 'ob')
    xlabel('x direction');
    ylabel('y direction');
    title('Robot Position');
    axis equal;
    

end

