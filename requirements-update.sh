#!/bin/bash

# Reminder: To make the script executable, run `chmod +x requirements_update.sh`.

# Install pip-tools.
if ! pip list | grep -F pip-tools &> /dev/null; then
	echo "Installing pip-tools..."
	pip install pip-tools
fi

# Compile requirements.in to generate updated requirements.txt.
echo "Compiling requirements.in to generate updated requirements.txt..."
pip-compile requirements.in

# Synchronize the virtual environment with the compiled requirements.txt.
echo "Synchronizing the virtual environment with the compiled requirements.txt..."
pip-sync

# Step 3: Check for dependency conflicts (pip-tools ensures there should be none, but just in case)

# Check for dependency conflicts.
echo "Checking for dependency conflicts..."
pip check

# Todo: Convert to Python.

# From ChatGPT:
# import subprocess
# import sys

# def run_command(command):
#     """Run a shell command and return its output."""
#     try:
#         output = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True, universal_newlines=True)
#         print(output)
#         return True
#     except subprocess.CalledProcessError as e:
#         print("An error occurred while executing the command:", e)
#         print(e.output)
#         return False

# def install_pip_tools():
#     """Check for pip-tools and install it if necessary."""
#     print("Checking for pip-tools...")
#     if not run_command("pip list | grep -F pip-tools"):
#         print("Installing pip-tools...")
#         run_command("pip install pip-tools")

# def compile_requirements():
#     """Compile requirements.in to generate updated requirements.txt."""
#     print("Compiling requirements.in to generate updated requirements.txt...")
#     run_command("pip-compile requirements.in")

# def sync_environment():
#     """Synchronize the virtual environment with the compiled requirements.txt."""
#     print("Synchronizing the virtual environment with the compiled requirements.txt...")
#     run_command("pip-sync")

# def check_conflicts():
#     """Check for dependency conflicts."""
#     print("Checking for dependency conflicts...")
#     run_command("pip check")

# def main():
#     install_pip_tools()
#     compile_requirements()
#     sync_environment()
#     check_conflicts()

# if __name__ == "__main__":
#     main()
