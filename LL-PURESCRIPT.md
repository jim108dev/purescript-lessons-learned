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

## Development

### Useful Extensions

1. "nwolverson.ide-purescript","nwolverson.language-purescript": Default PureScript IDE

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
