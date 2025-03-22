# Giti: A Lazy Tool for Git

`giti` is a simple command-line tool for lazy developers who want to streamline their Git workflow. It automates the process of adding, committing, and pushing changes, and even supports tagging with minimal effort.

## Features

- **Regular Commits**: Add, commit, and push changes with a single command.
- **Tagging**: Create and push a tag using the tag version as the commit message.
- **Interactive Prompts**: Confirms before making changes, so you don't accidentally push something.

## Installation

You can install `giti` directly using `curl`:

```bash
curl -sSL https://raw.githubusercontent.com/devfernandoa/giti/main/install.sh | bash
```

## Usage

### Regular Commit

```bash
giti "Your commit message here"
```

### Tagged Commit

```bash
giti vX.X.X
```

This will:

- Add all changes.

- Commit with the message vX.X.X.

- Push the changes.

- Create and push a tag named vX.X.X.

## Example

### Regular Commit

```bash
giti "Fixed a bug in the login system"
```

### Tagged Commit

```bash
giti v1.2.3
```

### Uninstall

To uninstall giti, simply remove the script:

```bash
sudo rm /usr/local/bin/giti
```

## License

This project is open-source and available under the MIT License.
