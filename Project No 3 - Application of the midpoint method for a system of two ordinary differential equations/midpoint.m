%% estimating values of functions in consecutive points using the midpoint method
function [Y1, Y2, X] = midpoint(f1, f2, Y1, Y2, X, xf, s)

% my (midpoint y's) - applying the midpoint method to estimate 
% the value of y's in the next step (general formula)
% ya (approximated y) - value of approximated y two steps back
my = @(ya, y1, y2, x, h, f) ya + 2 * h * f(y1, y2, x);

i = 2; % an interator counting steps
while X(i) + s <= xf
    i = i + 1;
    X(i) = X(i - 1) + s;
    Y1(i) = my(Y1(i - 2), Y1(i - 1), Y2(i - 1), X(i - 1), s, f1);
    Y2(i) = my(Y2(i - 2), Y1(i - 1), Y2(i - 1), X(i - 1), s, f2);
end

end
