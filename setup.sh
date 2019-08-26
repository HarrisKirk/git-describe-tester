addCommit() {
    echo `date` >> README.md
    git add README.md
    git commit --quiet -m "$1"
}
graph() {
    git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s" --simplify-by-decoration
}

repo_root="./build"
repo_name="mygitrepo"

rm -rf ${repo_root}
mkdir -p ${repo_root}/${repo_name}
cd ${repo_root}/${repo_name}

git init --quiet
git config core.autocrlf false

addCommit "First commit"

git tag -m "Annotated" 0.0.1 

addCommit "next commit"
addCommit "next commit"

graph 

git describe --always




echo "Done"
