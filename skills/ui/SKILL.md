---
name: ui
description: Use when the user wants to build a UI component, page, screen, or frontend feature. Trigger on: "build a component", "create a UI", "I need a form", "make a modal", "design a page", "add a button", "build this screen", "create a layout", "build this page", "design the dashboard".
disable-model-invocation: false
---

Define the interface and aesthetic. Get approval. Then build.

---

## Step 1: Read context

Check .project.md if it exists. Note: stack, constraints, conventions.

Scan the brief for signals:
- What kind of thing? (component / page / screen / redesign)
- Vibe words? ("minimal", "bold", "clean", "dense", "editorial")
- Who uses it? (B2B / consumer / internal tool / portfolio)
- Quiet constraints? (accessibility, public-sector, trust-critical)

---

## Step 2: Design Read

Output one line before anything else:

```
Reading this as: <what it is> for <who>, leaning toward <aesthetic direction>.
```

Example: "Reading this as: SaaS dashboard for internal ops team, leaning toward dense-data with neutral palette."

If the brief is too vague to infer a direction, ask ONE question: "What should this feel like?" Offer 3 options from the list below. Never multi-question.

**Aesthetic directions to pick from:**
- Brutally minimal — only what's needed, tight, monospace, no decoration
- Editorial — strong typography, generous whitespace, ink-on-paper
- Dense-data — compact, scannable, every pixel earns its place
- Premium / refined — clean but crafted, restrained motion, nothing cheap
- Playful — expressive, intentional color, small moments of delight
- Dark tech — mono + accent, terminal motifs, hacker aesthetic
- Brutalist — raw CSS, explicit borders, anti-design as the design

Pick one and commit. Never "clean and modern."

---

## Step 3: Define the interface

For components and pages, output this block. No code yet.

```
Component/Page: <name>
Purpose:        <one sentence>

Props/Inputs:
  <name>: <type> — <what it controls>

State:     <none / what's internal>
Emits:     <none / callbacks or events>

Edge cases:
  - empty state
  - loading state
  - error state
  - <any constraint from .project.md>
```

Match the project's stack from .project.md (React/Vue/Svelte/etc.).

---

## Step 4: Wait for approval

Show the Design Read and interface together. Ask: "Does this look right before I build?"

**Do not write a single line of component or page code until approved.**

---

## Step 5: Build

Only after approval. Apply these rules throughout.

### Typography
- Default to: Geist, Satoshi, Plus Jakarta Sans, Cabinet Grotesk, Outfit — NOT Inter, Roboto, Arial
- Inter only if user explicitly asks for neutral/Linear-style feel
- Pair: display font + mono font. Example: Satoshi + JetBrains Mono
- Display headlines: `text-4xl md:text-6xl tracking-tighter leading-none`
- Body: `text-base leading-relaxed max-w-[65ch]`

### Color
- Max 1 accent color. No AI-purple gradients by default.
- Neutral base (Zinc/Slate/Stone) + single sharp accent (Emerald, Electric Blue, Deep Rose, Burnt Orange)
- CSS variables for consistency. One palette locked for the whole page.
- No pure `#000000` or `#ffffff` — use off-black (zinc-950) and off-white

### Layout
- Grid over flex-math. Never `w-[calc(33%-1rem)]` — use `grid-cols-3 gap-6`
- Full-height: `min-h-[100dvh]` — NEVER `h-screen` (breaks iOS Safari)
- Breakpoints: sm:640, md:768, lg:1024, xl:1280. Contain at `max-w-7xl mx-auto`
- Every multi-column layout must declare its `< 768px` mobile collapse

### Icons
- Priority: `@phosphor-icons/react` → `hugeicons-react` → `@radix-ui/react-icons` → `@tabler/icons-react`
- Lucide: only if user explicitly asks or project already uses it
- One library per project. One stroke width everywhere.
- Never hand-roll SVG icons.

### AI Tells — never ship these
- Inter as default font
- Purple gradient + white background
- Three equal feature cards in a row
- Centered hero over dark mesh gradient
- Generic glassmorphism by default
- Infinite micro-animations on everything
- Div-based fake screenshots / fake dashboards
- Generic names: "John Doe", "Sarah Chen", "Acme", "Nexus", "Cloudly"
- Filler verbs: "Elevate", "Seamless", "Unleash", "Next-Gen", "Revolutionize"
- Fake-precise numbers: `99.99%`, `50%`, `1234567` — use organic data
- Em-dashes (`—`) anywhere. Use period, comma, or restructure.
- "Scroll ↓" cues, animated mouse icons
- Section number eyebrows: `001 · Capabilities`, `06 · how it works`
- Scroll cues, locale strips, weather stamps

### Motion
- Animate only `transform` and `opacity`. Never `top`, `left`, `width`, `height`
- One well-orchestrated page-load reveal > scattered micro-interactions
- Every animation needs a reason: hierarchy, feedback, storytelling, or state change
- `prefers-reduced-motion` respected for anything that moves

### Before shipping — verify
- [ ] One accent color used consistently across all sections
- [ ] One corner-radius system (all-sharp, all-soft, or all-pill — not mixed)
- [ ] Every CTA text readable (WCAG AA 4.5:1 min)
- [ ] No CTA label wraps to 2+ lines at desktop
- [ ] No em-dashes anywhere visible
- [ ] Real copy — no "Lorem ipsum", "Title here", "Description goes here"
- [ ] Loading / empty / error states provided
- [ ] Mobile collapse declared for every multi-column layout
