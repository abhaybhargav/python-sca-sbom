# Vulnerable Supply Chain Demo

This project demonstrates how to generate a Software Bill of Materials (SBOM) and scan a Python project for supply-chain security issues. It includes a simple Python application with integrated security scanning tools.

## Project Structure

- `app.py`: The main Python application (placeholder)
- `requirements.txt`: Python dependencies for the main application
- `Dockerfile`: Dockerfile for building the application container with scanning tools
- `scan_vulnerabilities.sh`: Script to generate SBOM and perform vulnerability scanning

## Prerequisites

- Docker
- Git (for cloning the repository)

## Setup and Usage

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/vulnerable_supply_chain_demo.git
   cd vulnerable_supply_chain_demo
   ```

2. Build the application container:
   ```
   docker build -t vuln-supply-chain-app .
   ```

3. Run the application container:
   ```
   docker run -d --name vuln-supply-chain-app -p 5000:5000 vuln-supply-chain-app
   ```

4. Run the vulnerability scan:
   ```
   docker exec vuln-supply-chain-app /app/scan_vulnerabilities.sh
   ```

   This command executes the `scan_vulnerabilities.sh` script inside the running container.

## Understanding the Scan Results

The vulnerability scan performs two main actions:

1. Generates an SBOM (Software Bill of Materials) using Syft.
2. Scans the SBOM for known vulnerabilities using OSV Scanner.

After running the scan, you will see output from both tools:

- Syft will list all the packages it finds in your project.
- OSV Scanner will report any known vulnerabilities in these packages.

Pay attention to any vulnerabilities reported by OSV Scanner. These will include details such as the affected package, vulnerability description, and potentially a link to more information.

## Interpreting and Acting on Results

1. Review the list of packages in your SBOM. Ensure all listed packages are necessary for your project.
2. For any vulnerabilities found:
   - Check if the vulnerability applies to your usage of the package.
   - Look for available updates or patches for the affected packages.
   - Consider alternative packages if a vulnerability cannot be mitigated.

3. Update your `requirements.txt` file with patched versions of packages when available.

4. Re-run the scan after making changes to verify that vulnerabilities have been addressed.

## Best Practices

- Run this scan regularly, especially before deploying new versions of your application.
- Keep your dependencies up to date.
- Minimize the number of dependencies in your project.
- Use version pinning in your `requirements.txt` to ensure reproducible builds.

## Troubleshooting

- If the scan fails, ensure that your project structure is correct and that all necessary files are present.
- Check that the Docker daemon is running if you encounter Docker-related errors.
- If you modify the scanning script, ensure it's still executable (`chmod +x scan_vulnerabilities.sh`).
- If you encounter issues with the vulnerability scan, you can access the container's shell using:
  ```
  docker exec -it vuln-supply-chain-app /bin/bash
  ```
  This allows you to run the scan manually or troubleshoot any issues within the container.

## Contributing

Contributions to improve the demo are welcome. Please submit a pull request or open an issue to discuss proposed changes.

## License

[Specify your license here]
