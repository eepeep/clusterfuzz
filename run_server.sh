#!/usr/bin/env bash

source ENV/bin/activate
python butler.py run_server --skip-install-deps
