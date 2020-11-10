PROJECT		= "github.com/eplightning/vault-plugin-secrets-minio"
GOFILES		= $(shell find . -name "*.go")

GOARCH = amd64

UNAME = $(shell uname -s)

ifndef OS
	ifeq ($(UNAME), Linux)
		OS = linux
	else ifeq ($(UNAME), Darwin)
		OS = darwin
	endif
endif

default: vault-plugin-secrets-minio

vault-plugin-secrets-minio: $(GOFILES)
	CGO_ENABLED=0 go build -ldflags "-s -w" ./cmd/vault-plugin-secrets-minio

clean:
	rm -f vault-plugin-secrets-minio

test: vault-plugin-secrets-minio
	/bin/bash test/test.sh

.PHONY: default clean test
