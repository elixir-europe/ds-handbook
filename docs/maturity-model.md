# How the maturity model gets into the handbook

The maturity model is not written in this repository. It lives in [rdm-maturity-model](https://github.com/elixir-europe/rdm-maturity-model) as [`_data/maturity_model.json`](https://github.com/elixir-europe/rdm-maturity-model/blob/main/_data/maturity_model.json), and the handbook renders it:

- `_external/rdm-maturity-model` is a git submodule of that repository, and `_data/shared` is a symlink to its `_data/` folder. Jekyll reads the model as `site.data.shared.maturity_model` and its contributors as `site.data.shared.contributors`.
- [`_plugins/maturity_model_pages.rb`](../_plugins/maturity_model_pages.rb) generates the 25 indicator pages (`/mm-support-network` and so on) and the maturity model sidebar from the model during the build. These pages have no files in this repository, and their edit, history and report-an-issue buttons point to the model.
- [`pages/maturity-model.md`](../pages/maturity-model.md) renders the overview table and the version information, and [`_includes/mm-contributors.html`](../_includes/mm-contributors.html) the model's contributors.
- The four domain pages in [`pages/maturity-model/`](../pages/maturity-model/) are written by hand and list their indicators by id. A new indicator in the model has to be added to its domain page.

## Updating the model

The site is built from the model commit the submodule points to, not from the latest `main` of rdm-maturity-model. To take a new model version, move the submodule in a pull request; its build checks that the handbook still renders that version:

```sh
cd _external/rdm-maturity-model
git fetch && git checkout <release tag or commit>
cd ../..
git add _external/rdm-maturity-model
```

To change what the model says, open a pull request in rdm-maturity-model, not here. In an existing clone, `git submodule update --init` fetches the model; without it, the build stops.
