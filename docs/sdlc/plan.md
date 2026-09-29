# Plan

> Two parts: (A) the implementation plan of the original project, reconstructed from the code and
> the report; (B) the plan followed to reorganize and document this repository without touching
> the original code.

## Part A — Original Implementation Plan (reconstructed)

| Step | Description | Where in the code | Status |
|---|---|---|---|
| A1 | Define editable parameters | `%% Variables modoficables` | Done in original |
| A2 | Generate 8 synthetic clusters, one per octant, and plot them | `g1 … g8` + `scatter3` | Done in original |
| A3 | Shuffle the data | local function `mix` | Done in original |
| A4 | Compute the data-driven learning rate (report section III) | `inte`, `Inteligencia` | Done in original |
| A5 | Initialize 8 neurons near the centre and their lateral positions | `w1 … w8`, `wd1 … wd8`, `Neu` | Done in original |
| A6 | Implement the Mexican hat function | local function `sombrero` (+ `sombrero.m`, later `sombrero_function.m`) | Done in original |
| A7 | Competitive training loop: activation, winner selection, winner update | `for r=1:Generaciones` | Done in original |
| A8 | Animate the training | `cla` / `scatter3` / `pause` block | Done in original (absent from the report listing) |
| A9 | Write the lab report with theory, objective, results and code | `docs/original/documentation.pdf` | Done in original (Nov 2019) |

## Part B — Repository Reorganization Plan

### Principles

- Modernize the repository, not the project.
- Preserve every original file; move, never edit.
- Label information as Confirmed / Inferred / Unknown; never invent context.
- Avoid unnecessary infrastructure (no build tools, CI, containers or package managers).

### Steps

| Step | Action | Result |
|---|---|---|
| B1 | Inventory all files and git history | 2 MATLAB files, 1 PDF, 4 commits (2023 upload, 2025 renames) |
| B2 | Read the PDF by text extraction and visual review of each page | Context, formulas, figures and discrepancies recovered |
| B3 | Move source code to `src/` with `git mv` | History preserved; content unchanged |
| B4 | Move the report to `docs/original/` | Original document preserved |
| B5 | Extract the report figures to `docs/images/` | Figures usable in Markdown; PDF untouched |
| B6 | Write `docs/project-context.md`, `docs/report.md`, `docs/code-overview.md` | Context, report summary and code walkthrough |
| B7 | Write `docs/possible-improvements.md` | Observations recorded, not applied |
| B8 | Write `docs/sdlc/intent.md`, `spec.md`, `plan.md` | Intent, specification and plan derived from existing material |
| B9 | Write `README.md` and a minimal MATLAB `.gitignore` | Entry point for readers |
| B10 | Verify integrity | SHA-256 of both `.m` files identical before and after; git reports 100% renames |
| B11 | Commit on a dedicated branch and open a pull request | Changes reviewable before merging |

### Verification Checklist

- [x] `src/*.m` hashes unchanged
- [x] `docs/original/documentation.pdf` unchanged
- [x] All relative links in Markdown resolve
- [x] No build, CI or deployment tooling added

### Out of Scope

- Any change to the MATLAB code, including the issues listed in
  [../possible-improvements.md](../possible-improvements.md).
- A modern rewrite. If ever done, it should live in a separate folder or repository so that the
  original implementation stays intact.
