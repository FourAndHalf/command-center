---
name: Executive Command Center
colors:
  surface: '#131315'
  surface-dim: '#131315'
  surface-bright: '#39393b'
  surface-container-lowest: '#0e0e10'
  surface-container-low: '#1c1b1d'
  surface-container: '#201f22'
  surface-container-high: '#2a2a2c'
  surface-container-highest: '#353437'
  on-surface: '#e5e1e4'
  on-surface-variant: '#c8c5cb'
  inverse-surface: '#e5e1e4'
  inverse-on-surface: '#313032'
  outline: '#919095'
  outline-variant: '#47464b'
  surface-tint: '#c8c5ca'
  primary: '#c8c5ca'
  on-primary: '#303033'
  primary-container: '#18181b'
  on-primary-container: '#828184'
  inverse-primary: '#5f5e61'
  secondary: '#c6c6c7'
  on-secondary: '#2f3131'
  secondary-container: '#454747'
  on-secondary-container: '#b4b5b5'
  tertiary: '#cbc6bd'
  on-tertiary: '#33302a'
  tertiary-container: '#1a1813'
  on-tertiary-container: '#85817a'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e4e1e6'
  primary-fixed-dim: '#c8c5ca'
  on-primary-fixed: '#1b1b1e'
  on-primary-fixed-variant: '#47464a'
  secondary-fixed: '#e2e2e2'
  secondary-fixed-dim: '#c6c6c7'
  on-secondary-fixed: '#1a1c1c'
  on-secondary-fixed-variant: '#454747'
  tertiary-fixed: '#e8e2d9'
  tertiary-fixed-dim: '#cbc6bd'
  on-tertiary-fixed: '#1d1b16'
  on-tertiary-fixed-variant: '#494640'
  background: '#131315'
  on-background: '#e5e1e4'
  surface-variant: '#353437'
typography:
  display-hero:
    fontFamily: Geist
    fontSize: 3.5rem
    fontWeight: '600'
    lineHeight: 4rem
    letterSpacing: -0.04em
  display-hero-mobile:
    fontFamily: Geist
    fontSize: 2.25rem
    fontWeight: '600'
    lineHeight: 2.75rem
    letterSpacing: -0.03em
  headline-lg:
    fontFamily: Geist
    fontSize: 2rem
    fontWeight: '600'
    lineHeight: 2.5rem
    letterSpacing: -0.03em
  headline-lg-mobile:
    fontFamily: Geist
    fontSize: 1.5rem
    fontWeight: '600'
    lineHeight: 2rem
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Geist
    fontSize: 1.25rem
    fontWeight: '500'
    lineHeight: 1.75rem
    letterSpacing: -0.02em
  body-lg:
    fontFamily: Inter
    fontSize: 1.125rem
    fontWeight: '400'
    lineHeight: 1.75rem
    letterSpacing: -0.01em
  body-md:
    fontFamily: Inter
    fontSize: 0.9375rem
    fontWeight: '400'
    lineHeight: 1.5rem
    letterSpacing: -0.005em
  body-sm:
    fontFamily: Inter
    fontSize: 0.8125rem
    fontWeight: '400'
    lineHeight: 1.25rem
    letterSpacing: 0em
  mono-metric:
    fontFamily: Geist
    fontSize: 0.9375rem
    fontWeight: '500'
    lineHeight: 1.25rem
    letterSpacing: -0.01em
  label-caps:
    fontFamily: Geist
    fontSize: 0.6875rem
    fontWeight: '600'
    lineHeight: 1rem
    letterSpacing: 0.08em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1.5rem
  gutter-mobile: 1rem
  margin: 2.5rem
  margin-mobile: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2.5rem
---

## Brand & Style

This design system delivers a rigorous, high-conviction workspace engineered for senior operators, founders, and executives. The aesthetic prioritizes absolute cognitive clarity, removing decorative artifacts to surface critical reasoning: assumptions, probability assessments, tripwires, and decision retrospectives. 

The aesthetic direction merges **Technical Minimalism** with **Swiss Precision Typography**. By strictly anchoring the visual field in deep zinc values, stark typographic contrast, and hairline structural dividers, the interface commands disciplined focus. Micro-accents are deployed solely for semantic consequence (e.g., tripwire alerts, calibration tracking, review states). The emotional impression is calm, uncompromising, and analytical.

## Colors

The palette relies on a tonal zinc hierarchy anchored on an ultra-deep canvas, avoiding harsh pure black while maintaining extreme contrast ratios.

- **Canvas & Surface Base:** Deepest zinc `#09090B` serves as the canvas layer. Elevated cards, inputs, and modular panels sit on primary surface `#18181B`. Nested inspection panels and hovering states transition through `#27272A` to `#3F3F46`.
- **Text & Foreground:** Primary high-conviction labels, titles, and metrics use stark bright white `#FAFAFA`. Body analysis, rationale, and pre-mortem context use medium-emphasis `#A1A1AA`. Footnotes, inactive metadata, and hairline separators use low-emphasis `#71717A` and `#27272A`.
- **Micro-State Accents:** Functional color is withheld until state confirmation demands it. Overdue audits and tripwires trigger a subdued amber `#F59E0B`. Calibrated and resolved hypotheses utilize an emerald `#10B981`. Calibration metrics and statistical bounds leverage a restrained slate-indigo `#6366F1`.

## Typography

The typographic hierarchy establishes ruthless order. `Geist` provides geometric authority for headlines, analytical dashboards, tabular values, and structural anchors, while `Inter` handles long-form hypothesis logs, narrative reasoning, and qualitative reflections.

