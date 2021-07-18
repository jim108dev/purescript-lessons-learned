# Lessons Learned

This is a learning project in order to summarize the insides gained from several learning projects and internet articles.

- [Lessons Learned](#lessons-learned)
  - [Working environment](#working-environment)
    - [VSCode setup](#vscode-setup)
  - [Documentation](#documentation)
  - [Development](#development)
    - [Useful Extensions](#useful-extensions)
  - [Version control](#version-control)
    - [Set git config](#set-git-config)
    - [Check out projects with submodules](#check-out-projects-with-submodules)
  - [Add submodules](#add-submodules)
    - [Push changes](#push-changes)
    - [Revert local changes (if necessary)](#revert-local-changes-if-necessary)
    - [Remove submodule](#remove-submodule)

## Working environment

### VSCode setup

1. `Makefile`:
   1. `make backup` copies user config files to local repo folder.
   1. `make restore` does the reverse.
1. Description of the user config files:
   1. `.config/Code/User/settings.json`: Includes various user settings. The last line solved this [error](https://stackoverflow.com/questions/39750674/experimental-support-for-decorators-is-a-feature-that-is-subject-to-change-in-a).

   1. `.config/Code/User/extensions.json`
   1. `.config/Code/User/keybindings.json`: The general notion is to use `ctrl+alt` for user commands.
   1. `.config/Code/User/snippets/markdown.code-snippets`: Markdown snippets. [(cf. documentation)](#documentation).

## Documentation

1. Extensions for documenting with markdown are
   1. "davidanson.vscode-markdownlint"
   1. "streetsidesoftware.code-spell-checker"
   1. "yzhang.markdown-all-in-one": For auto table of context generation.

1. Repository documentation:
   1. `README.md` convention: The readme file of a project should normally have a little abstract of *what* and *why*, followed by *Install*, *Usage* and *Development* with a link to the 'steps' file. A template can be found under `README-TEMPLATE.md`.
   1. `<REPOSITORY-SHORTNAME>-STEPS.md`: This files contains the *Steps for Reproduction*. A template can be found under `STEPS-TEMPLATE.md`.

## Development

### Useful Extensions

1. "2gua.rainbow-brackets": Useful for every programming language.
1. "nick-rudenko.back-n-forth": Buffers go back and forth with a key stroke.
2. "redvanworkshop.explorer-exclude-vscode-extension": Add `.spago` and `output` to hidden files on demand.
3. "jim108dev.open-file-from-path": [vscode-open-file-from-path](https://github.com/jim108dev/vscode-open-file-from-path) Place the cursor of a file in markdown like `README.md` and press `CTRL+ALT+f` to go to that file.
4. "ivoh.sendtoterminalplus": Use with `spago repl` to paste lines to the terminal with `CTRL+ALT+Enter`.
5. "mtxr.sqltools","mtxr.sqltools-driver-mysql","mtxr.sqltools-driver-pg": SQL Tools

## Version control

### Set git config

```sh
git config --global --edit
# Maybe reset password
git config --global --unset user.password
```

### Check out projects with submodules

```sh
git clone --recurse-submodules https://github.com/jim108dev/...
```

## Add submodules

```sh
git submodule add https://github.com/jim108dev/...
```

### Push changes

1. Force overwrite:

   ```sh
   git push -f origin main
   ```

### Revert local changes (if necessary)

1. Update submodules

   ```sh
   git submodule update --remote --merge
   ```

1. Same as deleting and cloning the repository

   ```sh
   git reset --hard origin/main
   git clean -fd
   ```

### Remove submodule

```sh
git submodule deinit -f -- <submodule>
rm -rf .git/modules/<submodule>
git rm -fr <submodule>
```
