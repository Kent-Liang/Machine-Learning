
% Use the function knnClassify to test performance on different datasets.
%-----------------------------------------------
%                   fruit
%-----------------------------------------------
%load data
load('/dataSets/fruit_train');
load('/dataSets/fruit_test');

num = size(inputs_test,2);
f_error=[];
for k = 3:2:21
    e = 0;
    for j = 1:num
        if knnClassify(inputs_test(:,j), k,inputs_train,target_train) ~= target_test(:,j)
            e = e+1;
        end
    end
    f_error=[f_error e];
end
plot(3:2:21, f_error,'b');
hold on;

%-----------------------------------------------
%                   mnist
%-----------------------------------------------
%load data
load('/dataSets/mnist_train');
load('/dataSets/mnist_test');

num = size(inputs_test,2);
d_error=[];
for k = 3:2:21
    e = 0;
    for j = 1:num
       if knnClassify(inputs_test(:,j), k,inputs_train,target_train) ~= target_test(:,j)
            e = e+1;
        end
    end
    d_error=[d_error e];
end
plot(3:2:21, d_error,'r');
hold on;
%-----------------------------------------------
%                   Generic 1
%-----------------------------------------------

%load data
load('/dataSets/generic1');
inputs_train=[c1_train c2_train];

tr_c1=size(c1_train,2);
tr_c2=size(c2_train,2);
target_train=[ones(1, tr_c1) zeros(1, tr_c2); zeros(1,tr_c1) ones(1, tr_c2)];

inputs_test=[c1_test c2_test];
t_c1=size(c1_test,2);
t_c2=size(c2_test,2);
target_test=[ones(1, t_c1) zeros(1, t_c2); zeros(1, t_c1) ones(1, t_c2)];

num = size(inputs_test,2);
%correct = [];
%wrong = [];
g1_error=[];
for k = 3:2:21
    e = 0;
    for j = 1:num
       result = knnClassify(inputs_test(:,j), k,inputs_train,target_train);
       %if k == 9
       %                
       %end    
       if result ~= target_test(:,j)
            e = e+1;
       end
    end
    g1_error=[g1_error e];
end
plot(3:2:21, g1_error,'m');
hold on;
%-----------------------------------------------
%                   Generic 2
%-----------------------------------------------

%load data
load('/dataSets/generic2');
inputs_train=[c1_train c2_train];

tr_c1=size(c1_train,2);
tr_c2=size(c2_train,2);
target_train=[ones(1, tr_c1) zeros(1, tr_c2); zeros(1,tr_c1) ones(1, tr_c2)];

inputs_test=[c1_test c2_test];
t_c1=size(c1_test,2);
t_c2=size(c2_test,2);
target_test=[ones(1, t_c1) zeros(1, t_c2); zeros(1, t_c1) ones(1, t_c2)];

num = size(inputs_test,2);
g2_error=[];
for k = 3:2:21
    e = 0;
    for j = 1:num
       if knnClassify(inputs_test(:,j), k,inputs_train,target_train) ~= target_test(:,j)
            e = e+1;
        end
    end
    g2_error=[g2_error e];
end
plot(3:2:21, g2_error,'c');
title('knn Error');
legend('fruit','mnist','generic1','generic2');
xlabel('k');
ylabel('errors');
hold off;
%-----------------------------------------------
%                   Generic 1
%-----------------------------------------------
%training data and test points are correctly or incorrectly labled
figure(2); clf; hold on;
plot(c1_train(1,:),c1_train(2,:),'ro');
plot(c2_train(1,:),c2_train(2,:),'bx');
legend({'class 1','class 2'});

%-----------------------------------------------
%                   Generic 2
%-----------------------------------------------
%training data and test points are correctly or incorrectly labled
figure(3); clf; hold on;
plot(c1_train(1,:),c1_train(2,:),'ro');
plot(c2_train(1,:),c2_train(2,:),'bx');
legend({'class 1','class 2'});





