function [SimpsonsDelta, NewtonsDelta] = CompareResults(a, b, A, B0, B)
if (a == b)
    error ("a equals b!")
end
SimpsonsDelta = abs(SimpsonsRule(a, b, A, B0, B) - ExactSolution(a, b, A, B0, B));
NewtonsDelta = abs(NewtonsRule(a, b, A, B0, B) - ExactSolution(a, b, A, B0, B));
end