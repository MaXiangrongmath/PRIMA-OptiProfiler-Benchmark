# PRIMA-OptiProfiler-Benchmark
# README.md

## Repository Overview
A systematic numerical experiment repository evaluating the PRIMA derivative-free optimization solver across varying dimensions, constraints, and floating-point precisions.

## Repository Contents
- Test codes: MATLAB solver functions and benchmark scripts for two groups of comparison tests.
- Experimental report: Formal experimental description, result analysis and summary.
- Test results: Automatically generated output figures.

## Test Content
### Task 1: Dimensionality and Constraint Testing (Chained Rosenbrock)
This task evaluates how PRIMA dynamically handles different constraints and scales with problem dimensionality. We minimize the chained Rosenbrock function under four scenarios:
1. **Unconstrained** 
2. **Bound-constrained**: $x \le 0$ 
3. **Linearly-constrained**: $\sum x \le 1, x \ge 0$
4. **Nonlinearly-constrained**: $\sum x^2 \le 1, x \ge 0$
   
Each scenario is tested across three spatial dimensions: $n = 5, 10,$ and $20$.

### Task 2: Precision Benchmarking with OptiProfiler
This task benchmarks the efficiency of PRIMA under different internal floating-point precisions using the OptiProfiler framework. Solvers are evaluated on `ubln` optimization problems (dimensions 2 to 20).
- **Comparison Group 1**: `single-precision` vs. `double-precision`.
- **Comparison Group 2**: `double-precision` vs. `quadruple-precision`.

Both groups are evaluated under two distinct feature sets:
- `plain`: Standard deterministic optimization problems without any perturbation.
- `noisy`: Problems with random Gaussian noise added to the objective function, designed to test the solver's robustness and fault tolerance.
  
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

⚠️ Note that running the scripts under Ubuntu 24.04 with MATLAB R2025 may cause MATLAB to crash unexpectedly. I have not found a solution to this issue. If you have any suggestions or solutions, please feel free to contact me.
