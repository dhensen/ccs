# Centralizing coding standards

Centralize python tooling (linters, formatters, etc).
These tools are installed in a docker image.
This image is wrapped by a bash script.
The bash script takes care of figuring out how to mount the parent dir of the file that you want to lint/format.

Example usage:

```
git clone <this_repo>
./ccs flake8 ./external_app.py
./ccs yapf ./external_app.py
./ccs yapf --in-place ./external_app.py
```

## Requirements

- have coding standards centralized
  - you don't want to copy setup.cfg, .flake8, .style.yapf, etc to all your repos and keep them in sync manually
- applicable to many external code repositories without hard coupling
- support multiple python versions
  - most tools versions only work against specific versions of python as they evolve
  - to be able to support multiple major versions of python we need to have multiple sets of compatible dependency versions
- tools like mypy are even harder: they require a set of dependencies containing the typing hints per project
  - it would great if this tool had a config where this could be specified
