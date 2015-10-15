# Documentation

## User documentation

- [API](api/README.md) Automate GitLab via a simple and powerful API.
- [GitLab as OAuth2 authentication service provider](integration/oauth_provider.md). It allows you to login to other applications from GitLab.
- [GitLab Basics](gitlab-basics/README.md) Find step by step how to start working on your commandline and on GitLab.
- [Importing to GitLab](workflow/importing/README.md).
- [Markdown](markdown/markdown.md) GitLab's advanced formatting system.
- [Permissions](permissions/permissions.md) Learn what each role in a project (guest/reporter/developer/master/owner) can do.
- [Profile Settings](profile/README.md)
- [Project Services](project_services/project_services.md) Integrate a project with external services, such as CI and chat.
- [Public access](public_access/public_access.md) Learn how you can allow public and internal access to projects.
- [SSH](ssh/README.md) Setup your ssh keys and deploy keys for secure access to your projects.
- [Web hooks](web_hooks/web_hooks.md) Let GitLab notify you when new code has been pushed to your project.
- [Workflow](workflow/README.md) Using GitLab functionality and importing projects from GitHub and SVN.

## CI Documentation

+ [Quick Start](ci/quick_start/README.md)
+ [Configuring project (.gitlab-ci.yml)](ci/yaml/README.md)
+ [Configuring runner](ci/runners/README.md)
+ [Configuring deployment](ci/deployment/README.md)
+ [Using Docker Images](ci/docker/using_docker_images.md)
+ [Using Docker Build](ci/docker/using_docker_build.md)
+ [Using Variables](ci/variables/README.md)

### CI Examples

+ [Test and deploy Ruby applications to Heroku](ci/examples/test-and-deploy-ruby-application-to-heroku.md)
+ [Test and deploy Python applications to Heroku](ci/examples/test-and-deploy-python-application-to-heroku.md)
+ [Test Clojure applications](ci/examples/test-clojure-application.md)
+ Help your favorite programming language and GitLab by sending a merge request with a guide for that language.

## Administrator documentation

- [Custom git hooks](hooks/custom_hooks.md) Custom git hooks (on the filesystem) for when web hooks aren't enough.
- [Install](install/README.md) Requirements, directory structures and installation from source.
- [Integration](integration/README.md) How to integrate with systems such as JIRA, Redmine, LDAP and Twitter.
- [Issue closing](customization/issue_closing.md) Customize how to close an issue from commit messages.
- [Libravatar](customization/libravatar.md) Use Libravatar for user avatars.
- [Log system](logs/logs.md) Log system.
- [Operations](operations/README.md) Keeping GitLab up and running
- [Raketasks](raketasks/README.md) Backups, maintenance, automatic web hook setup and the importing of projects.
- [Security](security/README.md) Learn what you can do to further secure your GitLab instance.
- [System hooks](system_hooks/system_hooks.md) Notifications when users, projects and keys are changed.
- [Update](update/README.md) Update guides to upgrade your installation.
- [Welcome message](customization/welcome_message.md) Add a custom welcome message to the sign-in page.
- [Reply by email](incoming_email/README.md) Allow users to comment on issues and merge requests by replying to notification emails.
- [Migrate GitLab CI to CE/EE](migrate_ci_to_ce/README.md) Follow this guide to migrate your existing GitLab CI data to GitLab CE/EE.

### Administrator documentation

+ [User permissions](permissions/permissions.md)
+ [API](api/README.md)

## Contributor documentation

- [Development](development/README.md) Explains the architecture and the guidelines for shell commands.
- [Legal](legal/README.md) Contributor license agreements.
- [Release](release/README.md) How to make the monthly and security releases.
