# Experiment 2: Rate Limits Analysis

## Objective
Document and compare rate limits across different AI coding tools to understand availability constraints.

## Rate Limits Comparison Table

| Coding Tool | Subscription Type | Monthly Cost | Rate Limits | Free Usage Allowance | Validation Status |
|-------------|------------------|--------------|-------------|---------------------|-------------------|
| **Claude Code** | | | | | |
| - Free | Free tier | $0 | ~100 messages/day | 100 messages/day, 20 searches/day | ✅ [[Claude Support](https://support.anthropic.com/en/articles/9518518-how-do-i-use-claude-ai)] |
| - Pro | Professional | $20/month | 5x more than free | ~500 messages/day | ✅ [[Claude Pricing](https://www.anthropic.com/pricing)] |
| - Max | Premium | $100/month | 5x more than Pro | ~2,500 messages/day | ✅ [[Claude Pricing](https://www.anthropic.com/pricing)] |
| - Ultra | Premium | $200/month | 20x more than Pro | ~900 messages/5hrs | ✅ [[Claude Pricing](https://www.anthropic.com/pricing)] |
| **OpenAI API** | | | | | |
| - Tier 1 | Basic | Usage-based | 3,500 RPM, 90K TPM | Depends on model | ✅ [[OpenAI Rate Limits](https://platform.openai.com/docs/guides/rate-limits)] |
| - Tier 2 | Higher | $500/month | Higher limits | Depends on model | ✅ [[OpenAI Rate Limits](https://platform.openai.com/docs/guides/rate-limits)] |
| - Tier 5 | Premium | $200K/month | Much higher limits | Depends on model | ✅ [[OpenAI Rate Limits](https://platform.openai.com/docs/guides/rate-limits)] |
| **Google Gemini API** | | | | | |
| - Free | Free tier | $0 | 5 RPM, 250K TPM | 100 RPD (Pro), 250 RPD (Flash) | ✅ [[Gemini API Docs](https://ai.google.dev/gemini-api/docs/models)] |
| - Tier 1 | Paid | Usage-based | 150 RPM, 2M TPM | 1K RPD (Pro), 10K RPD (Flash) | ✅ [[Gemini API Docs](https://ai.google.dev/gemini-api/docs/models)] |
| - Tier 2 | Higher | Usage-based | 1K RPM, 5M TPM | 50K RPD (Pro), 100K RPD (Flash) | ✅ [[Gemini API Docs](https://ai.google.dev/gemini-api/docs/models)] |
| **Cursor** | | | | | |
| - Free | Free tier | $0 | 50 requests/month | 50 requests/month | ✅ [[Cursor Pricing](https://cursor.sh/pricing)] |
| - Pro | Professional | $20/month | 500 fast/unlimited slow | 500 fast requests/month | ✅ [[Cursor Pricing](https://cursor.sh/pricing)] |
| - Ultra | Premium | $200/month | 20x more than Pro | ~13K requests/month | ✅ [[Cursor Pricing](https://cursor.sh/pricing)] |
| **Local (Ollama)** | | | | | |
| - Any | Self-hosted | $0 | Unlimited* | Unlimited | ✅ [[Ollama GitHub](https://github.com/ollama/ollama)] |

*Limited only by hardware capacity

**Sources:**
- Claude Code: Anthropic official documentation Jan 2025
- OpenAI API: OpenAI rate limits documentation
- Google Gemini: Google AI API documentation
- Cursor: Cursor pricing page and documentation

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

## <todo> Experiments to Run

1. **Rate Limit Testing**
   - <todo> Test rapid fire requests with app.build agent to measure actual hit limits
   - <todo> Document exact error messages and cooldown periods
   - <todo> Test burst vs sustained request patterns

2. **Development Flow Impact**
   - <todo> Measure productivity during rate-limited vs unlimited sessions
   - <todo> Track time lost to rate limit waits during complex debugging
   - <todo> Compare team development velocity with shared vs individual limits

3. **Local vs Cloud Performance**
   - <todo> Benchmark app.build agent response times with local models
   - <todo> Compare parallel request handling between Ollama and cloud APIs
   - <todo> Measure availability uptime: local vs cloud services