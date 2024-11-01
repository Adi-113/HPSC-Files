% Create a parallel pool if none exists
close all; clear all; clc;
syms f;
if isempty(gcp())
    parpool();
end
nworkers = gcp().NumWorkers;
% Define the function
f = @(x, y) x.* y;
% Discretize the interval on the client
y= linspace(0,20,nworkers+1);
% On the workers
tic
spmd
    ainit = y(spmdIndex())%left point of subinterval
    bfin =  y(spmdIndex()+1) %right point of subinterval
    locint = integral2(f,0,20,ainit,bfin); % subinterval integration
end
toc
totalIntegral = sum([locint{:}]);

% Display the total integral
disp(['The total integral is: ', num2str(totalIntegral)]);
