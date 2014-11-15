%% problem 1
data = load('train.txt');
% training
X = data(1:25, 1:2);            y = data(1:25, 3);
% validation
Xval = data(26:end, 1:2);       yVal = data(26:end, 3);
% linear transform
X = transform(X);               Xval = transform(Xval);
fprintf('\tk\t\tEin\t\tEval\n');
for i = 3:7
    Xtrain = X(:, 1:i);         m = size(Xtrain, 1);
    Xtrain = [ones(m, 1) Xtrain];
    w = pinv(Xtrain' * Xtrain) * Xtrain' * y;
    y_train_est = sign(Xtrain * w);
    
    Ein = length(y_train_est(y_train_est~=y))/ length(y);
    
    Xvalidate = Xval(:, 1:i);   n = size(Xvalidate, 1);
    Xvalidate = [ones(n, 1) Xvalidate];
    
    y_val_est = sign(Xvalidate * w);
    Eval = length(y_val_est(y_val_est~=yVal))/ length(yVal);
    
    fprintf('\t%f\t%f\t%f\n', i, Ein, Eval);
end
    
    