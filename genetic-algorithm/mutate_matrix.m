function mutationChildren = mutate_matrix(parents ,options,NVARS,FitnessFcn, state, thisScore,thisPopulation,mutationRate)
%   MUTATE_MATRIX mutation function for non-negative matrix factorization.
%   MUTATIONCHILDREN = MUTATE_PERMUTATION(PARENTS,OPTIONS,NVARS, ...
%   FITNESSFCN,STATE,THISSCORE,THISPOPULATION,MUTATIONRATE) mutate the
%   PARENTS to produce mutated children MUTATIONCHILDREN.
%
%   The arguments to the function are 
%     PARENTS: Parents chosen by the selection function
%     OPTIONS: Options structure created from GAOPTIMSET
%     NVARS: is a vector of 4 elements in which 
%            NVARS(1) -> number of rows i1 basis matrix A1 
%            NVARS(2) -> number of rows i2 basis matrix A2  
%            NVARS(3) -> number of rows j source matrix X  
%            NVARS(4) -> number of columns t source matrix X
%     FITNESSFCN: Fitness function 
%     STATE: State structure used by the GA solver 
%     THISSCORE: Vector of scores of the current population 
%     THISPOPULATION: Matrix of individuals in the current population
%     MUTATIONRATE: Rate of mutation

%   Copyright 2015 Mario Gianni - Alcor.

% Here we swap two elements of the permutation
i1 = 5;
i2 = 7;
t = 4;
j = min([i1 i2 t]);
lambda1 = 0.3;
lambda2 = 0.3;
lambda3 = 0.3;
%fprintf('Number of parents for mutation: %d\n', length(parents));
mutationChildren = zeros(length(parents),NVARS);% Normally zeros(length(parents),NVARS);

for i=1:length(parents)
    
    parent = thisPopulation(parents(i),:);
    if(i==1)
        %fprintf('Length of the parent individual for mutation: %d\n', length(parent));
    end
    
    A1 = reshape(parent(1:i1*j),i1,j);
    A2 = reshape(parent((i1*j+1):(i1*j+i2*j)),i2,j);
    X = reshape(parent((i1*j+i2*j+1):((i1*j+i2*j+j*t))),j,t);
    Y1 = reshape(parent((i1*j+i2*j+j*t+1):(i1*j+i2*j+j*t+i1*t)),i1,t);
    Y2 = reshape(parent((i1*j+i2*j+j*t+i1*t+1):(i1*j+i2*j+j*t+i1*t+i2*t)),i2,t);
    
%     childA1 = flipud(A1);
%     childA1 = fliplr(childA1);
%     
%     childA2 = flipud(A2);
%     childA2 = fliplr(childA2);
%     
%     childX = flipud(X);
%     childX = fliplr(childX);

    A1 = A1.*((Y1*X')./(lambda1*A1 + A1*(X*X')));
    A2 = A2.*((Y2*X')./(lambda2*A2 + A2*(X*X')));
%    A1 = A1*diag(1./sum(A1,1));
%    A2 = A2*diag(1./sum(A2,1));
%    X = X.*((A1'*Y1 + A2'*Y2)./(lambda3*X + A1'*A1*X + A2'*A2*X));
    X = X.*((A1'*Y1 + A2'*Y2)./(2*lambda3*X + X*Y1'*A1*X + X*Y2'*A2*X));

%    X = X*diag(1./sum(X,2));
%    X = X*pinv(X'*X)*X';
    
%    mutationChildren(i,:) = [childA1(:); childA2(:);childX(:);Y1(:);Y2(:)]';
    mutationChildren(i,:) = [A1(:); A2(:);X(:);Y1(:);Y2(:)]';
    if(i==1)
        %fprintf('Length of the mutatued child: %d\n', length(mutationChildren(i,:)));
    end
end