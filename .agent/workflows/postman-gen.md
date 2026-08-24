---
description: Reads Flutter/Dart Retrofit API services and generates a complete Postman Collection v2.1 JSON file.
---

# Postman Collection Generator Agent

// turbo-all

This workflow scans a Flutter/Dart project that uses **Retrofit** + **EndPoints** pattern, extracts all API endpoint definitions including HTTP methods, paths, path parameters, and body types, then generates a valid **Postman Collection v2.1** JSON file ready for import.

## Prerequisites
- The project must use the Retrofit pattern: `*_api_service.dart` files with `@GET`, `@POST`, `@PUT`, `@DELETE` annotations.
- Endpoint paths must be defined in a centralized file (e.g. `end_points.dart`).
- A `.env` file (e.g. `.env.dev`) should exist with a `BASE_URL` variable.

---

## Steps

### Step 1: Discover the project structure

1. Find the `end_points.dart` file (or equivalent) by searching for the `EndPoints` class:
   ```
   grep_search: Query="class EndPoints", SearchPath=<project_root>
   ```
2. Find all Retrofit API service files:
   ```
   find_by_name: Pattern="*_api_service.dart", SearchDirectory=<project_root>/lib, Excludes=["*.g.dart"]
   ```
3. Find the `.env` files for base URL:
   ```
   find_by_name: Pattern=".env*", SearchDirectory=<project_root>
   ```

### Step 2: Read the EndPoints file

1. Read the full contents of the `end_points.dart` file using `view_file`.
2. Extract all `static const String` definitions. Each one maps a **name** to an **API path**.
3. Build a lookup table: `{ endpointName: apiPath }`.

### Step 3: Read the `.env.dev` file

1. Read `.env.dev` (or `.env.prod`) using `view_file`.
2. Extract the `BASE_URL` value — this will be the `{{baseUrl}}` variable default in the collection.

### Step 4: Read each API service file

For each `*_api_service.dart` file (excluding `.g.dart` generated files):

1. Read the file using `view_file`.
2. Extract every method that has a Retrofit annotation: `@GET(...)`, `@POST(...)`, `@PUT(...)`, `@DELETE(...)`.
3. For each method, extract:
   - **HTTP method**: GET, POST, PUT, DELETE
   - **Path expression**: e.g. `EndPoints.getEmployees` or `'${EndPoints.stores}/{user_id}/{id}'`
   - **Path parameters**: any `@Path('param_name')` arguments
   - **Query parameters**: any `@Queries()` arguments (note the type name)
   - **Body type**: any `@Body()` argument (note the type name)
   - **Method name**: the Dart method name (used as the Postman request name)
4. Resolve the path expression against the EndPoints lookup table from Step 2.

### Step 5: Organize into folders

Group the extracted requests by **service name** (derived from the filename):
- `employee_api_service.dart` → Folder: **Employees**
- `order_api_service.dart` → Folder: **Orders**
- `auth_api_service.dart` → Folder: **Auth**
- etc.

Use this naming convention: remove `_api_service.dart`, capitalize, pluralize if needed.

### Step 6: Generate the Postman Collection JSON

Build a JSON object following the Postman Collection v2.1 schema:

```json
{
  "info": {
    "_postman_id": "<project-name>-api-generated",
    "name": "<Project Name> API",
    "description": "Auto-generated from Retrofit API services.",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "<Folder Name>",
      "item": [
        {
          "name": "<Method Name (human readable)>",
          "request": {
            "method": "<HTTP_METHOD>",
            "header": [],
            "url": {
              "raw": "{{baseUrl}}<resolved_path>",
              "host": ["{{baseUrl}}"],
              "path": ["<path>", "<segments>"]
            },
            "body": {
              "mode": "raw",
              "raw": "{}",
              "options": { "raw": { "language": "json" } }
            }
          }
        }
      ]
    }
  ],
  "variable": [
    { "key": "baseUrl", "value": "<BASE_URL from .env>", "type": "string" },
    { "key": "userId", "value": "1", "type": "string" },
    { "key": "authToken", "value": "", "type": "string" }
  ],
  "auth": {
    "type": "bearer",
    "bearer": [{ "key": "token", "value": "{{authToken}}", "type": "string" }]
  }
}
```

**Rules for path resolution:**
- Replace `EndPoints.xxx` references with the actual path from the lookup table.
- Replace `{user_id}` with `{{userId}}`.
- Replace other `{param}` patterns with `{{param}}`.
- Split the path into segments for the `path` array (exclude leading slash).

**Rules for body:**
- Only include `"body"` if the method has a `@Body()` annotation.
- Set `mode: "raw"` and `raw: "{}"` as a placeholder.

**Rules for naming:**
- Convert camelCase method names to Title Case with spaces: `getEmployeeList` → `Get Employee List`.

### Step 7: Write the output file

1. Write the JSON to `<project_root>/<project_name>_api.postman_collection.json`.
2. Validate the JSON is parseable:
   ```
   node -e "JSON.parse(require('fs').readFileSync('<output_path>'))"
   ```

### Step 8: Report to user

Provide a summary of:
- Number of folders generated
- Number of requests generated
- The output file path
- Instructions to import into Postman
