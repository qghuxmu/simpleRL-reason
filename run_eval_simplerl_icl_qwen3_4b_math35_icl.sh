#!/bin/bash
set -x

huggingface-cli download Qwen/Qwen3-4B-Base --local-dir /workspace/Qwen3-4B-Base

WANDB_MODE=offline bash eval_math_nodes.sh \
    --run_name /mnt/yaoxiang-wang-yeyuninterns-out/qingguo/simplerl_icl/qwen3_4b_math35_icl \
    --init_model /workspace/Qwen3-4B-Base \
    --template qwen-boxed \
    --tp_size 1 \
    --add_step_0 false \
    --temperature 1.0 \
    --top_p 0.95 \
    --max_tokens 16000 \
    --benchmarks aime24,amc23,math500,olympiadbench,gsm8k,minerva_math \
    --n_sampling 1 