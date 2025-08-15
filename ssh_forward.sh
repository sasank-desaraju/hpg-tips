# Remember to replace USERNAME_HERE with your actual username!
ssh -N -p 2222 -o ExitOnForwardFailure=yes \
  -L 8080:"$(ssh -p 2222 USERNAME_HERE@hpg.rc.ufl.edu 'squeue -h -u USERNAME_HERE -o %N | head -n1')":8080 \
  USERNAME_HERE@hpg.rc.ufl.edu

# More reliable but multiple lines and creates a local environment variable
# HPG_NODE="$(ssh -p 2222 USERNAME_HERE@hpg.rc.ufl.edu 'squeue -h -u USERNAME_HERE -o %N | head -n1')"
# echo "Node is: $HPG_NODE"
# ssh -N -p 2222 -o ExitOnForwardFailure=yes -L 8080:"$HPG_NODE":8080 USERNAME_HERE@hpg.rc.ufl.edu

