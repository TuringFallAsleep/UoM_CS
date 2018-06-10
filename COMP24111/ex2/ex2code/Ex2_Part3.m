%part 3
clc
clear
load postaldata
tic
threshold = 0.2;
learningrate = 0.1;
w = zeros(1,256);
active = 0;
output = zeros(1,200);

[mydata3,mylabel3] = shufflerows(data(1001:1500,:),labels(1001:1500,:));
[mydata8,mylabel8] = shufflerows(data(3501:4000,:),labels(3501:4000,:));
DataLabel3 = horzcat(mydata3,mylabel3);
DataLabel8 = horzcat(mydata8,mylabel8);
Training = vertcat(DataLabel3(1:100,:),DataLabel8(1:100,:));
Testing = vertcat(DataLabel3(101:200,:),DataLabel8(101:200,:));
%training dataset
for i = 1:200
    if Training(i,257) == 3
        target(i) = 0; % target = 0 -> 3
    else
        target(i) = 1; % targrt = 1 -> 8
    end 
end

% Training
for interaction = 1:50
    for i = 1:200
        x = Training(i,1:256);
        targ = target(i);
        activ = sum(w(1:256).*x(1:256));        
        if activ > threshold
            output(i) = 1;
        else
            output(i) = 0;
        end
        for j = 1:256
            w(j) = w(j) + learningrate * (targ - output(i)) * x(j);
        end
        threshold = threshold + learningrate * (targ - output(i)) * -1;
    end
end
disp(['Training time is ',num2str(toc)])


%Testing
for i = 1:200
    x = Training(i,1:256);
    targ = target(i);
    activ = sum(w(1:256).*x(1:256));
    if activ > threshold
        output(i) = 1;
    else
        output(i) = 0;
    end
end
for i = 1:200
    if output(i) == 1
        output(i) = 8;
    else
        output(i) = 3;
    end
end
[c,order] = confusionmat(Training(1:200,257),output);
showdata(Training(1:200,1:256),Training(1:200,257),output);


