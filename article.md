App.build - free, open source fully local agent for full-stack application development

Preface
======
A rise of capable open LLMs like DeepSeek or Qwen or Mistral lead to the first ever opportunity to generate working applications locally with no dependency on any cloud API or framework.

We present a solution suitable for local agentic workflows allowing to generate fully working applications end-to-end for free in autonomous mode.

Toolkits for local LLM inference like Ollama or vLLM enabled any new LLM quickly supported in such tools to abstract from underlying hardware.

Even more tools are being developed including Nano vLLM <link> that unlocks anyone to deploy their fully local inference on any hardware.

On the hardware side of things consumer GPUs like Nvidia 4090 and 3090ti are available on the market with enough memory (24Gb) to run 8b models in full precision or even larger ones with quantization (check relevant section).

Combining multiple GPUs in one system that runs on systems that have plenty of PCIe lanes and enough memory unlocks opportunities to scale using up to 7 or even more GPUs in one system.

For example check out sample system we are testing app.build for local development (Threadripper PRO 39xx dual RTX 3090 512 Gb 4 channel ram) to run Ollama with more than xx tokens / s on dual GPU with optional addition of NVlink bridge between 2 cards and overclocking capabilities with water-cooling setup.

Another great opportunity to run LLMs locally comes with Apple M chips, for example a reference Mac Book Pro M4 with 48GB of unified memory shareable between CPU and GPU. Such a system is capable of running XX LLM with up to xx tokens / s.

Why Local?
========
Yet there is a clear trend towards API usage via native APIs by LLM developers in agentic systems or hyperscalers, there are still many unresolved concerns that may be relevant for companies actively experimenting with agentic systems for code generation and deploying them to production.

We share these in relevant sections below showcasing how app.build can leverage its open source nature and ability to be run locally with free inferencing tools like Ollama on consumer / prosumer hardware opening and avenue for local LLM-based experimentation, prototyping and even production development.

There are multiple concerns addressed below including controlling AI development / codegen agent system costs, delivering performance and availability SLAs, simplifying setup and allowing faster startup, removing vendor lock-in, addressing GDPR / HIPAA / data sharing concerns and more.

No Credentials Required
==================
Staring with local AI inference is very easy and free with ollama:
<code>
apt install ollama  
ollama ps
ollama ls
 
ollama run xxx
Ollama serve
<todo> check out a fast start using guide below for using local LLM inference with app.build. 
Note we only tested this setup with limited hardware configurations listed below:
MacBook Pro M4 48GB RAM
Threadripper Pro 399x 512GB RAM, dual Nvidia RTX 3090 GPUs 
<todo> move here some performance measurements on pure ollama
Check out app.build repository for more details how to set up ollama based setup here: <todo>.

Choose Between Speed and Capability
—————————————————-
In closed APIs there are very limited ways to choose between model capabilities and performance, with 2-3 models to choose from max. * More recent reasoning models are now giving compute budgets to better tune balance vs capability, performance and cost.

In the open model world there is more choice to do so by either selecting more granular model sizes, quantization and other parameters even within a single model.

<todo> a table of available ollama flavors of Google Gemma including QAT and UnSloth.AI models with better quantizations and performance.

MoE architecture is also something worth noting allowing loading much larger total parameters models with systems having larger amounts of multi-channel fast RAM.

<todo> Present app.build performance on DeepSeek MoE 600b model on Threadripper Pro system.

Control LLM Usage Costs
———————————-
There are plenty of closed models available by API including ones from Anthropic, Google, OpenAI, DeepSeek, Mistral and others.

Although these SoTA models are the best for coding and developing agents they very soon become very costly to use when consumed via APIs. Consider these sample cost breakdowns of top models based on average coding session length and estimated token consumed:

Session length: 2 hours, estimated 2-5 million tokens consumed for a typical coding session

**Table 1. Breakdown of API-based cost per AI-assisted coding session**

