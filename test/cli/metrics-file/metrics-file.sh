#!/bin/bash

main/sorbet --silence-dev-message -e 'class Foo; end' --metrics-file=metrics.json 2>&1
grep status metrics.json

echo ------------------------------

# Sorbet does not crash if the metrics directory does not exist
main/sorbet --silence-dev-message -e 'class Foo; end' --metrics-file=foo/bar/metrics2.json 2>&1

echo ------------------------------

# Sorbet produce a clean error if the metrics path is not a directory
touch baz
main/sorbet --silence-dev-message -e 'class Foo; end' --metrics-file=baz/metrics3.json 2>&1

echo ------------------------------

# Sorbet produce correct file counters with plugins
main/sorbet --silence-dev-message \
            --dsl-plugins test/cli/metrics-file/sorbet/triggers.yml \
            --metrics-file=metrics4.json \
            test/cli/metrics-file/test.rb 2>&1

grep -A1 "\"ruby_typer.unknown..types.input.files\"" metrics4.json
grep -A1 "\"ruby_typer.unknown..types.input.files.sigil.false\"" metrics4.json
grep -A1 "\"ruby_typer.unknown..types.input.files.sigil.true\"" metrics4.json
