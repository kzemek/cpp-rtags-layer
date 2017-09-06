# c++-rtags Spacemacs layer

This layer augments C++ support provided by [Spacemacs` c-c++ layer](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Blang/c-c%2B%2B).

## Features

* Adds `rtags` package for basic RTags support
* Adds `company-rtags` package for RTags-powered completion
* Adds `flycheck-rtags` for checking C++ code with RTags
* Adds `helm-rtags` for Helm integration
* Ensures RTags daemon (`rdm`) is started via `cmake-ide-maybe-start-rdm`
* Enables completion (via `company`) and linting (via adding a checker to and replacing `flycheck` highligher) in C/C++ modes

## Installation

Simply clone the repository into your emacs.d private directory:

```shell
git clone https://github.com/kzemek/cpp-rtags-layer ~/.emacs.d/private/c++-rtags
```

and enable the layer in `~/.spacemacs` along with `c-c++` (without clang support):

```lisp
...
dotspacemacs-configuration-layers
'( ...
  c-c++
  c++-rtags
  ...
  )
...
```

If your `c-c++` layer doesn't include `cmake-ide` support you may additionally need to fetch it from `develop` branch:
```shell
cd ~/.emacs.d && git fetch && git checkout origin/develop layers/+lang/c-c++/
```

## Project setup

* Install [rtags](https://github.com/Andersbakken/rtags)
  * on macOS this step is as simple as `brew install rtags`
* [Set up `.dir-locals.el`](https://github.com/syl20bnr/spacemacs/tree/develop/layers/%2Blang/c-c%2B%2B#cmake-configuratio)
* [Create `compile_commands.json`](https://github.com/Andersbakken/rtags#setup) in your build directory
  * for CMake projects it's enough to add `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` to `cmake` invocation

## Key bindings

| Key Binding | Description    |
|-------------|----------------|
| `C <tab>`   | Forces showing completions on current point (`company-complete`) |
| `, g g`     | Jumps to symbol definition (using RTags) |
| `, g f`     | Apply Clang fixit |
| `C-c r`     | Various `rtags` functions |
