UNAME_S := $(shell uname -s)


init:
	@echo "== Initializing the developer environment ==\n"
	@echo ">>> Installing developer dependencies - golangci-lint"

    ifeq ($(UNAME_S),Linux)
		curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
    endif
    ifeq ($(UNAME_S),Darwin)
        brew install golangci-lint
    endif
	@echo "\n\n"
	@echo ">>> Setting up pre-commit:"
	python3 -m pip install pre-commit
	pre-commit install --install-hooks

# @echo "== install ginkgo =="
# go install -mod=mod github.com/onsi/ginkgo/v2/ginkgo
# go get github.com/onsi/gomega/...

# @echo "== install gomock =="
# go install github.com/golang/mock/mockgen@v1.6.0

# precommit.rehooks:
# 	pre-commit install --hook-type commit-msg

test:
	go test -tags=unit -timeout 30s -short -v ./...

build:
	go build -v

clean:
	go clean -x
