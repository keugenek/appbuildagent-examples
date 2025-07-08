# App.build Agent Experiments Plan

Based on the article analysis, here are the experiments to run using the app.build agent located at `/Users/evgenii.kniazev/projects/agent/agent`.

## How to Run the Agent

The agent can be executed using:
```bash
cd /Users/evgenii.kniazev/projects/agent/agent
uv run generate --prompt="your app description"
```

## Experiment 1: Cost Comparison Table (Article lines 62-70)

Compare API-based costs vs local development for a 2-hour coding session.

### Parameters:
- Session length: 2 hours
- Token consumption: To be measured
- Models to compare:
  - OpenAI o3/o3-mini
  - OpenAI GPT-4/4o
  - Anthropic Claude Opus/Sonnet
  - Google Gemini 2.5 Pro
  - Local models (free)

### Sample Prompts to Test:
1. "Create a todo list app with user authentication"
2. "Build an e-commerce product catalog with shopping cart"
3. "Develop a real-time chat application"

## Experiment 2: Generation Success Comparison (Article lines 75-78)

Test various prompts with cloud vs local models.

### Test Matrix:
| Prompt | Model | Generation Success | Time to Complete | Comments |
|--------|-------|-------------------|------------------|----------|
| (To be filled) | | | | |

## Experiment 3: Rate Limits Analysis (Article lines 87-92)

Document rate limits across coding tools.

### Tools to Analyze:
- Claude Code (Max, Ultra)
- OpenAI (Pro, Max)
- Gemini CLI
- Cursor
- Local (unlimited)

## Experiment 4: Parallelization Performance (Article lines 112-115)

Compare performance on different hardware with varying parallelization rates.

### Test Systems:
1. MacBook Pro M4 48GB RAM
2. Threadripper PRO 39xx dual RTX 3090

### Metrics:
- Time vs parallelization rate
- Tokens per second
- Memory usage

## Experiment 5: Model Capabilities Mapping (Article lines 125-131)

Map open models to closed model features.

### Features to Compare:
- 200K+ context support
- Visual understanding
- Fast inference
- Reasoning capabilities
- Function calling

## Experiment 6: Iteration Count Comparison (Article lines 152-159)

Compare number of iterations needed to complete a working app.

### Models to Test:
- Anthropic Sonnet
- Google Gemini
- DeepSeek R1
- Mixtral
- StarCoder
- Llama 3.1

### Test Application:
A standard reference app (to be defined)

## Next Steps

1. Set up the test environment
2. Define standard test prompts
3. Create measurement scripts
4. Run experiments systematically
5. Document results