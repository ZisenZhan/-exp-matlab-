clear;clc;close all;
%% 
% 
digitDatasetPath = fullfile(matlabroot, 'toolbox', 'nnet', 'nndemos', ...
    'nndatasets', 'DigitDataset');

% 
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders', true, ...
    'LabelSource', 'foldernames');

% 
numTrainFiles = 800;

% 
[imdsTrain, imdsValidation] = splitEachLabel(imds, numTrainFiles, 'randomized');

%% 
numClasses = numel(categories(imds.Labels));
numImagesPerClass = 1;

figure;

classCounts = countEachLabel(imds);
classLabels = classCounts.Label;
classImageIndices = cell(numClasses, 1);

for i = 1:numClasses
    % 
    classImageIndices{i} = find(imds.Labels == classLabels(i));
    
    % 
    selectedImageIndex = classImageIndices{i}(randi(length(classImageIndices{i})));
    selectedImage = imread(imds.Files{selectedImageIndex});
    
    %
    subplot(3, 4, i);
    
    % 
    imshow(selectedImage);
    title(['Class: ', char(classLabels(i))]);
end

%% 
% 
inputSize = [28 28 1]; % 
numClasses = 10; % 

% 
layers = [
    imageInputLayer(inputSize) % 
    convolution2dLayer(5, 20) % 
    batchNormalizationLayer % 
    reluLayer % 
    fullyConnectedLayer(numClasses) % 
    softmaxLayer % 
    classificationLayer]; % 

%% 
% 
options = trainingOptions('sgdm', ...
    'MaxEpochs', 10, ... % 
    'ValidationData', imdsValidation, ... % 
    'ValidationFrequency', 30, ... % 
    'Verbose', false, ... % 
    'Plots', 'training-progress'); % 

% 
net = trainNetwork(imdsTrain, layers, options);

%% 
% 
YPred = classify(net, imdsValidation);
YValidation = imdsValidation.Labels;

% 
accuracy = mean(YPred == YValidation);

% 
disp('×¼È·ÂÊ?:');
disp(accuracy);
