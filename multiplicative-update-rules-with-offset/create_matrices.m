function [Y1,Y2] = create_matrices(i1,i2,t,max_int)
% CREATE_MATRICES create two element-wise positive matrices
%   INPUT:
%       i1 num of rows of Y1
%       i2 num of rows of Y2
%       t num of column of both Y1 and Y2
%       max_int maximum value of each matrix entry, starting from zero
%   OUTPUT:
%       Y1 i1 x t matrix
%       Y2 i2 x t matrix

Y1 = randi(max_int+1,i1,t) - 1;
Y2 = randi(max_int+1,i2,t) - 1;

end

