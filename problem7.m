% answers' choice range range
p = [sqrt(sqrt(3) + 4), sqrt(sqrt(3) - 1), sqrt(9 + (4 * sqrt(6))), ...
    sqrt(9 - sqrt(6))];

y = [0 1 0]';           h0 = .5;        % constant hypothesis

fprintf('\tOption\t\tConstant\tLinear\n');
for i = 1:length(p)
    X = [1 -1; 1 p(i); 1 1];            % Adding the intercept 1
    linearError = 0;                    % Use this to sum all linear errors
    
    % leave last point
    Xtrain = [1 -1; 1 p(i)];    yTrain = [0 1]';
    h1 = pinv(Xtrain' * Xtrain) * Xtrain' * yTrain;  % h1 (linear)
    % calculate squared errors on the cross validation point
    linearError = linearError + sum(((X(3, :) * h1) - ...
        y(3, :)).^2);

    % leave middle point
    Xtrain = [1 -1; 1 1];    yTrain = [0 0]';
    h1 = pinv(Xtrain' * Xtrain) * Xtrain' * yTrain;  % h1 (linear)
    % calculate squared errors on the cross validation point
    linearError = linearError + sum((([1 p(i)] * h1) - ...
        y(2, :)).^2);
    
    % leave first point
    Xtrain = [1 p(i); 1 1];    yTrain = [1 0]';
    h1 = pinv(Xtrain' * Xtrain) * Xtrain' * yTrain;  % h1 (linear)
    % calculate squared errors on the cross validation point
    linearError = linearError + sum(((X(1, :) * h1) - ...
        y(1, :)).^2);
    
    fprintf('\t%f\t%f\t%f\n', i, h0, linearError/ i);
end
