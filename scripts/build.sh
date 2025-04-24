python3 -m ensurepip --upgrade
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade uv || python3 -m pip install --upgrade pipx && pipx install uv
uv sync
uv run ../manage.py collectstatic --noinput