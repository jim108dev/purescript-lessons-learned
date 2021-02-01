# Lessons Learned

This is a learning project in order to summarize the insides gained from several learning projects and internet articles.

- [Lessons Learned](#lessons-learned)
  - [Working environment](#working-environment)
    - [VSCode setup](#vscode-setup)
  - [Documentation](#documentation)
  - [Development](#development)
    - [Useful Extensions](#useful-extensions)
    - [PureScript Installation](#purescript-installation)
    - [Source code file and folder structure](#source-code-file-and-folder-structure)
    - [Setting up a new Project](#setting-up-a-new-project)
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
1. "redvanworkshop.explorer-exclude-vscode-extension": Add `.spago` and `output` to hidden files on demand.
1. "jim108dev.open-file-from-path": [vscode-open-file-from-path](https://github.com/jim108dev/vscode-open-file-from-path) Place the cursor of a file in markdown like `README.md` and press `CTRL+ALT+f` to go to that file.
1. "nwolverson.ide-purescript","nwolverson.language-purescript": Default PureScript IDE
1. "ivoh.sendtoterminalplus": Use with `spago repl` to paste lines to the terminal with `CTRL+ALT+Enter`.
1. "mtxr.sqltools","mtxr.sqltools-driver-mysql","mtxr.sqltools-driver-pg": SQL Tools

### PureScript Installation

General information is given by [Getting Started with PureScript](https://github.com/purescript/documentation/blob/master/guides/Getting-Started.md).

1. Install:

   ```sh
   sudo npm install -g --unsafe-perm purescript
   # Did not work without --unsafe-perm
   sudo npm install -g --unsafe-perm spago
   sudo npm install -g purty
   ```

1. Purty has some issues. [(cf. Discourse)](https://discourse.purescript.org/t/format-pattern-matching-with-purty/1903/3) I have used Regex-postprocessing as a workaround. (`purty-fix.js`). A `purty` file in local `~/bin` overwrites the system executable.

   ```sh
   # Create new executable
   sudo cp /usr/lib/node_modules/purty/bin/purty /usr/lib/node_modules/purty/bin/purty-fix.js
   # Copy a user editable file to personal bin
   ln -s /lib/node_modules/purty/bin/purty-fix.js ~/bin/purty
   sudo cat purty-fix.js > ~/bin/purty
   ```

### Source code file and folder structure

1. The general source code file and folder structure is `<src-folder>/<app>/<domain>/<layer>/<file>`.
    1. `<src-folder>`:
        1. `sql`: Contains sql scripts for development and database setup.
        1. `src`: PureScript and JavaScript development source files.
        1. `test`: Test cases.
    1. `<app>`:
        1. `Client`: Code which is only used in the client application. (Not implemented yet)
        1. `Server`: Code which is only used in the server application.
        1. `Shared`: Code which can be used by all apps.
    1. `<domain>`:
        1. `Shell`: For the entry point of the application and to direct to other domains. `Shell` can depend on other domains. Other domains cannot depend on `Shell`
        1. `User`: User domain code.
        1. `Shared`: Code which can be used by all domains. Other domains can depend on `Shared`. `Shared` cannot depend on other domains.
    1. `<layer>`:
        1. `Api`: Entry, exit points of requests and validation logic.
        1. `Application`: Business application layer. Layers which rely on effects can only be used with interfaces. If there is no business logic, the layer is omitted.
        1. `Interface`: Interfaces for persistence or application functions.
        1. `Persistence`: Persistence/storage/database layer.
        1. `Util`: Holds util functions which can be used in every layer.
    1. `<file>`: If there can be multiple implementations of the same layer, a distinct name is used. `Main.purs` refers to the general implementation/entrance point of a folder. `Types.purs` holds all data types, constructor functions, class and instance declarations.
1. The handle pattern was used for dependency injection following the description of [(Van der Jeugt, 2018)](https://jaspervdj.be/posts/2018-03-08-handle-pattern.html).
1. The source code is written for qualified import, which is also described by [(Van der Jeugt, 2018)](https://jaspervdj.be/posts/2018-03-08-handle-pattern.html).

### Setting up a new Project

1. `github.com`: Create new repository with README, "PureScript" `.gitignore` and MIT License.
1. Clone project. Change into folder.
1. Init

   ```sh
   spago init
   spago run
   ```

## Version control

### Set git config

```sh
git config --global --edit
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
