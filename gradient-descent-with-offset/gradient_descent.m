function [A1,A2,X,alpha1,alpha2,error] = gradient_descent( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5,eta,max_it)
%GRADIENT_DESCENT provides the solution which minimize the objective
%function
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%       alpha1 i1 x 1 offset vector for Y1
%       alpha2 i2 x 1 offset vector for Y2
%       lambda1 regulrization parameter of A1
%       lambda2 regulrization parameter of A2
%       lambda3 regulrization parameter of X
%       lambda4 regulrization parameter of alpha1
%       lambda5 regulrization parameter of alpha2
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
    [ dA1,dA2,dX,dalpha1,dalpha2 ] = compute_gradient( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5);
    A1 = A1 - eta * dA1;
    A2 = A2 - eta * dA2;
    X = X - eta * dX;
    alpha1 = alpha1 - eta * dalpha1;
    alpha2 = alpha2 - eta * dalpha2;
    error(it+1) = objective_function( Y1,Y2,A1,A2,X,alpha1,alpha2);
end

end

