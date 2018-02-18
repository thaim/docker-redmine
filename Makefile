IMAGE=thaim/redmine

.PHONY: help build push

help: ## このヘルプメッセージを表示
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Dockerイメージを生成する
	docker build \
		-t $(IMAGE):latest \
		.

push: ## 生成したDockerイメージをRegistryに保存する
	docker push $(IMAGE):latest
