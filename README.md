# UK EODH Documentation

This repository contains the source for the **UK Earth Observation Data Hub (EODH)** documentation site, built with **[MkDocs](https://www.mkdocs.org/)** using the **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)** theme.

- **Docs source**: `docs/`
- **MkDocs config**: `mkdocs.yml`
- **Published site URL**: `https://eodatahub.org.uk/docs/documentation`

## Local development

This repo includes a `pixi.toml` with the Python dependencies needed to run MkDocs locally. You can use either Pixi directly or Docker Compose.

### Option 1: Pixi

1. Install Pixi: [pixi.sh](https://pixi.sh/)
2. From the repo root:

```bash
pixi install
pixi run serve
```

Then open `http://127.0.0.1:8000/`.

### Option 2: Docker Compose

1. Install [Docker](https://docs.docker.com/get-docker/)
2. From the repo root:

```bash
docker compose up --build
```

The docs site will be available at `http://127.0.0.1:8100/` with hot-reload enabled — edits to `docs/` or `mkdocs.yml` are reflected immediately.

To build the static site instead:

```bash
docker compose run --rm docs pixi run build
```

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


