function [ px, pc ] = NBTrain(AttributeSet, LabelSet)

uniqueLabel = unique(LabelSet,'sorted');
uniqueAttribute = unique(AttributeSet,'sorted');
sizeOfAttribute = size(AttributeSet,2);%57 column: dim=2
sizeOfUniqueAttribute = size(uniqueAttribute,1);%2 column: dim=2
sizeOfClass = size(uniqueLabel,1);%2/2/3 row: dim=1,
sizeOfSample = size(LabelSet,1);%2300
NumOfEachAttributeInLabel = zeros(sizeOfClass,1);
NumOfEachAttributeInFeature = zeros(sizeOfUniqueAttribute,sizeOfClass,sizeOfAttribute);
pc =zeros(sizeOfClass,1);%probability of different classes
px =zeros(sizeOfUniqueAttribute,sizeOfClass,sizeOfAttribute);%probability of different attribute with different label
m=2;

for i = 1:sizeOfSample %2300
    for j = 1:sizeOfClass %2/2/3
        if LabelSet(i,1)==uniqueLabel(j,1)
            NumOfEachAttributeInLabel(j,1) = NumOfEachAttributeInLabel(j,1)+1;
            for k = 1:sizeOfAttribute %57
                for l = 1:sizeOfUniqueAttribute %2/3/7
                    if AttributeSet(i,k)==uniqueAttribute(l,1)
                       NumOfEachAttributeInFeature(l,j,k) = NumOfEachAttributeInFeature(l,j,k)+1;
                    end
                    if NumOfEachAttributeInFeature(l,j,k)==0
                        px(l,j,k) = (NumOfEachAttributeInFeature(l,j,k)+m*(1/sizeOfUniqueAttribute))/(NumOfEachAttributeInLabel(j,1)+m);
                    else
                        px(l,j,k) = NumOfEachAttributeInFeature(l,j,k)/NumOfEachAttributeInLabel(j,1);
                    end
                end 
            end            
        end
        pc(j) = NumOfEachAttributeInLabel(j,1)/sizeOfSample;    
    end
end

end
