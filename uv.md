# uv

uv is a popular Python manager that may be a good fit for you.
It works for most Python projects, including deep learning, and conforms to many popular standards by its files/formats.

[Website](https://docs.astral.sh/uv/)

## [Installation](https://docs.astral.sh/uv/getting-started/installation/)

Run this anywhere in your terminal:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Familiarize yourself with the [documentation](https://docs.astral.sh/uv/).

## Setup for Deep Learning
For deep learning on HPG, one needs to be careful to install Torch with CUDA support for our NVIDIA GPUs.
Thus, it is not merely running `uv install torch` as we would for most other packages.
Fortunately, uv has [a guide](https://docs.astral.sh/uv/guides/integration/pytorch/) for this.

After you run your `uv init` command, I recommend you edit your `pyproject.toml` as such to include sources for `torch` and `torchvision`:
```toml
[project]
name = "my-uv-project"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.10"
dependencies = [
]

[tool.uv.sources]
torch = [
  { index = "pytorch-cu128", marker = "sys_platform == 'linux' or sys_platform == 'win32'" },
]
torchvision = [
  { index = "pytorch-cu128", marker = "sys_platform == 'linux' or sys_platform == 'win32'" },
]

[[tool.uv.index]]
name = "pytorch-cu128"
url = "https://download.pytorch.org/whl/cu128"
explicit = true
```

Then, run `uv add torch` and `uv add torchvision` sequentially to install them.
This differs slightly from the PyTorch guide on their website.

Now, you should be able to run Python files that require PyTorch with CUDA.

You can even run bash files with Python in then, such as `cuda_check` described [here](README.md#cuda_check), using `uv run cuda_check`.



