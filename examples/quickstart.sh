#!/usr/bin/env bash
# واجهة API لنموذج لغوي بلا رقابة للمطورين في الخليج والشرق الأوسط — quickstart
set -euo pipefail
: "${UNLLM_KEY:?export UNLLM_KEY=sk-...}"

curl -s https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"اشرح باختصار كيف تُحسب القيمة السوقية لعملة رقمية."}]}' | head -c 2000
echo
