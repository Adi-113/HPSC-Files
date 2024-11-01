clear all; close all; delete(gcp('nocreate'));
parpool(4);

nworkers = gcp().NumWorkers;
maxIterations = 1000; gridSize = 2000;
blockSize = 2;  % number of blocks in each dimension
blockSizePerDim = gridSize / blockSize;
xlim = [-0.748766713922161, -0.748766707771757];
ylim = [ 0.123640844894862,  0.123640851045266];

% Split xlim and ylim into subintervals
xSubintervals = linspace(xlim(1), xlim(2), blockSize + 1);
ySubintervals = linspace(ylim(1), ylim(2), blockSize + 1);

tic();
spmd
    blockIndex = labindex();
    blockRow = ceil(blockIndex / blockSize);
    blockCol = mod(blockIndex - 1, blockSize) + 1;
    xStart = xSubintervals(blockCol);
    xEnd = xSubintervals(blockCol + 1);
    yStart = ySubintervals(blockRow);
    yEnd = ySubintervals(blockRow + 1);
    x = linspace(xStart, xEnd, blockSizePerDim);
    y = linspace(yStart, yEnd, blockSizePerDim);
    [xGrid, yGrid] = meshgrid(x, y);
    z0 = xGrid + 1i * yGrid; count = ones(size(z0));
    % Calculate
    z = z0;
    for n = 0:maxIterations
        z = z .* z + z0;
        inside = abs(z) <= 2; count = count + inside;
    end
    count = log(count);
end
% On the client, Show
cpuTime = toc();
set(gcf, 'Position', [200 200 600 600]);
imagesc(cat(2, x{:}), cat(2, y{:}), cat(1, count{:}));
axis image; axis off; colormap([jet(); flipud(jet()); 0 0 0]); drawnow;
title(sprintf('%1.2fsecs (with spmd)', cpuTime));