| Model | Cost per Million Tokens | Est. Tokens (2hr session) | Total Cost |
|-------|------------------------|---------------------------|------------|
| OpenAI o3 | $2 input / $8 output | 2-5M | $20-40 |
| OpenAI o3-pro | $20 input / $80 output | 2-5M | $200-400 |
| OpenAI GPT-4o | $2.50 input / $10 output | 2-5M | $25-50 |
| OpenAI GPT-o3-mini | $1.10 input / $4.40 output | 2-5M | $25-50 |
| Anthropic Claude Opus 4 | $15 input / $75 output | 2-5M | $150-300 |
| Anthropic Claude Sonnet 4 | $3 input / $15 output | 2-5M | $30-60 |
| Google Gemini 2.5 Pro | $1.25 input / $10 output (<200K), $2.50/$15 (>200K) | 2-5M | $12.50-50 |
| Local Models (Ollama) | $0 | Unlimited | $0 |

**Sources:**
- [OpenAI Pricing](https://openai.com/api/pricing/)
- [Anthropic Pricing](https://docs.anthropic.com/en/api/pricing)
- [Google AI Pricing](https://ai.google.dev/pricing)
- [Ollama GitHub](https://github.com/ollama/ollama)

Local development allows the same consumption completely free given the local models are capable enough to come up with the code that will work in an agentic setup.

Below there is a test of multiple sample prompts resulted in working applications generated by app.build.

Prompt, model, generation success, time to complete, comments
Xx xx xx
<todo> Table 2. Comparison between app.build generations powered by cloud models vs local ones
Given the rise of AI coding, cloud AI providers and tool developers came up with a solution of skyrocketing costs of API-based tools to include pre-allocated usage of less capable models into the monthly subscription costs to lock users to their platforms.

Enabling Availability SLAs
————————————
Every API-based system has often experienced major outages of their LLMs during their operation dropping their accessibility well below industry standard 99.99xx%  

To protect from overloading their systems all of the major providers implemented rate limits for their offerings, that are not public and may change over time unpredictably, see sample ones below.

Coding Tool, Subscription Type, Subscription Cost, Free Usage Allowance, …
Claude Code Max, Ultra
OpenAI Pro, Max
Gemini CLI
Cursor
<todo> Table x. Rate limits in coding tools

However we experienced a lot of rate limits hurting development flow in long sessions or during higher demand when there was no way to continue development anymore using cloud tools. There is no guaranteed method to allocate API capacity authors were aware of and therefore guarantee SLA for the development teams for the cloud LLM tools.

This is even more crucial for agentic systems like app.build that generate hundreds of LLM queries per session except using local / controlled LLM deployment.

Agentic Workload Peformance Boosting
—————————————————-
When developing app.build we relied on branching of multiple code versions to allow the agent to run faster and complete in less time. This required an LLM API to provide a required level of parallel request capacity to be available for our agent to run, especially serving user requests.

During the development of app.build our team contacted the AWS team to increase rate limits via AWS Bedrock that may partially mitigate the LLM API availability but this is only available for larger companies who generate significant usage for cloud providers. 

There was no clear way though to mitigate potential high demand spikes even with a limit to the number of requests rather than making the system unavailable for users.

This causes a waterfall of failures of many systems caused by downstream API failures.

A more robust solution would be to use autoscaling of parallel LLM infra which may be overkill for an experimental product but is fully in line with reference architectures for enterprise systems.
   
Local inference tools like Ollama and vLLM offer a great feature to serve parallel LLM requests on a single GPU enabling capability to be used as shared resource without locks and capability of one system to run many parallel LLM sessions with little overhead.

See comparison between various rates of parallelization of app.build when run on ollama in 2 reference systems - MacBook Pro M4 48GB RAM and Threadripper Pro based system with 48GB VRAM.

<todo>  Graph 1. Comparison between time and parallelization rate in 2 reference systems - MacBook Pro M4 48GB (top) and Threadripper PRO 39xx dual RTX 3090 with different parallelization rate

<todo check> This makes local systems more robust and sometimes more performant compared to cloud ones.

 
Vendor Lock-In
———————
Having used open source models we experienced significantly more freedom switching between them rather than in closed systems available by API.

Ollama tool supports many features across different models that may not even be available to them natively, for example function calling or usage of a long context, etc.

In app.build we rely on multiple features of closed source LLMs that were initially available only in these systems but now supported in open models too. App.build categorized these models along following types:
200K+ context - Anthropic Claude, Google Gemini // New MiniMax model supports up to 1M tokens
Visual understanding - Google Gemini // Google Gemma model is very good at visual understanding too
Fast inference - Google Flash, Anthropic Haiku, OpenAI o3 mini // Smaller models like Meta llama 8b or Microsoft phi4 14b are consuming much less VRAM and are much faster than larger more capable models
Reasoning - OpenAI o3, Anthropic Claude models support reasoning for harder tasks and help with debugging // DeepSeek R1 also supports reasoning as well as ollama emulation can make it work for other models
Function calling //
<todo> Table 1. Capability-based open model with competitive features to close SoTA APIs

It takes a lot of trial and error to find the proper combination of local models to work week for your use case, however it is less of a choice with API based ones since Anthropic models currently hold leadership for the best coding model with Google Gemini / Flash supplying additional niche models with larger context and faster operation.

Having tested closed API based models does not automatically mean they will continue working for you after updates. There were multiple cases reported by developers that after switching to newer models (often happening automatically in APIs) their use cases broke.

Model Drift and Backward Compatibility
——————————————————
Top AI LLM developers deprecate their older models or switch their API endpoints to newer versions with no clear path to test for potential incompatibilities breaking changes.

It has happened to GPT 3.5, Gemini xx models that broke many working systems unpredictably both because of no clear way in the industry to test compatibility between models and API providers to rush with newer better models with the need to decommission older less optimized ones to reduce running costs.

<user complaints regarding unexpected Gemini incompatibilities and model drifts along with unpredicted behaviors of OpenAI models>
<todo> Picture x. User feedback about unpredictability of model updates

This gives a local inference based system an advantage to both stick to the chosen model and / or switch to a better one after proper testing.

Open models are developing almost as fast as closed ones with a gap in capabilities of about a half of the year between top closed models and top ones. The DeepSeek R1 release has proven there might be less of a moat in pure capabilities of closed LLMs, so open ones could not catch up given enough time.

Below there is a comparison between the number of iterations required of app.build to complete working apps compared to different versions and the gap between them and top closed models.

Model, Number of Iterations, Latest Release Date
Anthropic Sonnet
Google Gemini
DeepSeek R1
Mixtral
StarCoder
Llama 3.1
<todo> Table 3. Number of iterations to complete working sample app using different models with app.build

Data Sharing Concerns
——————————-
Policies around data usage for training led to significant concerns in the industry, especially for IP preservation, data protection purposes and more.

Regulations around data usage by AI are still in development, many companies choose to opt out from training AI on their data.

However it is sometimes impossible to opt out or even sometimes even after explicitly doing so, an AI provider may be forced to store some user’s data for compliance reasons like OpenAI have to do for the court order related to xxx.

This rightfully leads to concerns in data usage / processing and compliance with existing regulations when personal / health data involved in LLM requests.

One way to mitigate this would be to use local LLM inference to avoid IP leakage, or a path to vulnerability exposure to public data in form of API keys and other secrets or some non-public infrastructure code as well as personal / health data concerns.

Of course best practices of development and usage of trusted cloud providers mitigate these risks.

However sometimes especially for prototyping and experimentation it makes sense to speed up development by limiting data exposure to the cloud by usage of local LLMs.

As a side note we must mention that local models are also not free from bias, were not fully tested / certified for vulnerabilities like code backdoor injections, zero day exploits etc

It is critical to say every agentic system for code generation including app.build must not be deployed to production with no human in the loop and proper safety controls.

Conclusion
========
