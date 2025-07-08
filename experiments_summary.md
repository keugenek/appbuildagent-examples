# App.build Agent Experiments Summary

## Overview
This repository contains a comprehensive plan to test and demonstrate the app.build agent's capabilities as described in the article about local AI development.

## Experiments Prepared

### 1. **Cost Analysis** (`experiment_1_cost_analysis.md`)
- Compares cloud API costs vs free local models
- Estimates $25-300 per 2-hour session for cloud models
- Local models run completely free

### 2. **Rate Limits Study** (`experiment_2_rate_limits.md`)
- Documents rate limits across major AI coding tools
- Shows how local deployment eliminates availability issues
- Demonstrates unlimited usage with Ollama

### 3. **Parallelization Performance** (`experiment_3_parallelization.md`)
- Tests performance on MacBook M4 vs Threadripper workstation
- Measures speedup with parallel request handling
- Includes Python script for benchmarking

### 4. **Model Capabilities Mapping** (`experiment_4_model_capabilities.md`)
- Maps open models to closed model features
- Shows feature parity in most areas
- Guides model selection for specific use cases

### 5. **Iteration Comparison** (`experiment_5_iteration_comparison.md`)
- Compares iterations needed across different models
- Shows 3-5 iterations for top closed models
- Open models need 5-18 iterations but improving

## How to Run Experiments

### Quick Start:
```bash
# Navigate to agent directory
cd /Users/evgenii.kniazev/projects/agent/agent

# Run a simple generation
uv run generate --prompt="Create a todo list app"

# Or use the provided script
./run_experiments.sh
```

### Key Commands:
- `uv run generate --prompt="[YOUR PROMPT]"` - Generate an app
- `uv run interactive` - Interactive CLI mode
- `uv run help` - Show all available commands

## Expected Outcomes

1. **Cost Savings**: $0 for local vs $25-300 per session
2. **No Rate Limits**: Unlimited local usage
3. **Better Performance**: Parallel execution without API constraints
4. **Privacy**: Complete data control
5. **Flexibility**: Choose models based on needs

## Article Insights

The article demonstrates that:
- Local LLMs are now viable for production development
- Open models lag closed ones by only ~6 months
- Hardware investment (GPUs) pays off quickly
- No vendor lock-in or model drift issues
- Complete control over your development environment

## Next Steps

1. Install Ollama and required models
2. Set up app.build agent environment
3. Run the experiments systematically
4. Document actual results vs predictions
5. Share findings with the community