#!/bin/bash

# App.build Agent Experiment Runner
# This script demonstrates how to run all experiments from the article

echo "========================================="
echo "App.build Agent Experiments"
echo "========================================="

AGENT_DIR="/Users/evgenii.kniazev/projects/agent/agent"
RESULTS_DIR="./experiment_results"

# Create results directory
mkdir -p "$RESULTS_DIR"

# Function to run a single experiment
run_experiment() {
    local experiment_name=$1
    local prompt=$2
    local output_file="$RESULTS_DIR/${experiment_name}_$(date +%Y%m%d_%H%M%S).log"
    
    echo "Running experiment: $experiment_name"
    echo "Prompt: $prompt"
    echo "Output: $output_file"
    echo "---"
    
    cd "$AGENT_DIR"
    uv run generate --prompt="$prompt" > "$output_file" 2>&1
    
    echo "Experiment completed. Check $output_file for results."
    echo ""
}

# Experiment prompts
SIMPLE_TODO="Create a todo list app with add, edit, delete tasks and persistence"
ECOMMERCE="Build an e-commerce product catalog with search, filters, cart, and checkout"
CHAT_APP="Develop a real-time chat with user auth, rooms, and message history"
PROJECT_MGMT="Create a project management app with tasks, kanban board, calendar, and reports"

echo "Starting experiments..."
echo ""

# Run experiments
echo "1. Testing Simple Todo App Generation"
run_experiment "simple_todo" "$SIMPLE_TODO"

echo "2. Testing E-commerce Catalog Generation"
run_experiment "ecommerce" "$ECOMMERCE"

echo "3. Testing Real-time Chat Generation"
run_experiment "chat_app" "$CHAT_APP"

echo "4. Testing Complex Project Management App"
run_experiment "project_mgmt" "$PROJECT_MGMT"

echo "========================================="
echo "All experiments completed!"
echo "Results saved in: $RESULTS_DIR"
echo "========================================="

# Generate summary report
cat > "$RESULTS_DIR/summary.md" << EOF
# App.build Agent Experiment Results

Generated on: $(date)

## Experiments Run:
1. Simple Todo App
2. E-commerce Catalog
3. Real-time Chat
4. Project Management System

## Next Steps:
- Analyze generation times
- Count iterations needed
- Measure token consumption
- Compare with cloud model costs
- Test on different hardware
EOF

echo "Summary report created: $RESULTS_DIR/summary.md"