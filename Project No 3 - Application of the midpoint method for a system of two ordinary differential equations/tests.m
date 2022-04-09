%% evaluation of predictions against a built-in solver
%% TEST 1

% initial values for calculation:
h = 0.01;     % size of a step
x0 = 3;       % initial argument
xf = 5;       % final argument
              % function is approximated in domain D = [x0, xf]
y01 = 2;      % value of 1st equation in x0
y02 = 5;      % value of 2nd equation in x0

% differential equations as symbolic functions
f1 = @(y1, y2, x) -5*y1 - 2*y2;
f2 = @(y1, y2, x) y1 + 5*y2;

% using the implemented prediction methods
[Y1, Y2, X] = prediction(f1, f2, y01, y02, x0, xf, h);

% plotting the results
plot(X, Y1)
hold on
plot(X, Y2)
grid on
legend('y1', 'y2')
title(sprintf('Runge-Kutta methods, N = %.0f', size(X, 2) - 1))
hold off

% using the built-in function to numerically solve the system of equations
[SX, SY] = ode45(@S1, [x0 xf], [y01 y02]);

% plotting the results
plot(SX, SY)
grid on
legend('y1', 'y2')
title(sprintf('ode45, N = %.0f', size(SX, 1) - 1))

%% TEST 2

h = 0.05; x0 = 1; xf = 2; y01 = 2; y02 = 2000;

f1 = @(y1, y2, x) 2*y1 + 3*y2 + x;
f2 = @(y1, y2, x) 5*y1 - 5*y2 - 10*x;

[Y1, Y2, X] = prediction(f1, f2, y01, y02, x0, xf, h);

plot(X, Y1)
hold on
plot(X, Y2)
grid on
legend('y1', 'y2')
title(sprintf('Runge-Kutta methods, N = %.0f', size(X, 2) - 1))
hold off

[SX, SY] = ode45(@S2, [x0 xf], [y01 y02]);

plot(SX, SY)
grid on
legend('y1', 'y2')
title(sprintf('ode45, N = %.0f', size(SX, 1) - 1))

%% TEST 3

h = 0.01; x0 = 0; xf = 2.2; y01 = 1; y02 = 1;

f1 = @(y1, y2, x) 2*y1 - 5*y2;
f2 = @(y1, y2, x) 5*y1 + 10*y2;

[Y1, Y2, X] = prediction(f1, f2, y01, y02, x0, xf, h);

plot(X, Y1)
hold on
plot(X, Y2)
grid on
legend('y1', 'y2')
title(sprintf('Runge-Kutta methods, N = %.0f', size(X, 2) - 1))
hold off

[SX, SY] = ode45(@S3, [x0 xf], [y01 y02]);

plot(SX, SY)
grid on
legend('y1', 'y2')
title(sprintf('ode45, N = %.0f', size(SX, 1) - 1))

%% TEST 4

h = 0.01; x0 = 0; xf = 5; y01 = 6; y02 = 12;

f1 = @(y1, y2, x) 4*y1 + 4*y2;
f2 = @(y1, y2, x) -8*y1 - 4*y2;

[Y1, Y2, X] = prediction(f1, f2, y01, y02, x0, xf, h);

plot(X, Y1)
hold on
plot(X, Y2)
grid on
legend('y1', 'y2')
title(sprintf('Runge-Kutta methods, N = %.0f', size(X, 2) - 1))
hold off

[SX, SY] = ode45(@S4, [x0 xf], [y01 y02]);

plot(SX, SY)
grid on
legend('y1', 'y2')
title(sprintf('ode45, N = %.0f', size(SX, 1) - 1))

%% FUNCTIONS
% used in bulit-in numerical solvers

function dydx = S1(x, Y)
dydx = zeros(2, 1);
dydx(1) = -5*Y(1) - 2*Y(2);
dydx(2) = Y(1) + 5*Y(2);
end

function dydx = S2(x, Y)
dydx = zeros(2, 1);
dydx(1) = 2*Y(1) + 3*Y(2) + x;
dydx(2) = 5*Y(1) - 5*Y(2) - 10*x;
end

function dydx = S3(x, Y)
dydx = zeros(2, 1);
dydx(1) = 2*Y(1) - 5*Y(2);
dydx(2) = 5*Y(1) + 10*Y(2);
end

function dydx = S4(x, Y)
dydx = zeros(2, 1);
dydx(1) = 4*Y(1) + 4*Y(2);
dydx(2) = -8*Y(1) - 4*Y(2);
end