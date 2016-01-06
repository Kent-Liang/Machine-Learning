% Use learnLogReg() to test performance on various datasets.
% -----------------------------------------------
%                   Fruits
% -----------------------------------------------
load('/dataSets/fruit_train');
load('/dataSets/fruit_test');

alphas = [0.25, 0.5, 1, 2, 5];
num_alphas = size(alphas,2);
num_tests = size(target_test,2);
index_c1 = find(target_train(1,:)==1);
index_c2 = find(target_train(2,:)==1);
c1_train = inputs_train(:,index_c1);
c2_train = inputs_train(:,index_c2);
result = zeros(1, num_alphas);

for i = 1:num_alphas
    [w, b] = learnLogReg(c1_train, c2_train ,alphas(i));
    error = 0;
    sol = logistic(inputs_test, w, b);
    for j = 1:num_tests
         if round(sol(j)) ~= target_test(2,j)
             error = error + 1;
         end
    end
    result(1,i) = error/num_tests;
end
figure;
plot(alphas, result, 'r*');
title('Logistic Regression');
xlabel('Alpha');
ylabel('Percentage of Error');
hold on;

%-----------------------------------------------
%                   Generic 1
%-----------------------------------------------
load('/dataSets/generic1');
alphas = [0.25, 0.5, 1, 2, 5];
num_alphas = size(alphas,2);
result = zeros(1, num_alphas);
inputs_test = [c1_test c2_test];
num_tests = size(c1_test,2) + size(c2_test,2);
target_test = [zeros(1,size(c1_test,2)), ones(1,size(c2_test,2))];

for i = 1:num_alphas
    [w, b] = learnLogReg(c1_train, c2_train ,alphas(i));
    error = 0;
    sol = logistic(inputs_test, w, b);
    for j = 1:num_tests
          if round(sol(j)) ~= target_test(j)
              error = error + 1;
          end
    end
    result(1,i) = error/num_tests;
end
figure;
plot(alphas, result, 'r*');
title('Logistic Regression');
xlabel('Alpha');
ylabel('Percentage of Error');
hold on;

%-----------------------------------------------
%                   Generic2
%-----------------------------------------------
load('/dataSets/generic2');
alphas = [0.25, 0.5, 1, 2, 5];
num_alphas = size(alphas,2);
result = zeros(1, num_alphas);
inputs_test = [c1_test c2_test];
num_tests = size(c1_test,2) + size(c2_test,2);
target_test = [zeros(1,size(c1_test,2)), ones(1,size(c2_test,2))];

for i = 1:num_alphas
    [w, b] = learnLogReg(c1_train, c2_train ,alphas(i));
    error = 0;
    sol = logistic(inputs_test, w, b);
    for j = 1:num_tests
          if round(sol(j)) ~= target_test(j)
              error = error + 1;
          end
    end
    result(1,i) = error/num_tests;
end
figure;
plot(alphas, result, 'r*');
title('Logistic Regression');
xlabel('Alpha');
ylabel('Percentage of Error');
hold on;


%-----------------------------------------------
%                   Digits
%-----------------------------------------------
load('/dataSets/mnist_train');
load('/dataSets/mnist_test');

alphas = [0.25, 0.5, 1, 2, 5];
num_alphas = size(alphas,2);
num_tests = size(target_test,2);
index_c1 = find(target_train(1,:)==1);
index_c2 = find(target_train(2,:)==1);
c1_train = inputs_train(:,index_c1);
c2_train = inputs_train(:,index_c2);
result = zeros(1, num_alphas);

for i = 1:num_alphas
    [w, b] = learnLogReg(c1_train, c2_train ,alphas(i));
    error = 0;
    sol = logistic(inputs_test, w, b);
    for j = 1:num_tests
         if round(sol(j)) ~= target_test(j)
             error = error + 1;
         end
    end
    result(1,i) = error/num_tests;
end
figure;
plot(alphas, result, 'r*');
title('Logistic Regression');
xlabel('Alpha');
ylabel('Percentage of Error');
hold on;
