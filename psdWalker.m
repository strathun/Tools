function [pxx1,f] = psdWalker(data,avgs,Fs,varargin)
% [pxx1,f] = psdWalker(data,avgs,Fs)
% power spectral density using Welch method
% basically just pwelch...
% Inputs :
%   varargin{1}: name of file ('string') containing power calc of grounded
%   recording device

% checks for variable input: ground measurement for recording device
if nargin > 4  
    groundPower = varargin{1}; 
    load(groundPower);
else
    groundPower = 0;
end

nx = max(size(data));                   % number of samples
w = floor(nx/avgs);                     % window. Divides time domain data up into sections of length w
[pxx, f] = pwelch(data,w,[],[],Fs);

pxx = pxx - groundPower;    % subtracts instrument noise power

% (7/24/2018)
pxx1 = (sqrt(pxx))*1e9; % converts to nV

%  noiseArray(i,:) = pxx1 ;
%  powerArray(i,:) = pxx ; 
%  avgNoise = mean(noiseArray);
%  verifArray(1,1) = trapz(pxx(176:21847)*f(2));
% verifArray(i,2) = var(V(i,:));
% verifArray(i,3) = (abs(verifArray(i,1)-verifArray(i,2))/verifArray(i,2))*100;

end

