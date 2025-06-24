#!/bin/bash
set -x

# 允许通过环境变量传递参数，否则使用默认值
BASE_MODEL=${BASE_MODEL}
PROJECT_NAME=${PROJECT_NAME}
EXPERIMENT_NAME=${EXPERIMENT_NAME}

huggingface-cli download "$BASE_MODEL" --local-dir /workspace/base_model

WANDB_MODE=offline bash eval_math_nodes.sh \
    --run_name /mnt/yaoxiang-wang-yeyuninterns-out/qingguo/"$PROJECT_NAME"/"$EXPERIMENT_NAME" \
    --init_model /workspace/base_model \
    --template qwen-boxed \
    --tp_size 1 \
    --add_step_0 true \
    --temperature 1.0 \
    --top_p 0.95 \
    --max_tokens 16000 \
    --benchmarks aime24,amc23,math500,olympiadbench,gsm8k,minerva_math \
    --n_sampling 1 