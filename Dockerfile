FROM ghcr.io/prefix-dev/pixi:latest

WORKDIR /docs

# Copy pixi manifest files first so deps are cached
COPY pixi.toml pixi.lock ./

# Install project dependencies (cached layer)
RUN pixi install --frozen

# Copy the rest of the project
COPY . .

# Expose mkdocs serve port
EXPOSE 8000

# Default command: serve with hot-reload, bind to all interfaces
CMD ["pixi", "run", "serve"]
