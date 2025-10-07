# API Usage Guide

## Authentication

All requests to `/api/explain` require Firebase ID Token authentication.

### Getting a Firebase ID Token

In your frontend (which already uses Firebase):

```javascript
import { getAuth } from "firebase/auth";

const auth = getAuth();
const user = auth.currentUser;

if (user) {
  const idToken = await user.getIdToken();
  // Use this token in API requests
}
```

### Making Authenticated Requests

Include the token in the `Authorization` header:

```bash
curl -X POST http://localhost:8000/api/explain \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_FIREBASE_ID_TOKEN" \
  -d '{
    "query": "Explain quadratic equations",
    "locale": "en"
  }'
```

## Endpoints

### POST /api/explain

Explain a math concept using multi-agent pipeline.

**Request:**

```json
{
  "query": "Explain quadratic equations",
  "locale": "en"
}
```

**Response:**

```json
{
  "topic": "Quadratic Equations",
  "elements": [
    {
      "id": "elem_0",
      "type": "text_block",
      "order": 0,
      "title": "Introduction",
      "text": "A quadratic equation is a second-degree polynomial equation..."
    },
    {
      "id": "elem_1",
      "type": "formula",
      "order": 1,
      "title": "Key Formula",
      "latex": "\\frac{-b + \\sqrt{b^{2} - 4 a c}}{2 a}",
      "text": "x = (-b ± √(b² - 4ac)) / (2a)"
    },
    {
      "id": "elem_2",
      "type": "example_steps",
      "order": 2,
      "title": "Worked Example",
      "steps": [
        "Given: x² - 5x + 6 = 0",
        "Identify coefficients: a=1, b=-5, c=6",
        "Apply quadratic formula: x = (5 ± √(25-24)) / 2",
        "Simplify: x = (5 ± 1) / 2",
        "Solutions: x = 3 or x = 2"
      ]
    },
    {
      "id": "elem_3",
      "type": "line_chart",
      "order": 3,
      "title": "Function Graph",
      "x": [-5.0, -4.9, -4.8, ...],
      "y": [38.0, 36.61, 35.24, ...],
      "image_base64": "iVBORw0KGgoAAAANSUhEUgAA..."
    }
  ]
}
```

## Element Types

### text_block

```json
{
  "id": "elem_0",
  "type": "text_block",
  "order": 0,
  "title": "Optional Title",
  "caption": "Optional Caption",
  "text": "Main text content"
}
```

### formula

```json
{
  "id": "elem_1",
  "type": "formula",
  "order": 1,
  "title": "Optional Title",
  "latex": "x^2 + y^2 = z^2",
  "text": "x² + y² = z²"
}
```

### example_steps

```json
{
  "id": "elem_2",
  "type": "example_steps",
  "order": 2,
  "title": "Optional Title",
  "steps": ["Step 1: ...", "Step 2: ...", "Step 3: ..."]
}
```

### bar_chart

```json
{
  "id": "elem_3",
  "type": "bar_chart",
  "order": 3,
  "title": "Optional Title",
  "data": [10.5, 20.3, 15.7],
  "labels": ["A", "B", "C"],
  "image_base64": "base64_encoded_png_image"
}
```

### line_chart

```json
{
  "id": "elem_4",
  "type": "line_chart",
  "order": 4,
  "title": "Optional Title",
  "x": [1.0, 2.0, 3.0],
  "y": [1.0, 4.0, 9.0],
  "image_base64": "base64_encoded_png_image"
}
```

### long_division

```json
{
  "id": "elem_5",
  "type": "long_division",
  "order": 5,
  "title": "Optional Title",
  "dividend": 156,
  "divisor": 12,
  "steps": [
    {
      "quotient_digit": 1,
      "partial_product": 12,
      "remainder": 3
    },
    {
      "quotient_digit": 3,
      "partial_product": 36,
      "remainder": 0
    }
  ]
}
```

### life_cycle

```json
{
  "id": "elem_6",
  "type": "life_cycle",
  "order": 6,
  "title": "Optional Title",
  "stages": ["Stage 1", "Stage 2", "Stage 3"]
}
```

### node_graph

```json
{
  "id": "elem_7",
  "type": "node_graph",
  "order": 7,
  "title": "Optional Title",
  "nodes": [
    { "id": "n1", "label": "Node 1" },
    { "id": "n2", "label": "Node 2" }
  ],
  "edges": [{ "source": "n1", "target": "n2", "label": "connects" }]
}
```

### hex_steps

```json
{
  "id": "elem_8",
  "type": "hex_steps",
  "order": 8,
  "title": "Optional Title",
  "items": ["Step 1", "Step 2", "Step 3"]
}
```

### horizontal_blocks

```json
{
  "id": "elem_9",
  "type": "horizontal_blocks",
  "order": 9,
  "title": "Optional Title",
  "items": [
    { "title": "Block 1", "desc": "Description 1" },
    { "title": "Block 2", "desc": "Description 2" }
  ]
}
```

### pyramid

```json
{
  "id": "elem_10",
  "type": "pyramid",
  "order": 10,
  "title": "Optional Title",
  "levels": [
    ["Top"],
    ["Middle 1", "Middle 2"],
    ["Bottom 1", "Bottom 2", "Bottom 3"]
  ]
}
```

## Error Responses

### 401 Unauthorized

```json
{
  "detail": "Missing authentication token"
}
```

### 422 Unprocessable Entity

```json
{
  "detail": {
    "error_type": "PlanningError",
    "message": "Query cannot be empty",
    "details": {}
  }
}
```

## Example Queries

Here are some example queries that trigger different visuals:

- **Formulas**: "What is the quadratic formula?", "Explain the Pythagorean theorem"
- **Graphs**: "Graph quadratic functions", "Plot sine wave"
- **Comparisons**: "Compare different methods of solving equations"
- **Division**: "How to do long division"
- **Processes**: "Explain the problem-solving process"
- **Relationships**: "Show relationships between mathematical concepts"
- **Steps**: "Step by step guide to derivatives"
- **Hierarchies**: "Show the hierarchy of mathematical topics"

## Frontend Integration

### React/Next.js Example

```typescript
import { getAuth } from "firebase/auth";

async function explainMath(query: string) {
  const auth = getAuth();
  const user = auth.currentUser;

  if (!user) {
    throw new Error("User not authenticated");
  }

  const idToken = await user.getIdToken();

  const response = await fetch("http://localhost:8000/api/explain", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${idToken}`,
    },
    body: JSON.stringify({
      query,
      locale: "en",
    }),
  });

  if (!response.ok) {
    throw new Error(`API error: ${response.status}`);
  }

  const data = await response.json();
  return data; // { topic, elements }
}
```

### Rendering Elements

```tsx
function renderElement(element: Element) {
  switch (element.type) {
    case "text_block":
      return (
        <div>
          {element.title && <h3>{element.title}</h3>}
          <p>{element.text}</p>
        </div>
      );

    case "formula":
      return (
        <div>
          {element.title && <h3>{element.title}</h3>}
          <code>{element.text || element.latex}</code>
        </div>
      );

    case "bar_chart":
    case "line_chart":
      return (
        <div>
          {element.title && <h3>{element.title}</h3>}
          <img
            src={`data:image/png;base64,${element.image_base64}`}
            alt={element.title}
          />
        </div>
      );

    // ... handle other element types
  }
}

function ExplanationView({ topic, elements }: ExplainResponse) {
  return (
    <div>
      <h1>{topic}</h1>
      {elements
        .sort((a, b) => a.order - b.order)
        .map((element) => (
          <div key={element.id}>{renderElement(element)}</div>
        ))}
    </div>
  );
}
```
