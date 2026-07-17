#!/usr/bin/env bash
set -x
source /root/sglang/.venv/bin/activate

sglang serve \
  --model-path /home/admin/resource-slow/model/464482ce/glm-5.2-fp8-official/1 \
  --served-model-name glm-5.2 \
  --tp 8 \
  --attn-cp-size 8 \
  --enable-prefill-cp \
  --cp-strategy interleave \
  --speculative-algorithm EAGLE \
  --speculative-num-steps 5 \
  --speculative-eagle-topk 1 \
  --speculative-num-draft-tokens 6 \
  --max-running-requests 16 \
  --mem-fraction-static 0.92 \
  --enable-hierarchical-cache \
  --enable-mla-hicache-host-dedup \
  --hicache-size 200 \
  --hicache-write-policy write_back \
  --hicache-io-backend kernel \
  --reasoning-parser glm45 \
  --tool-call-parser glm47 \
  --enable-metrics \
  --enable-metrics-for-all-schedulers \
  --enable-mfu-metrics \
  --enable-request-time-stats-logging \
  --host 0.0.0.0 \
  --port 30000
