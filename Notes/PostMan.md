# Postman — Complete Reference Guide

## 1. What is Postman?

Postman is an API platform used for designing, building, testing, documenting, and monitoring APIs. It started as a simple Chrome extension for sending HTTP requests and has grown into a full API lifecycle tool (desktop app, web app, CLI runner, and cloud platform for team collaboration).

**Core use cases:**
- Sending HTTP requests (GET, POST, PUT, PATCH, DELETE, etc.) to test APIs
- Automating API testing with scripts and test suites
- Documenting APIs for internal or external consumers
- Mocking APIs before the backend exists
- Monitoring APIs for uptime/performance
- Collaborating with a team on API development
- Generating client code snippets in multiple languages

---

## 2. Postman Workflow (End-to-End)

A typical Postman workflow looks like this:

1. **Create a Workspace** — a shared or personal space to organize your work.
2. **Create a Collection** — a folder-like container that groups related requests.
3. **Add Requests** — define method, URL, headers, params, body, auth.
4. **Use Variables** — parameterize URLs, tokens, and payloads (environment/collection/global variables).
5. **Write Scripts** — Pre-request scripts (set up data before the call) and Test scripts (validate the response after the call).
6. **Send & Inspect** — send the request and inspect status, headers, body, cookies, timing.
7. **Organize into Folders** — group requests logically (e.g., Auth, Users, Orders).
8. **Run Collections** — use the Collection Runner or Newman to execute all requests in sequence, often with a data file (CSV/JSON) for multiple test iterations.
9. **Automate with CI/CD** — integrate Newman (Postman's CLI runner) into Jenkins/GitHub Actions/GitLab CI pipelines.
10. **Document** — auto-generate documentation from the collection and publish it.
11. **Mock Servers** — simulate API responses before the real backend is ready.
12. **Monitor** — schedule collections to run periodically to check uptime and performance.
13. **Version Control & Collaboration** — use Postman's built-in version control (forking, merging, pull requests) or sync with Git.

```
Design → Build Requests → Add Variables/Scripts → Test → Run/Automate → Document → Mock → Monitor → Collaborate
```

---

## 3. Postman Dashboard / Interface — Detailed Breakdown

When you open Postman, the interface is divided into these main areas:

### 3.1 Sidebar (Left Panel)
- **Collections** — All your saved API request collections, organized into folders.
- **APIs** — Manage API definitions (OpenAPI/RAML specs) linked to collections.
- **Environments** — List of environment sets (Dev, Staging, Production, etc.).
- **Flows** — Visual, no-code workflow builder for chaining API calls.
- **History** — A log of every request you've sent, searchable by time/date.

### 3.2 Header Bar (Top)
- **Workspace switcher** — Switch between Personal, Team, or Public workspaces.
- **Search bar** — Search across collections, requests, docs.
- **Invite/Share** — Add teammates to a workspace.
- **Runner button** — Opens the Collection Runner.
- **New button** — Create new Request, Collection, Environment, Mock Server, Monitor, etc.

### 3.3 Request Builder (Center Panel)
- **Method selector** — GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS, etc.
- **URL bar** — Enter the endpoint, supports variables like `{{base_url}}/users`.
- **Tabs under the URL bar:**
  - **Params** — Query parameters (key-value pairs appended to URL)
  - **Authorization** — Auth type (Bearer Token, Basic Auth, OAuth 1.0/2.0, API Key, AWS Signature, Digest, Hawk, NTLM, JWT, etc.)
  - **Headers** — Custom request headers
  - **Body** — Request payload (form-data, x-www-form-urlencoded, raw JSON/XML/text, binary, GraphQL)
  - **Pre-request Script** — JavaScript run before the request is sent
  - **Tests** — JavaScript assertions run after the response is received
  - **Settings** — Request-specific settings (SSL verification, redirects, etc.)

### 3.4 Response Viewer (Bottom/Right of Request Builder)
- **Body** — Pretty/Raw/Preview view of the response (JSON, HTML, XML, image)
- **Cookies** — Cookies returned by the server
- **Headers** — Response headers
- **Test Results** — Pass/fail status of test scripts with assertion details
- **Status, Time, Size** — HTTP status code, response time (ms), payload size

### 3.5 Environment Quick Look (Top-right)
- Dropdown to select the active environment
- Eye icon to quickly view/edit variable values without opening full settings

### 3.6 Console
- A dev-tools-like log (Postman Console) showing raw requests/responses, useful for debugging headers, redirects, and script `console.log()` output.

---

## 4. Collections

A **Collection** is a group of saved requests, organized into folders, that can be:
- Run together (Collection Runner)
- Shared with a team
- Version controlled (forking, merging)
- Documented automatically
- Exported/imported as JSON

**Collection-level features:**
- Collection variables (scoped to that collection only)
- Pre-request/Test scripts that run for every request in the collection
- Authorization inherited by all child requests
- Collection-level documentation (Markdown supported)

---

## 5. Variables (Scope Hierarchy)

Postman variables exist at different scopes, resolved in this priority order (highest to lowest):

1. **Local variables** — Set within a single script run, temporary.
2. **Data variables** — From a CSV/JSON file used in Collection Runner iterations.
3. **Environment variables** — Scoped to the currently active environment (e.g., Dev vs Prod).
4. **Collection variables** — Scoped to a specific collection.
5. **Global variables** — Available across the entire Postman app.

Syntax: `{{variable_name}}`

**Common example:**
```
base_url = https://api.example.com
{{base_url}}/users/{{user_id}}
```

---

## 6. Scripting in Postman (Pre-request & Test Scripts)

Postman uses JavaScript (via the `pm` API object) for scripting.

### Pre-request Script (runs before sending)
```javascript
pm.environment.set("timestamp", Date.now());
pm.request.headers.add({ key: "X-Timestamp", value: pm.environment.get("timestamp") });
```

### Test Script (runs after response)
```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response has user id", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.id).to.exist;
});

// Chaining requests - save a token for later use
pm.test("Save auth token", function () {
    const jsonData = pm.response.json();
    pm.environment.set("auth_token", jsonData.token);
});
```

Common `pm` methods:
- `pm.response.to.have.status(code)`
- `pm.response.json()`
- `pm.environment.set()/get()`
- `pm.collectionVariables.set()/get()`
- `pm.expect()` (Chai-style assertions)
- `pm.test(name, fn)`

---

## 7. Authorization Types Supported

- No Auth
- API Key (header or query param)
- Bearer Token
- Basic Auth
- Digest Auth
- OAuth 1.0
- OAuth 2.0 (Authorization Code, Client Credentials, Implicit, Password Grant)
- AWS Signature
- NTLM
- Hawk Authentication
- JWT Bearer
- Kerberos

Auth can be set at request, folder, or collection level, and inherited downward.

---

## 8. Collection Runner

The **Collection Runner** lets you execute all requests in a collection (or folder) automatically, in order.

Features:
- Choose iterations (run the same set of requests multiple times)
- Attach a **data file** (CSV/JSON) to feed different data into each iteration
- Set delay between requests
- View a summary report of pass/fail tests
- Save the run results

Use case: Testing a "Create User" → "Get User" → "Delete User" flow across 50 different data rows automatically.

---

## 9. Newman (CLI Test Runner)

**Newman** is Postman's command-line collection runner, used for CI/CD pipelines.

```bash
npm install -g newman

newman run MyCollection.postman_collection.json \
  -e MyEnvironment.postman_environment.json \
  --reporters cli,html \
  --reporter-html-export report.html
```

Common CI/CD integration:
```yaml
# GitHub Actions example
- name: Run API Tests
  run: |
    npm install -g newman
    newman run collection.json -e environment.json
```

---

## 10. Mock Servers

A **Mock Server** simulates API responses based on example responses saved in a collection — useful when the backend isn't ready yet.

- Define example requests/responses in a collection
- Postman generates a unique mock URL
- Frontend/other teams can develop against the mock URL
- Supports dynamic responses using variables

---

## 11. Monitors

**Monitors** let you schedule a collection to run automatically at intervals (e.g., every 5 minutes, hourly, daily) to:
- Check API uptime
- Track response times
- Get alerted (email/Slack) on failures

Useful for production health checks without needing external uptime tools.

---

## 12. API Documentation

Postman can auto-generate human-readable documentation from a collection:
- Pulls in request examples, descriptions, headers, and responses
- Supports Markdown descriptions
- Can be published publicly with a shareable link
- Auto-updates when the underlying collection changes (if using "dynamic" docs)

---

## 13. Postman Flows

A visual, no-code/low-code canvas for chaining multiple API calls together with conditional logic, loops, and data transformation — similar to a lightweight automation/orchestration builder, without writing scripts.

---

## 14. Workspaces & Collaboration

- **Personal Workspace** — private to you
- **Team Workspace** — shared with your organization
- **Public Workspace** — visible to anyone (used for public API docs, e.g., Stripe, Twilio use Postman public workspaces)

Collaboration features:
- Comments on requests
- Real-time collaborative editing (like Google Docs)
- Version control: fork a collection, make changes, merge back
- Role-based access control (Viewer, Editor, Admin)
- Activity feed / change history

---

## 15. Import & Export

Postman supports importing/exporting:
- Postman Collection format (`.json`)
- OpenAPI/Swagger specs
- cURL commands
- RAML, WSDL, GraphQL SDL
- Environment files (`.json`)

This makes it easy to migrate between tools or share collections via version control (Git).

---

## 16. Postman + Git / Version Control Integration

- Collections can be linked to a Git repository
- Changes sync between Postman and the repo
- Useful for teams that want API definitions tracked alongside code

---

## 17. Code Generation

Postman can auto-generate ready-to-use code snippets for any request in many languages/frameworks, including:
- cURL
- JavaScript (Fetch, Axios, jQuery)
- Python (requests, http.client)
- Java (OkHttp, Unirest)
- Go, C#, PHP, Ruby, Swift, Node.js, and more

This is accessible via the **"Code" button** (`</>` icon) next to the Send button.

---

## 18. Best Practices

1. Use **environments** instead of hardcoding URLs/tokens (Dev/Staging/Prod).
2. Never commit real secrets in shared collections — use environment variables and mark sensitive ones as "secret" type.
3. Write **tests for every request** to catch regressions early.
4. Organize collections into **folders by resource/feature** (Users, Orders, Auth).
5. Use **pre-request scripts** to handle dynamic data (timestamps, generated tokens).
6. Chain requests using variables to **pass data between requests** (e.g., save an ID from a POST response for a later GET).
7. Use the **Collection Runner + data files** for bulk/regression testing.
8. Integrate **Newman into CI/CD** for automated regression testing on every deploy.
9. Keep **documentation up to date** by writing clear descriptions for each request.
10. Use **mock servers** to unblock frontend development while backend is in progress.

---

## 19. Summary Table

| Feature | Purpose |
|---|---|
| Collections | Group and organize API requests |
| Environments | Manage variable sets per stage (dev/staging/prod) |
| Variables | Parameterize requests dynamically |
| Pre-request/Test Scripts | Automate setup and validation with JS |
| Collection Runner | Run multiple requests/iterations at once |
| Newman | CLI tool to run collections in CI/CD |
| Mock Servers | Simulate API responses before backend is ready |
| Monitors | Scheduled health/performance checks |
| Flows | Visual no-code API workflow builder |
| Documentation | Auto-generated, shareable API docs |
| Workspaces | Collaboration space (personal/team/public) |

---

## 20. Quick Start Cheat Sheet

```
1. New → Collection → name it "My API"
2. Add Request → GET https://api.example.com/users
3. Save to Collection
4. Add environment: base_url = https://api.example.com
5. Change URL to {{base_url}}/users
6. Add a Test:
   pm.test("Status 200", () => pm.response.to.have.status(200));
7. Click Send → check the Test Results tab
8. Run entire collection via Collection Runner
9. Export collection as JSON for sharing/version control
10. Automate with: newman run collection.json -e environment.json
```