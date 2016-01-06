
function class = gccClassify(x, p1, m1, m2, C1, C2)
% 
% Inputs
%   x - test examplar
%   p1 - prior probability for class 1
%   m1 - mean of Gaussian measurement likelihood for class 1
%   m2 - mean of Gaussian measurement likelihood for class 2
%   C1 - covariance of Gaussian measurement likelihood for class 1
%   C2 - covariance of Gaussian measurement likelihood for class 2
%
% Outputs
%   class - sgn(a(x)) (ie sign of decision function a(x))
% YOUR CODE GOES HERE.
p2 = 1 - p1;
ax = -p1 * (x - m1)' * inv(C1) * (x - m1) - p1 * log(m1)  + p2 * (x - m2)' * inv(C2) * (x - m2) - p2 * log(m2);
if sign(ax) == 1
    class = 1;
else
    class = 0;
end



