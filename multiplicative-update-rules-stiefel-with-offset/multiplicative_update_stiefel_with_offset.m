function [ A1,A2,X,alpha1,alpha2 ] = multiplicative_update_stiefel_with_offset( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5)
% MULTIPLICATIVE_UPDATE computes the multiplicative update rules according
% to Lee, D. Seung, H. S. Algorithms for non-negative matrix factorization.
% taking into account the orthogonality constraint using true gradient
% on Stiefel manifold
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%       lambda1 regulrization parameter of A1
%       lambda2 regulrization parameter of A2
%       lambda3 regulrization parameter of X
%       lambda4 regulrization parameter of alpha1
%       lambda5 regulrization parameter of alpha2
%   OUTPUT:
%       A1 mud with respect to A1
%       A2 mud with respect to A2
%       X mud with respect to X
%       alpha1 mud with respect to alpha1
%       alpha2 mud with respect to alpha2

[j,t] = size(X);

% A1 =  A1.*((X*Y1')./(lambda1*A1' + (A1*(X*X'))'))';
% A2 =  A2.*((X*Y2')./(lambda2*A2' + (A2*(X*X'))'))';

A1 = A1.*((Y1*X')./(lambda1*A1 + A1*(X*X') + alpha1*ones(t,1)'*X'));
A2 = A2.*((Y2*X')./(lambda2*A2 + A2*(X*X') + alpha2*ones(t,1)'*X'));
alpha1 = alpha1.*((Y1*ones(t,1))./(lambda4*alpha1 + A1*X*ones(t,1) + alpha1*ones(t,1)'*ones(t,1)));
alpha2 = alpha2.*((Y2*ones(t,1))./(lambda5*alpha2 + A2*X*ones(t,1) + alpha2*ones(t,1)'*ones(t,1)));
X = X.*((A1'*Y1 + A2'*Y2 + X*(alpha1*ones(t,1)')'*A1*X + X*(alpha2*ones(t,1)')'*A2*X)./(2*lambda3*X +  X*Y1'*A1*X + X*Y2'*A2*X + A1'*alpha1*ones(t,1)' + A2'*alpha2*ones(t,1)'));


end

