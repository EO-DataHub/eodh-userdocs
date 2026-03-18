# UK EODH Documentation

This repository contains the source for the **UK Earth Observation Data Hub (EODH)** documentation site, built with **[MkDocs](https://www.mkdocs.org/)** using the **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)** theme.

- **Docs source**: `docs/`
- **MkDocs config**: `mkdocs.yml`
- **Published site URL**: `https://eodatahub.org.uk/docs/documentation`

## Local development

This repo includes a `pixi.toml` with the Python dependencies needed to run MkDocs locally.

1. Install Pixi: [pixi.sh](https://pixi.sh/)
2. From the repo root:

```bash
pixi install
pixi run mkdocs serve
```

Then open the local URL printed by MkDocs (typically `http://127.0.0.1:8000/`).

## Build the site

To build the static site into `site/`:

```bash
mkdocs build
```

## Deployment

Deployment is handled by GitHub Actions (`.github/workflows/ci.yml`) on pushes to `main`/`master`, using:

```bash
mkdocs gh-deploy --force
```

This publishes the built site.

## Writing docs

- **Add/edit pages** in `docs/` (Markdown and a few Jupyter notebooks).
- **Navigation** is configured in `mkdocs.yml` under `nav:`.
- **Assets** (images, CSS, JS) live under `docs/assets/`, `docs/stylesheets/`, and `docs/javascripts/`.

## Style guide (quick)

- **Admonitions**: Use MkDocs Material admonitions for callouts (notes, warnings, tips). See [Admonitions reference](https://squidfunk.github.io/mkdocs-material/reference/admonitions/).
- **Icons/emoji**: Prefer clean, monochrome Material icons where it helps readability. See [Icons + Emoji reference](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/).
- **Consistency**: Prefer clean headings, simple lists, and avoid manual line breaks/formatting hacks unless necessary.


