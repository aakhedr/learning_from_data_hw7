%%
function [pred] = PLA(X, y)
    % initialize weights and add bias term to x
    X = [ones(size(X, 1), 1) X];	w = zeros(size(X, 2), size(y, 2)); 

    % calculate y predictions according to w
    pred = sign(X * w);

    % identify misclassifications
    [row] = find(pred~=y);

    num_iters = 0;
    while num_iters < 100
        num_iters = num_iters + 1;
        index = ceil(rand * length(row));
        if index == 0
            break;
        end

        w = w + (y(index) * X(index, :))';		% update weights
        pred = sign(X * w);
        [row] = find(pred ~= y);
    end
end
%%