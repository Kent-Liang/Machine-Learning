load('a3spam.mat');
alphas = 0.004:0.0001:0.007;
num_alphas = size(alphas, 2);
num_tests = size(labels_test,1);
result = zeros(1, num_alphas);
for i=1:num_alphas
    error = 0;
    for j=1:num_tests
        if labels_test(j) ~= descrete_naive_bayes(data_train, labels_train, data_test(j,:), alphas(i), 0)
           error = error + 1;
        end
    end
    result(i) = error/num_tests;  
end
figure();
plot(alphas, result, 'b-*');
title('Naive Bayes');
xlabel('Alpha');
ylabel('Percentage of Error');

% [w sol] = descrete_naive_bayes(data_train, labels_train, data_test(1,:), 0.005, 0);
% [b ind] = sort(w);
% NB_ham = feature_names(ind(1:10))
% NB_ham_weight = w(ind(1:10))
% NB_spam = feature_names(ind(end - 9 : end))
% NB_spam_weight = w(ind(end-9 : end))
