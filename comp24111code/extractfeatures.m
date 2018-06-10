%
% EXTRACTFEATURES( digdata )
%
% Arguments: 'digdata' is a 2-d matrix, size 16x16.
%
% Process the supplied 2d matrix to generate a lower dimensional
% feature vector, to be used in a learning algorithm.
%
% The returned vector is the sum of pixel values in each of the 16 columns.
% Alternatives might be the sum of values in the 16 rows, or combinations
% of the two, or other statistics of the pixels, like standard deviation.
%
% Note: This MUST return a 1-d array
%
%

function x = extractfeatures( mydata )

%sum the values in along matrix dimension 1 (rows)
%x = sum(digdata,1);

for m = 1:5000
    for n = 1:256
        if mydata(m,n)>100
            tempData(1,n) = mydata(m,n);
        else
            tempData(1,n) = 0;
        end
    end
    tempDataTo2D = reshape(tempData,16,16);
    extractTempData(m,:) = sum(tempDataTo2D,1);
end

 x = extractTempData;