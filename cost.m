function J = cost(X, y, theta)
	m = length(y);
	J = 0; % init 
	for i=1:m
		J = J + 1./(2*m)*(theta'*X(i,:)'-y(i)).^2;
	end
end