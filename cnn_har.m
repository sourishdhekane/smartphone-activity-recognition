clc
clear all

%%%%%%%%%%--- LOAD DATA ---%%%%%%%%%%%%%%%%
test_body_acc_x= load('test_body_acc_x_test.txt');
test_body_acc_y= load('test_body_acc_y_test.txt');
test_body_acc_z= load('test_body_acc_z_test.txt');
test_body_gyro_x= load('test_body_gyro_x_test.txt');
test_body_gyro_y= load('test_body_gyro_y_test.txt');
test_body_gyro_z= load('test_body_gyro_z_test.txt');
test_total_acc_x= load('test_total_acc_x_test.txt');
test_total_acc_y= load('test_total_acc_y_test.txt');
test_total_acc_z= load('test_total_acc_z_test.txt');

train_body_acc_x= load('train_body_acc_x_train.txt');
train_body_acc_y= load('train_body_acc_y_train.txt');
train_body_acc_z= load('train_body_acc_z_train.txt');
train_body_gyro_x= load('train_body_gyro_x_train.txt');
train_body_gyro_y= load('train_body_gyro_y_train.txt');
train_body_gyro_z= load('train_body_gyro_z_train.txt');
train_total_acc_x= load('train_total_acc_x_train.txt');
train_total_acc_y= load('train_total_acc_y_train.txt');
train_total_acc_z= load('train_total_acc_z_train.txt');

%y_train= load('y_train.txt');
%y_test= load('y_test.txt');
y_train= load('subject_train.txt');
y_test= load('subject_test.txt');

%%%%%%%%%--- CONSTRUCTION OF SIGNAL IMAGE ---%%%%%%%%%%%%%

signal_image_set=zeros(7352,37,128);
for i=1:7352
    for j=1:37
        if j==1 || j==10 || j==19 || j==22 || j==37
            signal_image_set(i,j,:)= train_body_gyro_x(i,:);
        end
        if j==2 || j==15 || j==25 || j==35 
            signal_image_set(i,j,:)= train_body_gyro_y(i,:);
        end
        if j==3 || j==11 || j==28 || j==33 
            signal_image_set(i,j,:)= train_body_gyro_z(i,:);
        end
        if j==4 || j==16 || j==20 || j==31 
            signal_image_set(i,j,:)= train_total_acc_x(i,:);
        end
        if j==5 || j==12 || j==23 || j==26 
            signal_image_set(i,j,:)= train_total_acc_y(i,:);
        end
        if j==6 || j==17 || j==29 || j==36 
            signal_image_set(i,j,:)= train_total_acc_z(i,:);
        end
        if j==7 || j==13 || j==21 || j==34 
            signal_image_set(i,j,:)= train_body_acc_x(i,:);
        end
        if j==8 || j==18 || j==24 || j==32 
            signal_image_set(i,j,:)= train_body_acc_y(i,:);
        end
        if j==9 || j==14 || j==27 || j==30 
            signal_image_set(i,j,:)= train_body_acc_z(i,:);
        end
    end
end

%%%%%%%%%%%--- CONSTRUCTION OF ACTIVITY IMAGE ---%%%%%%%%%%%%%%

activity_image_set= zeros(7352,37,128);
for i=1:7352
    activity_image_set(i,:,:)=real(fft(signal_image_set(i,:,:)));
end

activity_image_set_= zeros(37,128,1,7352);
for i=1:7352
    activity_image_set_(:,:,1,i)= activity_image_set(i,:,:);
end
y_train_= categorical(y_train);

%%%%%%%%%%%--- CNN ARCHITECTURE ---%%%%%%%%%%%%%%%%

layers = [
    imageInputLayer([37 128 1])
    
    convolution2dLayer(5,5)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(5,10)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    fullyConnectedLayer(120)
    fullyConnectedLayer(21)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm','InitialLearnRate',0.01,'MaxEpochs',4,'Shuffle','every-epoch','Verbose',false);

%%%%%%%%%%%%%--- TRAIN THE NETWORK ---%%%%%%%%%%%%%%%%

net = trainNetwork(activity_image_set_,y_train_,layers,options);

%%%%%%%%%%%%--- TEST THE NETWORK ---%%%%%%%%%%%%%%%%%


test_signal_image_set=zeros(2947,37,128);
for i=1:2947
    for j=1:37
        if j==1 || j==10 || j==19 || j==22 || j==37
            test_signal_image_set(i,j,:)= test_body_gyro_x(i,:);
        end
        if j==2 || j==15 || j==25 || j==35 
            test_signal_image_set(i,j,:)= test_body_gyro_y(i,:);
        end
        if j==3 || j==11 || j==28 || j==33 
            test_signal_image_set(i,j,:)= test_body_gyro_z(i,:);
        end
        if j==4 || j==16 || j==20 || j==31 
            test_signal_image_set(i,j,:)= test_total_acc_x(i,:);
        end
        if j==5 || j==12 || j==23 || j==26 
            test_signal_image_set(i,j,:)= test_total_acc_y(i,:);
        end
        if j==6 || j==17 || j==29 || j==36 
            test_signal_image_set(i,j,:)= test_total_acc_z(i,:);
        end
        if j==7 || j==13 || j==21 || j==34 
            test_signal_image_set(i,j,:)= test_body_acc_x(i,:);
        end
        if j==8 || j==18 || j==24 || j==32 
            test_signal_image_set(i,j,:)= test_body_acc_y(i,:);
        end
        if j==9 || j==14 || j==27 || j==30 
            test_signal_image_set(i,j,:)= test_body_acc_z(i,:);
        end
    end
end

test_activity_image_set= zeros(2947,37,128);
for i=1:2947
    test_activity_image_set(i,:,:)=real(fft(test_signal_image_set(i,:,:)));
end

test_activity_image_set_= zeros(37,128,1,2947);
for i=1:2947
    test_activity_image_set_(:,:,1,i)= test_activity_image_set(i,:,:);
end
y_test_= categorical(y_test);
YPred = classify(net,test_activity_image_set_);

%%%%%%%%%%%%--- CALCULATE ACCURACY ---%%%%%%%%%%%%%%%%
accuracy = sum(YPred == y_test_)/numel(y_test_);
accuracy