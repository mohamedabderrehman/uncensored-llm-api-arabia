# واجهة API لنموذج لغوي بلا رقابة للمطورين في الخليج والشرق الأوسط — quickstart
# pip install openai
import os
from openai import OpenAI

client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key=os.environ["UNLLM_KEY"])
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "اشرح باختصار كيف تُحسب القيمة السوقية لعملة رقمية."}],
)
print(r.choices[0].message.content)
