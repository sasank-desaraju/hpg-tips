# Using `uv` in a Jupyter Notebook (.ipynb)


## Steps for creating a test notebook
A lot of this was taken from [their docs](https://docs.astral.sh/uv/guides/integration/jupyter/).
You can also download [this .ipynb file](uv_jupyter_notebook.ipynb) and follow along in that.

1. Access HPG and and use the terminal to install `uv` if you haven't already
    - `curl -LsSf https://astral.sh/uv/install.sh | sh`
    - confirm installation with `uv --version`

2. Create a new project directory and enter it
    - The terminal can be from VSCode (including through Tunnel) or JupyterLab terminal
    - Make sure you `cd` into your project directory

3. Start `uv` management by running `uv init`

4. Install `ipykernel` as a development dependency
    - `uv add --dev ipykernel`

5. (For JupyterLab) Create kernel
    - `uv run ipython kernel install --user --env VIRTUAL_ENV $(pwd)/.venv --name=project`
    - Make sure to replace `project` with your project name

6. Create a new notebook (test.ipynb or so)
    - Keep an eye on your `pyproject.toml` file to see how it updates as you add packages
    - Adding packages from CLI:
        - Using a terminal: `uv add seaborn`
        - Now you can `import seaborn` in your new notebook
    - Adding via notebook cell:
        - In a notebook cell, run `!uv add altair`
        - Now you can `import altair` in your notebook
        - Importantly, this lives in your `.venv`



## Advantages
- Easy to copy/fork environments
    - Just copy the `pyproject.toml` to a new project's directory, change the name if you want, and run `uv sync` to create a new environment

- Safely add packages in the notebook with familiar interface similar to `pip install <package>`
    - Just use `!uv add <package>` in a notebook cell to add a package to the environment
    - This will update the `pyproject.toml` file and install the package in the environment

- `uv` keeps environment in `.venv/`
    - VSCode recognizes this immediately and treats it like a good ol' `python -m venv .venv`

- Super fast installs

## Limitations
- I don't think this can take advantage of the precreated Jupyter kernels on HPG
