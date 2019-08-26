repo_root="./build"
repo_name="mygitrepo"

rm -rf repo_root


mkdir -p ${repo_root}/${repo_name}
cd $repo_root/${repo_name}
git init

echo "Done"
