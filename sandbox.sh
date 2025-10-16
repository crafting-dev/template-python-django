#!/bin/bash

# ============================================
# Configure sandbox for quick workspace setup using uv.
# ============================================

echo '== Install uv =='
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.cargo/bin:$PATH"

echo '== Install Python dependencies with uv =='
uv sync

echo '== Apply unapplied migration(s) =='
uv run python manage.py migrate

echo '== Done! == '
