# Performance Optimization Workflow
An efficient performance optimization workflow for Unreal Engine project.

## High Level Performance Screenshot
- Initial Bottleneck Identification: CPU, GPU or Memory
- Always tackling the biggest problem first, leading to maximum performance return for the time invested
- Finding spikes in profiled result
Common Tools
- stat unit
1. Game Thread (GT): CPU bottleneck
2. Draw Thread (DT): Rendering thread bottleneck
3. GPU
4. Frame time

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
