function [ predictLabel, accuracy ] = NBTest(noOfClasses, priorProbabilities, probabilityMatrix, testAttributeSet, validLabel )

 noOfFeatures = size(testAttributeSet,2);
 noOfExamples = size(testAttributeSet,1);
 
 
 predictLabel = zeros(1:validLabel);

 for i= 1: noOfExamples
     probabilityClasses = priorProbabilities;
     for j=1:noOfClasses
         for k =1:noOfFeatures
             probabilityClasses(j)= probabilityClasses(j)* probabilityMatrix(k,j,testAttributeSet(i,k)+1);
         end
         
     end

     [maxClassProb,index] = max(probabilityClasses);
     predictLabel(i)= index-1;
 end
 
 accuracy = 0;
 for i= 1:noOfExamples
     if predictLabel(i) == validLabel(i)
         accuracy = accuracy+1;
     end
 end
 accuracy = accuracy / noOfExamples;


end

