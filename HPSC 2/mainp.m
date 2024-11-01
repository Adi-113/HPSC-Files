

clear all; % Start fresh, you can comment this if it is too annoying

% Create a parallel pool if none exists
if isempty(gcp())
    parpool();
end

% Utilize multiple cores to run embarrasingly parallel computations
n = 150;
tic
parfor i=1:n
    timeconsumingfun
end
tp = toc