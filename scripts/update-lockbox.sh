#!/bin/bash
cd "$(dirname "$0")"
cd "../src/lua-lockbox"

git reset --hard origin/master
git pull origin