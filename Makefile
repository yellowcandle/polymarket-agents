# Make uv-based helpers available for daily use

.PHONY: uv-help uv-get-markets uv-smoke clean

# Wrapper to invoke commands inside the uv-managed Python 3.12 environment
UV_WRAP = ./scripts/uv-run.sh

uv-help:
	@$(UV_WRAP) python scripts/python/cli.py --help

uv-get-markets:
	@$(UV_WRAP) python scripts/python/cli.py get-all-markets --limit 1

uv-smoke:
	@$(UV_WRAP) python -c "from py_clob_client.client import ClobClient; print('core import OK')" 

clean:
	@rm -f uv-migration.patch || true
	@rm -rf uv-migration || true
	@echo "Cleaned auxiliary artifacts"
