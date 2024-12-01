#!/bin/bash
#SBATCH --job-name=PixiExample
#SBATCH --mail-user=alber.gator@ufl.edu
#SBATCH --mail-type=END,FAIL
#SBATCH --output ./slurm/logs/my_job-%j.log
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32gb
#SBATCH --time=72:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:a100:1
#SBATCH --account=my-account
#SBATCH --qos=my-account
echo "Date      = $(date)"
echo "host      = $(hostname -s)"
echo "Directory = $(pwd)"


# No conda stuff

# Pixi
cd /absolute/path/to/your/pixi/project

pixi run python my_script.py \
  --arg1 val1 \
  --arg2 val2
