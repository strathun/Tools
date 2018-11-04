function [pxx1,f] = psdWalker(data,avgs,Fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% power using Welch method
% basically just pwelch...
%load('groundPower');

% na = 64; %number of averages
nx = max(size(data));
w = floor(nx/avgs);
[pxx, f] = pwelch(data,w,[],[],Fs);

% pxx = pxx - groundPower;  %put back in if not using Mohits stuff
% (7/24/2018)
pxx1 = (sqrt(pxx))*1e9; %took out the /2 for now... Not really sure what the correct method is.

%  noiseArray(i,:) = pxx1 ;
%  powerArray(i,:) = pxx ; 
%  avgNoise = mean(noiseArray);
%  verifArray(1,1) = trapz(pxx(176:21847)*f(2));
% verifArray(i,2) = var(V(i,:));
% verifArray(i,3) = (abs(verifArray(i,1)-verifArray(i,2))/verifArray(i,2))*100;

end

