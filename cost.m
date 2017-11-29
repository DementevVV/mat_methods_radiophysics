function CostVal = cost(X,y,theta)
% training examples length
m = length(y); 
CostVal = (1/(2*m))*sum((X*theta - y).^2);