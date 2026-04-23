#!/bin/sh
# Vercel build step — inject Supabase config from env vars.
# Runs once per deploy.  All output here lands in the Vercel deploy log.
set -e

echo "--- Supabase build diagnostics ---"
if [ -n "$SUPABASE_URL" ]; then
  echo "SUPABASE_URL: set (length=${#SUPABASE_URL})"
else
  echo "SUPABASE_URL: MISSING  ← env var not available at build time"
fi
if [ -n "$SUPABASE_ANON_KEY" ]; then
  echo "SUPABASE_ANON_KEY: set (length=${#SUPABASE_ANON_KEY})"
else
  echo "SUPABASE_ANON_KEY: MISSING  ← env var not available at build time"
fi

# printf (not echo) because the key may contain leading dashes which some shells
# treat as options to `echo`.
printf "window.__SUPABASE_URL__='%s';\nwindow.__SUPABASE_ANON_KEY__='%s';\n" \
  "$SUPABASE_URL" "$SUPABASE_ANON_KEY" > config.js

echo "--- Generated config.js ---"
cat config.js
echo "--- end diagnostics ---"
