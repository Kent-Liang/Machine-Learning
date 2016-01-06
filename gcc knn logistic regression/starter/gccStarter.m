% Use the function learnGCCmodel to learn a Gaussian Class-Conditional
% model for classification.
% Use the function gccClassify for evaluating the decision function
% to perform classification.
% Then test the model under various conditions.
%-----------------------------------------------
%                   fruit
%-----------------------------------------------
%load data
load('/dataSets/fruit_train');
load('/dataSets/fruit_test');

num = size(inputs_test,2);
f_error=[];
e = 0;
x1 = inputs_train(1,:);
x2 = inputs_train(2,:);
for j = 1:num
    [p1, m1, m2, C1, C2] = learnGCCmodel(x1, x2);
    if gccClassify(inputs_test(:,j), p1, m1, m2, C1, C2) ~= target_test(1,j)
        e = e+1;
    end
    f_error=[f_error e]
end
plot(1:num, f_error,'bx');
hold on;

% %-----------------------------------------------
% %                  mnist
% %-----------------------------------------------
% %load data
% load('/dataSets/mnist_train');
% load('/dataSets/mnist_test');
% 
% num = size(inputs_test,2);
% d_error=[];
% e = 0;
% for j = 1:num
%     [p1, m1, m2, C1, C2] = learnGCCmodel(x1, x2);
%     if gccClassify(inputs_test(:,j), p1, m1, m2, C1, C2) ~= target_test(j)
%         e = e+1;
%     end
%     d_error=[d_error e];
% end
% plot(1:num, d_error,'r');
% hold on;

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
g1_error=[];
e = 0;
x1 = inputs_train(1,:);
x2 = inputs_train(2,:);

for j = 1:num
    [p1, m1, m2, C1, C2] = learnGCCmodel(x1, x2);
    if gccClassify(inputs_test(:,j), p1, m1, m2, C1, C2) ~= target_test(1,j)
        e = e+1;
    end
    g1_error=[g1_error e];
end
plot(1:num, g1_error,'ro');
hold on;
% %-----------------------------------------------
% %                   Generic 2
% %-----------------------------------------------
% 
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
e = 0;
x1 = inputs_train(1,:);
x2 = inputs_train(2,:);

for j = 1:num
    [p1, m1, m2, C1, C2] = learnGCCmodel(x1, x2);
    if gccClassify(inputs_test(:,j), p1, m1, m2, C1, C2) ~= target_test(1,j)
        e = e+1;
    end
    plot(j, e,'k*');
end

hold on;
title('GCC Error');
legend('fruit','generic1','generic2');
xlabel('test points');
ylabel('errors');
hold off;


