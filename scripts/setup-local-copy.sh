#!/bin/bash
cd "$(dirname "$0")"
cd "../src"

cp -r "./lua-lockbox/lockbox" "./lockbox-autogen"

sed -i '1 i\local require = require(script:FindFirstAncestor("lockbox-autogen").Parent.innerRequire)' ./lockbox-autogen/*.lua ./lockbox-autogen/*/*.lua ./lockbox-autogen/*/*/*.lua

rm -rf "./lockbox-wrapper/lockbox-secure/lockbox-autogen"
cp -r "./lockbox-autogen" "./lockbox-wrapper/lockbox-secure/lockbox-autogen"

rm -rf "./lockbox-wrapper/lockbox-insecure/lockbox-autogen"
cp -r "./lockbox-autogen" "./lockbox-wrapper/lockbox-insecure/lockbox-autogen"

rm -rf "./lockbox-autogen"


cp -r "./lua-lockbox/test" "./lockbox-test-autogen"

sed -i '1 i\local require = require(script:FindFirstAncestor("lockbox-test-autogen").Parent.innerRequire)\
return function()' ./lockbox-test-autogen/**.lua
sed -i '$s/$/\nend/' ./lockbox-test-autogen/**.lua

rm -rf "./Test/Server/test/lockbox-test-autogen"
mv "./lockbox-test-autogen" "./Test/Server/test/lockbox-test-autogen"