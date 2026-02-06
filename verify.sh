#!/bin/bash
# Verification script for seekfirst-bible
# Runs linting, type checking, tests, and build

set -e
cd "$(dirname "$0")"

echo "=============================="
echo "VERIFICATION PIPELINE"
echo "=============================="

echo ""
echo "[1/3] Running ESLint..."
npm run lint
echo "✓ Linting OK"

echo ""
echo "[2/3] Running tests..."
npm run test
echo "✓ Tests OK"

echo ""
echo "[3/3] Running build..."
npm run build
echo "✓ Build OK"

echo ""
echo "=============================="
echo "ALL CHECKS PASSED"
echo "=============================="
