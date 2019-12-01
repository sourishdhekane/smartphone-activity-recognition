%clc
%clear all
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


% CALCULATE DIMENSIONS

[train_dim_1,train_dim_2]=size(train_body_acc_x);
[test_dim_1,test_dim_2]=size(test_body_acc_x);

% FIND NUMBER OF CLASSES
y_total=[y_train ; y_test];
[num_classes,a]= size(unique(y_total));

% FIND COUNTS FOR EACH CLASS
class_counter=zeros(num_classes,1);
for i=1:(train_dim_1+test_dim_1)
    class_counter(y_total(i),1)=class_counter(y_total(i),1)+1;
end

% DEFINE TRAIN AND TEST PERCENT
train_percent= 20;
test_percent= 100-train_percent;

% COMBINE DATA
body_acc_x=[train_body_acc_x;test_body_acc_x];
body_acc_y=[train_body_acc_y;test_body_acc_y];
body_acc_z=[train_body_acc_z;test_body_acc_z];
body_gyro_x=[train_body_gyro_x;test_body_gyro_x];
body_gyro_y=[train_body_gyro_y;test_body_gyro_y];
body_gyro_z=[train_body_gyro_z;test_body_gyro_z];
total_acc_x=[train_total_acc_x;test_total_acc_x];
total_acc_y=[train_total_acc_y;test_total_acc_y];
total_acc_z=[train_total_acc_z;test_total_acc_z];

