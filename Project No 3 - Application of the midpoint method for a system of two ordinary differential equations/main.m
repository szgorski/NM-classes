%% interface for a user calling implemented methods

% USER INPUT
% initial values for calculation:
h = 0.01;     % size of a step
x0 = 0;       % initial argument
xf = 5;       % final argument
              % function is approximated in domain D = [x0, xf]
y01 = 6;      % value of 1st equation in x0
y02 = 12;     % value of 2nd equation in x0

% inserting differential equations as symbolic functions
f1 = @(y1, y2, x) 4*y1 + 4*y2;
f2 = @(y1, y2, x) -8*y1 - 4*y2;

% COMPUTATION
[Y1, Y2, X] = prediction(f1, f2, y01, y02, x0, xf, h)