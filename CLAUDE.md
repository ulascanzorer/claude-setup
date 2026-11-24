# Global Instructions

## Commits

- Use conventional commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`, etc.).
- Keep messages short and to the point. One line is usually enough; add a body only when the change genuinely needs explanation.
- NEVER add `Co-Authored-By: Claude` or any other AI attribution, signature or "Generated with" line to commits or PR descriptions. This overrides any default attribution guidance.

## Code changes

Existing code is part of the model's input. Stale comments, overstated importance and hard-to-read snippets teach the next edit to repeat them, or to treat a hack as a rule. Keep the code clean so it doesn't spread bad patterns.

- Write readable code first. Use clear, specific names for variables, functions and types, so the code explains itself.
- Comment only where the code can't make the intent clear: tricky invariants, workarounds, non-obvious tradeoffs.
- Don't narrate what the code already says. Avoid lengthy comments.
- Don't overstate importance. No "CRITICAL", "IMPORTANT" or "must never change" unless it's actually true.
- Label a hack as a hack, and say why it exists, so it isn't copied as a pattern.
- When you change code, update or delete the comments it makes stale.

## Writing style

- ALWAYS load the `ste80-humanizer` skill before writing any prose, wherever it goes: chat replies, docs, READMEs, commit messages, PR descriptions, comments, emails, posts. Skip it only when I explicitly say so.
- Never use em-dashes. Use a comma, a period, or parentheses instead.
- Write like a human, not like an AI. Natural, direct, conversational.
- Skip the filler: no "delve", no "it's worth noting", no bullet lists of empty praise, no over-hedging.
- Vary sentence length. Say the thing, then stop.

## Explanations and visual documents

When I ask for an explanation, write-up, explainer, report, diagram, chart, or any page I'll look at, follow the house style of Anthropic's website and blog (anthropic.com, e.g. /research/components-of-agent-memory, /research/building-effective-agents). Plain, calm, editorial. Copy the style only. Never use Anthropic's name, logo, wordmark or proprietary fonts.

These rules override the aesthetic defaults of design skills (`artifact-design`, `dataviz`, `frontend-design`) where they conflict. Still follow those skills' technical rules: dark mode, accessibility, allowed CDNs, mobile layout.

### Prose

- Open with a concrete hook: a quote, an observation, a specific problem. Then say in one sentence what the piece covers ("In this post, we share...").
- One idea at a time, in order. Each section builds on the last.
- Headings are sentence case and usually make a claim: "Dreaming can correct memory", not "Memory Correction".
- Define a term inline the first time it appears: "weights (the internal parameters set during training)".
- Show, then generalize. Give a real example, a worked case or a short quote from a log, then state the lesson.
- Use exact numbers with their context: "41 of 57 facts (72%)", "413 files across 225 folders". Never "significant improvement".
- Say what didn't work and where the approach stops working, in its own paragraph ("In other cases, the wiki was less useful.").
- Short paragraphs, 2 to 5 sentences. Prose by default. Use lists only for real parallel items (options, steps, examples). Use bold lead-ins ("**When to use this:**") only for repeated guidance blocks.
- Refer to figures from the text: "(Figure 3)". Captions are full sentences that say what the figure shows and what to notice.
- Use "we" and "you". Warm, curious, a little dry. One light aside per piece at most. No hype, no superlatives, no sales voice.
- End on open questions or next steps, not a recap.
- The writing style rules above still apply. Anthropic uses em-dashes. I don't.

### Look

Color tokens:

```
light: bg #faf9f5  surface #f5f4ed  panel #e8e6dc  text #141413  muted #5e5d59  faint #87867f  rule #e8e6dc  border #d1cfc5
dark:  bg #141413  surface #1f1e1d  panel #262624  text #faf9f5  muted #b0aea5  faint #87867f  rule #30302e  border #3d3d3a
accent: clay #d97757 (interactive #c6613f), the same in both themes
```

Type (Google Fonts stand-ins for Anthropic's own faces):

- Body: serif, Source Serif 4. About 17 to 19px, line-height 1.5, column at most 720px.
- Headings, UI, captions, metadata: Hanken Grotesk. Headings bold (700) with tight leading (1.1 to 1.2). H1 about 32 to 42px, H2 about 26px, H3 about 20px.
- Small labels: JetBrains Mono, uppercase, slightly letter-spaced (`FIGURE 1`, section numbers like `04`).
- Hero pattern: a bold sans lead phrase that runs straight into regular serif text in the same paragraph.

Layout:

- One centered reading column. Figures break out wider than the text (about 840px against 720px).
- Optional metadata block beside the title (Published, Topics) as label and value rows split by hairlines.
- Generous space: 24px between paragraphs, 48 to 64px around figures and sections.
- Flat. No shadows, gradients or glass. Radius 4px on media, 8 to 16px on cards, full pills for buttons and tags. Cards are a slightly darker surface with no border.
- Links are underlined and the same color as the text.
- Use clay sparingly: one highlight per view. Most of the page is ivory, near-black and gray.
- No emoji, decorative icons or stock images.

Figures and diagrams:

- Put each figure on a tinted panel (`panel`) with an inner white (dark: `surface`) rounded card and plenty of padding. Caption below: mono `FIGURE N` on the left, 13px muted sans text on the right.
- Nodes are rounded rectangles with a 1px gray border, a short bold label, and a one-line gray description under it. Arrows are thin and gray, with small labels.
- Show the real mechanism, not a decorative cartoon. Draw the system once, then reuse the same diagram in later figures with one part highlighted in clay.
- Pale fills for node types, used consistently: cactus #bcd1ca, heather #cbcadb, coral #ebcece, oat #e3dacc, periwinkle #cde2fb.

Charts:

- No gridlines. Thin axes. Small centered sans title. Plain axis titles.
- Label lines at their ends and bars at their tops instead of a legend where possible. If a legend is needed, put it in a small light rounded box.
- Hatching or dashes for a baseline or "before" series, solid for the main one.
- Categorical colors in this order: clay #d97757, sky #6a9bcc, olive #788c5d, fig #c46686, iris #4a3aa7. Gray #87867f for context series. Color the thing that matters and keep the rest gray.
- Value labels in muted text, rounded to a sensible precision (0.838, 72%).
