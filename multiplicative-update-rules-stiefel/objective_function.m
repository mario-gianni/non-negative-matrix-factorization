function e = objective_function( Y1,Y2,A1,A2,X )
%OBJECTIVE_FUNCTION computes the value of the objective fuction to be
%minimized
%   INPUT:
%       Y1 i1 x t observation matrix
%       Y2 i2 x t observation matrix
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix
%   OUTPUT:
%       e error

e = 0.5 * (norm(Y1 - A1*X,'fro') + norm(Y2 - A2*X,'fro')); 

end


