%% problem 1
data = load('train.txt');
% training
X = data(1:25, 1:2);      y = data(1:25, 3);
% validation
Xval = data(25:end, 1:2);       yVal = data(26:end, 3);

