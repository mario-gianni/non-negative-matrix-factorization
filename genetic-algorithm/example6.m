clear all
close all

i1 = 5;
i2 = 7;
t = 4;
j = min([i1 i2 t]);
% save('matrices.mat','i1','i2','t','j');
% 
% max_int = 5;
% Y1 = randi(max_int+1,i1,t) - 1;
% Y2 = randi(max_int+1,i2,t) - 1;
lambda1 = 0.3;
lambda2 = 0.3;
lambda3 = 0.3;

options = gaoptimset('PopulationType', 'doubleVector');
ConstraintFunction = @simple_constraint;
options = gaoptimset(options,'CreationFcn',@create_permutations, ...
    'CrossoverFcn',@crossover_matrix, ...
    'MutationFcn',@mutate_matrix, ...
    'PlotFcns',{@gaplotbestf,@gaplotstopping},...
    'Generations',500,'PopulationSize',200, ...
    'StallGenLimit',200,'Vectorized','on','TolFun', 1.0000e-10);


FitnessFcn = @(x) objective_function(x,lambda1,lambda2,lambda3);

% ConstraintFunction = @(x) simple_constraint(x);
numberOfVariables = i1*j + i2*j + j*t + i1*t + i2*t; 
fprintf('Number of variables: %d\n', numberOfVariables);
LB = zeros(1,numberOfVariables);
[x,fval,reason,output] = ga(FitnessFcn,numberOfVariables,[],[],[],[],LB,[],[],options);

 A1 = reshape(x(1:i1*j),i1,j);
 A2 = reshape(x((i1*j+1):(i1*j+i2*j)),i2,j);
 X = reshape(x((i1*j+i2*j+1):((i1*j+i2*j+j*t))),j,t);
 Y1 = reshape(x((i1*j+i2*j+j*t+1):(i1*j+i2*j+j*t+i1*t)),i1,t);
 Y2 = reshape(x((i1*j+i2*j+j*t+i1*t+1):(i1*j+i2*j+j*t+i1*t+i2*t)),i2,t);
 
 sY1 = A1*X;
 sY2 = A2*X;
 error1 = 0.5 * norm(Y1 - sY1,'fro');
 error2 = 0.5 * norm(Y2 - sY2,'fro');

fprintf('The number of generations was : %d\n', output.generations);
fprintf('The number of function evaluations was : %d\n', output.funccount);
fprintf('The best function value found was : %g\n', fval);