function test2()
% TEST1 Benchmark PRIMA double vs quadruple precision
%
% This function performs Test 1 required by the assignment using OptiProfiler.
% It benchmarks two versions of the PRIMA solver:
%     prima_double: PRIMA with precision set to 'double'
%     prima_quadruple: PRIMA with precision set to 'quadruple'
%
% Test configuration:
% - Problem type: 'ubln' (unconstrained, bound-, linearly-, nonlinearly-constrained)
% - Problem dimension: from 2 to 20
% - Problem feature: 'plain' and 'noisy'

addpath('../solvers');

    %% Start test2_plain.
    fprintf('\nThis is a test to benchmark prima with double and quadruple precision with the "plain" feature.\n');
    fprintf('\nStart test2_plain...\n\n');

    options = struct();
    options.ptype = 'ubln';    % Test unconstrained, box-constrained, linearly constrained and nonlinearly constrained optimization problems. 
    options.mindim = 2;     % Select problems with dimension at least 2.
    options.maxdim = 20;     % Select problems with dimension at most 20.
    options.feature_name = 'plain';    % Choose the 'plain' feature.
 
    scores_plain = benchmark({@prima_double, @prima_quadruple}, options)

   %% Start test2_noisy.
    fprintf('\nThis is a test to benchmark prima with double and quadruple precision with the "noisy" feature.\n');
    fprintf('\nStart test2_noisy...\n\n');

    options = struct();
    options.ptype = 'ubln';    % Test unconstrained, box-constrained, linearly constrained and nonlinearly constrained optimization problems. 
    options.mindim = 2;     % Select problems with dimension at least 2.
    options.maxdim = 20;     % Select problems with dimension at most 20.
    options.feature_name = 'noisy';    % Choose the 'noisy' feature.
 
    scores_noisy = benchmark({@prima_double, @prima_quadruple}, options)
end