# Code Overview

Explanation of the original MATLAB source code in [`src/`](../src/). The code is described as it
is; nothing has been changed. Variable names and comments are in Spanish in the original and are
quoted verbatim here.

## Files

| File | Role |
|---|---|
| [`src/competitive_neuronal_networks.m`](../src/competitive_neuronal_networks.m) | Main script: data generation, training loop, visualization, plus local functions `mix` and `sombrero` |
| [`src/sombrero_function.m`](../src/sombrero_function.m) | Standalone copy of the Mexican hat function `sombrero` |

## `competitive_neuronal_networks.m`

### Execution flow

```
clear workspace / figure
 └─ set parameters
     └─ generate 8 groups of random 3D points and plot them
         └─ concatenate + shuffle (mix)
             └─ compute learning rate "Inteligencia"
                 └─ initialize 8 neurons (Neu) + lateral positions (wd1..wd8)
                     └─ for r = 1..Generaciones
                          for i = 1..Numero_deDatos
                            compute activation v for each neuron
                            pick winner (max v)
                            update winner weights
                            redraw figure (animation)
                 └─ plot final neurons
```

### 1. Parameters ("Variables modoficables")

| Variable | Value | Meaning |
|---|---|---|
| `Numero_deDatos` | 50 | Points per group; also the number of samples visited per generation |
| `Neuronas` | 8 | Number of neurons (declared but not used by the code) |
| `a` | 0.01 | Mexican hat coefficient |
| `b` | 0.06 | Mexican hat coefficient |
| `Generaciones` | 10 | Training epochs ("generations") |
| `sep` | 0.7 | Offset used to separate the groups ("Para ploteo") |

### 2. Data generation

Eight matrices `g1 … g8` of size 3×50. Each coordinate is `rand(1,50) ± sep`:

- `rand − 0.7` ∈ [−0.7, 0.3)
- `rand + 0.7` ∈ [0.7, 1.7)

Each group combines a different sign pattern for (x, y, z), so every group lies in a different
octant around `(0.5, 0.5, 0.5)`. Each group is plotted immediately with `scatter3` in its own
colour (r, g, b, c, m, y, k; `g8` uses a yellow face with a cyan edge).

### 3. Shuffling — `mix(XX)`

`XX = [g1,…,g8]` (3×400) is passed to the local function `mix`, which reorders its columns with
`randperm`. The result `X` is then copied into `T` (the training set).

### 4. Learning rate — `Inteligencia`

```matlab
inte(1)=mean(X(1,:)); inte(2)=mean(X(2,:)); inte(3)=mean(X(3,:));
Inteligencia=mean(inte)
```

The mean of the per-axis means. With this data it is about 0.5 (inferred from the data ranges).
The line has no semicolon, so the value is printed in the Command Window. This is the
"ideal learning coefficient" described in section III of the report.

### 5. Neuron initialization

With `u = 0.8`, every weight component is either `−0.5 + u = 0.3` or `1.5 − u = 0.7`, so the
8 neurons `w1 … w8` sit at the corners of the cube `[0.3, 0.7]³`, one per octant. They are stored
as columns of `Neu` (3×8), and a copy is kept in `NeuInicial` for plotting.

Each neuron also receives a scalar "position" used for lateral interaction:

| Neuron | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|
| `wd` | 2 | 3 | 3.5 | 4.5 | 5.6 | 7.8 | 8 | 9 |

### 6. Competition

For each sample `T(:,i)` and each neuron `j` (written out explicitly as eight lines):

```
v(j) = Neu(:,j)'*T(:,i) − 0.5*Neu(:,j)'*Neu(:,j) + Σ_k sombrero(|wd_j − wd_k|, a, b)
```

- `wᵀx − 0.5·wᵀw` is equivalent (up to a term that does not depend on the neuron) to choosing the
  neuron closest to `x` in Euclidean distance.
- The Mexican hat sum depends only on the fixed `wd` values, not on the data or the weights, so it
  acts as a constant bias per neuron. Computed from the code's parameters, the bias ranges from
  about 0.075 (neuron 5) to about 0.136 (neuron 7).

The winner is `[~,ind] = max(v)`.

### 7. Weight update

```matlab
Neu(:,ind)=(Neu(:,ind)+(Inteligencia*(T(:,i)-Neu(:,ind))));
```

Only the winning neuron moves toward the sample (winner-take-all).

### 8. Visualization

After each update the axes are cleared (`cla`), all 8 groups are redrawn, and every neuron is
plotted at its current position (black fill, red edge) together with its initial position (yellow
fill, black edge). `pause(.0001)` lets MATLAB refresh the figure, producing an animation. After
training, the final neurons are plotted once more.

### Local functions

- `mix(XX)` — returns the columns of `XX` in random order.
- `sombrero(v,a,b)` — Mexican hat: `s = (b − a·v²)·exp(−v²)`.

## `sombrero_function.m`

Contains the same `sombrero` function as the local function in the main script. Observations:

- The main script does **not** need this file: MATLAB resolves `sombrero` to the local function
  defined inside the script.
- The file was named `sombrero.m` when uploaded; it was renamed to `sombrero_function.m` in 2025.
  In MATLAB, a function file is called by its file name, so it would now be invoked as
  `sombrero_function(v,a,b)` (MATLAB may warn about the name mismatch).

## Dependencies Observed

- MATLAB built-ins only: `rand`, `randperm`, `mean`, `max`, `abs`, `exp`, `zeros`, `length`,
  `scatter3`, `axis`, `xlabel`, `ylabel`, `zlabel`, `hold`, `cla`, `pause`, `clear`, `clc`.
- Local functions at the end of a script require MATLAB R2016b or newer.

## Behaviours Worth Knowing (confirmed by reading the code)

- The inner loop runs `i = 1:Numero_deDatos` (50), so each generation visits only the first 50
  of the 400 shuffled samples, and always the same 50.
- No random seed is set; each run is different.
- Group colours are for visualization only; the network never sees the labels.

These and other observations are collected in
[possible-improvements.md](possible-improvements.md). None of them were changed in the code.
