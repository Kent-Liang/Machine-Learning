function [ll, dll_dw, dll_db] = logisticNLP(x1, x2, w, b, alpha)
% [ll, dll_dw, dll_db] = logisticNLP(x1, x2, w, b, alpha)
% 
% Inputs:
%   x1 - array of exemplar measurement vectors for class 1.
%   x2 - array of exemplar measurement vectors for class 2.
%   w - an array of weights for the logistic regression model.
%   b - the bias parameter for the logistic regression model.
%   alpha - weight decay parameter
% Outputs:
%   ll - negative log probability (likelihood) for the data 
%        conditioned on the model (ie w).
%   dll_dw - gradient of negative log data likelihood wrt w
%   dll_db - gradient of negative log data likelihood wrt b


% YOUR CODE GOES HERE.

X=[x1, x2];
num = size(X, 2);
y = [zeros(1,size(x1,2)), ones(1,size(x2,2))];
ll = 0;
dll_dw =0;
dll_db = 0;
%Calculate the log likelihood and the gradient of log likelihood wrt w and
%b

for i = 1:num
    class_prob = 1/(1+exp(-w'*X(:,i)-b));
    %Avoid the 0 * -Inf = Nan error
    part = 0;
    if 1-y(:,i) ~= 0
        part = (1-y(:,i))*log(1-class_prob);
    end 
    ll = ll + y(:,i)*log(class_prob) + part;
    dll_dw = dll_dw + (y(:,i)-class_prob)*X(:,i);
    dll_db = dll_db + y(:,i)-class_prob;   
end
ll = 1/(2*alpha)*w'*w-ll;
dll_dw = (1/alpha)*w-dll_dw;
dll_db = -1 * dll_db;
end




