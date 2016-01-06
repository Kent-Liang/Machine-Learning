function class = knnClassify(test, k, trainingInputs, trainingTargets);
%
% Inputs:
%   test: test input vector
%   k: number of nearest neighbours to use in classification.
%   traingingInputs: array of training exemplars, one exemplar per row
%   traingingTargets: indicator vector per row (Fixed spelling from idenicator to indicator)
%
% Basic Algorithm of kNN Classification
% 1) find distance from test input to each training exemplar,
% 2) sort distances
% 3) take smallest k distances, and use the median class among 
%    those exemplars to label the test input.
%
% YOUR CODE GOES HERE.
num=size(trainingInputs,2);
dis=[];
for i = 1:num
    %find distance from test input to each training exemplar
    dist = sqrt(sum((test-trainingInputs(:,i)).^2));
    dis = [dis; dist trainingTargets(:,i)'];
end
%sort 
dis = sortrows(dis,1);
%cut
class = dis(1:k,2:3);
%find median;
class = median(class)';
end

