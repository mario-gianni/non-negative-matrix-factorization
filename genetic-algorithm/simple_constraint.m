function [c, ceq] = simple_constraint(x)
c = [];
n = length(x);
ceq = [];
for i = 1 : n
    ceq = [ceq; -x(i)];
end
