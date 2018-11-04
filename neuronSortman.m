function [sortedWaveforms] = neuronSortman(waveformArray)
%UNTITLED2 Summary of this function goes here
%   Inputs
%       waveformArray : array of spike waveforms. Columns = traces.

[events, ~] = size(waveformArray);

disp('Click in the middle of the cluster for a specific point on the waveform. Can click more than one spot')

figure
for ii = 1:events
    plot(waveformArray(ii,:))
    hold on
end
[x, y] = ginput;

artifacts = length(x);
sortedWaveforms = cell(1,artifacts);

for ii = 1:events
    for i = 1:artifacts
        A(i,1) = waveformArray(ii,ceil(x(i)));
    end
    B = abs(A - y);
    [~, sortPointer] = min(B);
    sortedWaveforms{1,sortPointer} = [sortedWaveforms{1,sortPointer}; waveformArray(ii,:)];
end

end

