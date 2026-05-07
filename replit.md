# MailPilot

Outlook (Microsoft) mailbox bulk management system — import, export, delete, search, group accounts, check/renew refresh tokens, and read Inbox/Junk mail via Graph API or IMAP fallback.

## Run & Operate

- **Start**: `python app.py`
- **Port**: 5000 (0.0.0.0)
- No required env vars — all data stored in `output/accounts.json` and `output/groups.json`

## Stack

- **Backend**: Python 3, FastAPI, Uvicorn
- **HTTP client**: httpx (OAuth2 + Microsoft Graph API)
- **Frontend**: Plain HTML/CSS/JS served as static files via FastAPI StaticFiles
- **Auth**: Microsoft OAuth2 refresh token flow (no secrets required server-side)

## Where things live

- `app.py` — main FastAPI app, all API routes, IMAP fallback, static file serving
- `api.py` — public batch API router (`/api/batch-check`, `/api/batch-renew`, etc.)
- `static/` — frontend assets (`index.html`, `style.css`, `app.js`)
- `output/` — runtime data (accounts.json, groups.json, accounts.csv); auto-created
- `android/` — Android app (WebView + NanoHTTPD local server) — not run on Replit

## Architecture decisions

- Static frontend is served by FastAPI itself — no separate frontend server needed
- PyInstaller "frozen" path detection in `app.py` for Windows distribution builds
- IMAP used as fallback when Graph API scope is unavailable for a token
- All account data is stored in local JSON/CSV files (no database)
- Public batch API (`api.py`) is included via FastAPI router at `/api` prefix

## Product

- Bulk import/export Outlook accounts (email, password, clientId, refreshToken)
- Check and renew OAuth2 refresh tokens (manual or batch)
- Read Inbox and Junk mail per account (Graph API + IMAP fallback)
- Extract verification codes from recent emails
- Group and paginate accounts; search by email

## User preferences

_Populate as you build_

## Gotchas

- The `webbrowser.open` call was removed for Replit compatibility (no desktop browser)
- App runs on port 5000 with host 0.0.0.0 for Replit preview pane

## Pointers

- Microsoft Graph API docs: https://learn.microsoft.com/en-us/graph/api/overview
- FastAPI docs: https://fastapi.tiangolo.com
