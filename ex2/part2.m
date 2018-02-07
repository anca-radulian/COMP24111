%Part 2 a)
% Training data from 1a)
data2 = zeros(200, 256);
data2(1:100, :) = data(sampleSet3, :);
data2(101:200, :) = data(sampleSet8, :);

% Testing data from 1b)
x2 = zeros(200,256);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);
target(1:100,1) = -1;
target(101:200,1) = 1;

Y = RegLS(0, data2, data2, target);

linear_accuracy = 0;

predictedLabels2 = zeros(200,1);
mylabels2(1:100, :) = 3;
mylabels2(101:200, :) = 8;


for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracy = linear_accuracy + 1; 
    end

    if Y(index) < 0.0
        predictedLabels2(index) = 3;
    else
        predictedLabels2(index) = 8;
    end
end

showdata(data2, mylabels2, predictedLabels2)
linear_accuracy = linear_accuracy/ 200;

%Part b)
% First testing
testingSet3 = 1000 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);

Y = RegLS(0, x2, data2, target);


linear_accuracy1 = 0;


for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracy1 = linear_accuracy1 + 1;
        
    end
  
end
linear_accuracy1 = linear_accuracy1/ 200;


% Second testing
testingSet3 = 1000 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);

linear_accuracy2 = 0;
Y = RegLS(0, x2, data2, target);
linear_accuracy2 = linear_accuracy2/ 200;
for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracy2 = linear_accuracy2 + 1;
        
    end
  
end
linear_accuracy2 = linear_accuracy2/ 200;

%Third testing
testingSet3 = 1000 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);

Y = RegLS(0, x2, data2, target);

linear_accuracy3 = 0;


for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracy3 = linear_accuracy3 + 1;
        
    end
  
end
linear_accuracy3 = linear_accuracy3/ 200;

% Fouth testing
testingSet3 = 1000 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);

Y = RegLS(0, x2, data2, target);

linear_accuracy4 = 0;


for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracy4 = linear_accuracy4 + 1;
        
    end
  
end
linear_accuracy4 = linear_accuracy4/ 200;

% Fifth testing
testingSet3 = 1000 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);

Y = RegLS(0, x2, data2, target);

linear_accuracy5 = 0;


for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracy5 = linear_accuracy5 + 1;
        
    end
  
end
linear_accuracy5 = linear_accuracy5/ 200;

linear_accuracy_testing= [linear_accuracy1, linear_accuracy2, linear_accuracy3, linear_accuracy4, linear_accuracy5];

figure()

plot(1:1:5, linear_accuracy_testing, 'b')
title('Accuracy for testing examples')
xlabel('No of tests')
ylabel('Accuracy')
%Part c)
accuracy_testing_c = zeros(5,16);

for index = 1: 5
    for lambda = -5:10
        testingSet3 = 1000 + randperm(500, 100);
        testingSet8 = 3500 + randperm(500, 100);
        x2(1:100, :) = data(testingSet3, :);
        x2(101:200, :) = data(testingSet8, :);
        correct_labeling = 0;
        Y = RegLS(10^lambda, x2, data2, target);
        for i = 1:200
             if (Y(i) < 0.0 && target(i) < 0.0) ||  (Y(i) >= 0.0 && target(i) >= 0.0)
                    correct_labeling = correct_labeling + 1;
        
             end
        end
        accuracy_testing_c(index, lambda + 6) = correct_labeling / 200;
    end
end
   
average_accuracy_testing_c = sum(accuracy_testing_c) / 5;
figure()

errorbar(-5:10, average_accuracy_testing_c, std(accuracy_testing_c));
title('Average accuracy and standard deviation for testing')
xlabel('Accuracy')
ylabel('log10 of lambda')
    

%Part d)
trainingData = zeros(100, 256);
testingData = zeros(100, 256);
targetD = zeros(100,1);
total_accuracyD = zeros(5,16);

for index = 1:5
    
[shuffledData, shuffledLabels] = shufflerows(data2, mylabels2);
trainingData(1:100, :) = shuffledData(1:100, :);
testingData(1:100,:) = shuffledData(101:200,:);

trainingLabels(1:100, 1) = shuffledLabels(1:100,1);
testingLabels(1:100, 1) = shuffledLabels(101:200,1);

for i = 1:100
    if trainingLabels(i) == 3
        targetD(i) = -1;
    else
        targetD(i) = 1;
    end
end

for lambda = -5:10
     correct_labeling = 0;
     Y = RegLS(10^lambda, testingData, trainingData, targetD);
     for i = 1:100
         if (Y(i) < 0 && testingLabels(i) == 3) || ( Y(i) >= 0.0 && testingLabels(i) == 8)
                    correct_labeling = correct_labeling + 1;
        
         end
     end
     total_accuracyD(index, lambda+6) = correct_labeling;
end
 
end     

figure()

errorbar(-5:10, mean(total_accuracyD), std(total_accuracyD));
title('Average accuracy and standard deviation for testing - best lambda')
xlabel('Accuracy')
ylabel('log10 of lambda')

%Part e)
testingSet3 = 1000 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
x2(1:100, :) = data(testingSet3, :);
x2(101:200, :) = data(testingSet8, :);


linear_accuracyE = 0;

 Y = RegLS(10^6, x2, data2, target);
for index = 1:200
    if (Y(index) < 0.0 && target(index) < 0.0) ||  (Y(index) >= 0.0 && target(index) >= 0.0)
        linear_accuracyE = linear_accuracyE + 1;
    end
     if Y(index) < 0.0
        predictedLabels2(index) = 3;
    else
        predictedLabels2(index) = 8;
    end
  
end
linear_accuracyE = linear_accuracyE/ 200;

figure()
showdata(x2,mylabels2, predictedLabels2); 



