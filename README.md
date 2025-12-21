# Table of Contents
[Profiling](#Profiling)
- [DataFlow](#DataFlow)
- [HighLevel Performance Screenshot](#HighLevelPerformanceScreenshot)
- [ProfilingCPU](#ProfilingCPU)
- [ProfilingGPU](#ProfilingGPU)
- [ProfilingMemory](#ProfilingMemory)

# Profiling
An efficient profiling workflow for Unreal Engine project.
(image here)the profiling process should be a loop > after the problem get solved, we should go back to beginning



## DataFlow
```diff
- CPU and GPU are not working in parallel
- Not all rendering-related issues are related to the GPU
- Before the GPU actually renders, CPU also needs to deal with rendering tasks
- Some GPU tasks will need to wait for CPU tasks finish
- Some CPU tasks will need to wait for GPU tasks finish
- That's the reason we will see some waiting tasks in profiled result
```
- ***Game (Game Thread)***: Gameplay logic + decides what should be rendered > related to ***CPU*** bottleneck, game logic too heavy
- ***Darw (Render Thread)***: Prepares rendering work(draw calls, material permutations, culling, sorting, batching, pass...), high-level rendering abstraction > related to ***CPU*** bottleneck, scene complexity
- ***RHIT (RHI Thread)***: translates render commands into actual GPU commands (DirectX, Vulkan, Metal...), manages GPU resources > related to ***CPU/GPU*** bottleneck (two side)
- ***GPU***: Actual GPU render > related to ***GPU*** bottleneck, rendering/shader overload
- GPU is rendering frame N
- RHI Thread is submitting frame N+1
- Render Thread is building frame N+2
- Game Thread is simulating frame N+3

![DataFlow1](https://github.com/user-attachments/assets/7be43df1-6f16-49e8-b67a-4928e4868217)
![DataFlow2](https://github.com/user-attachments/assets/d77450d2-2ba1-45cc-a8c1-061e243dc064)


## HighLevelPerformanceScreenshot
- Set up target fps first: 30 fps = 33.33 ms/frame, 60 fps = 16.66 ms/frame
- Initial Bottleneck Identification: Is it CPU, GPU or Memory?
- Always tackling the biggest problem first, leading to maximum performance return for the time invested
- Finding spikes in profiled result

***Common Profiling Tools***
- `stat fps` : Show current fps
- `stat unit` : Overall frame time as well as the game thread, rendering thread, and GPU times
- `stat unitgraph` : See the graph with the stat unit data
- `stat rhi` : Displays Render Hardware Interface(RHI) memory and performance statistics
- `stat memory` : Shows statistics on how much memory is being used by various subsystems

![unit](https://github.com/user-attachments/assets/da83f09f-a9aa-41fe-9824-8b1d289bcbfe)
![memory](https://github.com/user-attachments/assets/e0fe07d3-4f76-40b4-8bfa-48690d17a9ae)


## ProfilingCPU
***Simple Profiling Tools***
- `stat game` : Gives feedback on how long the various Gameplay Ticks are taking
- `stat physics` : Displays physics performance statistics
- `stat anim` : Shows how long skinned meshes are taking to compute per tick
- `stat navigation` : Shows performance and memory information for the navigation system

***Unreal Insights***
- Filter CPU tracks only
![CPUTask](https://github.com/user-attachments/assets/b43a0fa3-311e-42e1-bcae-709ddde0949d)
- Find the key funciton (or a set of functions) that cause performance issue. Search from high level to low level
![Tasks](https://github.com/user-attachments/assets/79e5f489-f864-49f8-929b-edb6511ea1a9)
- Diagnose funciton counts and time spent
![NamedEvent](https://github.com/user-attachments/assets/3181eb68-6a95-4921-9da9-9b92bb0765dc)
- Enable Stat Named Events will be slightly heavier but provide more tracing details
![NamedEvent](https://github.com/user-attachments/assets/c6676d30-7a07-4dc6-92ac-496d2d9ab3e5)
- Read function in source code if needed
![SOURCE](https://github.com/user-attachments/assets/5e74d4c3-6ed1-45a7-a68d-e73fd55773c5)


## ProfilingGPU

***Simple Profiling Tools***
- `stat gpu` : Displays GPU statistics for the frame
<img width="652" height="371" alt="GPU" src="https://github.com/user-attachments/assets/8d3bd6c1-a7ba-455a-9c97-0b64f342ed0c" />

- `ProfileGPU` (GPU Visualizer)
<img width="1001" height="602" alt="GPUVisualizer" src="https://github.com/user-attachments/assets/acea004d-b222-49f1-9282-83998efca23a" />

- Optimization view mode
![viewMode](https://github.com/user-attachments/assets/a5728307-efeb-4b0a-bed5-c9651e27d1be)


- Windows PIX (WIP)
- RenderDoc (WIP)

***Unreal Insights***
- Filter GPU tracks only
![FilterGPU](https://github.com/user-attachments/assets/f7247730-4e64-4fa2-9d6c-f44b1bfe2a1d)
- Find the key elements (or a set of elements) that cause performance issue
![GPUTasks](https://github.com/user-attachments/assets/b2219343-165f-46b8-8717-6049d503e078)
- GPU bottleneck will block other thread's tasks
![GPU_Bottleneck](https://github.com/user-attachments/assets/fce38833-ece3-4782-81c3-961464d0f4bf)





## ProfilingMemory
Common Tools
- memreport -full
- stat memory
- stat streaming
- Unreal Insights Memory profiler
