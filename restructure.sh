#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(pwd)"
TS="$(date +%Y%m%d-%H%M%S)"
BACKUP="../$(basename "$PROJECT_ROOT")-backup-$TS.tgz"

echo "==> Creating backup: $BACKUP"
tar -czf "$BACKUP" .

echo "==> Creating standard directories"
mkdir -p src/main/webapp/WEB-INF/jsps
mkdir -p src/main/resources
mkdir -p src/test/java

echo "==> Moving JSPs into /WEB-INF/jsps (secure)"
if [ -d "src/main/webapp/jsps" ]; then
  # Move contents, keep history friendly
  shopt -s dotglob nullglob
  mv src/main/webapp/jsps/* src/main/webapp/WEB-INF/jsps/ || true
  shopt -u dotglob nullglob
  rmdir src/main/webapp/jsps 2>/dev/null || true
else
  echo "   - src/main/webapp/jsps not found (skipping)"
fi

echo "==> Ensuring WEB-INF configs are in place"
mkdir -p src/main/webapp/WEB-INF

# Move web.xml if it exists in a common legacy location
if [ -f "src/main/webapp/web.xml" ] && [ ! -f "src/main/webapp/WEB-INF/web.xml" ]; then
  mv src/main/webapp/web.xml src/main/webapp/WEB-INF/web.xml
  echo "   - moved src/main/webapp/web.xml -> src/main/webapp/WEB-INF/web.xml"
fi

# Move mt-servlet.xml if it exists outside WEB-INF
if [ -f "src/main/webapp/mt-servlet.xml" ] && [ ! -f "src/main/webapp/WEB-INF/mt-servlet.xml" ]; then
  mv src/main/webapp/mt-servlet.xml src/main/webapp/WEB-INF/mt-servlet.xml
  echo "   - moved src/main/webapp/mt-servlet.xml -> src/main/webapp/WEB-INF/mt-servlet.xml"
fi

echo "==> Creating static folders if missing"
mkdir -p src/main/webapp/styles src/main/webapp/images src/main/webapp/js

echo "==> (Optional) Normalize controller package name"
# Choose ONE canonical package. You can change this to com.mt.controller if you prefer.
CANON="com.mt.controllers"
ALT="com.mt.controller"

# Detect both packages exist
HAS_CANON="$(find src/main/java -type f -name "*.java" -print0 2>/dev/null | xargs -0 grep -l "package $CANON" 2>/dev/null || true)"
HAS_ALT="$(find src/main/java -type f -name "*.java" -print0 2>/dev/null | xargs -0 grep -l "package $ALT" 2>/dev/null || true)"

if [ -n "$HAS_ALT" ] && [ -z "$HAS_CANON" ]; then
  echo "   - Found $ALT but not $CANON. Converting $ALT -> $CANON"

  # Move directory tree if present
  if [ -d "src/main/java/com/mt/controller" ]; then
    mkdir -p src/main/java/com/mt/controllers
    mv src/main/java/com/mt/controller/* src/main/java/com/mt/controllers/ || true
    rmdir src/main/java/com/mt/controller 2>/dev/null || true
  fi

  # Update package declarations + imports in all java files
  find src/main/java -type f -name "*.java" -print0 | xargs -0 sed -i.bak \
    -e "s/package $ALT;/package $CANON;/g" \
    -e "s/import $ALT\./import $CANON\./g"

  # Remove .bak files
  find src/main/java -type f -name "*.bak" -delete
else
  echo "   - Package normalization not required (or both packages exist)."
  echo "     If both exist, decide your preferred canonical package then rerun with CANON/ALT adjusted."
fi

echo "==> Updating mt-servlet.xml view resolver prefix to /WEB-INF/jsps/"
MT="src/main/webapp/WEB-INF/mt-servlet.xml"
if [ -f "$MT" ]; then
  # replace prefix value="jsps/" or "/jsps/" to "/WEB-INF/jsps/"
  sed -i.bak -E 's#(<property name="prefix" value=")(/?jsps/?)(" */>)#\1/WEB-INF/jsps/\3#g' "$MT" || true
  rm -f "$MT.bak"
else
  echo "   - $MT not found (skipping)"
fi

echo "==> Conservative JSP link fix: change href=\"jsps/...\" -> href=\"<c:url ...>\" is manual"
echo "   - Keeping safe: only converting hardcoded /jsps/ paths to controller routes is best done intentionally."

echo "==> Done."
echo "Backup created at: $BACKUP"
echo ""
echo "Next steps:"
echo "1) Ensure web.xml points to /WEB-INF/mt-servlet.xml"
echo "2) Ensure DispatcherServlet mapping is '/' (recommended)"
echo "3) Update controllers to return logical view names (e.g., 'home')"

