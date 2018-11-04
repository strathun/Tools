function [ cornerFreq ] = cornerCalc( dataVector, freqVector, startingFreq, percentDiff, window )
%UNTITLED2 Summary of this function goes here
%   Inputs : 
%       dataVector : Single data vector
%       freqVector : 
%       startingFreq : what X value to compare to
%       percentDiff : what percent diff from the Y value at startingFreq to
%           monitor
%       window : number of samples to use in averaging window.
%   Outputs : 
%       cornerFreq : X value that is percentDiff away from Y value at
%           startingFreq 

startMarker = 1 ;


for i = 1:length(freqVector)
    if freqVector(i) > startingFreq     %may need to change to < if freqVector is increasing
        startMarker = startMarker + 1 ;
    else 
        break
    end
end
percentDiff = ( ( percentDiff+100 ) / 100 );

endValue = percentDiff * dataVector( startMarker - 1 );

for i = (startMarker + window):length(dataVector)
    if mean( dataVector( i-window:i ) ) >= endValue
        endMarker = i;
        break
    end
end
     
cornerFreq = freqVector( endMarker ); 
end

