function [A1,A2,X,error] = mult_up_rules_optimization( Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3,max_it)
%MULT_UP_RULES_OPTIMIZATION provides the solution which minimize the objective
%function according to the multiplicative update rules
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%       lambda1 regulrization parameter of A1
%       lambda2 regulrization parameter of A2
%       lambda3 regulrization parameter of X
%       eta size of the descent step
%       max_it maximum number of iterations
%   OUTPUT:
%       A1 i1 x j matrix solution
%       A2 i2 x j matrix solution
%       X j x t matrix solution

error = zeros(1,max_it+1);
error(1) = objective_function(Y1,Y2,A1,A2,X);
for it = 1 : max_it
    [mA1,mA2,mX] = multiplicative_update(Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3);
    A1 = A1.* mA1;
    A2 = A2.* mA2;
    X = X.* mX;
    error(it+1) = objective_function(Y1,Y2,A1,A2,X);
end

end

