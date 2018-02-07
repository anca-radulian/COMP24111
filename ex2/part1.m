% Part a)
% Create the matrix for the training data set.
load postaldata;
mydata = zeros(300,256); % edited for part e)
mylabels = zeros(300,1);

% Use the funtion randperm to generate two vectors with data training for 
% the digits 3, 6 and 8. ed the offset to get the required interval for
% that digit.
sampleSet3 = 1000 + randperm(500, 100);
sampleSet6 = 2500 + randperm(500, 100);
sampleSet8 = 3500 + randperm(500, 100);

% Load data into the matrix
mydata(1:100, :) = data(sampleSet3, :);
mydata(101:200, :) = data(sampleSet6, :);
mydata(201:300, :) = data(sampleSet8, :);

mylabels(1:100) = 3;
mylabels(101:200) = 6;
mylabels(201:300) = 8;


% Part b)
% Training section
accuracy = zeros(300,1);

for k = 1:300
    for index = 1:300
        x = mydata(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy(k,1) = 1 + accuracy(k,1);
        end
    end
end

plot(1:300, accuracy ./ 300)
title('Training accuracy')
xlabel('K number')
ylabel('Accuracy')


%Part c) Testing part with multiple testing samples
testingData = zeros(300,256);

testingSet3 = 1000 + randperm(500, 100);
testingSet6 = 2500 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);

% Load data into the matrix
testingData(1:100, :) = data(testingSet3, :);
testingData(101:200, :) = data(testingSet6, :);
testingData(201:300, :) = data(testingSet8, :);

accuracy1 = zeros(300,1);
for k = 1:300
    for index = 1:300
        x = testingData(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy1(k,1) = 1 + accuracy1(k,1);
        end
    end
end

figure()

plot(1:300, accuracy1 ./300,'r') 
title('Accuracy for testing examples')
hold on

for index = 1:300
        x = mydata(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy(k,1) = 1 + accuracy(k,1);
        end
end

%Part d)

testingSet3 = 1000 + randperm(500, 100);
testingSet6 = 2500 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);

% Load data into the matrix
testingData(1:100, :) = data(testingSet3, :);
testingData(101:200, :) = data(testingSet6, :);
testingData(201:300, :) = data(testingSet8, :);

accuracy2 = zeros(300,1);
for k = 1:300
    for index = 1:300
        x = testingData(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy2(k,1) = 1 + accuracy2(k,1);
        end
    end
end

testingSet3 = 1000 + randperm(500, 100);
testingSet6 = 2500 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);

% Load data into the matrix
testingData(1:100, :) = data(testingSet3, :);
testingData(101:200, :) = data(testingSet6, :);
testingData(201:300, :) = data(testingSet8, :);

accuracy3 = zeros(300,1);
for k = 1:300
    for index = 1:300
        x = testingData(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy3(k,1) = 1 + accuracy3(k,1);
        end
    end
end

testingSet3 = 1000 + randperm(500, 100);
testingSet6 = 2500 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);

% Load data into the matrix
testingData(1:100, :) = data(testingSet3, :);
testingData(101:200, :) = data(testingSet6, :);
testingData(201:300, :) = data(testingSet8, :);

accuracy4 = zeros(300,1);
for k = 1:300
    for index = 1:300
        x = testingData(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy4(k,1) = 1 + accuracy4(k,1);
        end
    end
end

testingSet3 = 1000 + randperm(500, 100);
testingSet6 = 2500 + randperm(500, 100);
testingSet8 = 3500 + randperm(500, 100);

% Load data into the matrix
testingData(1:100, :) = data(testingSet3, :);
testingData(101:200, :) = data(testingSet6, :);
testingData(201:300, :) = data(testingSet8, :);

accuracy5 = zeros(300,1);
for k = 1:300
    for index = 1:300
        x = testingData(index, :);
        y = knearest(k,x,mydata,mylabels);
        if y == mylabels(index)
            accuracy5(k,1) = 1 + accuracy5(k,1);
        end
    end
end

plot(1:300, accuracy2 ./300,'g') 
plot(1:300, accuracy3 ./300,'r') 
plot(1:300, accuracy4 ./300,'y') 
plot(1:300, accuracy5 ./300,'c') 
hold off
legend('accuracy 1', 'accuracy 2', 'accuracy 3','accuracy 4','accuracy 5')
xlabel('K number')
ylabel('Accuracy')

averageAccuracy = (accuracy1 + accuracy2 + accuracy3 + accuracy4 + accuracy5) ./ 5;
averageAccuracy = averageAccuracy ./300;

averageMatrix = zeros(5, 300);
averageMatrix(1,:) = accuracy1./300;
averageMatrix(2,:) = accuracy2./300;
averageMatrix(3,:) = accuracy3./300;
averageMatrix(4,:) = accuracy4./300;
averageMatrix(5,:) = accuracy5./300;


figure()
errorbar(1:300, averageAccuracy', std(averageMatrix))
title('Average accuracy and standard deviation')
xlabel('K number')
ylabel('Accuracy')

 %Part e) 

predictedLabels = zeros(300,1);

for index = 1:300
        x = mydata(index, :);
        y = knearest(3,x,mydata,mylabels);
        predictedLabels(index) = y; 
end


figure()
showdata(mydata, mylabels, predictedLabels)
confusionmat(mylabels, predictedLabels)






