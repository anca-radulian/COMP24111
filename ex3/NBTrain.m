function [noOfClasses, priorProbabilities, probabilityMatrix] = NBTrain( AttributeSet, LabelSet )
%NBTRAIN Summary of this function goes here
%   Detailed explanation goes here

    noExamples = size(LabelSet, 1);
    noOfClasses = max(LabelSet) + 1;
    
    
    elementsClass = zeros(noOfClasses,1);
    
    % Calculate number of elements in each class
    for i=1:noExamples
        elementsClass(LabelSet(i) + 1) = elementsClass(LabelSet(i) + 1) + 1;
    end
    
   
    % Calculate prior probabilities
    priorProbabilities =[]; 
    priorProbabilities = elementsClass ./ noExamples;
    

    noOfFeatures = size(AttributeSet, 2);
    noOfMails = size(AttributeSet,1);
    
    
    dataValues = unique(AttributeSet);
    probabilityMatrix = zeros(noOfFeatures, noOfClasses, size(dataValues,1));
    
    
    
     
     for i = 1:noOfFeatures
         for j = 1:noOfMails
           probabilityMatrix(i, LabelSet(j) + 1, AttributeSet(j,i) + 1) =  probabilityMatrix(i, LabelSet(j) + 1, AttributeSet(j,i)+1) + 1;
         end
         
       for k= 1: noOfClasses
        probabilityMatrix(i,k,:) = probabilityMatrix(i,k,:)/elementsClass(k);
     end
    
end

