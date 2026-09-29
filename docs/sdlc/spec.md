# Specification

> Reverse-engineered specification of the behaviour implemented in
> [`src/competitive_neuronal_networks.m`](../../src/competitive_neuronal_networks.m). It
> describes what the original code does, including its quirks; it is not a specification for new
> behaviour. Requirement IDs are added only to make the document navigable.

## 1. Scope

A single MATLAB script that generates synthetic 3D data, trains an 8-neuron competitive network
on it, and animates the training in a 3D plot.

## 2. Parameters

| ID | Name | Value | Description |
|---|---|---|---|
| P-1 | `Numero_deDatos` | 50 | Points per group and samples visited per generation |
| P-2 | `Neuronas` | 8 | Declared, unused |
| P-3 | `a` | 0.01 | Mexican hat coefficient |
| P-4 | `b` | 0.06 | Mexican hat coefficient |
| P-5 | `Generaciones` | 10 | Number of training generations |
| P-6 | `sep` | 0.7 | Group offset |
| P-7 | `u` | 0.8 | Neuron initialization offset |

## 3. Functional Requirements (as implemented)

| ID | Requirement |
|---|---|
| FR-1 | The system shall generate 8 groups of `Numero_deDatos` 3D points; each coordinate is `rand ± sep`, with a different sign combination per group (one group per octant around `(0.5, 0.5, 0.5)`). |
| FR-2 | The system shall plot each group with `scatter3` using a group-specific colour, on axes limited to `[-2, 2]` in x, y and z. |
| FR-3 | The system shall concatenate all groups and shuffle the columns randomly (`mix`). |
| FR-4 | The system shall compute the learning rate as `mean([mean(x), mean(y), mean(z)])` over the shuffled data and print it. |
| FR-5 | The system shall initialize 8 neurons at the corners of the cube `[0.3, 0.7]³` and assign them lateral positions `wd = [2, 3, 3.5, 4.5, 5.6, 7.8, 8, 9]`. |
| FR-6 | For each generation and each sample `i = 1..Numero_deDatos`, the system shall compute for every neuron `j`: `v_j = w_jᵀx − 0.5·w_jᵀw_j + Σ_k sombrero(|wd_j − wd_k|, a, b)`. |
| FR-7 | The Mexican hat function shall be `sombrero(v, a, b) = (b − a·v²)·exp(−v²)`. |
| FR-8 | The neuron with the maximum `v` shall be the only one updated: `w ← w + η·(x − w)`. |
| FR-9 | After every update, the system shall redraw the data, the current neurons (black fill, red edge) and the initial neurons (yellow fill, black edge), pausing 0.0001 s. |
| FR-10 | After training, the system shall plot the final neuron positions. |

## 4. Inputs and Outputs

- **Inputs:** none external; all values are hard-coded or randomly generated.
- **Outputs:** MATLAB figure (animated), learning rate printed to the Command Window. No files.

## 5. Constraints

| ID | Constraint | Status |
|---|---|---|
| C-1 | MATLAB R2016b or newer (local functions in scripts) | Inferred |
| C-2 | No toolboxes required | Inferred |
| C-3 | Non-deterministic (no random seed) | Confirmed |

## 6. Known Deviations from the Report

- The report's code listing has no animation block (FR-9). See
  [../project-context.md](../project-context.md#contradictions-and-discrepancies).
- The report says neurons start near the origin; the code starts them near `(0.5, 0.5, 0.5)`.

## 7. Acceptance (Observable Behaviour)

- Running the script opens a 3D figure with 8 coloured clusters and 8 yellow initial neurons.
- During the animation, black neurons move from the centre toward the clusters.
- The printed learning rate is approximately 0.5.

Behaviours that could be considered defects are listed in
[../possible-improvements.md](../possible-improvements.md); they are part of the original
implementation and are intentionally preserved.
