% answers' choice range range
p = [sqrt(sqrt(3) + 4), sqrt(sqrt(3) - 1), sqrt(9 + (4 * sqrt(6))), ...
    sqrt(9 - sqrt(6))];

y = [0 1 0];

fprintf('\tOption\t\tLinear\n');
for i = 1:length(p)
    Xtrain = [1 -1 p(i) 1];         % Adding the intercept 1
    h1 = pinv(Xtrain' * Xtrain) * Xtrain' * y;
    
    linear = 1/ length(p) * (((Xtrain * h1) - y).^2);
    fprintf('\t%f\t%f\n', i, linear);
end
