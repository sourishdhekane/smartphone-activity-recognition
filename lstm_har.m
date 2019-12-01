clc
clear all

load HumanActivityTrain
%XTrain
load HumanActivityTest
%XTest

X = XTrain{1}(1,:);
classes = categories(YTrain{1});

numFeatures = 3;
numHiddenUnits = 200;
numClasses = 5;

layers = [ 
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

options = trainingOptions('adam','MaxEpochs',60,'GradientThreshold',2,'Verbose',0,'Plots','training-progress');

net = trainNetwork(XTrain,YTrain,layers,options);
YPred = classify(net,XTest);
acc = sum(YPred == YTest)./numel(YTest);
acc