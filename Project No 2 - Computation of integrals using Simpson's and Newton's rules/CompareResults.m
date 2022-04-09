%I certify that this assignment is entirely my work,
%performed independently and without any help
%from the sources which are not allowed.
%Szymon Górski

function [SimpsonsDelta, NewtonsDelta] = CompareResults(a, b, A, B0, B)
if (a == b)
    error ("a equals b!")
end
SimpsonsDelta = abs(SimpsonsRule(a, b, A, B0, B) - ExactSolution(a, b, A, B0, B));
NewtonsDelta = abs(NewtonsRule(a, b, A, B0, B) - ExactSolution(a, b, A, B0, B));
end