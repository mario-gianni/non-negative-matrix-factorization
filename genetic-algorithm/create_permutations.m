function pop = create_permutations(NVARS,FitnessFcn,options)
%CREATE_PERMUTATIONS Creates a population of both basis and source matrices.
%   POP = CREATE_PERMUTATION(NVARS,FITNESSFCN,OPTIONS) creates a population
%  of both basis and source matrices POP each with a size of NVARS. 
%
%   The arguments to the function are 
%     NVARS: is a vector of 4 elements in which 
%            NVARS(1) -> number of rows i1 basis matrix A1 
%            NVARS(2) -> number of rows i2 basis matrix A2  
%            NVARS(3) -> number of rows j source matrix X  
%            NVARS(4) -> number of columns t source matrix X  
%     FITNESSFCN: Fitness function 
%     OPTIONS: Options structure used by the GA

%   Copyright 2015 Mario Gianni - Alcor.

totalPopulationSize = sum(options.PopulationSize);
%fprintf('Population size : %d\n', totalPopulationSize);
i1 = 5;
i2 = 7;
t = 4;
j = min([i1 i2 t]);
max_int = 5;
Y1 = randi(max_int+1,i1,t) - 1;
Y2 = randi(max_int+1,i2,t) - 1;

pop = zeros(totalPopulationSize,NVARS);

rng('shuffle');

for i = 1:totalPopulationSize
    A1 = rand(i1,j); % A1 = rand(i1,j);
    A2 = rand(i2,j); % A2 = rand(i2,j);
    X = rand(j,t); %X = rand(j,t);
    % X = eye(j,t) + rand(j,t);
    % X = X(:,randperm(t));
    % X = sqrtm(pinv(X*X'))*X;
    pop(i,:) = [A1(:);A2(:);X(:);Y1(:);Y2(:)]';
    if i == 1
       % fprintf('Length of an individual: %d\n', length(pop(i,:)));
    end
end