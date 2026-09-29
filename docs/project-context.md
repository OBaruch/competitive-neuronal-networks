# Project Context

This document reconstructs the origin and context of the project from the evidence available in
the repository. Each statement is labelled:

- **Confirmed** — directly supported by a file, the code or git metadata.
- **Inferred** — reasonably deduced from the repository, but not stated explicitly.
- **Unknown** — cannot be determined from the repository.

## Classification

**Academic / University Project — Coursework (lab practice).**

The original report ([original/documentation.pdf](original/documentation.pdf)) describes itself as
a *práctica* ("En esta práctica se explicará…", "Objetivo de la práctica") and lists the author's
affiliation as *Universidad de Guadalajara*.

## Evidence Summary

| Fact | Status | Source |
|---|---|---|
| Author: Omar Baruch Morón López | Confirmed | Report header |
| Institution: Universidad de Guadalajara | Confirmed | Report header |
| The work is a lab practice (*práctica*) | Confirmed | Report abstract and section II |
| Practice number 4 | Inferred | The PDF was first committed as `practica4.pdf` |
| Course name | Unknown | Not stated. The subject matter (competitive networks, Mexican hat function, Kohonen references) suggests a neural networks / artificial intelligence course |
| Professor, semester, grade | Unknown | Not stated |
| Report date: 8 November 2019 | Confirmed | PDF metadata (`creationDate`) |
| Report authored in Microsoft Word for Office 365 using an IEEE-style template | Confirmed | PDF metadata (`creator`, `subject: IEEE Transactions on Magnetics`) and layout |
| Implementation language: MATLAB | Confirmed | `.m` files; report states "se programará en Matlab" |
| First upload to GitHub: 30 September 2023 | Confirmed | Git history |
| Files renamed to English names on 31 March 2025 (`RNCompetitivas.m` → `competitive_neuronal_networks.m`, `sombrero.m` → `sombrero_function.m`, `practica4.pdf` → `documentation.pdf`) | Confirmed | Git history (renames with no content changes) |

## Objective

- **Main goal (Confirmed):** divide a data set into groups using a competitive neural network,
  in 3 dimensions so the result can be visualized.
- **Didactic design (Confirmed):** one separate random cluster per octant (8 clusters) and one
  neuron per cluster, with neurons starting near the centre of the data.
- **Extra goal (Confirmed):** derive an "ideal" learning coefficient from the data so that the
  neurons do not diverge (section III of the report).

## Scope

- Single MATLAB script with two local helper functions, plus a standalone copy of the Mexican hat
  function.
- Synthetic data only — no external data sets are read.
- Output is purely visual (an animated 3D scatter plot); no results are saved.

## Historical Timeline

| Date | Event | Status |
|---|---|---|
| ≤ Nov 2019 | Code written as a university lab practice | Inferred (the report embeds the code) |
| 8 Nov 2019 | Lab report generated as PDF | Confirmed |
| 30 Sep 2023 | `RNCompetitivas.m`, `sombrero.m` and `practica4.pdf` uploaded to GitHub | Confirmed |
| 31 Mar 2025 | Files renamed to English names | Confirmed |
| Later | Repository reorganized and documented (this documentation) | Confirmed |

## Contradictions and Discrepancies

These are documented rather than resolved:

1. **Code in the report vs. code in the repository.** The listing in section VI of the report
   does not contain the per-sample animation block (`cla`, redrawing all groups and neurons,
   `pause(.0001)`) that exists in `src/competitive_neuronal_networks.m`. The report listing
   also shows only one `end` closing the training loops, which suggests the block — and the
   `end` that follows it — were omitted or lost when the code was pasted into the report. It
   cannot be determined which version came first.
2. **"Neurons start near the origin."** Section II says neurons start "en el centro cercano al
   origen". In the code, the initial weights are in the cube `[0.3, 0.7]³`, i.e. near
   `(0.5, 0.5, 0.5)`, which is the centre of the generated data rather than the origin. The
   report figures are consistent with the code.
3. **Example in the conclusion.** The conclusion mentions "an experiment of 4 variables" and then
   "5 compounds … 5 dimensions" in the same example. This is a minor inconsistency in the
   original text.
4. **File name vs. function name.** `sombrero_function.m` declares `function s = sombrero(...)`.
   The file was originally named `sombrero.m`; the 2025 rename introduced the mismatch. See
   [code-overview.md](code-overview.md).

## Related Documents

- [report.md](report.md) — English summary of the original report.
- [code-overview.md](code-overview.md) — technical explanation of the code.
- [sdlc/intent.md](sdlc/intent.md), [sdlc/spec.md](sdlc/spec.md), [sdlc/plan.md](sdlc/plan.md).
