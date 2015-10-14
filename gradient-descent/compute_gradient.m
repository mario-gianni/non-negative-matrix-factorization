function [ dA1,dA2,dX ] = compute_gradient( Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3)
% COMPUTE_GRADIENT computes the gradient of the objective function
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%       lambda1 regulrization parameter of A1
%       lambda2 regulrization parameter of A2
%       lambda3 regulrization parameter of X
%   OUTPUT:
%       dA1 gradient with respect to A1
%       dA2 gradient with respect to A2
%       dX gradient with respect to X

dA1 = lambda1*A1 - (Y1 - A1*X)*X';
dA2 = lambda2*A2 - (Y2 - A2*X)*X';
dX = lambda3*X - A1'*(Y1 - A1*X) - A2'*(Y2 - A2*X);
end

