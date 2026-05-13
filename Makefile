.DEFAULT_GOAL := help

LEETGO_REMOTE ?= leetgo
LEETGO_LOCAL ?= leetgofork
OFFLINE_TEST_FLAG ?= -O
SITE ?= us
CODE_LANG ?= go
ID ?= last

.PHONY: help setup init pick test-local test-remote submit edit open \
	init-go init-python init-cpp init-rust \
	pick-go pick-python pick-cpp pick-rust \
	test-local-go test-local-python test-local-cpp test-local-rust \
	test-remote-go test-remote-python test-remote-cpp test-remote-rust \
	submit-go submit-python submit-cpp submit-rust \
	edit-go edit-python edit-cpp edit-rust \
	open-go open-python open-cpp open-rust

define leetgo_init
	$(LEETGO_REMOTE) init -t $(SITE) -l $(1)
endef

define leetgo_pick
	$(LEETGO_LOCAL) -l $(1) pick $(ID)
endef

define leetgo_test_local
	$(LEETGO_LOCAL) -l $(1) test $(OFFLINE_TEST_FLAG) $(ID)
endef

define leetgo_test_remote
	$(LEETGO_REMOTE) -l $(1) test $(ID)
endef

define leetgo_submit
	$(LEETGO_REMOTE) -l $(1) submit $(ID)
endef

define leetgo_edit
	$(LEETGO_REMOTE) -l $(1) edit $(ID)
endef

define leetgo_open
	$(LEETGO_REMOTE) -l $(1) open $(ID)
endef

help:
	@printf '%s\n' "LeetCode workspace com leetgo"
	@printf '%s\n' ""
	@printf '%s\n' "Targets:"
	@printf '%s\n' "  make setup               Instala o leetgo via go install"
	@printf '%s\n' "  make init                Inicializa o workspace ($(SITE), $(CODE_LANG))"
	@printf '%s\n' "  make pick ID=1           Gera um problema pelo id/slug/data"
	@printf '%s\n' "  make test-local          Roda o teste local/offline com -O"
	@printf '%s\n' "  make test-remote         Roda o teste sem -L"
	@printf '%s\n' "  make submit              Submete a ultima solucao"
	@printf '%s\n' "  make edit                Abre a ultima solucao"
	@printf '%s\n' "  make open                Abre a pagina do problema"
	@printf '%s\n' ""
	@printf '%s\n' "Lang targets:"
	@printf '%s\n' "  make init-go             Init com Go"
	@printf '%s\n' "  make init-python         Init com Python"
	@printf '%s\n' "  make init-cpp            Init com C++"
	@printf '%s\n' "  make init-rust           Init com Rust"
	@printf '%s\n' "  make pick-go ID=1        Pega problema com Go"
	@printf '%s\n' "  make pick-python ID=1    Pega problema com Python"
	@printf '%s\n' "  make pick-cpp ID=1       Pega problema com C++"
	@printf '%s\n' "  make pick-rust ID=1      Pega problema com Rust"
	@printf '%s\n' ""
	@printf '%s\n' "Vars:"
	@printf '%s\n' "  SITE=us CODE_LANG=go ID=last LEETGO_REMOTE=leetgo LEETGO_LOCAL=leetgofork"

setup:
	go install github.com/j178/leetgo@latest
	@printf '%s\n' ""
	@printf '%s\n' "Se 'leetgo' nao for encontrado, adicione isto ao PATH:"
	@printf '%s\n' 'export PATH="$$(go env GOPATH)/bin:$$PATH"'

init:
	$(LEETGO_REMOTE) init -t $(SITE) -l $(CODE_LANG)

pick:
	$(LEETGO_LOCAL) -l $(CODE_LANG) pick $(ID)

test-local:
	@if [ "$(CODE_LANG)" = "go" ]; then \
		$(MAKE) --no-print-directory test-local-go ID=$(ID); \
	else \
		$(LEETGO_LOCAL) -l $(CODE_LANG) test $(OFFLINE_TEST_FLAG) $(ID); \
	fi

test-remote:
	$(LEETGO_REMOTE) -l $(CODE_LANG) test $(ID)

submit:
	$(LEETGO) -l $(CODE_LANG) submit $(ID)

edit:
	$(LEETGO) -l $(CODE_LANG) edit $(ID)

open:
	$(LEETGO) -l $(CODE_LANG) open $(ID)

init-go:
	$(call leetgo_init,go)

init-python:
	$(call leetgo_init,python3)

init-cpp:
	$(call leetgo_init,cpp)

init-rust:
	$(call leetgo_init,rust)

pick-go:
	$(call leetgo_pick,go)

pick-python:
	$(call leetgo_pick,python3)

pick-cpp:
	$(call leetgo_pick,cpp)

pick-rust:
	$(call leetgo_pick,rust)

test-local-go:
	$(call leetgo_test_local,go)

test-local-python:
	$(call leetgo_test_local,python3)

test-local-cpp:
	$(call leetgo_test_local,cpp)

test-local-rust:
	$(call leetgo_test_local,rust)

test-remote-go:
	$(call leetgo_test_remote,go)

test-remote-python:
	$(call leetgo_test_remote,python3)

test-remote-cpp:
	$(call leetgo_test_remote,cpp)

test-remote-rust:
	$(call leetgo_test_remote,rust)

submit-go:
	$(call leetgo_submit,go)

submit-python:
	$(call leetgo_submit,python3)

submit-cpp:
	$(call leetgo_submit,cpp)

submit-rust:
	$(call leetgo_submit,rust)

edit-go:
	$(call leetgo_edit,go)

edit-python:
	$(call leetgo_edit,python3)

edit-cpp:
	$(call leetgo_edit,cpp)

edit-rust:
	$(call leetgo_edit,rust)

open-go:
	$(call leetgo_open,go)

open-python:
	$(call leetgo_open,python3)

open-cpp:
	$(call leetgo_open,cpp)

open-rust:
	$(call leetgo_open,rust)
