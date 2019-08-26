addCommit() {
    echo `date` >> README.md
    git add README.md
    git commit -m "$1"
}

repo_root="./build"
repo_name="mygitrepo"

rm -rf ${repo_root}
mkdir -p ${repo_root}/${repo_name}
cd ${repo_root}/${repo_name}

git init
git status

addCommit "First commit"
git tag -m "Annotated" 0.0.1 

git describe --always




echo "Done"
