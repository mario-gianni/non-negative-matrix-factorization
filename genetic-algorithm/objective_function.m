function scores = objective_function(x,lambda1,lambda2,lambda3)
%   Copyright 2004-2007 The MathWorks, Inc.
i1 = 5;
i2 = 7;
t = 4;
j = min([i1 i2 t]);
scores = zeros(size(x,1),1);
for k = 1:size(x,1)
    % here is where the special knowledge that the population is a cell
    % array is used. Normally, this would be pop(j,:);
    parent = x(k,:);
    A1 = reshape(parent(1:i1*j),i1,j);
    A2 = reshape(parent((i1*j+1):(i1*j+i2*j)),i2,j);
    X = reshape(parent((i1*j+i2*j+1):((i1*j+i2*j+j*t))),j,t);
    Y1 = reshape(parent((i1*j+i2*j+j*t+1):(i1*j+i2*j+j*t+i1*t)),i1,t);
    Y2 = reshape(parent((i1*j+i2*j+j*t+i1*t+1):(i1*j+i2*j+j*t+i1*t+i2*t)),i2,t);
   
    scores(k) = 0.5 * (norm(Y1 - A1*X,'fro') + norm(Y2 - A2*X,'fro'));% + lambda1*norm(A1,2) + lambda2*norm(A2,2) + lambda3*norm(X,2));
end