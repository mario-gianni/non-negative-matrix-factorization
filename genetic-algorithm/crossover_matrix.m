function xoverKids  = crossover_matrix(parents,options,NVARS,FitnessFcn,thisScore,thisPopulation)
%   CROSSOVER_MATRIX  crossover function for non-negative matrix factorization.
%   XOVERKIDS = CROSSOVER_MATRIX(PARENTS,OPTIONS,NVARS, ...
%   FITNESSFCN,THISSCORE,THISPOPULATION) crossovers PARENTS to produce
%   the children XOVERKIDS.
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

%   Copyright 2015 Mario Gianni - Alcor.
% parents
% size(parents)
%fprintf('Number of parents for crossover: %d\n', length(parents));
nKids = length(parents)/2;
%fprintf('Number of kids : %d\n', nKids);
xoverKids = zeros(nKids,NVARS); % Normally zeros(nKids,NVARS);
index = 1;
% i1 = NVARS(1);
% i2 = NVARS(2);
% j = NVARS(3);
% t = NVARS(4);
i1 = 5;
i2 = 7;
t = 4;
j = min([i1 i2 t]);


for i=1:nKids
    % here is where the special knowledge that the population is a cell
    % array is used. Normally, this would be thisPopulation(parents(index),:);
    parent1 = thisPopulation(parents(index),:);
    parent2 = thisPopulation(parents(index+1),:);
    if i == 1
        %fprintf('Length of the parent individual 1 for crossover: %d\n', length(parent1));
        %fprintf('Length of the parent individual 2 for crossover: %d\n', length(parent2));
    end
    parentA11 = reshape(parent1(1:i1*j),i1,j);
    
    parentA12 = reshape(parent2(1:i1*j),i1,j);
    
    parentA21 = reshape(parent1((i1*j+1):(i1*j+i2*j)),i2,j);
    
    parentA22 = reshape(parent2((i1*j+1):(i1*j+i2*j)),i2,j);
    
    parentX1 = reshape(parent1((i1*j+i2*j+1):((i1*j+i2*j+j*t))),j,t);
    
    parentX2 = reshape(parent2((i1*j+i2*j+1):((i1*j+i2*j+j*t))),j,t);
    
    Y1 = reshape(parent1((i1*j+i2*j+j*t+1):(i1*j+i2*j+j*t+i1*t)),i1,t);
    Y2 = reshape(parent1((i1*j+i2*j+j*t+i1*t+1):(i1*j+i2*j+j*t+i1*t+i2*t)),i2,t);
    
%     a1 = Y1 - parentA11*parentX1;
%     a2 = Y2 - parentA21*parentX1;
%     
%     a3 = Y1 - parentA12*parentX2;
%     a5 = Y2 - parentA22*parentX2;
    
%    save('matrices.mat','Y1','Y2','parentA11','parentA21','parentA12','parentA22','parentX1','parentX2','-append');
    
%       childA1 = [parentA11(:,1:ceil(j/2)) parentA12(:,(ceil(j/2)+1):end)] + 0.1*rand(i1,j);
%       childA2 = [parentA21(:,1:ceil(j/2)) parentA22(:,(ceil(j/2)+1):end)] + 0.1*rand(i2,j);
%       childX = [parentX1(:,1:ceil(t/2)) parentX2(:,(ceil(t/2)+1):end)] + 0.1*rand(j,t);

    [childA1,childA2,childX] = getChild(Y1,Y2,parentA11,parentA12,parentA21,parentA22,parentX1,parentX2);
        
    xoverKids(i,:) = [childA1(:);childA2(:);childX(:);Y1(:);Y2(:)]';
    if(i == 1)
        %fprintf('Length of a kid individual: %d\n', length(xoverKids(i,:)));
    end
    
    index = index + 2;

end