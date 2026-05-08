function x = prima_double(fun, x0, xl, xu, Aineq, bineq, Aeq, beq, cub, ceq)
%PRIMA_DOUBLE  Wrap PRIMA solver with single precision for OptiProfiler
%   This function adapts PRIMA to the interface required by OptiProfiler,
%   supporting all problem types (unconstrained, bound-constrained, 
%   linearly constrained, nonlinearly constrained) with double precision.

    % Configure PRIMA options: use double precision
    opts = struct();
    opts.precision = 'double';

    % Determine the problem type based on the number of input arguments
    narginchk(2, 10); % OptiProfiler passes 2, 4, 8, or 10 arguments

    if nargin == 2
        % Case 1: Unconstrained problem (fun, x0)
        Aineq = []; bineq = [];
        Aeq = []; beq = [];
        xl = []; xu = [];
        nonlcon = [];
    elseif nargin == 4
        % Case 2: Bound-constrained problem (fun, x0, xl, xu)
        Aineq = []; bineq = [];
        Aeq = []; beq = [];
        nonlcon = [];
    elseif nargin == 8
        % Case 3: Linearly constrained problem (fun, x0, xl, xu, aub, bub, aeq, beq)
        nonlcon = [];
    elseif nargin == 10
        % Case 4: Nonlinearly constrained problem (fun, x0, xl, xu, aub, bub, aeq, beq, cub, ceq)
        % Wrap the nonlinear constraint functions into PRIMA's required format
        nonlcon = @(x) deal(cub(x), ceq(x));
    end

    % Call PRIMA with the mapped inputs and options
    x = prima(fun, x0, Aineq, bineq, Aeq, beq, xl, xu, nonlcon, opts);

end