# Local Inference Setup

This guide describes how to run app.build with fully local inference using `llama.cpp`.

## Installation

For macOS using Homebrew:

```bash
brew install llama.cpp
```

This installs the `llama-cli` command which provides fast local inference for
many models.

## Example Command

To launch the Qwen3 30B model in MAX mode run:

```bash
llama-cli -hf Qwen/Qwen3-30B-A3B:Q8_0 --jinja --color -ngl 99 -fa -sm row \
  --temp 0.6 --top-k 20 --top-p 0.95 --min-p 0 \
  --presence-penalty 1.5 -c 40960 -n 32768 --no-context-shift
```

The flags above enable fast GPU inference and extended context windows. Adjust
`--temp`, `--top-k` and `--top-p` to experiment with different creativity
settings.

Configuration courtesy of [OwnYourAI](https://www.linkedin.com/in/ownyourai?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app).


