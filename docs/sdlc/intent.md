# Intent

> Reverse-engineered from the existing repository (original report and source code). This
> document states *why* the project exists. It describes the original 2019 project, not new work.
> See [spec.md](spec.md) for *what* it does and [plan.md](plan.md) for *how* it was built and how
> the repository was later reorganized.

## Problem

Unlabeled multidimensional data needs to be split into meaningful groups. Humans can do this by
eye in 2D or 3D, but not in higher dimensions.

## Intent

Demonstrate, as a university lab practice at Universidad de Guadalajara, how a **competitive
(winner-take-all) neural network** can cluster data without supervision, using a 3D example that
can be visualized so the learning process is easy to follow.

## Desired Outcomes

1. Explain what a competitive neural network is (architecture, activation, update rule).
2. Implement it in MATLAB for 3 inputs and 8 neurons (8 groups).
3. Use a Mexican hat function to model competition between neurons.
4. (Extra) Derive a learning coefficient from the data so neurons do not diverge.
5. Show visually that each neuron moves from the centre toward one group of data.

## Audience

- Original: the course instructor evaluating the practice (Inferred).
- Today: readers of a technical portfolio who want to understand the original work.

## Non-Goals

- Production use, performance, or general-purpose clustering of arbitrary data.
- Handling real data sets or saving results.
- Modernizing or correcting the original code (applies to the later repository reorganization).

## Success Criteria (as evidenced by the report)

- After the configured generations, the neurons (black) have moved from their initial positions
  (yellow) toward the data groups — shown in *Illustration 2* of the report.

## Guardrails for Any Future Work on This Repository

- `src/` is historical and must remain byte-for-byte unchanged.
- `docs/original/` holds original documents and must not be edited.
- New documentation must distinguish **Confirmed**, **Inferred** and **Unknown** information.
