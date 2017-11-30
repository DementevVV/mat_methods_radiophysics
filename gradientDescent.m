function [theta, J_History] = gradientDescent(X, theta, y, alpha, iterations)
	m = length(y);
	J_History = zeros(iterations, 1);
	thetaLen = length(theta);
	tempVal = theta;

	for iteration=1:iterations
    	temp = (X*theta - y);
    
    	for i=1:thetaLen
        	tempVal(i,1) = sum(temp.*X(:,i));
    	end
    
    	theta = theta - (alpha/m)*tempVal;
    
    	J_History(iteration,1) = cost(X,y,theta);
 	
	end

end