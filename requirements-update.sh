#!/bin/bash

# Reminder: To make the script executable, run `chmod +x update_requirements.sh`.

# Upgrade all packages.
pip list --outdated | grep -v "Package\|---\|WARNING:" | awk "{print $1}" | xargs -n1 pip install -U

# Regenerate requirements.txt.
pip freeze > requirements.txt

# Check for dependency conflicts.
pip check
