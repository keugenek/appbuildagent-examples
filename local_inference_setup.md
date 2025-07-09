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

Thanks Mitko Vasilyev for the configuration [OwnYourAI](https://www.linkedin.com/in/ownyourai).

## Function Calling Model Compatibility

Not all Ollama models support function calling properly, which is required for the agent's FSM tools to work correctly. Models that don't support function calling will cause endless refinement loops.

**Compatible Models (tested):**
- `llama3.3:latest` ✅
- `devstral:latest` ✅

**Incompatible Models:**
- `qwen2.5-coder:32b` ❌ (returns function calls as text)
- `gemma3:27b` ❌ (explicitly doesn't support tools)

**Symptoms of incompatible models:**
- Agent gets stuck in endless refinement loops
- Generate command hits the 5-attempt limit and fails
- Models return function calls as plain text instead of using tool_calls format

**Solution:** Use a function calling compatible model in `.env`:
```bash
LLM_BEST_CODING_MODEL=llama3.3:latest
LLM_UNIVERSAL_MODEL=llama3.3:latest
```


