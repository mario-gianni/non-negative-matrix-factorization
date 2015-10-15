function [A1,A2,X,alpha1,alpha2,error] = mult_up_rules_optimization( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5,max_it)
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
%       alpha1 i1 x 1 offset vector solution for Y1
%       alpha2 i2 x 1 offset vector solution for Y2

error = zeros(1,max_it+1);
error(1) = objective_function( Y1,Y2,A1,A2,X,alpha1,alpha2);
for it = 1 : max_it
    [A1,A2,X,alpha1,alpha2] = multiplicative_update( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5);
    error(it+1) = objective_function( Y1,Y2,A1,A2,X,alpha1,alpha2);
end

end

