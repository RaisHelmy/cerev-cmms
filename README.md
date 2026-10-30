# CEREV CMMS

Bun monorepo: React/TypeScript web dashboard, Cloudflare Workers/Hono API, D1 database, R2 evidence uploads, Expo React Native contractor app.

## Quick start
```bash
bun install
bun --cwd apps/api dev
bun --cwd apps/web dev
EXPO_PUBLIC_API_URL=http://YOUR-LAN-IP:8787 bun --cwd apps/mobile start
```

Before starting API: create D1 database `cerev-cmms`, replace `database_id` in `apps/api/wrangler.toml`, create R2 bucket `cerev-evidence`, and apply `db/migrations/0001_initial.sql` using Wrangler D1 execute/migrations.

Web API URL: `VITE_API_URL=http://localhost:8787`.

## Work order flow
Submitted → Assigned → In Progress → Completed → Verified → Closed → JSON report. Mobile captures and uploads proof photos to R2.

## IMPORTANT: PROTOTYPE ONLY
Current API has **no authentication, authorization, contractor isolation, or secure CORS**. Do not deploy publicly or store real personal data. Push notifications, PostgreSQL adapter, PM/assets/inventory and production reporting are not yet implemented. Add secure identity, RBAC, tenant isolation, audit controls and signed file access before production.
