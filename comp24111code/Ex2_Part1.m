clc
clear
load postaldata

madata3 = [];
mylabel3 = [];
mydata8 = [];
mylabel8 = [];
Training3 = [];
Training8 = [];
k = 0;
x = 1:256;
i = 0;
trainingMatch = zeros(1,200);
trainingAccuracy = zeros(1,100);
testing1Match = zeros(1,200);
testing2Match = zeros(1,200);
testing3Match = zeros(1,200);
testing4Match = zeros(1,200);
testing1Accuracy = zeros(1,100);
testing2Accuracy = zeros(1,100);
testing3Accuracy = zeros(1,100);
testing4Accuracy = zeros(1,100);
averageAccuracy = zeros(1,100);


% part1 (a)
[mydata3,mylabel3] = shufflerows(data(1001:1500,:),labels(1001:1500,:));
[mydata8,mylabel8] = shufflerows(data(3501:4000,:),labels(3501:4000,:));
DataLabel3 = horzcat(mydata3,mylabel3);
DataLabel8 = horzcat(mydata8,mylabel8);
%training dataset
Training = vertcat(DataLabel3(1:100,:),DataLabel8(1:100,:));

% part1 (b)
%y = knearest(k,x,Training(1:200,1:256),Training(1:200,257));
for k = 1:2:200 % even values will result in ties broken randomly.
    for i = 1:200
        if(knearest(k,Training(i,1:256),Training(1:200,1:256),Training(1:200,257))==Training(i,257))
            trainingMatch(k) = trainingMatch(k) + 1;
        end
    end
    trainingAccuracy(k) = trainingMatch(k)/200;
end

% figure
% plot(1:2:200, trainingAccuracy(1:2:200));
% title('Training in part1 (b)');
% xlabel('K-Value');
% ylabel('accuracy');

%Part (c)
Testing1 = vertcat(DataLabel3(101:200,:),DataLabel8(101:200,:));
for k = 1:2:200 % even values will result in ties broken randomly.
    for i = 1:200
        if(knearest(k,Testing1(i,1:256),Training(1:200,1:256),Testing1(1:200,257))==Testing1(i,257))
            testing1Match(k) = testing1Match(k) + 1;
        end
    end
    testing1Accuracy(k) = testing1Match(k)/200;
end

figure
plot(1:2:200, testing1Accuracy(1:2:200));
title('Testing1 in part1 (c)');
xlabel('K-Value');
ylabel('accuracy');

%Part (d)
Testing2 = vertcat(DataLabel3(201:300,:),DataLabel8(201:300,:));
for k = 1:2:200 % even values will result in ties broken randomly.
    for i = 1:200
        if(knearest(k,Testing2(i,1:256),Training(1:200,1:256),Testing2(1:200,257))==Testing2(i,257))
            testing2Match(k) = testing2Match(k) + 1;
        end
    end
    testing2Accuracy(k) = testing2Match(k)/200;
end

% figure
% plot(1:2:200, testing2Accuracy(1:2:200));
% title('Testing2 in part1 (d)');
% xlabel('K-Value');
% ylabel('accuracy');

Testing3 = vertcat(DataLabel3(301:400,:),DataLabel8(301:400,:));
for k = 1:2:200 % even values will result in ties broken randomly.
    for i = 1:200
        if(knearest(k,Testing3(i,1:256),Training(1:200,1:256),Testing3(1:200,257))==Testing3(i,257))
            testing3Match(k) = testing3Match(k) + 1;
        end
    end
    testing3Accuracy(k) = testing3Match(k)/200;
end

% figure
% plot(1:2:200, testing3Accuracy(1:2:200));
% title('Testing3 in part1 (d)');
% xlabel('K-Value');
% ylabel('accuracy');

Testing4 = vertcat(DataLabel3(401:500,:),DataLabel8(401:500,:));
for k = 1:2:200 % even values will result in ties broken randomly.
    for i = 1:200
        if(knearest(k,Testing4(i,1:256),Training(1:200,1:256),Testing4(1:200,257))==Testing4(i,257))
            testing4Match(k) = testing4Match(k) + 1;
        end
    end
    testing4Accuracy(k) = testing4Match(k)/200;
end


% figure
% plot(1:2:200, testing4Accuracy(1:2:200));
% title('Testing4 in part1 (d)');
% xlabel('K-Value');
% ylabel('accuracy');
averageAccuracy = (testing1Accuracy + testing2Accuracy + testing3Accuracy + testing4Accuracy)/4;
error(1:2:200)=std(averageAccuracy(1:2:200));
figure
errorbar(1:2:200,averageAccuracy(1:2:200),error(1:2:200));
title('Average Testing');
xlabel('K-Value');
ylabel('accuracy');


