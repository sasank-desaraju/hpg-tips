# Marimo

[Marimo](https://docs.marimo.io/) is a pretty neat new notebook.
Here is how I use it for GPU accelerated Python work on HPG.

I use SSH port forwarding so that I can run the computations in an HPG compute node but view and interact with the notebook in my local browser.
This will involve two terminal windows: the first one is for the HPG compute node and the second one is just for the SSH port forwarding.


## 1. Create project folder with `uv` package management

`uv` is a popular new package management system for Python, replacing conda and pip.
`uv` is really a first class citizen for marimo, with marimo notebooks being able to directly use `uv` environments from within the marimo editor.
Make sure you have `uv` installed (see [here](uv.md)).
I'll assume you're familiar with `uv` from now.

Create folder (e.g. `my_project`) and `cd` into it.
Then run
```bash
uv init
```
and create your `uv` env as you normally would.

## 2. Install Marimo

```bash
uv add marimo
```

Simple as that.

## 3. Start Marimo server

Start the marimo server (with `uv` package management) with
```bash
uv run marimo edit --headless --host 0.0.0.0 --port 8080
```
See [their docs](https://docs.marimo.io/faq/?h=remote#how-do-i-use-marimo-on-a-remote-server) for more info
The port choice here is arbitrary, but make sure to use the same port in the next step.
For convenience, you can copy [this bash file](server_marimo.md) into your project folder and run it instead typing the command out every time.

## 4. SSH port forwarding

Open a second terminal window on your local machine and run the following command to forward the port from the HPG compute node to your local machine:
This creates an environment variable called HPG_NODE on your local machine and then uses it to set up the SSH port forwarding.
```bash
HPG_NODE="$(ssh -p 2222 USERNAME_HERE@hpg.rc.ufl.edu 'squeue -h -u USERNAME_HERE -o %N | head -n1')"
echo "Node is: $HPG_NODE"
ssh -N -p 2222 -o ExitOnForwardFailure=yes -L 8080:"$HPG_NODE":8080 USERNAME_HERE@hpg.rc.ufl.edu
```
Remember to replace `USERNAME_HERE` with your actual HPG username.
You can copy [this bash file](ssh_forward.sh) onto your local machine.

## 5. Open Marimo in your browser

In your first terminal window, you should see the marimo server starting up and be able to Control+LeftClick on the URL link.
This should open up the marimo editor in your local browser, letting you choose the file in your project folder to edit.







