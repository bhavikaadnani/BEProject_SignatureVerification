imds = imageDatastore('Dataset\', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
 tbl = countEachLabel(imds);
 minSetCount = min(tbl{:,2});
[imdsTrain,imdsTest] = splitEachLabel(imds,minSetCount);
s=countEachLabel(imds)
numTrainImages = numel(imdsTrain.Labels);

net = alexnet;
net.Layers;
inputSize = net.Layers(1).InputSize;
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);

layer = 'fc7';
featuresTrain = activations(net,augimdsTrain,layer,'OutputAs','rows');
%featuresTest = activations(net,augimdsTest,layer,'OutputAs','rows');
 save('featureTrainCNN.mat','featuresTrain');
%save('featureTestCNN.mat','featuresTest');
% 
%  load featureTrainCNN;
%  load featureTestCNN;
  YTrain = imdsTrain.Labels;
 YTest = imdsTest.Labels;