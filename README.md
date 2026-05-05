# PRIMA-OptiProfiler-Benchmark
# README.md

## Repository Overview
This is a numerical experiment that benchmarks the PRIMA solver based on the OptiProfiler platform. The repository stores all files for the numerical optimization assignment, including **complete test codes, experimental reports, and original test results**.

## Repository Contents
- Test codes: MATLAB solver functions and benchmark scripts for two groups of comparison tests.
- Experimental report: Formal experimental description, result analysis and summary.
- Test results: Automatically generated output folders containing performance figures, log files and statistical data.

## Test Content
Two independent comparison tests are implemented:
1. **Test 1**: Performance comparison between `single-precision` and `double-precision` based on the PRIMA solver.
2. **Test 2**: Performance comparison between `double-precision` and `quadruple-precision` based on the PRIMA solver.

Both tests adopt two benchmark problem features:
- `plain`: Standard optimization problems without any perturbation.
- `noisy`: Optimization problems with random noise added to the objective function, used to test solver robustness.

## Testing Method
All experiments are conducted on the **OptiProfiler benchmark platform**.
Solvers are evaluated on optimization problems with dimensions from 2 to 20, covering unconstrained, bound-constrained, linearly constrained and nonlinearly constrained (`ubln`) cases. The performance and robustness of solvers under different precision levels are compared and analyzed.

## Source and Acquisition of Dependencies
### PRIMA
PRIMA is a derivative-free optimization solver for solving optimization problems.
Users can obtain the official source code and release package from its official repository https://github.com/libprima/prima.

### OptiProfiler
OptiProfiler is a general benchmark platform designed for systematic evaluation and comparison of optimization solvers.
Users can download the official toolkit from its official repository  https://github.com/optiprofiler/optiprofiler.

## Experiment Reproduction
1. Clone or download this entire repository locally.
2. Place the downloaded **PRIMA** and **OptiProfiler** folders in **the same parent directory** as this repository folder.
3. Add all related folders to the MATLAB search path.
4. Run the corresponding test scripts directly and all experimental processes and results can be reproduced.