class_1=zeros(class_counter(1,1),9,128);
class_1_counter=1;
class_2=zeros(class_counter(2,1),9,128);
class_2_counter=1;
class_3=zeros(class_counter(3,1),9,128);
class_3_counter=1;
class_4=zeros(class_counter(4,1),9,128);
class_4_counter=1;
class_5=zeros(class_counter(5,1),9,128);
class_5_counter=1;
class_6=zeros(class_counter(6,1),9,128);
class_6_counter=1;
class_7=zeros(class_counter(7,1),9,128);
class_7_counter=1;
class_8=zeros(class_counter(8,1),9,128);
class_8_counter=1;
class_9=zeros(class_counter(9,1),9,128);
class_9_counter=1;
class_10=zeros(class_counter(10,1),9,128);
class_10_counter=1;
class_11=zeros(class_counter(11,1),9,128);
class_11_counter=1;
class_12=zeros(class_counter(12,1),9,128);
class_12_counter=1;
class_13=zeros(class_counter(13,1),9,128);
class_13_counter=1;
class_14=zeros(class_counter(14,1),9,128);
class_14_counter=1;
class_15=zeros(class_counter(15,1),9,128);
class_15_counter=1;
class_16=zeros(class_counter(16,1),9,128);
class_16_counter=1;
class_17=zeros(class_counter(17,1),9,128);
class_17_counter=1;
class_18=zeros(class_counter(18,1),9,128);
class_18_counter=1;
class_19=zeros(class_counter(19,1),9,128);
class_19_counter=1;
class_20=zeros(class_counter(20,1),9,128);
class_20_counter=1;
class_21=zeros(class_counter(21,1),9,128);
class_21_counter=1;
class_22=zeros(class_counter(22,1),9,128);
class_22_counter=1;
class_23=zeros(class_counter(23,1),9,128);
class_23_counter=1;
class_24=zeros(class_counter(24,1),9,128);
class_24_counter=1;
class_25=zeros(class_counter(25,1),9,128);
class_25_counter=1;
class_26=zeros(class_counter(26,1),9,128);
class_26_counter=1;
class_27=zeros(class_counter(27,1),9,128);
class_27_counter=1;
class_28=zeros(class_counter(28,1),9,128);
class_28_counter=1;
class_29=zeros(class_counter(29,1),9,128);
class_29_counter=1;
class_30=zeros(class_counter(30,1),9,128);
class_30_counter=1;
for i=1:(train_dim_1+test_dim_1)
    if y_total(i,1)==1
        class_1(class_1_counter,1,:)= body_acc_x(i,:);
        class_1(class_1_counter,2,:)= body_acc_y(i,:);
        class_1(class_1_counter,3,:)= body_acc_z(i,:);
        class_1(class_1_counter,4,:)= body_gyro_x(i,:);
        class_1(class_1_counter,5,:)= body_gyro_y(i,:);
        class_1(class_1_counter,6,:)= body_gyro_z(i,:);
        class_1(class_1_counter,7,:)= total_acc_x(i,:);
        class_1(class_1_counter,8,:)= total_acc_y(i,:);
        class_1(class_1_counter,9,:)= total_acc_z(i,:);
        class_1_counter=class_1_counter+1;
    end
    if y_total(i,1)==2
        class_2(class_2_counter,1,:)= body_acc_x(i,:);
        class_2(class_2_counter,2,:)= body_acc_y(i,:);
        class_2(class_2_counter,3,:)= body_acc_z(i,:);
        class_2(class_2_counter,4,:)= body_gyro_x(i,:);
        class_2(class_2_counter,5,:)= body_gyro_y(i,:);
        class_2(class_2_counter,6,:)= body_gyro_z(i,:);
        class_2(class_2_counter,7,:)= total_acc_x(i,:);
        class_2(class_2_counter,8,:)= total_acc_y(i,:);
        class_2(class_2_counter,9,:)= total_acc_z(i,:);
        class_2_counter=class_2_counter+1;
    end
    if y_total(i,1)==3
        class_3(class_3_counter,1,:)= body_acc_x(i,:);
        class_3(class_3_counter,2,:)= body_acc_y(i,:);
        class_3(class_3_counter,3,:)= body_acc_z(i,:);
        class_3(class_3_counter,4,:)= body_gyro_x(i,:);
        class_3(class_3_counter,5,:)= body_gyro_y(i,:);
        class_3(class_3_counter,6,:)= body_gyro_z(i,:);
        class_3(class_3_counter,7,:)= total_acc_x(i,:);
        class_3(class_3_counter,8,:)= total_acc_y(i,:);
        class_3(class_3_counter,9,:)= total_acc_z(i,:);
        class_3_counter=class_3_counter+1;
    end
    if y_total(i,1)==4
        class_4(class_4_counter,1,:)= body_acc_x(i,:);
        class_4(class_4_counter,2,:)= body_acc_y(i,:);
        class_4(class_4_counter,3,:)= body_acc_z(i,:);
        class_4(class_4_counter,4,:)= body_gyro_x(i,:);
        class_4(class_4_counter,5,:)= body_gyro_y(i,:);
        class_4(class_4_counter,6,:)= body_gyro_z(i,:);
        class_4(class_4_counter,7,:)= total_acc_x(i,:);
        class_4(class_4_counter,8,:)= total_acc_y(i,:);
        class_4(class_4_counter,9,:)= total_acc_z(i,:);
        class_4_counter=class_4_counter+1;
    end
    if y_total(i,1)==5
        class_5(class_5_counter,1,:)= body_acc_x(i,:);
        class_5(class_5_counter,2,:)= body_acc_y(i,:);
        class_5(class_5_counter,3,:)= body_acc_z(i,:);
        class_5(class_5_counter,4,:)= body_gyro_x(i,:);
        class_5(class_5_counter,5,:)= body_gyro_y(i,:);
        class_5(class_5_counter,6,:)= body_gyro_z(i,:);
        class_5(class_5_counter,7,:)= total_acc_x(i,:);
        class_5(class_5_counter,8,:)= total_acc_y(i,:);
        class_5(class_5_counter,9,:)= total_acc_z(i,:);
        class_5_counter=class_5_counter+1;
    end
    if y_total(i,1)==6
        class_6(class_6_counter,1,:)= body_acc_x(i,:);
        class_6(class_6_counter,2,:)= body_acc_y(i,:);
        class_6(class_6_counter,3,:)= body_acc_z(i,:);
        class_6(class_6_counter,4,:)= body_gyro_x(i,:);
        class_6(class_6_counter,5,:)= body_gyro_y(i,:);
        class_6(class_6_counter,6,:)= body_gyro_z(i,:);
        class_6(class_6_counter,7,:)= total_acc_x(i,:);
        class_6(class_6_counter,8,:)= total_acc_y(i,:);
        class_6(class_6_counter,9,:)= total_acc_z(i,:);
        class_6_counter=class_6_counter+1;
    end
    if y_total(i,1)==7
        class_7(class_7_counter,1,:)= body_acc_x(i,:);
        class_7(class_7_counter,2,:)= body_acc_y(i,:);
        class_7(class_7_counter,3,:)= body_acc_z(i,:);
        class_7(class_7_counter,4,:)= body_gyro_x(i,:);
        class_7(class_7_counter,5,:)= body_gyro_y(i,:);
        class_7(class_7_counter,6,:)= body_gyro_z(i,:);
        class_7(class_7_counter,7,:)= total_acc_x(i,:);
        class_7(class_7_counter,8,:)= total_acc_y(i,:);
        class_7(class_7_counter,9,:)= total_acc_z(i,:);
        class_7_counter=class_7_counter+1;
    end
    if y_total(i,1)==8
        class_8(class_8_counter,1,:)= body_acc_x(i,:);
        class_8(class_8_counter,2,:)= body_acc_y(i,:);
        class_8(class_8_counter,3,:)= body_acc_z(i,:);
        class_8(class_8_counter,4,:)= body_gyro_x(i,:);
        class_8(class_8_counter,5,:)= body_gyro_y(i,:);
        class_8(class_8_counter,6,:)= body_gyro_z(i,:);
        class_8(class_8_counter,7,:)= total_acc_x(i,:);
        class_8(class_8_counter,8,:)= total_acc_y(i,:);
        class_8(class_8_counter,9,:)= total_acc_z(i,:);
        class_8_counter=class_8_counter+1;
    end
    if y_total(i,1)==9
        class_9(class_9_counter,1,:)= body_acc_x(i,:);
        class_9(class_9_counter,2,:)= body_acc_y(i,:);
        class_9(class_9_counter,3,:)= body_acc_z(i,:);
        class_9(class_9_counter,4,:)= body_gyro_x(i,:);
        class_9(class_9_counter,5,:)= body_gyro_y(i,:);
        class_9(class_9_counter,6,:)= body_gyro_z(i,:);
        class_9(class_9_counter,7,:)= total_acc_x(i,:);
        class_9(class_9_counter,8,:)= total_acc_y(i,:);
        class_9(class_9_counter,9,:)= total_acc_z(i,:);
        class_9_counter=class_9_counter+1;
    end
    if y_total(i,1)==10
        class_10(class_10_counter,1,:)= body_acc_x(i,:);
        class_10(class_10_counter,2,:)= body_acc_y(i,:);
        class_10(class_10_counter,3,:)= body_acc_z(i,:);
        class_10(class_10_counter,4,:)= body_gyro_x(i,:);
        class_10(class_10_counter,5,:)= body_gyro_y(i,:);
        class_10(class_10_counter,6,:)= body_gyro_z(i,:);
        class_10(class_10_counter,7,:)= total_acc_x(i,:);
        class_10(class_10_counter,8,:)= total_acc_y(i,:);
        class_10(class_10_counter,9,:)= total_acc_z(i,:);
        class_10_counter=class_7_counter+1;
    end
    if y_total(i,1)==11
        class_11(class_11_counter,1,:)= body_acc_x(i,:);
        class_11(class_11_counter,2,:)= body_acc_y(i,:);
        class_11(class_11_counter,3,:)= body_acc_z(i,:);
        class_11(class_11_counter,4,:)= body_gyro_x(i,:);
        class_11(class_11_counter,5,:)= body_gyro_y(i,:);
        class_11(class_11_counter,6,:)= body_gyro_z(i,:);
        class_11(class_11_counter,7,:)= total_acc_x(i,:);
        class_11(class_11_counter,8,:)= total_acc_y(i,:);
        class_11(class_11_counter,9,:)= total_acc_z(i,:);
        class_11_counter=class_11_counter+1;
    end
    if y_total(i,1)==12
        class_12(class_12_counter,1,:)= body_acc_x(i,:);
        class_12(class_12_counter,2,:)= body_acc_y(i,:);
        class_12(class_12_counter,3,:)= body_acc_z(i,:);
        class_12(class_12_counter,4,:)= body_gyro_x(i,:);
        class_12(class_12_counter,5,:)= body_gyro_y(i,:);
        class_12(class_12_counter,6,:)= body_gyro_z(i,:);
        class_12(class_12_counter,7,:)= total_acc_x(i,:);
        class_12(class_12_counter,8,:)= total_acc_y(i,:);
        class_12(class_12_counter,9,:)= total_acc_z(i,:);
        class_12_counter=class_12_counter+1;
    end
    if y_total(i,1)==13
        class_13(class_13_counter,1,:)= body_acc_x(i,:);
        class_13(class_13_counter,2,:)= body_acc_y(i,:);
        class_13(class_13_counter,3,:)= body_acc_z(i,:);
        class_13(class_13_counter,4,:)= body_gyro_x(i,:);
        class_13(class_13_counter,5,:)= body_gyro_y(i,:);
        class_13(class_13_counter,6,:)= body_gyro_z(i,:);
        class_13(class_13_counter,7,:)= total_acc_x(i,:);
        class_13(class_13_counter,8,:)= total_acc_y(i,:);
        class_13(class_13_counter,9,:)= total_acc_z(i,:);
        class_13_counter=class_13_counter+1;
    end
    if y_total(i,1)==14
        class_14(class_14_counter,1,:)= body_acc_x(i,:);
        class_14(class_14_counter,2,:)= body_acc_y(i,:);
        class_14(class_14_counter,3,:)= body_acc_z(i,:);
        class_14(class_14_counter,4,:)= body_gyro_x(i,:);
        class_14(class_14_counter,5,:)= body_gyro_y(i,:);
        class_14(class_14_counter,6,:)= body_gyro_z(i,:);
        class_14(class_14_counter,7,:)= total_acc_x(i,:);
        class_14(class_14_counter,8,:)= total_acc_y(i,:);
        class_14(class_14_counter,9,:)= total_acc_z(i,:);
        class_14_counter=class_14_counter+1;
    end
    if y_total(i,1)==15
        class_15(class_15_counter,1,:)= body_acc_x(i,:);
        class_15(class_15_counter,2,:)= body_acc_y(i,:);
        class_15(class_15_counter,3,:)= body_acc_z(i,:);
        class_15(class_15_counter,4,:)= body_gyro_x(i,:);
        class_15(class_15_counter,5,:)= body_gyro_y(i,:);
        class_15(class_15_counter,6,:)= body_gyro_z(i,:);
        class_15(class_15_counter,7,:)= total_acc_x(i,:);
        class_15(class_15_counter,8,:)= total_acc_y(i,:);
        class_15(class_15_counter,9,:)= total_acc_z(i,:);
        class_15_counter=class_15_counter+1;
    end
    if y_total(i,1)==16
        class_16(class_16_counter,1,:)= body_acc_x(i,:);
        class_16(class_16_counter,2,:)= body_acc_y(i,:);
        class_16(class_16_counter,3,:)= body_acc_z(i,:);
        class_16(class_16_counter,4,:)= body_gyro_x(i,:);
        class_16(class_16_counter,5,:)= body_gyro_y(i,:);
        class_16(class_16_counter,6,:)= body_gyro_z(i,:);
        class_16(class_16_counter,7,:)= total_acc_x(i,:);
        class_16(class_16_counter,8,:)= total_acc_y(i,:);
        class_16(class_16_counter,9,:)= total_acc_z(i,:);
        class_16_counter=class_16_counter+1;
    end
    if y_total(i,1)==17
        class_17(class_17_counter,1,:)= body_acc_x(i,:);
        class_17(class_17_counter,2,:)= body_acc_y(i,:);
        class_17(class_17_counter,3,:)= body_acc_z(i,:);
        class_17(class_17_counter,4,:)= body_gyro_x(i,:);
        class_17(class_17_counter,5,:)= body_gyro_y(i,:);
        class_17(class_17_counter,6,:)= body_gyro_z(i,:);
        class_17(class_17_counter,7,:)= total_acc_x(i,:);
        class_17(class_17_counter,8,:)= total_acc_y(i,:);
        class_17(class_17_counter,9,:)= total_acc_z(i,:);
        class_17_counter=class_17_counter+1;
    end
    if y_total(i,1)==18
        class_18(class_18_counter,1,:)= body_acc_x(i,:);
        class_18(class_18_counter,2,:)= body_acc_y(i,:);
        class_18(class_18_counter,3,:)= body_acc_z(i,:);
        class_18(class_18_counter,4,:)= body_gyro_x(i,:);
        class_18(class_18_counter,5,:)= body_gyro_y(i,:);
        class_18(class_18_counter,6,:)= body_gyro_z(i,:);
        class_18(class_18_counter,7,:)= total_acc_x(i,:);
        class_18(class_18_counter,8,:)= total_acc_y(i,:);
        class_18(class_18_counter,9,:)= total_acc_z(i,:);
        class_18_counter=class_18_counter+1;
    end
    if y_total(i,1)==19
        class_19(class_19_counter,1,:)= body_acc_x(i,:);
        class_19(class_19_counter,2,:)= body_acc_y(i,:);
        class_19(class_19_counter,3,:)= body_acc_z(i,:);
        class_19(class_19_counter,4,:)= body_gyro_x(i,:);
        class_19(class_19_counter,5,:)= body_gyro_y(i,:);
        class_19(class_19_counter,6,:)= body_gyro_z(i,:);
        class_19(class_19_counter,7,:)= total_acc_x(i,:);
        class_19(class_19_counter,8,:)= total_acc_y(i,:);
        class_19(class_19_counter,9,:)= total_acc_z(i,:);
        class_19_counter=class_19_counter+1;
    end
    if y_total(i,1)==20
        class_20(class_20_counter,1,:)= body_acc_x(i,:);
        class_20(class_20_counter,2,:)= body_acc_y(i,:);
        class_20(class_20_counter,3,:)= body_acc_z(i,:);
        class_20(class_20_counter,4,:)= body_gyro_x(i,:);
        class_20(class_20_counter,5,:)= body_gyro_y(i,:);
        class_20(class_20_counter,6,:)= body_gyro_z(i,:);
        class_20(class_20_counter,7,:)= total_acc_x(i,:);
        class_20(class_20_counter,8,:)= total_acc_y(i,:);
        class_20(class_20_counter,9,:)= total_acc_z(i,:);
        class_20_counter=class_20_counter+1;
    end
    if y_total(i,1)==21
        class_21(class_21_counter,1,:)= body_acc_x(i,:);
        class_21(class_21_counter,2,:)= body_acc_y(i,:);
        class_21(class_21_counter,3,:)= body_acc_z(i,:);
        class_21(class_21_counter,4,:)= body_gyro_x(i,:);
        class_21(class_21_counter,5,:)= body_gyro_y(i,:);
        class_21(class_21_counter,6,:)= body_gyro_z(i,:);
        class_21(class_21_counter,7,:)= total_acc_x(i,:);
        class_21(class_21_counter,8,:)= total_acc_y(i,:);
        class_21(class_21_counter,9,:)= total_acc_z(i,:);
        class_21_counter=class_21_counter+1;
    end
    if y_total(i,1)==22
        class_22(class_22_counter,1,:)= body_acc_x(i,:);
        class_22(class_22_counter,2,:)= body_acc_y(i,:);
        class_22(class_22_counter,3,:)= body_acc_z(i,:);
        class_22(class_22_counter,4,:)= body_gyro_x(i,:);
        class_22(class_22_counter,5,:)= body_gyro_y(i,:);
        class_22(class_22_counter,6,:)= body_gyro_z(i,:);
        class_22(class_22_counter,7,:)= total_acc_x(i,:);
        class_22(class_22_counter,8,:)= total_acc_y(i,:);
        class_22(class_22_counter,9,:)= total_acc_z(i,:);
        class_22_counter=class_22_counter+1;
    end
    if y_total(i,1)==23
        class_23(class_23_counter,1,:)= body_acc_x(i,:);
        class_23(class_23_counter,2,:)= body_acc_y(i,:);
        class_23(class_23_counter,3,:)= body_acc_z(i,:);
        class_23(class_23_counter,4,:)= body_gyro_x(i,:);
        class_23(class_23_counter,5,:)= body_gyro_y(i,:);
        class_23(class_23_counter,6,:)= body_gyro_z(i,:);
        class_23(class_23_counter,7,:)= total_acc_x(i,:);
        class_23(class_23_counter,8,:)= total_acc_y(i,:);
        class_23(class_23_counter,9,:)= total_acc_z(i,:);
        class_23_counter=class_23_counter+1;
    end
    if y_total(i,1)==24
        class_24(class_24_counter,1,:)= body_acc_x(i,:);
        class_24(class_24_counter,2,:)= body_acc_y(i,:);
        class_24(class_24_counter,3,:)= body_acc_z(i,:);
        class_24(class_24_counter,4,:)= body_gyro_x(i,:);
        class_24(class_24_counter,5,:)= body_gyro_y(i,:);
        class_24(class_24_counter,6,:)= body_gyro_z(i,:);
        class_24(class_24_counter,7,:)= total_acc_x(i,:);
        class_24(class_24_counter,8,:)= total_acc_y(i,:);
        class_24(class_24_counter,9,:)= total_acc_z(i,:);
        class_24_counter=class_24_counter+1;
    end
    if y_total(i,1)==25
        class_25(class_25_counter,1,:)= body_acc_x(i,:);
        class_25(class_25_counter,2,:)= body_acc_y(i,:);
        class_25(class_25_counter,3,:)= body_acc_z(i,:);
        class_25(class_25_counter,4,:)= body_gyro_x(i,:);
        class_25(class_25_counter,5,:)= body_gyro_y(i,:);
        class_25(class_25_counter,6,:)= body_gyro_z(i,:);
        class_25(class_25_counter,7,:)= total_acc_x(i,:);
        class_25(class_25_counter,8,:)= total_acc_y(i,:);
        class_25(class_25_counter,9,:)= total_acc_z(i,:);
        class_25_counter=class_25_counter+1;
    end
    if y_total(i,1)==26
        class_26(class_26_counter,1,:)= body_acc_x(i,:);
        class_26(class_26_counter,2,:)= body_acc_y(i,:);
        class_26(class_26_counter,3,:)= body_acc_z(i,:);
        class_26(class_26_counter,4,:)= body_gyro_x(i,:);
        class_26(class_26_counter,5,:)= body_gyro_y(i,:);
        class_26(class_26_counter,6,:)= body_gyro_z(i,:);
        class_26(class_26_counter,7,:)= total_acc_x(i,:);
        class_26(class_26_counter,8,:)= total_acc_y(i,:);
        class_26(class_26_counter,9,:)= total_acc_z(i,:);
        class_26_counter=class_26_counter+1;
    end
    if y_total(i,1)==27
        class_27(class_27_counter,1,:)= body_acc_x(i,:);
        class_27(class_27_counter,2,:)= body_acc_y(i,:);
        class_27(class_27_counter,3,:)= body_acc_z(i,:);
        class_27(class_27_counter,4,:)= body_gyro_x(i,:);
        class_27(class_27_counter,5,:)= body_gyro_y(i,:);
        class_27(class_27_counter,6,:)= body_gyro_z(i,:);
        class_27(class_27_counter,7,:)= total_acc_x(i,:);
        class_27(class_27_counter,8,:)= total_acc_y(i,:);
        class_27(class_27_counter,9,:)= total_acc_z(i,:);
        class_27_counter=class_27_counter+1;
    end
    if y_total(i,1)==28
        class_28(class_28_counter,1,:)= body_acc_x(i,:);
        class_28(class_28_counter,2,:)= body_acc_y(i,:);
        class_28(class_28_counter,3,:)= body_acc_z(i,:);
        class_28(class_28_counter,4,:)= body_gyro_x(i,:);
        class_28(class_28_counter,5,:)= body_gyro_y(i,:);
        class_28(class_28_counter,6,:)= body_gyro_z(i,:);
        class_28(class_28_counter,7,:)= total_acc_x(i,:);
        class_28(class_28_counter,8,:)= total_acc_y(i,:);
        class_28(class_28_counter,9,:)= total_acc_z(i,:);
        class_28_counter=class_28_counter+1;
    end
    if y_total(i,1)==29
        class_29(class_29_counter,1,:)= body_acc_x(i,:);
        class_29(class_29_counter,2,:)= body_acc_y(i,:);
        class_29(class_29_counter,3,:)= body_acc_z(i,:);
        class_29(class_29_counter,4,:)= body_gyro_x(i,:);
        class_29(class_29_counter,5,:)= body_gyro_y(i,:);
        class_29(class_29_counter,6,:)= body_gyro_z(i,:);
        class_29(class_29_counter,7,:)= total_acc_x(i,:);
        class_29(class_29_counter,8,:)= total_acc_y(i,:);
        class_29(class_29_counter,9,:)= total_acc_z(i,:);
        class_29_counter=class_29_counter+1;
    end
    if y_total(i,1)==30
        class_30(class_30_counter,1,:)= body_acc_x(i,:);
        class_30(class_30_counter,2,:)= body_acc_y(i,:);
        class_30(class_30_counter,3,:)= body_acc_z(i,:);
        class_30(class_30_counter,4,:)= body_gyro_x(i,:);
        class_30(class_30_counter,5,:)= body_gyro_y(i,:);
        class_30(class_30_counter,6,:)= body_gyro_z(i,:);
        class_30(class_30_counter,7,:)= total_acc_x(i,:);
        class_30(class_30_counter,8,:)= total_acc_y(i,:);
        class_30(class_30_counter,9,:)= total_acc_z(i,:);
        class_30_counter=class_30_counter+1;
    end
