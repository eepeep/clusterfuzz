#!/usr/bin/env bash

BOT_DIR=../cf_fuchsia_test_bot

# Ensure we're in the virtualenv
source ENV/bin/activate

# Kill any leftover gsutil subprocesses
pkill -9 -f gsutil

# Start the bot in the background, ensuring that we stop it when this script is
# stopped
QUEUE_OVERRIDE=FUCHSIA python butler.py run_bot "$BOT_DIR"&
BOT_PID=$!
trap "kill $BOT_PID" SIGINT SIGTERM EXIT

# Let the logs flow
tail -n 0 -F "$BOT_DIR"/clusterfuzz/bot/logs/*.log

