# App.build Agent Experiments Plan

This document lists experiments to evaluate app.build with both cloud and local LLMs.

## How to Run the Agent

```bash
cd /Users/evgenii.kniazev/projects/agent/agent
uv run generate --prompt="your app description"
```

For local inference using `llama.cpp` first follow [local_inference_setup.md](local_inference_setup.md).

## Experiment 1: Cost Comparison
Compare API usage costs against completely local generation for a 2‑hour coding session.

## Experiment 2: Generation Success Rate
Test the same prompts with cloud vs local models and track completion time.

## Experiment 3: Rate Limits Analysis
Document rate limits for Claude Code, OpenAI, Gemini CLI and others.

## Experiment 4: Parallelization Performance
Measure tokens per second when running multiple instances on test hardware (MacBook Pro M4 and Threadripper PRO dual 3090).

## Experiment 5: Model Capabilities Mapping
Map open-source models to features of closed APIs (context size, vision, reasoning, function calling).

## Experiment 6: Iteration Count Comparison
Track how many iterations are required to build a standard reference app across models.

## Experiment 7: Local Inference Tweaks
Evaluate the Qwen3 30B model using the following command:

```bash
llama-cli -hf Qwen/Qwen3-30B-A3B:Q8_0 --jinja --color -ngl 99 -fa -sm row \
  --temp 0.6 --top-k 20 --top-p 0.95 --min-p 0 \
  --presence-penalty 1.5 -c 40960 -n 32768 --no-context-shift
```

This configuration is attributed to [OwnYourAI](https://www.linkedin.com/in/ownyourai?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app).

Experiment with other models, quantization levels, and parameters (e.g., lower `--temp` for deterministic output) to find optimal local settings.