end
classwise_train_points= zeros(num_classes,1);
for i=1:num_classes
    classwise_train_points(i,1)= ceil( (train_percent/100) * (class_counter(i,1)));
end

class_1_train_indices= randperm(class_counter(1,1),classwise_train_points(1,1));
class_2_train_indices= randperm(class_counter(2,1),classwise_train_points(2,1));
class_3_train_indices= randperm(class_counter(3,1),classwise_train_points(3,1));
class_4_train_indices= randperm(class_counter(4,1),classwise_train_points(4,1));
class_5_train_indices= randperm(class_counter(5,1),classwise_train_points(5,1));
class_6_train_indices= randperm(class_counter(6,1),classwise_train_points(6,1));
class_7_train_indices= randperm(class_counter(7,1),classwise_train_points(7,1));
class_8_train_indices= randperm(class_counter(8,1),classwise_train_points(8,1));
class_9_train_indices= randperm(class_counter(9,1),classwise_train_points(9,1));
class_10_train_indices= randperm(class_counter(10,1),classwise_train_points(10,1));
class_11_train_indices= randperm(class_counter(11,1),classwise_train_points(11,1));
class_12_train_indices= randperm(class_counter(12,1),classwise_train_points(12,1));
class_13_train_indices= randperm(class_counter(13,1),classwise_train_points(13,1));
class_14_train_indices= randperm(class_counter(14,1),classwise_train_points(14,1));
class_15_train_indices= randperm(class_counter(15,1),classwise_train_points(15,1));
class_16_train_indices= randperm(class_counter(16,1),classwise_train_points(16,1));
class_17_train_indices= randperm(class_counter(17,1),classwise_train_points(17,1));
class_18_train_indices= randperm(class_counter(18,1),classwise_train_points(18,1));
class_19_train_indices= randperm(class_counter(19,1),classwise_train_points(19,1));
class_20_train_indices= randperm(class_counter(20,1),classwise_train_points(20,1));
class_21_train_indices= randperm(class_counter(21,1),classwise_train_points(21,1));
class_22_train_indices= randperm(class_counter(22,1),classwise_train_points(22,1));
class_23_train_indices= randperm(class_counter(23,1),classwise_train_points(23,1));
class_24_train_indices= randperm(class_counter(24,1),classwise_train_points(24,1));
class_25_train_indices= randperm(class_counter(25,1),classwise_train_points(25,1));
class_26_train_indices= randperm(class_counter(26,1),classwise_train_points(26,1));
class_27_train_indices= randperm(class_counter(27,1),classwise_train_points(27,1));
class_28_train_indices= randperm(class_counter(28,1),classwise_train_points(28,1));
class_29_train_indices= randperm(class_counter(29,1),classwise_train_points(29,1));
class_30_train_indices= randperm(class_counter(30,1),classwise_train_points(30,1));

