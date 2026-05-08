function nd_rosenbrock_example(n)

%==========================================================================
% nd_rosenbrock_example.m
% Purpose: Minimize n-dimensional chained Rosenbrock function using PRIMA
% Test 4 cases: unconstrained, bound, linear, and nonlinear constraints
%
% Usage: nd_rosenbrock_example(n) (n = dimension)
%
% Modified from: https://github.com/libprima/prima/tree/main/matlab/examples/rosenbrock_example.m
%==========================================================================

if nargin < 1
    error('Please specify the dimension n, e.g., rosenbrock_example(5)');
end

fprintf('\nMinimize the chained Rosenbrock function with n variables subject to various constraints:\n');
x0 = -ones(n, 1);    % starting point

fprintf('\n1. No constraints:\n');
[x, fx, exitflag, output] = prima(@chrosen, x0)

fprintf('\n2. Bound constraints --- x <= 0:\n');
ub = zeros(n, 1);
[x, fx, exitflag, output] = prima(@chrosen, x0, [], [], [], [], [], ub)

fprintf('\n3. Linear constraints --- sum(x) <= 1, x >= 0:\n');
Aineq = ones(1, n);
bineq = 1;
lb = zeros(n, 1);
[x, fx, exitflag, output] = prima(@chrosen, x0, Aineq, bineq, [], [], lb, [])

fprintf('\n4. Nonlinear constraints --- sum(x^2) <= 1, x >= 0:\n');
lb = zeros(n, 1);
% nonlinear constraints
nonlcon = @nlc;  % see function nlc given below
[x, fx, exitflag, output] = prima(@chrosen, x0, [], [], [], [], lb, [], nonlcon)


return


function f = chrosen(x)  % the subroutine defining the objective function
f = sum( 100*(x(2:end)-x(1:end-1).^2).^2 + (1-x(1:end-1)).^2 );
return


function [cineq, ceq] = nlc(x)  % the subroutine defining the nonlinear constraints
% The same as fmincon, nonlinear constraints cineq(x) <= 0 and ceq(x) = 0 are specified
% by a function with two returns, the first being cineq and the second being ceq.
cineq = sum(x.^2) - 1;   % Nonlinear inequality: sum(x^2) <= 1
ceq = []; % No nonlinear equality constraints
return