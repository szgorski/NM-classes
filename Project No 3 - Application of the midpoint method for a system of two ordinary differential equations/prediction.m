%% estimating values of functions using both Heun's and midpoint methods
function [Y1, Y2, X] = prediction(f1, f2, y01, y02, x0, xf, h)

% calculating values in the first step using the Heun's method
[y11, y12] = heun(f1, f2, y01, y02, x0, h);

% tables of calculated values for given arguments
% capital letters were used to label tables in order not to confuse them
% with arguments of symbolic functions
X = [x0, x0 + h];
Y1 = [y01, y11];
Y2 = [y02, y12];

% calculating remaining values using the midpoint method
[Y1, Y2, X] = midpoint(f1, f2, Y1, Y2, X, xf, h);

% plotting the results
plot(X, Y1)
hold on
plot(X, Y2)
grid on
legend('y1', 'y2')
hold off

end
