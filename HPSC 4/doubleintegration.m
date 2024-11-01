% Define the function to integrate
f = @(x, y) x.*y;

% Set the limits of integration
xLower = 0; xUpper = 20;
yLower = 0; yUpper = 20;

tic
% Sequential double integration for comparison
Result = integral2(f, xLower, xUpper, yLower, yUpper);
toc
disp(['Integral Value: ', num2str(Result)]);