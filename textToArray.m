function [dataArray] = textToArray(data, HeaderLine, dataRows, dataColumns)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   Inputs:
%       data : Name of data file (as 'string'). Needs to be text document.
%           (Not necessarily .txt).
%       startLine : Row # of first row of data.
%       dataRows : Number of rows of data (in original document)
%       dataColumns : Number of columns of data (in original document)
%
%   Outputs:
%       dataArray : data specified in orginal data file reformated as
%       Matlab matrix. This will only display number data, all else will
%       show as zeros. You're welcome!

    filename = data;
    fid = fopen(filename);
    sizer = dataRows * dataColumns;
    dataArray = zeros(sizer,1);
    
    C = textscan(fid,'%s','Delimiter','\t','Headerlines',HeaderLine+1);
    CC = table2array(C);
    
    %Eventually make it so it can handle strings as well. (ie column headers)
    for i = 1:sizer
        [X,tf] = str2num(CC{i,1}); 
        if tf == 1
            dataArray(i) = X;
        else
            dataArray(i) = 0;
        end
    end
    
    dataArray = reshape(dataArray,dataColumns,dataRows);
    dataArray = dataArray.';
end

