# واجهة API لنموذج لغوي بلا رقابة للمطورين في الخليج والشرق الأوسط

> واجهة متوافقة مع OpenAI لفرق التطوير في الخليج. عربية سليمة افتراضياً، تعليمات النظام تُنفَّذ، ولا فقرة تحذير في مقدمة كل رد. العنوان: https://uncensored-llm.sbs/v1

**الواجهة:** https://uncensored-llm.sbs/v1
**الموقع:** https://uncensored-llm.sbs

إن كنت قد استخدمت نموذجاً لغوياً للكتابة عن السياسة أو الصحة أو الأمن الهجومي أو أي موضوع يعتبره مزود أجنبي حسّاساً، فأنت تعرف النتيجة: رفض عام، وفقرة تحذير بدل المحتوى، وإجابة نصف مكتملة. تصف هذه الصفحة بديلاً مباشراً: واجهة متوافقة مع OpenAI تجيب عن السؤال كما طُلب.

## لماذا يهم هذا لمن يطوّر في الخليج

المنتج العربي يحتاج نموذجاً يكتب بعربية صحيحة لا ترجمة حرفية من الإنجليزية. والمشكلة الأغلى هي أن النموذج يرفض موضوعات عادية تماماً — الرسوم الدراسية، التمويل، الصحة، اختبار الاختراق — لأن سياسة صُممت لسوق آخر. هنا يبقى القرار لفريق المنتج، بينما يعمل البث واستدعاء الأدوات و JSON mode كما هو. الحد الوحيد الباقي هو المحتوى غير القانوني.

## مثال على الاستدعاء

```bash
export UNLLM_KEY="sk-..."
curl https://uncensored-llm.sbs/v1/chat/completions \
  -H "Authorization: Bearer $UNLLM_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"uncensored-llm","messages":[{"role":"user","content":"اشرح باختصار كيف تُحسب القيمة السوقية لعملة رقمية."}],"stream":true}'
```

```python
# pip install openai
from openai import OpenAI
client = OpenAI(base_url="https://uncensored-llm.sbs/v1", api_key="sk-...")
r = client.chat.completions.create(
    model="uncensored-llm",
    messages=[{"role": "user", "content": "اشرح باختصار كيف تُحسب القيمة السوقية لعملة رقمية."}],
)
print(r.choices[0].message.content)
```

```javascript
import OpenAI from "openai";
const ai = new OpenAI({ baseURL: "https://uncensored-llm.sbs/v1", apiKey: process.env.UNLLM_KEY });
const r = await ai.chat.completions.create({ model: "uncensored-llm", messages: [{ role: "user", content: "اشرح باختصار كيف تُحسب القيمة السوقية لعملة رقمية." }] });
console.log(r.choices[0].message.content);
```

## أين تُستخدم فعلياً

| الحالة | السبب |
|---|---|
| دعم العملاء | روبوت يحل المشكلة بدل قراءة السياسات. |
| محتوى عربي | مقالات ونصوص ورسائل بنبرة محلية حقيقية. |
| اختبار أمني مرخّص | عمل هجومي ضمن نطاق موقّع من العميل. |
| أدب للبالغين (18+) | مشاهد صريحة بين بالغين دون قطع. |

## زمن الاستجابة من مدينتك

زمن الاستجابة يحدده مزود الإنترنت لا الجنسية. قِسه من جهازك أولاً:

```bash
curl -o /dev/null -s -w '%{time_total}s\n' https://uncensored-llm.sbs/v1/models
```

| المدينة | المنطقة |
|---|---|
| الرياض | السعودية |
| جدة | السعودية |
| الدمام | السعودية |
| مكة المكرمة | السعودية |
| المدينة المنورة | السعودية |
| الكويت | الكويت |
| الدوحة | قطر |
| المنامة | البحرين |
| مسقط | عُمان |
| دبي | الإمارات |
| أبوظبي | الإمارات |
| عمّان | الأردن |

## أسئلة تتكرر فعلاً

### هل هي متوافقة فعلاً مع OpenAI؟

نعم. مسارات /v1/chat/completions و /v1/models والبث SSE تستخدم نفس صيغة الأحداث، لذا تعمل المكتبة الرسمية بمجرد تغيير base_url.

### هل توجد فترة تجريبية مجانية؟

الشروط السارية تُنشر على https://uncensored-llm.sbs، وأي تغيير في الأسعار يُعلن هناك لا في هذا المستودع.

### ما الذي يُحجب؟

المحتوى غير القانوني، بما في ذلك أي مادة تتعلق بمن هم دون 18 عاماً. خارج ذلك يكون الرد عن الطلب نفسه.

### هل تعمل مع Open WebUI أو LibreChat؟

نعم، كلاهما يقبل base URL متوافقاً مع OpenAI. أدخل https://uncensored-llm.sbs/v1 ومفتاحك.

### كيف أحفظ المفتاح؟

متغير بيئة لكل بيئة، وتدوير دوري، ولا يوضع أبداً في الواجهة الأمامية أو مستودع عام.

## هذه الوثائق بلغات أخرى

- [pt-BR] https://brown1023.github.io/llm-api-sem-censura-brasil/
- [es-419] https://brown1023.github.io/api-llm-sin-censura-latam/
- [id-ID] https://ryuuless.github.io/uncensored-llm-api-indonesia/
- [vi-VN] https://ryuuless.github.io/uncensored-llm-api-vietnam/
- [tr-TR] https://askcode24.github.io/sansursuz-llm-api-turkiye/
- [de-DE] https://askcode24.github.io/uncensored-llm-api-deutschland/
- [es-ES] https://palazuel0s2004.github.io/api-llm-sin-censura-espana/
- [it-IT] https://palazuel0s2004.github.io/llm-api-senza-censura-italia/
- [en-IN] https://nirav0712.github.io/uncensored-llm-api-india/
- [en-PH] https://nirav0712.github.io/uncensored-llm-api-philippines/
- [ar-EG] https://mohamedabderrehman.github.io/uncensored-llm-api-egypt/

---

uncensored-llm.sbs — واجهة متوافقة مع OpenAI. يُحجب المحتوى غير القانوني وأي مادة تتعلق بمن هم دون 18 عاماً. وما عدا ذلك مسؤولية من يستدعي الواجهة.