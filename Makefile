SHELL := /bin/bash
.SHELLFLAGS := -O extglob -eo pipefail -c
.DEFAULT_GOAL := .last_update


# update *.md (markdown) files
.last_update: de_*.md
	@echo "  UPDATE   $@"
	@git add de_*.md
	@/home/mbarkhau/miniconda3/envs/py312/bin/python \
		../scratch/translate.py translate translate_en_de.toml --verbose
	touch .last_update


ingest:
	@/home/mbarkhau/miniconda3/envs/py312/bin/python \
		../scratch/translate.py ingest translate_en_de.toml --verbose
	touch .last_update
