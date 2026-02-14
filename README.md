# RLDDM

## Overview

`RLDDM` is an R package that provides a computational framework for modeling decision-making processes by combining reinforcement learning (RL) and the drift-diffusion model (DDM) using frequentist methods. This package is designed to model cognitive and behavioral data, providing an efficient way to estimate parameters and make predictions in decision-making tasks. For more details on the RL-DDM framework, see [Pedersen et al. (2017)](https://doi.org/10.3758/s13423-016-1199-y) (for Bayesian methods) and [Bian et al. (2025)](https://doi.org/10.1214/25-AOAS2112) (for frequentist methods).

### Features

- Integration of RL and DDM to model decision-making processes.
- Supports frequentist methods for parameter estimation and model fitting.
- Flexible framework for analyzing both experimental and real-world decision-making data.

### Extensions

Future versions of `RLDDM` will include extensions incorporating Hidden Markov Models (HMMs) to model latent state switching in decision-making tasks. Stay tuned for updates! For details on the RL-HMM-DDM framework, refer to [Bian et al. (2025)](https://doi.org/10.1214/25-AOAS2112).

## Installation

To install the latest version of `RLDDM` from GitHub, use the following command:

```r
remotes::install_github("krisyuanbian/RLDDM")
```

## Usage

More details on usage will be provided in upcoming releases. Stay tuned!

## Reference

Pedersen, M.L., Frank, M.J., and Biele, G. (2017). A Bayesian approach to reinforcement learning and drift-diffusion models. *Psychonomic Bulletin & Review*, 24(4), 1234–1251. https://doi.org/10.3758/s13423-016-1199-y

Bian, Y., Guo, X., and Wang, Y. (2025). Reinforcement learning and drift-diffusion models for decision-making: A frequentist framework, *The Annals of Applied Statistics*, 19(4), 3372-3393. https://doi.org/10.1214/25-AOAS2112
