function [ A1,A2,X ] = initialization( i1,i2,t )
% INITIIALIZATION creates three random matices
%   INPUT:
%       i1 num of rows of A1
%       i2 num of rows of A2
%       t num of column of X
%   OUTPUT:
%       A1 i1 x j matrix
%       A2 i2 x j matrix
%       X j x t matrix

j = 2;%min([i1 i2 t]);
A1 = rand(i1,j);
A2 = rand(i2,j);
X = rand(j,t);
% X = sqrtm(pinv(X*X'))*X;

end

