# Experiment 1: Cost Analysis - Cloud vs Local Models

## Objective
Compare the costs of using cloud-based AI models vs local models for app generation using app.build agent.

## Test Prompts

### Prompt 1: Simple Todo App
```
Create a todo list application with the following features:
- Add, edit, and delete tasks
- Mark tasks as complete
- Filter tasks by status (all, active, completed)
- Persist data in a database
```

### Prompt 2: E-commerce Product Catalog
```
Build an e-commerce product catalog with:
- Product listing with search and filters
- Product detail pages
- Shopping cart functionality
- Checkout process
- Admin panel for product management
```

### Prompt 3: Real-time Chat Application
```
Develop a real-time chat application with:
- User registration and authentication
- Create and join chat rooms
- Real-time message delivery
- User presence indicators
- Message history
```

## Cost Calculation Table

| Model | Cost per Million Tokens | Est. Tokens (2hr session) | Total Cost | Validation Status |
|-------|------------------------|---------------------------|------------|-------------------|
| OpenAI o3 | $2 input / $8 output [[OpenAI Pricing](https://openai.com/api/pricing/)] | 2-5M | $20-40 | ✅ VERIFIED |
| OpenAI o3-pro | $20 input / $80 output [[OpenAI Pricing](https://openai.com/api/pricing/)] | 2-5M | $200-400 | ✅ VERIFIED |
| OpenAI GPT-4o | $2.50 input / $10 output [[OpenAI Pricing](https://openai.com/api/pricing/)] | 2-5M | $25-50 | ✅ VERIFIED |
| Anthropic Claude Opus 4 | $15 input / $75 output [[Anthropic Pricing](https://docs.anthropic.com/en/api/pricing)] | 2-5M | $150-300 | ✅ VERIFIED |
| Anthropic Claude Sonnet 4 | $3 input / $15 output [[Anthropic Pricing](https://docs.anthropic.com/en/api/pricing)] | 2-5M | $30-60 | ✅ VERIFIED |
| Google Gemini 2.5 Pro | $1.25 input / $10 output (<200K), $2.50/$15 (>200K) [[Google AI Pricing](https://ai.google.dev/pricing)] | 2-5M | $12.50-50 | ⚠️ UPDATED |
| Local Models (Ollama) | $0 [[Ollama GitHub](https://github.com/ollama/ollama)] | Unlimited | $0 | ✅ VERIFIED |

**Notes:**
- Gemini 2.5 Pro output pricing was corrected from $5 to $10 per million tokens
- OpenAI o3 pricing added after 80% price drop in Jan 2025
- Prices can be reduced through caching (up to 90% for Anthropic) and batch processing (50% discount)

## Running the Experiment

To test with app.build agent:
```bash
# Navigate to agent directory
cd /Users/evgenii.kniazev/projects/agent/agent

# Run with each prompt
uv run generate --prompt="[INSERT PROMPT HERE]"
```

## Metrics to Collect
1. Total tokens consumed
2. Time to completion
3. Number of iterations
4. Success rate
5. Quality of generated code

## Expected Results
- Cloud models: Higher quality but significant costs ($25-300 per session)
- Local models: Free but potentially lower quality or more iterations needed

## <todo> Experiments to Run

1. **Token Consumption Measurement**
   - <todo> Run each prompt with app.build agent and measure actual token usage
   - <todo> Track input vs output token ratios for accurate cost calculation

2. **Model Comparison**
   - <todo> Test same prompts with local models (DeepSeek, Llama, Qwen) via Ollama
   - <todo> Compare quality and iteration count vs cloud models

3. **Session Duration Analysis**
   - <todo> Measure actual time for 2-hour development session token consumption
   - <todo> Track token usage patterns during debugging vs initial generation