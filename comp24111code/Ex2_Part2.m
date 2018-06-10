%part 2

clc
clear
load postaldata
extractDATA = extractfeatures(data);
result = [];
tic
exTrainingMatch = zeros(1,200);
exTestingMatch = zeros(1,200);
%Extract Data
[exMydata3,exMylabel3] = shufflerows(extractDATA(1001:1500,:),labels(1001:1500,:));
[exMydata8,exMylabel8] = shufflerows(extractDATA(3501:4000,:),labels(3501:4000,:));
exDataLabel3 = horzcat(exMydata3,exMylabel3);
exDataLabel8 = horzcat(exMydata8,exMylabel8);
%training dataset
exTraining = vertcat(exDataLabel3(1:100,:),exDataLabel8(1:100,:));

%Original Data
[mydata3,mylabel3] = shufflerows(data(1001:1500,:),labels(1001:1500,:));
[mydata8,mylabel8] = shufflerows(data(3501:4000,:),labels(3501:4000,:));
DataLabel3 = horzcat(mydata3,mylabel3);
DataLabel8 = horzcat(mydata8,mylabel8);
%training dataset
Training = vertcat(DataLabel3(1:100,:),DataLabel8(1:100,:));

for i = 1:200
  result(i) = knearest(3,exTraining(i,1:16),exTraining(1:200,1:16),exTraining(1:200,17));
end
toc

[c,order] = confusionmat(Training(1:200,257),result);
showdata (Training(1:200,1:256),Training(1:200,257),result);
disp(['Training time is ',num2str(toc)])
%end
    %exTestingAccuracy(k) = exTestingMatch(k)/200;
%end

% figure
% plot(1:2:200, exTestingAccuracy(1:2:200));
% title('Testing in part2 ');
% xlabel('K-Value');
% ylabel('accuracy');
% 
