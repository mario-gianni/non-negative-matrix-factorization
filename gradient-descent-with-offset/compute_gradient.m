function [ dA1,dA2,dX,dalpha1,dalpha2 ] = compute_gradient( Y1,Y2,A1,A2,X,alpha1,alpha2,lambda1,lambda2,lambda3,lambda4,lambda5)
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
%       lambda4 regulrization parameter of alpha1
%       lambda5 regulrization parameter of alpha2
%   OUTPUT:
%       dA1 gradient with respect to A1
%       dA2 gradient with respect to A2
%       dX gradient with respect to X
%       dalpha1 gradient with respect to alpha1
%       dalpha2 gradient with respect to alpha2

[j,t] = size(X);

dA1 = lambda1*A1 - (Y1 - A1*X - alpha1*ones(t,1)')*X';
dA2 = lambda2*A2 - (Y2 - A2*X - alpha2*ones(t,1)')*X';
dX = lambda3*X - A1'*(Y1 - A1*X- alpha1*ones(t,1)') - A2'*(Y2 - A2*X- alpha2*ones(t,1)');
dalpha1 = lambda4*alpha1 - (Y1 - A1*X- alpha1*ones(t,1)')*ones(t,1);
dalpha2 = lambda5*alpha2 - (Y2 - A2*X- alpha2*ones(t,1)')*ones(t,1);

end

