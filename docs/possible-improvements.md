# Possible Improvements (Not Applied)

> **Important:** none of the items below have been applied. The code in [`src/`](../src/) is kept
> exactly as it was originally written, to preserve the historical implementation. This list only
> records observations made while documenting the repository, as a reference for a possible
> future rewrite in a separate location.

## Correctness / Behaviour

| # | Observation | Location | Impact |
|---|---|---|---|
| 1 | The inner loop runs `for i=1:Numero_deDatos` (50) instead of over all `length(T)` (400) samples. Each generation trains on only the first 50 shuffled samples, always the same ones. | Training loop | Some clusters may be under-represented in training |
| 2 | The Mexican hat term uses fixed scalar positions `wd1…wd8`, so it is a constant bias per neuron and does not depend on the input or the weights. Lateral interaction does not actually change during training. | `v(:,1) … v(:,8)` | The "competition" reduces to nearest-neuron selection plus a fixed bias |
| 3 | The learning rate `Inteligencia` is the mean of the data coordinates. It is ≈ 0.5 for this data set, but for other data it could be negative, zero or larger than 1, which would make the update diverge or move neurons away from the data. | Learning rate | Not general beyond this data set |
| 4 | The learning rate is constant; competitive learning usually decreases it over time to help convergence. | Weight update | Neurons may keep oscillating |
| 5 | No random seed (`rng`) is set, so results cannot be reproduced exactly. | Data generation | Reproducibility |

## Code Quality

| # | Observation |
|---|---|
| 6 | `clear all` appears twice on the first line. |
| 7 | `Neuronas=8` is declared but never used; the number of neurons is hard-coded through `w1…w8` and `v(:,1)…v(:,8)`. |
| 8 | Groups, weights and activations are written out 8 times; loops or vectorization (e.g. `Neu'*x - 0.5*sum(Neu.^2)'`) would allow any number of neurons or dimensions. |
| 9 | `v` is not preallocated. |
| 10 | `g6` and `g8` are both drawn in yellow, which makes two clusters hard to tell apart. |
| 11 | Redrawing the entire figure after every sample (`cla` + 8 `scatter3` + 16 neuron plots + `pause`) is slow; updating plot handles would be faster. |
| 12 | Typos in comments (`modoficables`, `Inteligneica`, `Leatorios`, `incicial`). |
| 13 | `sombrero_function.m` declares `function s = sombrero(...)`; the file name and function name no longer match since the 2025 rename. The file is also a duplicate of the local function in the main script. |
| 14 | `length(Neu)` relies on the matrix having more columns than rows; `size(Neu,2)` would be explicit. |

## Possible Extensions

- Report cluster assignments or a quality metric (e.g. quantization error) instead of only a plot.
- Compare with k-means or a Kohonen self-organizing map, which the report mentions as a related
  model.
- Support data with more than 3 dimensions, as suggested in the report's conclusion.
