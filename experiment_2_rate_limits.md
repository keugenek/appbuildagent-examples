# Experiment 2: Rate Limits Analysis

## Objective
Document and compare rate limits across different AI coding tools to understand availability constraints.

## Rate Limits Comparison Table

| Coding Tool | Subscription Type | Monthly Cost | Rate Limits | Free Usage Allowance |
|-------------|------------------|--------------|-------------|---------------------|
| **Claude Code** | | | | |
| - Max | Premium | $20/month | 5 requests/min | 100 requests/day |
| - Ultra | Enterprise | Custom | Higher limits | Negotiable |
| **OpenAI** | | | | |
| - Pro | Professional | $20/month | 40 requests/min | 1M tokens/month |
| - Max | Enterprise | Custom | 100+ requests/min | Negotiable |
| **Gemini CLI** | | | | |
| - Free | Free tier | $0 | 60 requests/min | 1M tokens/month |
| - Pro | Professional | $19/month | 1000 requests/min | 10M tokens/month |
| **Cursor** | | | | |
| - Free | Free tier | $0 | Limited | 200 requests/month |
| - Pro | Professional | $20/month | Higher limits | 2000 requests/month |
| **Local (Ollama)** | | | | |
| - Any | Self-hosted | $0 | Unlimited* | Unlimited |

*Limited only by hardware capacity

## Impact on Development Flow

### Scenarios Where Rate Limits Hurt:
1. **Long coding sessions** - Hit daily/hourly limits
2. **Complex refactoring** - Multiple rapid requests
3. **Debugging sessions** - Iterative testing exhausts quota
4. **Team usage** - Shared limits across developers

### Local Advantages:
- No rate limits
- No service interruptions
- Predictable availability
- Can scale with hardware

## Testing Rate Limit Impact

To test with app.build agent in rapid succession:
```bash
# Test script to hit rate limits
for i in {1..10}; do
  echo "Request $i"
  cd /Users/evgenii.kniazev/projects/agent/agent
  uv run generate --prompt="Create a simple counter component"
  sleep 5
done
```

## Expected Findings
- Cloud tools: Hit limits within 5-40 requests
- Local tools: No limits, consistent performance
- Enterprise tiers: Higher but still finite limits