function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

CRange = C*3.^[-3:3];
sigmaRange = sigma*3.^[-3:3];

error = zeros(length(CRange),length(sigmaRange));

for i = 1:length(CRange)
	for j = 1:length(sigmaRange)
		model = svmTrain(X, y, CRange(i), @(x1, x2) ...
			gaussianKernel(x1, x2, sigmaRange(j)));
		predictions = svmPredict(model, Xval);
		errors(i,j) = mean(double(predictions ~= yval));
	endfor
endfor

[minErrors minCi] = min(errors);
[minErrors minsigmai] = min(minErrors);

sigma = sigmaRange(minsigmai);
C = CRange(minCi(minsigmai));

%[a b] = meshgrid(1:length(errors));
%figure;
%surf(a,b,errors);

	
% =========================================================================

end
