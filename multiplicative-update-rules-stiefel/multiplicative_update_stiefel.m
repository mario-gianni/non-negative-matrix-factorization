function [ A1,A2,X ] = multiplicative_update_stiefel( Y1,Y2,A1,A2,X,lambda1,lambda2,lambda3)
% MULTIPLICATIVE_UPDATE computes the multiplicative update rules according
% to Lee, D. Seung, H. S. Algorithms for non-negative matrix factorization
% taking into account the orthogonality constraint using true gradient
% (Stiefel manifold)
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

% A1 =  A1.*((Y1*X')./(lambda1*A1 + A1*(X*X')));
A1 =  A1.*((X*Y1')./(lambda1*A1' + (A1*(X*X'))'))';
% A1 = A1*diag(1./(sum(A1,1) + eps));
%A2 = A2.*((Y2*X')./(lambda2*A2 + A2*(X*X')));
A2 =  A2.*((X*Y2')./(lambda2*A2' + (A2*(X*X'))'))';
% A2 = A2*diag(1./(sum(A2,1) + eps));
X = X.*((A1'*Y1 + A2'*Y2)./(2*lambda3*X + X*Y1'*A1*X + X*Y2'*A2*X));
% X = X.*((Y1'*A1 + Y2'*A2)./((X'*X)*(Y1'*A1 + Y2'*A2)+lambda3*X'))';
% X = X*pinv(X'*X)*X';
end

