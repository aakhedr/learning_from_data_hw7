%% problems 3, 4
data = load('train.txt');
% training
X = data(26:end, 1:2);            y = data(26:end, 3);
% validation
Xval = data(1:25, 1:2);       yVal = data(1:25, 3);
% test set
test = load('test.txt');
Xtest = test(:, 1:2);           yTest = test(:, 3);
% linear transform
X = transform(X);               Xval = transform(Xval);
Xtest = transform(Xtest);

fprintf('\tk\t\tEin\t\tEval\t\tEout\n');
for i = 3:7
    % train each model
    Xtrain = X(:, 1:i);         m = size(Xtrain, 1);
    Xtrain = [ones(m, 1) Xtrain];
    w = pinv(Xtrain' * Xtrain) * Xtrain' * y;
    y_train_est = sign(Xtrain * w);
    
    Ein = length(y_train_est(y_train_est~=y))/ length(y);
    
    % validate each model
    Xvalidate = Xval(:, 1:i);   n = size(Xvalidate, 1);
    Xvalidate = [ones(n, 1) Xvalidate];
    y_val_est = sign(Xvalidate * w);
    
    Eval = length(y_val_est(y_val_est~=yVal))/ length(yVal);
    
    % check each model with against test set (out of sample)
    XtestSet = Xtest(:, 1:i);      l = size(XtestSet, 1);
    XtestSet = [ones(l, 1) XtestSet];
    y_test_est = sign(XtestSet * w);
    
    Eout = length(y_test_est(y_test_est~=yTest))/ length(yTest);
    
    fprintf('\t%f\t%f\t%f\t%f\n', i, Ein, Eval, Eout);
end  
%%