function [ predictLabel, accuracy ] = NBTest( px,pc,testAttributeSet,validLabel) % NB test

sizeAttribute = size(testAttributeSet,2);%57
sizeOfSample = size(testAttributeSet,1);%2300
uniqueLabel = unique(validLabel); %matrix of unique label
sizeOfClass = length(uniqueLabel); %2/2/3
uniqueAttribute = unique(testAttributeSet);
predictLabel = zeros(sizeOfSample,1);
countCorrect = 0;


for i = 1:sizeOfSample %2300
    predictPc = ones(sizeOfClass,1);
    for j = 1:sizeOfClass %2/2/3
        for k = 1:sizeAttribute %57
            predictPc(j,1) = predictPc(j,1)*px(find(uniqueAttribute==testAttributeSet(i,k)),j,k);
            %find(uniqueAttribute==testAttributeSet(i,k)) is to get the
            %correspoinding coordinate position of every attributes
        end
        predictPc(j,1) = predictPc(j,1)*pc(j,1);
    end
    predictLabel(i,1) = find(predictPc==max(predictPc),1)-1; %notice value=position-1
    if predictLabel(i,1) == validLabel(i,1)
        countCorrect = countCorrect+1;
    end
end

accuracy = countCorrect/size(validLabel,1);
[C,order] = confusionmat(predictLabel,validLabel)
end
