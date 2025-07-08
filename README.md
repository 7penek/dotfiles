# What are Dotfiles?
Dotfiles are the configuration files used to personalize your environment.
You are more than welcome to explore my configurations, but keep in mind that these are suited for my use case only.

# Shell Scripts
There are various shell scripts included in this repository.
Please be aware of their effects before executing them.

# Setting up Authentication on MacOS

- $HOME/.gnupg/gpg-agent.conf

```
pinentry-program /opt/homebrew/bin/pinentry-mac
```

> pkill -TERM gpg-agent

> Close and reopen shell.

> echo test | gpg --encrypt -r penek@penek.rocks | gpg --decrypt

- $HOME/.ssh/config

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

> ssh-add --apple-use-keychain ~/.ssh/id_ed25519
