function e = objective_function( Y1,Y2,A1,A2,X,alpha1,alpha2)
%OBJECTIVE_FUNCTION computes the value of the objective fuction to be
%minimized
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%       alpha1 i1 x 1 offset vector for Y1
%       alpha2 i2 x 1 offset vector for Y2
%   OUTPUT:
%       e error

[j,t] = size(X);
e = 0.5 * (norm(Y1 - A1*X - alpha1*ones(t,1)','fro') + norm(Y2 - A2*X - alpha2*ones(t,1)','fro')); 

end

