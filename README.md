# Salesforce DX Project

Salesforce DX is a development approach that brings source-driven development, team collaboration, and continuous integration to the Salesforce Platform. Instead of working directly in an org through a web browser, you work with metadata as source files in a local DX project, track changes in version control, and deploy through automated processes.

This project template gets you started with the tools and structure you need to build Salesforce applications using source control, scratch orgs, and the Salesforce CLI.

## Prerequisites

Before you start, make sure you have:

- **Salesforce CLI** - Download from [developer.salesforce.com/tools/salesforcecli](https://developer.salesforce.com/tools/salesforcecli). See [Install Salesforce CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm) for details.
- **VS Code with Salesforce Extension Pack** - See [Installation Instructions](https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/install.html) for details. Includes the Agentforce Vibes extension.
- **A development org** - Sign up for a free Developer Edition org [here](https://developer.salesforce.com/signup).
- **Dev Hub enabled** (optional, required to create scratch orgs) - You can enable Dev Hub in your development org under Setup > Dev Hub.  See [Provide Developers Access to Salesforce DX Tools](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_setup_dx_tools.htm).

## Project Structure

Your DX project follows this structure:

- **`force-app/main/default/`** - Your metadata source files live in this default package directory. You can configure additional package directories in the `sfdx-project.json` file.
- **`config/`** - Scratch org definitions and project settings
- **`scripts/`** - Automation scripts for common tasks
- **`sfdx-project.json`** - Project manifest that defines package directories, namespace, API version, and other project-level settings

See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm).

## Get Started

Ready to start developing? The [Get Started with Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_get_started_dx.htm) guide walks you through your first project, from creating a scratch org to creating a simple Apex class or LWC to deploying your code to a sandbox.

## Common Salesforce CLI Commands

Here are common CLI commands that you'll use the most:

- `sf org login web`: Authorize an org
- `sf org open`: Open your org in a browser
- `sf org create scratch`: Create a scratch org
- `sf project deploy start`: Deploy metadata to your org
- `sf project retrieve start`: Retrieve metadata from your org
- `sf template generate <artifact>`: Scaffold new components, such as Apex classes and triggers, LWC components, Lightning apps, and more
- `sf apex <command>`: Run Apex tests, run anonymous Apex blocks, and view logs
- `sf data <command>`: Work with test data
- `sf alias <command>`: Manage org aliases
- `sf config <command>`: Configure CLI settings

## Use Agentforce Vibes to Build Lightning Apps

Transform your ideas into custom Lightning apps that extend CRM workflows directly in Lightning Experience. Through natural conversations with Agentforce Vibes, implement custom objects and fields, complex business logic, and dynamic UI components. See [Build a Lightning App Using Agentforce Vibes](https://developer.salesforce.com/docs/platform/einstein-for-devs/guide/lexapp-overview.html).

## Additional Resources

- [Agentforce Vibes Developer Guide](https://developer.salesforce.com/docs/platform/einstein-for-devs/guide/einstein-overview.html)
- [Salesforce CLI Installation Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/)
- [Salesforce CLI Plugin Development Guide](https://developer.salesforce.com/docs/platform/salesforce-cli-plugin/guide/conceptual-overview.html)
- [Salesforce VS Code Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
## Sprint 35

This sprint covers Git version control, GitHub repository management,
feature branches, commits, and pushing Salesforce project changes.
## Git and Deployment Workflow

This project follows a feature-branch development workflow.

1. Create a feature branch from `main`.
2. Make and test the required changes.
3. Commit the changes with a meaningful commit message.
4. Push the feature branch to GitHub.
5. Create a Pull Request.
6. Review the changes before merging.
7. Merge the approved Pull Request into `main`.
8. Pull the latest `main` branch before starting new work.

### Salesforce Deployment

Salesforce metadata is maintained in the Git repository.

The general deployment flow is:

Developer
↓
Feature Branch
↓
Pull Request
↓
Code Review
↓
main
↓
Salesforce Development/Test Org
↓
Testing
↓
Production

Before deployment, verify:

- Correct Salesforce org
- Correct Git branch
- Correct commit
- Required metadata dependencies
- Apex tests
- Permissions and configuration
## Sprint 38 – Salesforce Deployment Comparison

Sprint 38 focuses on understanding the different approaches used to move Salesforce metadata between environments.

### Deployment Approaches

| Approach | Purpose |
|---|---|
| Changesets | Salesforce-native method for moving metadata between related Salesforce orgs |
| Salesforce CLI | Developer-focused command-line workflow for retrieving and deploying metadata |
| Metadata API | Programmatic mechanism for deploying and retrieving Salesforce metadata |
| Scratch Orgs | Temporary source-driven environments for development and testing |
| Sandboxes | Longer-lived environments used for development, testing, QA, and UAT |

### Recommended Approach for the Placement Management System

#### 1. Modern Git-Based Development

**Preferred: Salesforce CLI + Git**

Git stores the Salesforce metadata as source code, while Salesforce CLI is used to retrieve and deploy metadata.

Workflow:

Developer
↓
Feature Branch
↓
Git Commit
↓
Pull Request
↓
Code Review
↓
main
↓
Salesforce CLI
↓
Development / QA Org

#### 2. Traditional Salesforce Deployment

**Preferred: Changesets**

Changesets are useful when an organization follows a traditional Salesforce administration-based deployment process and needs to move metadata between related Salesforce orgs.

#### 3. Temporary Isolated Feature Development

**Preferred: Scratch Orgs**

Scratch Orgs are temporary Salesforce environments that can be created from source and project configuration.

They are useful for isolated feature development and testing.

#### 4. Testing Before Production

**Preferred: Sandbox**

A Sandbox provides a separate Salesforce environment where the application can be tested before changes are moved toward Production.

### Deployment Decision

For this Placement Management System, the preferred modern workflow is:

Git
↓
Feature Branch
↓
Pull Request
↓
Code Review
↓
Salesforce CLI
↓
Development / Scratch Org
↓
QA Sandbox
↓
UAT
↓
Production

The exact deployment process may vary between organizations, but the main principle is controlled, tested, and reproducible deployment.
## Sprint 39 – Deployment Exercise

This sprint demonstrates a controlled Salesforce deployment workflow.

### Deployment Process

1. Create a feature branch.
2. Make a meaningful project change.
3. Commit the change to Git.
4. Push the feature branch to GitHub.
5. Create a Pull Request.
6. Review and merge the Pull Request.
7. Deploy Salesforce metadata to a development or test org.
8. Run Apex tests.
9. Verify the deployed feature manually.
10. Document the deployment result.

### Deployment Target

For this exercise, the Salesforce Scratch Org is used as the development/test environment.

Target org alias:

`scratchOrg`

The target org must always be verified before deployment.

### Deployment Verification

Before deployment:

- Verify the Git branch.
- Verify the Git commit.
- Verify the Salesforce target org.
- Review deployment metadata.
- Check required dependencies.
- Run appropriate tests.

After deployment:

- Confirm deployment success.
- Run Apex tests.
- Verify the feature in Salesforce.
- Check for configuration or permission issues.
- Document the result.