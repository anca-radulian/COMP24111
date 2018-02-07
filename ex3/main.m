close all;
clear all;
fname = input('Enter a filename to load data for training/testing: ','s');
load(fname);

% Put your NB training function below
[ noOfClasses, priorProbabilities, probabilityMatrix ] = NBTrain(AttributeSet, LabelSet); % NB training
% Put your NB test function below
[predictLabel, accuracy] = NBTest( noOfClasses, priorProbabilities, probabilityMatrix , testAttributeSet, validLabel); % NB test

fprintf('********************************************** \n');
fprintf('Overall Accuracy on Dataset %s: %f \n', fname, accuracy);
fprintf('Confusion matrix for part 1: \n');
confusionmat(validLabel,predictLabel)
fprintf('\n********************************************** \n');