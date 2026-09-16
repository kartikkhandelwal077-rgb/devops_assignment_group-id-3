# Postman Cheat Sheet

## HTTP Methods
| Method | Use |
|---|---|
| GET | Retrieve data |
| POST | Create data |
| PUT | Replace data (full update) |
| PATCH | Partial update |
| DELETE | Remove data |

## Variable Syntax
```
{{variable_name}}
```
**Scope priority (high → low):** Local → Data (CSV/JSON) → Environment → Collection → Global

## Common `pm` Script Snippets

**Set/Get variables**
```javascript
pm.environment.set("key", "value");
pm.environment.get("key");
pm.collectionVariables.set("key", "value");
pm.globals.set("key", "value");
```

**Status code tests**
```javascript
pm.test("Status is 200", () => pm.response.to.have.status(200));
pm.test("Status is 2xx", () => pm.response.to.be.success);
```

**Response body tests**
```javascript
const jsonData = pm.response.json();
pm.test("Has id", () => pm.expect(jsonData.id).to.exist);
pm.test("Name matches", () => pm.expect(jsonData.name).to.eql("John"));
```

**Response time test**
```javascript
pm.test("Response time < 500ms", () => pm.expect(pm.response.responseTime).to.be.below(500));
```

**Header checks**
```javascript
pm.test("Content-Type is json", () => {
  pm.response.to.have.header("Content-Type");
});
```

**Chaining requests (save token from login response)**
```javascript
const res = pm.response.json();
pm.environment.set("auth_token", res.token);
```

**Pre-request: dynamic timestamp/random data**
```javascript
pm.environment.set("timestamp", Date.now());
pm.variables.set("randomId", require('crypto').randomUUID());
```

**Postman built-in dynamic variables** (usable directly in URL/body/headers)
```
{{$guid}}
{{$timestamp}}
{{$randomInt}}
{{$randomEmail}}
{{$randomFirstName}}
{{$randomLastName}}
```

## Authorization Quick Reference
| Type | Where it's used |
|---|---|
| No Auth | Public endpoints |
| API Key | Header or query param |
| Bearer Token | `Authorization: Bearer <token>` |
| Basic Auth | Username/password (base64) |
| OAuth 2.0 | Access token via grant flow |
| AWS Signature | AWS services |

## Collection Runner
- Run all requests in a collection/folder
- Attach CSV/JSON for data-driven iterations
- Set iteration count + delay
- View pass/fail summary

## Newman (CLI)
```bash
npm install -g newman

newman run collection.json -e environment.json

# With HTML report
newman run collection.json -e environment.json \
  --reporters cli,html --reporter-html-export report.html
```

## Useful Console Commands
```javascript
console.log(pm.response.json());   // debug response
console.log(pm.request.headers);   // debug request headers
```

## Import/Export Formats
- Postman Collection (`.json`)
- OpenAPI / Swagger
- cURL
- Environment (`.json`)

## Common cURL → Postman
```bash
curl -X POST https://api.example.com/users \
  -H "Content-Type: application/json" \
  -d '{"name":"John"}'
```
→ Paste into Postman's **Import** (raw text) to auto-convert.

## Keyboard Shortcuts (Desktop App)
| Action | Shortcut (Win/Linux) | Shortcut (Mac) |
|---|---|---|
| New Tab | Ctrl + T | Cmd + T |
| Save | Ctrl + S | Cmd + S |
| Send Request | Ctrl + Enter | Cmd + Enter |
| Close Tab | Ctrl + W | Cmd + W |
| New Request | Ctrl + N | Cmd + N |
| Find | Ctrl + F | Cmd + F |

## Quick Test Snippet Bundle (paste in Tests tab)
```javascript
pm.test("Status code is 200", () => pm.response.to.have.status(200));
pm.test("Response is JSON", () => pm.response.to.be.json);
pm.test("Response time is acceptable", () => pm.expect(pm.response.responseTime).to.be.below(1000));
```