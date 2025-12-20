# Performance Optimization Workflow (WIP)
An efficient performance optimization workflow for Unreal Engine project.

## Data Flow
- CPU and GPU are not working in parallel
- Some GPU tasks will need to wait for CPU tasks finish. That's the reason we will see some waiting tasks in profiling result
- Game(Game Thread): Gameplay logic + decides what should be rendered > related to CPU bottleneck
- Darw(Render Thread): Prepares rendering work(draw calls, material permutations, sculling, sorting, batching, pass...), high-level rendering abstraction > related to CPU bottleneck
- RHIT(RHI Thread): translates render commands into actual GPU commands (DirectX, Vulkan, Metal...), manages GPU resources > related to CPU/GPU bottleneck (two side)
- GPU: Actual GPU render > related to GPU bottleneck
- GPU is rendering frame N
- RHI Thread is submitting frame N+1
- Render Thread is building frame N+2
- Game Thread is simulating frame N+3

Builds:
3. GPU
4. Frame time
![DataFlow1](https://github.com/user-attachments/assets/7be43df1-6f16-49e8-b67a-4928e4868217)
![DataFlow2](https://github.com/user-attachments/assets/d77450d2-2ba1-45cc-a8c1-061e243dc064)


## High Level Performance Screenshot
- Set up target fps first: 30 fps = 33.33 ms/frame, 60 fps = 16.66 ms/frame
- Initial Bottleneck Identification: Is it CPU, GPU or Memory?
- Always tackling the biggest problem first, leading to maximum performance return for the time invested
- Finding spikes in profiled result

Profiling Tools
- stat unit: Overall frame time as well as the game thread, rendering thread, and GPU times
- stat rhi: Displays Render Hardware Interface(RHI) memory and performance statistics
- stat unitgraph: See the graph with the stat unit data
- stat memory: Shows statistics on how much memory is being used by various subsystems



## Profiling CPU
Common Tools
- stat game
- stat ai
- stat physics
- stat animation
- stat navmesh
- stat blueprint
- Unreal Insights

## Profiling GPU
- GPU  visualizer
- optimization view mode
- RenderDoc
- stat gpu
- profilegpu

## Profiling Memory
Common Tools
- memreport -full
- stat memory
- stat streaming
- Insights → Memory profiler