- **Tabular Figures & Metrics:** For all dates, probabilities, decision intervals, and Brier calibration scores, apply `font-feature-settings: "tnum" 1, "cv01" 1` to ensure vertical column alignment across dense comparative lists.
- **Micro Labels:** Category indicators, tripwire warnings, and workflow status indicators use `label-caps` rendered in full uppercase with expanded tracking (`+0.08em`) to guarantee legibility at small scale.
- **Reading Length:** Maintain body copy line width between 55 and 70 characters (`max-w-prose`) to preserve focus during intensive retrospective evaluations.

## Layout & Spacing

The layout model is anchored on an 8pt structural rhythm combined with a responsive 12-column grid for wide workspaces, compressing to a focused 4-column stack on mobile devices.

- **Breakpoints:** Mobile (`< 768px`), Tablet/Split View (`768px - 1199px`), Desktop Command View (`>= 1200px`).
- **Dense Analytical Grid:** Use `gutter` (`1.5rem`) for standard analytical card splits (e.g., decision matrix alongside tripwire parameters). Inner component padding strictly uses `space-md` (`1rem`) for inputs and controls, stepping up to `space-lg` (`1.5rem`) for decision cards.
- **Canvas Framing:** Desktop view keeps an outer margin of `margin` (`2.5rem`) with a fixed max-width container of `1440px` centered in the viewport, preventing wide-screen dilution. Mobile views contract to `margin-mobile` (`1rem`) edge margins to maximize reading real estate.

## Elevation & Depth

This system avoids synthetic drop shadows, relying entirely on **tonal layered surfaces** and **1px razor-sharp borders** to define spatial layering.

- **Layer 0 (Canvas Base):** Ground level (`#09090B`). Houses outer navigation, background structures, and inactive margins.
- **Layer 1 (Card & Module Surface):** Surface fill (`#18181B`) coupled with a continuous 1px outline of `#27272A`. All modules, log entries, and workspace sections live here.
- **Layer 2 (Interactive Floating & Flyouts):** Modals, probability sliders, calibration popovers, and contextual action trays utilize surface fill `#27272A` paired with a 1px border of `#3F3F46`. A tight, non-diffuse occlusion shadow (`0 8px 24px -4px rgba(0, 0, 0, 0.6)`) separates floating dialogs from background cards.
- **Layer 3 (Active Focus & Selection):** Active states eliminate ambiguous glows. Focused inputs, targeted rows, and selected segments present a crisp 1px `#FAFAFA` outline or an internal highlight border.

## Shapes

The geometric architecture relies on **Level 2 (Rounded)** corners to balance mechanical technicality with modern ergonomic comfort.

- **Primary Cards & Containers:** Standardize on `rounded-xl` (`1.5rem` / `24px`) for outer structural cards, log viewports, and deep-dive panels.
- **Controls & Modals:** Standardize on `rounded-lg` (`1rem` / `16px`) for dropdown menus, dialog popups, and nested input groupings.
- **Buttons, Inputs & Pill Badges:** Buttons, text fields, and segmented control chips utilize `0.5rem` (`8px`) for immediate utilitarian responsiveness. Status indicators and probability markers may employ full rounded pills (`9999px`) when functioning as self-contained tags.

## Components

### Buttons & Trigger Controls
- **Primary High-Conviction:** Solid `#FAFAFA` background, `#09090B` bold text. Zero border. Hover state transitions to `#E4E4E7`. Used exclusively for principal actions (e.g., "Commit Decision", "Lock Hypothesis").
- **Secondary Surface:** Background `#18181B`, border 1px solid `#27272A`, text `#FAFAFA`. Hover transitions border to `#3F3F46` and background to `#27272A`.
- **Destructive / Tripwire Manual Reset:** Translucent amber/red tint (`rgba(245, 158, 11, 0.08)`), border 1px solid `rgba(245, 158, 11, 0.3)`, text `#F59E0B`.

### Form Fields & Decision Inputs
- Built on `#18181B` base with a 1px `#27272A` border. Active focus yields an immediate 1px solid `#FAFAFA` outline without a diffuse blur halo.
- Labels are fixed in `label-caps` style above the field. Monospace numeric inputs for confidence calibration (0% - 100%) and target dates automatically enforce tabular numerals (`tnum`).

### Badges & Calibration Chips
- Ultra-compact, low-padding (`py-0.5 px-2`) pills.
- **Status Reviewed:** Subdued emerald fill (`rgba(16, 185, 129, 0.1)`), text `#10B981`, hairline border `rgba(16, 185, 129, 0.2)`.
- **Status Tripwire:** Subtle amber fill (`rgba(245, 158, 11, 0.1)`), text `#F59E0B`, hairline border `rgba(245, 158, 11, 0.25)`.
- **Neutral Categorical:** Fill `#27272A`, text `#A1A1AA`, border 1px solid `#3F3F46`.

### Cards & Decision Log Entries
- Constructed with `#18181B` surface and 1px `#27272A` perimeter.
- Top section houses metadata: categorical tag, timestamp (monospace), and conviction percentage.
- Separator line: 1px horizontal rule colored `#27272A`.
- Lower section exposes rationale, tripwires, and pre-mortem scenarios with clean vertical typographic spacing.

### Segmented View Switchers
- Inset container styled with background `#09090B` and 1px `#27272A` outline.
- Segment items use `0.5rem` internal border radius. Selected segment activates with background `#27272A` and stark white `#FAFAFA` text, while inactive segments rest at muted zinc `#71717A`.