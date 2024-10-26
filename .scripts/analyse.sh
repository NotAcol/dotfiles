#!/usr/bin/env bash

set -euo pipefail

file_name="$1"

perf record -g "$file_name"
perf report -g -M intel "graph,0.5,caller"
