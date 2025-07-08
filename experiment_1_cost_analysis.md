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

| Model | Cost per Million Tokens | Est. Tokens (2hr session) | Total Cost |
|-------|------------------------|---------------------------|------------|
| OpenAI o3 | TBD | 2-5M | TBD |
| OpenAI GPT-4o | $2.50 input / $10 output | 2-5M | $25-50 |
| Anthropic Claude Opus | $15 input / $75 output | 2-5M | $150-300 |
| Anthropic Claude Sonnet | $3 input / $15 output | 2-5M | $30-60 |
| Google Gemini 2.5 Pro | $1.25 input / $5 output | 2-5M | $12.50-25 |
| Local Models (Ollama) | $0 | Unlimited | $0 |

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