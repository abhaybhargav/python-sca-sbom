#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for required tools
if ! command_exists syft; then
    echo "Error: Syft is not installed. Please install Syft and try again."
    exit 1
fi

if ! command_exists osv-scanner; then
    echo "Error: OSV Scanner is not installed. Please install OSV Scanner and try again."
    exit 1
fi

# Generate SBOM using Syft
echo "Generating SBOM using Syft..."
if ! syft packages dir:. -o cyclonedx-json > sbom.json; then
    echo "Error: Failed to generate SBOM. Please check your project structure and try again."
    exit 1
fi

# Run OSV Scanner against the generated SBOM
echo "Running OSV Scanner against the generated SBOM..."
if ! osv-scanner --sbom=sbom.json; then
    echo "Error: OSV Scanner failed. Please review the output and try again."
    exit 1
fi

echo "Vulnerability scan complete. Please review the results above."
exit 0