class_1_train_data=zeros(classwise_train_points(1,1),9,128);
class_2_train_data=zeros(classwise_train_points(2,1),9,128);
class_3_train_data=zeros(classwise_train_points(3,1),9,128);
class_4_train_data=zeros(classwise_train_points(4,1),9,128);
class_5_train_data=zeros(classwise_train_points(5,1),9,128);
class_6_train_data=zeros(classwise_train_points(6,1),9,128);
class_7_train_data=zeros(classwise_train_points(7,1),9,128);
class_8_train_data=zeros(classwise_train_points(8,1),9,128);
class_9_train_data=zeros(classwise_train_points(9,1),9,128);
class_10_train_data=zeros(classwise_train_points(10,1),9,128);
class_11_train_data=zeros(classwise_train_points(11,1),9,128);
class_12_train_data=zeros(classwise_train_points(12,1),9,128);
class_13_train_data=zeros(classwise_train_points(13,1),9,128);
class_14_train_data=zeros(classwise_train_points(14,1),9,128);
class_15_train_data=zeros(classwise_train_points(15,1),9,128);
class_16_train_data=zeros(classwise_train_points(16,1),9,128);
class_17_train_data=zeros(classwise_train_points(17,1),9,128);
class_18_train_data=zeros(classwise_train_points(18,1),9,128);
class_19_train_data=zeros(classwise_train_points(19,1),9,128);
class_20_train_data=zeros(classwise_train_points(20,1),9,128);
class_21_train_data=zeros(classwise_train_points(21,1),9,128);
class_22_train_data=zeros(classwise_train_points(22,1),9,128);
class_23_train_data=zeros(classwise_train_points(23,1),9,128);
class_24_train_data=zeros(classwise_train_points(24,1),9,128);
class_25_train_data=zeros(classwise_train_points(25,1),9,128);
class_26_train_data=zeros(classwise_train_points(26,1),9,128);
class_27_train_data=zeros(classwise_train_points(27,1),9,128);
class_28_train_data=zeros(classwise_train_points(28,1),9,128);
class_29_train_data=zeros(classwise_train_points(29,1),9,128);
class_30_train_data=zeros(classwise_train_points(30,1),9,128);

