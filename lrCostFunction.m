function [J, grad] = lrCostFunction(theta, X, y, lambda)
  

 m = length(y);
 
 J = 0;
grad = zeros(size(theta));

h = sigmoid( X * theta);
J = sum(-y .* log(h) - (1 - y) .* log(1 - h)) / m;
J = J + (lambda / (2 * m)) * sum(theta(2:end) .^ 2);

grad = (1/m) * X' * (h-y);
grad = grad + (lambda / m) * [0 ; theta(2:end)];

grad = grad(:);

end