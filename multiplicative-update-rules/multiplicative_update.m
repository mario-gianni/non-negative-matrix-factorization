function [ A1,A2,X ] = multiplicative_update( Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3)
% MULTIPLICATIVE_UPDATE computes the multiplicative update rules according
% to Lee, D. Seung, H. S. Algorithms for non-negative matrix factorization
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
%       mA1 mud with respect to A1
%       mA2 mud with respect to A2
%       mX mud with respect to X

A1 =  A1.*((Y1*X')./(lambda1*A1 + A1*(X*X')));
A2 = A2.*((Y2*X')./(lambda2*A2 + A2*(X*X')));
X = X.*((A1'*Y1 + A2'*Y2)./(lambda3*X + A1'*A1*X + A2'*A2*X));
end