for i= 1:classwise_train_points(1,1)
    class_1_train_data(i,:,:)= class_1(class_1_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(2,1)
    class_2_train_data(i,:,:)= class_2(class_2_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(3,1)
    class_3_train_data(i,:,:)= class_3(class_3_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(4,1)
    class_4_train_data(i,:,:)= class_4(class_4_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(5,1)
    class_5_train_data(i,:,:)= class_5(class_5_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(6,1)
    class_6_train_data(i,:,:)= class_6(class_6_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(7,1)
    class_7_train_data(i,:,:)= class_7(class_7_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(8,1)
    class_8_train_data(i,:,:)= class_8(class_8_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(9,1)
    class_9_train_data(i,:,:)= class_9(class_9_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(10,1)
    class_10_train_data(i,:,:)= class_10(class_10_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(11,1)
    class_11_train_data(i,:,:)= class_11(class_11_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(12,1)
    class_12_train_data(i,:,:)= class_12(class_12_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(13,1)
    class_13_train_data(i,:,:)= class_13(class_13_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(14,1)
    class_14_train_data(i,:,:)= class_14(class_14_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(15,1)
    class_15_train_data(i,:,:)= class_15(class_15_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(16,1)
    class_16_train_data(i,:,:)= class_16(class_16_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(17,1)
    class_17_train_data(i,:,:)= class_17(class_17_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(18,1)
    class_18_train_data(i,:,:)= class_18(class_18_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(19,1)
    class_19_train_data(i,:,:)= class_19(class_19_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(20,1)
    class_20_train_data(i,:,:)= class_20(class_20_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(21,1)
    class_21_train_data(i,:,:)= class_21(class_21_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(22,1)
    class_22_train_data(i,:,:)= class_22(class_22_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(23,1)
    class_23_train_data(i,:,:)= class_23(class_23_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(24,1)
    class_24_train_data(i,:,:)= class_24(class_24_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(25,1)
    class_25_train_data(i,:,:)= class_25(class_25_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(26,1)
    class_26_train_data(i,:,:)= class_26(class_26_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(27,1)
    class_27_train_data(i,:,:)= class_27(class_27_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(28,1)
    class_28_train_data(i,:,:)= class_28(class_28_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(29,1)
    class_29_train_data(i,:,:)= class_29(class_29_train_indices(1,i),:,:);
end
for i= 1:classwise_train_points(30,1)
    class_30_train_data(i,:,:)= class_30(class_30_train_indices(1,i),:,:);
end
train_data=[class_1_train_data;class_2_train_data;class_3_train_data;class_4_train_data;class_5_train_data;...
            class_6_train_data;class_7_train_data;class_8_train_data;class_9_train_data;class_10_train_data;...
            class_11_train_data;class_12_train_data;class_13_train_data;class_14_train_data;class_15_train_data;...
            class_16_train_data;class_17_train_data;class_18_train_data;class_19_train_data;class_20_train_data;...
            class_21_train_data;class_22_train_data;class_23_train_data;class_24_train_data;class_25_train_data;...
            class_26_train_data;class_27_train_data;class_28_train_data;class_29_train_data;class_30_train_data];

        
y_train_=zeros(sum(classwise_train_points),1);
cp=cumsum(classwise_train_points);
y_train_(1:cp(1,1))=1;
y_train_(cp(1,1)+1:cp(2,1))=2;
y_train_(cp(2,1)+1:cp(3,1))=3;
y_train_(cp(3,1)+1:cp(4,1))=4;
y_train_(cp(4,1)+1:cp(5,1))=5;
y_train_(cp(5,1)+1:cp(6,1))=6;
y_train_(cp(6,1)+1:cp(7,1))=7;
y_train_(cp(7,1)+1:cp(8,1))=8;
y_train_(cp(8,1)+1:cp(9,1))=9;
y_train_(cp(9,1)+1:cp(10,1))=10;
y_train_(cp(10,1)+1:cp(11,1))=11;
y_train_(cp(11,1)+1:cp(12,1))=12;
y_train_(cp(12,1)+1:cp(13,1))=13;
y_train_(cp(13,1)+1:cp(14,1))=14;
y_train_(cp(14,1)+1:cp(15,1))=15;
y_train_(cp(15,1)+1:cp(16,1))=16;
y_train_(cp(16,1)+1:cp(17,1))=17;
y_train_(cp(17,1)+1:cp(18,1))=18;
y_train_(cp(18,1)+1:cp(19,1))=19;
y_train_(cp(19,1)+1:cp(10,1))=20;
y_train_(cp(20,1)+1:cp(21,1))=21;
y_train_(cp(21,1)+1:cp(22,1))=22;
y_train_(cp(22,1)+1:cp(23,1))=23;
y_train_(cp(23,1)+1:cp(24,1))=24;
y_train_(cp(24,1)+1:cp(25,1))=25;
y_train_(cp(25,1)+1:cp(26,1))=26;
y_train_(cp(26,1)+1:cp(27,1))=27;
y_train_(cp(27,1)+1:cp(28,1))=28;
y_train_(cp(28,1)+1:cp(29,1))=29;
y_train_(cp(29,1)+1:cp(30,1))=30;



a=zeros(class_counter(1,1),1);
for i=1:class_counter(1,1)
    a(i)=i;
end
class_1_test_indices=setdiff(a,class_1_train_indices);
class_1_test_indices=class_1_test_indices';

a=zeros(class_counter(2,1),1);
for i=1:class_counter(2,1)
    a(i)=i;
end
class_2_test_indices=setdiff(a,class_2_train_indices);
class_2_test_indices=class_2_test_indices';

a=zeros(class_counter(3,1),1);
for i=1:class_counter(3,1)
    a(i)=i;
end
class_3_test_indices=setdiff(a,class_3_train_indices);
class_3_test_indices=class_3_test_indices';

a=zeros(class_counter(4,1),1);
for i=1:class_counter(4,1)
    a(i)=i;
end
class_4_test_indices=setdiff(a,class_4_train_indices);
class_4_test_indices=class_4_test_indices';

a=zeros(class_counter(5,1),1);
for i=1:class_counter(5,1)
    a(i)=i;
end
class_5_test_indices=setdiff(a,class_5_train_indices);
class_5_test_indices=class_5_test_indices';

a=zeros(class_counter(6,1),1);
for i=1:class_counter(6,1)
    a(i)=i;
end
class_6_test_indices=setdiff(a,class_6_train_indices);
class_6_test_indices=class_6_test_indices';

a=zeros(class_counter(7,1),1);
for i=1:class_counter(7,1)
    a(i)=i;
end
class_7_test_indices=setdiff(a,class_7_train_indices);
class_7_test_indices=class_7_test_indices';

a=zeros(class_counter(8,1),1);
for i=1:class_counter(8,1)
    a(i)=i;
end
class_8_test_indices=setdiff(a,class_8_train_indices);
class_8_test_indices=class_8_test_indices';

a=zeros(class_counter(9,1),1);
for i=1:class_counter(9,1)
    a(i)=i;
end
class_9_test_indices=setdiff(a,class_9_train_indices);
class_9_test_indices=class_9_test_indices';

a=zeros(class_counter(10,1),1);
for i=1:class_counter(10,1)
    a(i)=i;
end
class_10_test_indices=setdiff(a,class_10_train_indices);
class_10_test_indices=class_10_test_indices';

a=zeros(class_counter(11,1),1);
for i=1:class_counter(11,1)
    a(i)=i;
end
class_11_test_indices=setdiff(a,class_11_train_indices);
class_11_test_indices=class_11_test_indices';

a=zeros(class_counter(12,1),1);
for i=1:class_counter(12,1)
    a(i)=i;
end
class_12_test_indices=setdiff(a,class_12_train_indices);
class_12_test_indices=class_12_test_indices';

a=zeros(class_counter(13,1),1);
for i=1:class_counter(13,1)
    a(i)=i;
end
class_13_test_indices=setdiff(a,class_13_train_indices);
class_13_test_indices=class_13_test_indices';

a=zeros(class_counter(14,1),1);
for i=1:class_counter(14,1)
    a(i)=i;
end
class_14_test_indices=setdiff(a,class_14_train_indices);
class_14_test_indices=class_14_test_indices';

a=zeros(class_counter(15,1),1);
for i=1:class_counter(15,1)
    a(i)=i;
end
class_15_test_indices=setdiff(a,class_15_train_indices);
class_15_test_indices=class_15_test_indices';

a=zeros(class_counter(16,1),1);
for i=1:class_counter(16,1)
    a(i)=i;
end
class_16_test_indices=setdiff(a,class_16_train_indices);
class_16_test_indices=class_16_test_indices';

a=zeros(class_counter(17,1),1);
for i=1:class_counter(17,1)
    a(i)=i;
end
class_17_test_indices=setdiff(a,class_17_train_indices);
class_17_test_indices=class_17_test_indices';

a=zeros(class_counter(18,1),1);
for i=1:class_counter(18,1)
    a(i)=i;
end
class_18_test_indices=setdiff(a,class_18_train_indices);
class_18_test_indices=class_18_test_indices';

a=zeros(class_counter(19,1),1);
for i=1:class_counter(19,1)
    a(i)=i;
end
class_19_test_indices=setdiff(a,class_19_train_indices);
class_19_test_indices=class_19_test_indices';

a=zeros(class_counter(20,1),1);
for i=1:class_counter(20,1)
    a(i)=i;
end
class_20_test_indices=setdiff(a,class_20_train_indices);
class_20_test_indices=class_20_test_indices';

a=zeros(class_counter(21,1),1);
for i=1:class_counter(21,1)
    a(i)=i;
end
class_21_test_indices=setdiff(a,class_21_train_indices);
class_21_test_indices=class_21_test_indices';

a=zeros(class_counter(22,1),1);
for i=1:class_counter(22,1)
    a(i)=i;
end
class_22_test_indices=setdiff(a,class_22_train_indices);
class_22_test_indices=class_22_test_indices';

a=zeros(class_counter(23,1),1);
for i=1:class_counter(23,1)
    a(i)=i;
end
class_23_test_indices=setdiff(a,class_23_train_indices);
class_23_test_indices=class_23_test_indices';

a=zeros(class_counter(24,1),1);
for i=1:class_counter(24,1)
    a(i)=i;
end
class_24_test_indices=setdiff(a,class_24_train_indices);
class_24_test_indices=class_24_test_indices';

a=zeros(class_counter(25,1),1);
for i=1:class_counter(25,1)
    a(i)=i;
end
class_25_test_indices=setdiff(a,class_25_train_indices);
class_25_test_indices=class_25_test_indices';

a=zeros(class_counter(26,1),1);
for i=1:class_counter(26,1)
    a(i)=i;
end
class_26_test_indices=setdiff(a,class_26_train_indices);
class_26_test_indices=class_26_test_indices';

a=zeros(class_counter(27,1),1);
for i=1:class_counter(27,1)
    a(i)=i;
end
class_27_test_indices=setdiff(a,class_27_train_indices);
class_27_test_indices=class_27_test_indices';

a=zeros(class_counter(28,1),1);
for i=1:class_counter(28,1)
    a(i)=i;
end
class_28_test_indices=setdiff(a,class_28_train_indices);
class_28_test_indices=class_28_test_indices';

a=zeros(class_counter(29,1),1);
for i=1:class_counter(29,1)
    a(i)=i;
end
class_29_test_indices=setdiff(a,class_29_train_indices);
class_29_test_indices=class_29_test_indices';

a=zeros(class_counter(30,1),1);
for i=1:class_counter(30,1)
    a(i)=i;
end
class_30_test_indices=setdiff(a,class_30_train_indices);
class_30_test_indices=class_30_test_indices';

classwise_test_points= zeros(num_classes,1);
for i=1:num_classes
    classwise_test_points(i,1)= class_counter(i,1)-classwise_train_points(i,1);
end
%%%%%%%%%%%%%%%%%%%%%%%

class_1_test_data=zeros(classwise_test_points(1,1),9,128);
class_2_test_data=zeros(classwise_test_points(2,1),9,128);
class_3_test_data=zeros(classwise_test_points(3,1),9,128);
class_4_test_data=zeros(classwise_test_points(4,1),9,128);
class_5_test_data=zeros(classwise_test_points(5,1),9,128);
class_6_test_data=zeros(classwise_test_points(6,1),9,128);
class_7_test_data=zeros(classwise_test_points(7,1),9,128);
class_8_test_data=zeros(classwise_test_points(8,1),9,128);
class_9_test_data=zeros(classwise_test_points(9,1),9,128);
class_10_test_data=zeros(classwise_test_points(10,1),9,128);
class_11_test_data=zeros(classwise_test_points(11,1),9,128);
class_12_test_data=zeros(classwise_test_points(12,1),9,128);
class_13_test_data=zeros(classwise_test_points(13,1),9,128);
class_14_test_data=zeros(classwise_test_points(14,1),9,128);
class_15_test_data=zeros(classwise_test_points(15,1),9,128);
class_16_test_data=zeros(classwise_test_points(16,1),9,128);
class_17_test_data=zeros(classwise_test_points(17,1),9,128);
class_18_test_data=zeros(classwise_test_points(18,1),9,128);
class_19_test_data=zeros(classwise_test_points(19,1),9,128);
class_20_test_data=zeros(classwise_test_points(20,1),9,128);
class_21_test_data=zeros(classwise_test_points(21,1),9,128);
class_22_test_data=zeros(classwise_test_points(22,1),9,128);
class_23_test_data=zeros(classwise_test_points(23,1),9,128);
class_24_test_data=zeros(classwise_test_points(24,1),9,128);
class_25_test_data=zeros(classwise_test_points(25,1),9,128);
class_26_test_data=zeros(classwise_test_points(26,1),9,128);
class_27_test_data=zeros(classwise_test_points(27,1),9,128);
class_28_test_data=zeros(classwise_test_points(28,1),9,128);
class_29_test_data=zeros(classwise_test_points(29,1),9,128);
class_30_test_data=zeros(classwise_test_points(30,1),9,128);

for i= 1:classwise_test_points(1,1)
    class_1_test_data(i,:,:)= class_1(class_1_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(2,1)
    class_2_test_data(i,:,:)= class_2(class_2_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(3,1)
    class_3_test_data(i,:,:)= class_3(class_3_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(4,1)
    class_4_test_data(i,:,:)= class_4(class_4_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(5,1)
    class_5_test_data(i,:,:)= class_5(class_5_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(6,1)
    class_6_test_data(i,:,:)= class_6(class_6_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(7,1)
    class_7_test_data(i,:,:)= class_7(class_7_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(8,1)
    class_8_test_data(i,:,:)= class_8(class_8_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(9,1)
    class_9_test_data(i,:,:)= class_9(class_9_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(10,1)
    class_10_test_data(i,:,:)= class_10(class_10_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(11,1)
    class_11_test_data(i,:,:)= class_11(class_11_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(12,1)
    class_12_test_data(i,:,:)= class_12(class_12_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(13,1)
    class_13_test_data(i,:,:)= class_13(class_13_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(14,1)
    class_14_test_data(i,:,:)= class_14(class_14_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(15,1)
    class_15_test_data(i,:,:)= class_15(class_15_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(16,1)
    class_16_test_data(i,:,:)= class_16(class_16_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(17,1)
    class_17_test_data(i,:,:)= class_17(class_17_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(18,1)
    class_18_test_data(i,:,:)= class_18(class_18_test_indices(1,i),:,:);
end
for i= 1:classwise_train_points(19,1)
    class_19_test_data(i,:,:)= class_19(class_19_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(20,1)
    class_20_test_data(i,:,:)= class_20(class_20_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(21,1)
    class_21_test_data(i,:,:)= class_21(class_21_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(22,1)
    class_22_test_data(i,:,:)= class_22(class_22_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(23,1)
    class_23_test_data(i,:,:)= class_23(class_23_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(24,1)
    class_24_test_data(i,:,:)= class_24(class_24_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(25,1)
    class_25_test_data(i,:,:)= class_25(class_25_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(26,1)
    class_26_test_data(i,:,:)= class_26(class_26_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(27,1)
    class_27_test_data(i,:,:)= class_27(class_27_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(28,1)
    class_28_test_data(i,:,:)= class_28(class_28_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(29,1)
    class_29_test_data(i,:,:)= class_29(class_29_test_indices(1,i),:,:);
end
for i= 1:classwise_test_points(30,1)
    class_30_test_data(i,:,:)= class_30(class_30_test_indices(1,i),:,:);
end
test_data=[class_1_test_data;class_2_test_data;class_3_test_data;class_4_test_data;class_5_test_data;...
            class_6_test_data;class_7_test_data;class_8_test_data;class_9_test_data;class_10_test_data;...
            class_11_test_data;class_12_test_data;class_13_test_data;class_14_test_data;class_15_test_data;...
            class_16_test_data;class_17_test_data;class_18_test_data;class_19_test_data;class_20_test_data;...
            class_21_test_data;class_22_test_data;class_23_test_data;class_24_test_data;class_25_test_data;...
            class_26_test_data;class_27_test_data;class_28_test_data;class_29_test_data;class_30_test_data];

y_test_=zeros(sum(classwise_test_points),1);
cp=cumsum(classwise_test_points);
y_test_(1:cp(1,1))=1;
y_test_(cp(1,1)+1:cp(2,1))=2;
y_test_(cp(2,1)+1:cp(3,1))=3;
y_test_(cp(3,1)+1:cp(4,1))=4;
y_test_(cp(4,1)+1:cp(5,1))=5;
y_test_(cp(5,1)+1:cp(6,1))=6;
y_test_(cp(6,1)+1:cp(7,1))=7;
y_test_(cp(7,1)+1:cp(8,1))=8;
y_test_(cp(8,1)+1:cp(9,1))=9;
y_test_(cp(9,1)+1:cp(10,1))=10;
y_test_(cp(10,1)+1:cp(11,1))=11;
y_test_(cp(11,1)+1:cp(12,1))=12;
y_test_(cp(12,1)+1:cp(13,1))=13;
y_test_(cp(13,1)+1:cp(14,1))=14;
y_test_(cp(14,1)+1:cp(15,1))=15;
y_test_(cp(15,1)+1:cp(16,1))=16;
y_test_(cp(16,1)+1:cp(17,1))=17;
y_test_(cp(17,1)+1:cp(18,1))=18;
y_test_(cp(18,1)+1:cp(19,1))=19;
y_test_(cp(19,1)+1:cp(10,1))=20;
y_test_(cp(20,1)+1:cp(21,1))=21;
y_test_(cp(21,1)+1:cp(22,1))=22;
y_test_(cp(22,1)+1:cp(23,1))=23;
y_test_(cp(23,1)+1:cp(24,1))=24;
y_test_(cp(24,1)+1:cp(25,1))=25;
y_test_(cp(25,1)+1:cp(26,1))=26;
y_test_(cp(26,1)+1:cp(27,1))=27;
y_test_(cp(27,1)+1:cp(28,1))=28;
y_test_(cp(28,1)+1:cp(29,1))=29;
y_test_(cp(29,1)+1:cp(30,1))=30;

%%%%%%%%%--- CONSTRUCTION OF SIGNAL IMAGE ---%%%%%%%%%%%%%

signal_image_set=zeros(sum(classwise_train_points),37,128);
for i=1:sum(classwise_train_points)
    for j=1:37
        if j==1 || j==10 || j==19 || j==22 || j==37
            signal_image_set(i,j,:)= train_data(i,4,:);
        end
        if j==2 || j==15 || j==25 || j==35 
            signal_image_set(i,j,:)= train_data(i,5,:);
        end
        if j==3 || j==11 || j==28 || j==33 
            signal_image_set(i,j,:)= train_data(i,6,:);
        end
        if j==4 || j==16 || j==20 || j==31 
            signal_image_set(i,j,:)= train_data(i,7,:);
        end
        if j==5 || j==12 || j==23 || j==26 
            signal_image_set(i,j,:)= train_data(i,8,:);
        end
        if j==6 || j==17 || j==29 || j==36 
            signal_image_set(i,j,:)= train_data(i,9,:);
        end
        if j==7 || j==13 || j==21 || j==34 
            signal_image_set(i,j,:)= train_data(i,1,:);
        end
        if j==8 || j==18 || j==24 || j==32 
            signal_image_set(i,j,:)= train_data(i,2,:);
        end
        if j==9 || j==14 || j==27 || j==30 
            signal_image_set(i,j,:)= train_data(i,3,:);
        end
    end
end
%%%%%%%%%%%--- CONSTRUCTION OF ACTIVITY IMAGE ---%%%%%%%%%%%%%%

activity_image_set= zeros(sum(classwise_train_points),37,128);
for i=1:sum(classwise_train_points)
    activity_image_set(i,:,:)=real(fft(signal_image_set(i,:,:)));
end

activity_image_set_= zeros(37,128,1,sum(classwise_train_points));
for i=1:sum(classwise_train_points)
    activity_image_set_(:,:,1,i)= activity_image_set(i,:,:);
end
y_train__= categorical(y_train_);
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
    fullyConnectedLayer(30)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm','InitialLearnRate',0.01,'MaxEpochs',4,'Shuffle','every-epoch','Verbose',false);

%%%%%%%%%%%%%--- TRAIN THE NETWORK ---%%%%%%%%%%%%%%%%

net = trainNetwork(activity_image_set_,y_train__,layers,options);

%%%%%%%%%%%%--- TEST THE NETWORK ---%%%%%%%%%%%%%%%%%

test_signal_image_set=zeros(sum(classwise_test_points),37,128);
for i=1:sum(classwise_test_points)
    for j=1:37
        if j==1 || j==10 || j==19 || j==22 || j==37
            signal_image_set(i,j,:)= test_data(i,4,:);
        end
        if j==2 || j==15 || j==25 || j==35 
            signal_image_set(i,j,:)= test_data(i,5,:);
        end
        if j==3 || j==11 || j==28 || j==33 
            signal_image_set(i,j,:)= test_data(i,6,:);
        end
        if j==4 || j==16 || j==20 || j==31 
            signal_image_set(i,j,:)= test_data(i,7,:);
        end
        if j==5 || j==12 || j==23 || j==26 
            signal_image_set(i,j,:)= test_data(i,8,:);
        end
        if j==6 || j==17 || j==29 || j==36 
            signal_image_set(i,j,:)= test_data(i,9,:);
        end
        if j==7 || j==13 || j==21 || j==34 
            signal_image_set(i,j,:)= test_data(i,1,:);
        end
        if j==8 || j==18 || j==24 || j==32 
            signal_image_set(i,j,:)= test_data(i,2,:);
        end
        if j==9 || j==14 || j==27 || j==30 
            signal_image_set(i,j,:)= test_data(i,3,:);
        end
    end
end



test_activity_image_set= zeros(sum(classwise_test_points),37,128);
for i=1:sum(classwise_test_points)
    test_activity_image_set(i,:,:)=real(fft(test_signal_image_set(i,:,:)));
end

test_activity_image_set_= zeros(37,128,1,sum(classwise_test_points));
for i=1:sum(classwise_test_points)
    test_activity_image_set_(:,:,1,i)= test_activity_image_set(i,:,:);
end
y_test__= categorical(y_test_);
YPred = classify(net,test_activity_image_set_);

%%%%%%%%%%%%--- CALCULATE ACCURACY ---%%%%%%%%%%%%%%%%
accuracy = sum(YPred == y_test__)/numel(y_test__);
accuracy