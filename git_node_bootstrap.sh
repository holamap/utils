ORG_LIB_LOCATION=/tmp/org-libs
#checking out egg/wheel file from git
HOME_DIR=/root
echo "Starting to bootstrap setup…"
#mkdir -p $HOME_DIR/.ssh
#copy the gitlab private ssh key to cluster .ssh folder 
hadoop dfs -get s3n://<your git key location>/id_edxxxx $HOME_DIR/.ssh/id_edxxxx
#change the permission
sleep 20s
chmod 400 $HOME_DIR/.ssh/id_edxxxx
echo "Downloaded org-qubole-gitlab-private-key"
#clone the repo sample command
rm -rf $org_LIB_LOCATION
ssh-keyscan -t rsa git-dev.myorg.net >> ~/.ssh/known_hosts
sleep 60s
echo "keyscan knownhost"
GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone -b develop git@git-dev.myorg.net:ecr-wya/basic-analytics.git $org_LIB_LOCATION
echo "Cloned basic-analytics".
