%Part 3 a)
data3 = zeros(300,256);
labels3 = zeros(300,1);
target3 = zeros(300,3);
sampleSet3 = 1000 + randperm(500, 100);
sampleSet6 = 2500 + randperm(500, 100);
sampleSet8 = 3500 + randperm(500, 100);

data3(1:100, :) = data(sampleSet3, :);
data3(101:200, :) = data(sampleSet6, :);
data3(201:300, :) = data(sampleSet8, :);

labels3(1:100, :) = 3;
labels3(101:200, :) = 6;
labels3(201:300, :) = 8;

target3(1:100, 1) = 1;
target3(101:200,2) = 1;
target3(201:300,3) = 1;

predictedLabels3 = zeros(300,1);

Y = RegLS(0, data3, data3,target3);
correct_labeling = 0;
for index = 1: 300
    max = Y(index,1);
    column = 1;
    for i = 2:3
        if max < Y(index,i)
            max = Y(index,i);
            column = i;
        end
    end
    if column == 1
           predictedLabels3(index) = 3;
    elseif column == 2
           predictedLabels3(index) = 6;
    elseif column == 3
           predictedLabels3(index) = 8;
    end
            
    
    if predictedLabels3(index) == labels3(index)
        correct_labeling = correct_labeling + 1;
    end
end

accuracy_3 = correct_labeling / 300;

figure()
showdata(data3, labels3, predictedLabels3);

% Vary lambda
testingdata3 = zeros(300, 256);
total_accuracy3 = zeros(5, 16);

for indexT = 1:5    
    testingSet3 = 1000 + randperm(500, 100);
    testingSet6 = 2500 + randperm(500, 100);
    testingSet8 = 3500 + randperm(500, 100);
    testingdata3(1:100, :) = data(testingSet3, :);
    testingdata3(101:200, :) = data(testingSet6, :);
    testingdata3(201:300, :) = data(testingSet8, :);
    
    
    for lambda = -5 : 10
        correct_labeling = 0;
        Y = RegLS(10^lambda, testingdata3, data3,target3);
        for index = 1: 300
            max = Y(index,1);
            column = 1;
            for i = 2:3
                if max < Y(index,i)
                    max = Y(index,i);
                    column = i;
                end
            end
            if column == 1
                predictedLabels3(index) = 3;
            elseif column == 2
                predictedLabels3(index) = 6;
            elseif column == 3
                predictedLabels3(index) = 8;
            end
       
            if predictedLabels3(index) == labels3(index)
                correct_labeling = correct_labeling + 1;
            end
        end
    total_accuracy3(indexT, lambda+6) = correct_labeling / 300;
    end
end

figure()

errorbar(-5:10, mean(total_accuracy3), std(total_accuracy3));
title('Average accuracy and standard deviation for testing - best lambda')
xlabel('Accuracy')
ylabel('log10 of lambda')


% Best Lambda

testingSet3 = 1000 + randperm(500, 100);
testingSet6 = 2500 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);
testingdata3(1:100, :) = data(testingSet3, :);
testingdata3(101:200, :) = data(testingSet6, :);
testingdata3(201:300, :) = data(testingSet8, :);

Y = RegLS(10^6, testingdata3, data3,target3);
correct_labeling = 0;
for index = 1: 300
    max = Y(index,1);
    column = 1;
    for i = 2:3
        if max < Y(index,i)
            max = Y(index,i);
            column = i;
        end
    end
    if column == 1
           predictedLabels3(index) = 3;
    elseif column == 2
           predictedLabels3(index) = 6;
    elseif column == 3
           predictedLabels3(index) = 8;
    end
            
    
    if predictedLabels3(index) == labels3(index)
        correct_labeling = correct_labeling + 1;
    end
end

accuracy_3 = correct_labeling / 300;

figure()
showdata(testingdata3, labels3, predictedLabels3);



        
