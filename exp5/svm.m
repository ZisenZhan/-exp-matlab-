clc
clear
load fisheriris

meas(101:150,:)=[];
species(101:150,:)=[];

CVSVMModel = fitcsvm(meas,species,'Holdout',0.1);
CompactSVMModel = CVSVMModel.Trained{1}; 
testInds = test(CVSVMModel.Partition);  
dataTest = meas(testInds,:);   
labelTest = species(testInds,:);
label_predict = predict(CompactSVMModel,dataTest); 

table(labelTest,label_predict,'VariableNames',...
    {'TrueLabel','PredictedLabel'})