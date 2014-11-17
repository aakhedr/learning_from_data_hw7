%% problem 8 and 9
svm_better = 0;         N = 100;

for i = 1:1000
    [X, y] = buildDataSet(N);
    while sum(y) == -1 * length(y) || sum(y) == length(y)
        [X, y] = buildDataSet(N);
    end
    PLA_pred = PLA(X, y);
    
    model = svmtrain(X, y);
    svm_pred = svmclassify(model, X);
    
    if (length(svm_pred(svm_pred~=y))/ length(y)) < ...
            (length(PLA_pred(PLA_pred~=y))/ length(y))
        svm_better = svm_better + 1;
    end
end

%%
fprintf('SVM better than PLA: %f of the times\n', svm_better/ 1000);
%%