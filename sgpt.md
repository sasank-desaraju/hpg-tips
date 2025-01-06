# Shell GPT

"A command-line productivity tool powered by AI large language models (LLM).
This command-line tool offers streamlined generation of shell commands, code snippets, documentation, eliminating the need for external resources (like Google search)."

## Free API Credits (UF people)

UF's Navigator AI program allows you to get $5 API credits for free every month.
This will almost certainly be enough for you.
Follow the steps [here](https://it.ufl.edu/ai/navigator-toolkit/) to crete your API key.
Copy the API key and then you can skip steps 2 and 3 below.

## Install

1. Follow the [GitHub](https://github.com/TheR1D/shell_gpt) and `pip install shell-gpt`.
This should install.

2. Create an OpenAI API account and make sure you [have money](https://platform.openai.com/settings/organization/billing/overview) it.

3. Then, create a new API Key from the API Keys menu.
Name it "Shell GPT" or something.
Copy your API Key to the clipboard.

4. Run `sgpt` and paste your API Key (with `Ctrl+Shift+v`) when prompted.

Your API Key, along with other info, will be saved to `~/.config/shell_gpt/.sgptrc`.
You can edit this file to change other things like the default model.

## Usage

DO NOT give it sensitive information included Protected Health Information (PHI).
Everything you give it gets sent to OpenAI's servers so please keep that in mind.
