%% calculating the first step from initial values using the Heun's method
function [y11, y12] = heun(f1, f2, y01, y02, x0, s)

% py (predicting y's) - applying the Euler method to estimate 
% the value of y's in the next step (general formula)
% ya (approximated y) - value of approximated y in the initial step
py = @(ya, y1, y2, x, h, f) ya + h * f(y1, y2, x);

% predicting for the first step (Y1)
p11 = py(y01, y01, y02, x0, s, f1);
p12 = py(y02, y01, y02, x0, s, f2);

% cy (correcting y's) - applying calculated estimation 
% into the correcting function (general formula)
cy = @(ya, y1, y2, x, h, f, p1, p2) ya + (h / 2) * (f(y1, y2, x) + f(p1, p2, x + h));

% correcting for the first step
y11 = cy(y01, y01, y02, x0, s, f1, p11, p12);
y12 = cy(y02, y01, y02, x0, s, f2, p11, p12);

end
