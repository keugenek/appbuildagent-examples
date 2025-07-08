# Experiment 3: Parallelization Performance Analysis

## Objective
Compare app.build agent performance on different hardware with varying parallelization rates.

## Test Systems

### System 1: MacBook Pro M4
- CPU: Apple M4
- Memory: 48GB unified
- GPU: Integrated
- Expected tokens/s: 30-50

### System 2: Threadripper PRO Workstation
- CPU: Threadripper PRO 3995WX
- Memory: 512GB (4-channel)
- GPU: Dual RTX 3090 (24GB VRAM each)
- Expected tokens/s: 100-200

## Parallelization Test Matrix

| Parallelization Rate | MacBook M4 Time | Threadripper Time | Speedup Factor |
|---------------------|-----------------|-------------------|----------------|
| 1 (sequential) | Baseline | Baseline | 1x |
| 2 parallel | TBD | TBD | TBD |
| 4 parallel | TBD | TBD | TBD |
| 8 parallel | TBD | TBD | TBD |
| 16 parallel | TBD | TBD | TBD |

## Test Scenario

Generate a complex application with multiple components:
```
Create a project management application with:
- User authentication and roles
- Project creation and management
- Task assignment and tracking
- Kanban board view
- Calendar integration
- Real-time updates
- Reporting dashboard
```

## Performance Metrics Script

```python
import time
import subprocess
import matplotlib.pyplot as plt

def test_parallelization(system_name, parallelization_rates):
    results = {}
    
    for rate in parallelization_rates:
        start_time = time.time()
        
        # Run app.build with parallelization setting
        cmd = f"cd /Users/evgenii.kniazev/projects/agent/agent && uv run generate --prompt='[PROMPT]' --parallel={rate}"
        subprocess.run(cmd, shell=True)
        
        end_time = time.time()
        results[rate] = end_time - start_time
    
    return results

# Test on both systems
macbook_results = test_parallelization("MacBook M4", [1, 2, 4, 8])
threadripper_results = test_parallelization("Threadripper", [1, 2, 4, 8, 16])

# Plot results
plt.figure(figsize=(10, 6))
plt.plot(list(macbook_results.keys()), list(macbook_results.values()), 'b-o', label='MacBook M4')
plt.plot(list(threadripper_results.keys()), list(threadripper_results.values()), 'r-o', label='Threadripper PRO')
plt.xlabel('Parallelization Rate')
plt.ylabel('Time (seconds)')
plt.title('App.build Performance vs Parallelization Rate')
plt.legend()
plt.grid(True)
plt.savefig('parallelization_performance.png')
```

## Expected Results

### MacBook M4:
- Optimal parallelization: 2-4x
- Memory bandwidth limited
- Diminishing returns after 4x

### Threadripper System:
- Optimal parallelization: 8-16x
- VRAM and PCIe bandwidth advantages
- Near-linear scaling up to 8x

## Key Insights
1. Local systems can handle burst parallelization better than cloud APIs
2. Hardware investment pays off for heavy usage
3. No rate limit concerns with local deployment