function result = descrete_naive_bayes(data_train, labels_train, test_data, a, b)
    alpha_i = summation(data_train, labels_train, test_data, 0, a, b) ;   
    alpha_j = summation(data_train, labels_train, test_data, 1, a, b);
    gamma = max(alpha_i,alpha_j);
    result = exp(alpha_j - gamma)/(exp(alpha_i - gamma) + exp(alpha_j  - gamma));
    if result > 0.5
        result = 1;
    else
        result = 0;
    end
end

function alpha_j = summation(data_train, labels_train, test_data, feature,alpha,b)
    Nk = size(data_train(labels_train == feature,:),1);
    N0k = sum(data_train(labels_train == feature, test_data == 0));
    N1k = sum(data_train(labels_train == feature, test_data == 1));
    %Equation 33 aij = (Nik + alpha)/(Nk + 2alpha) from the lecture note
    a0j = (N0k + alpha) ./(Nk + 2 * alpha);
    a1j = (N1k + alpha) ./(Nk + 2 * alpha);
    %Equation 31 from the lecture note
    bj = (Nk + b)/ (size(data_train,1) + 2*b);
    %Equation 28 from the lecture note
    alpha_j = sum(log(a1j)) + sum(log(1-a0j)) + log(bj);
end