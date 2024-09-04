srun \
  --ntasks=1 \
  --cpus-per-task=1 \
  --account=your-account-here \
  --qos=your-account-here \
  --partition=gpu \
  --gpus=a100:1 \
  --mem=8gb \
  --time=12:00:00 \
  --pty bash -i

# Change the account and qos to your own account and qos
# The account is the account name of the PI or the lab
# The qos is the corresponding QOS (Quality of Service) name; usually same as account name
