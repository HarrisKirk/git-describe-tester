addCommit() {
    echo `date` >> README.md
    git add README.md
    git commit --quiet -m "$1"
}
graph() {
#    git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s" --simplify-by-decoration
    git log --graph --full-history --all --color \
    --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s" 
}
tag() {
    git tag -m "Annotated" $1 
}

repo_root="./build"
repo_name="mygitrepo"

rm -rf ${repo_root}
mkdir -p ${repo_root}/${repo_name}
cd ${repo_root}/${repo_name}

git init --quiet
git config core.autocrlf false

addCommit "First commit"

tag "0.0.1"

addCommit "next commit"
addCommit "next commit"

git checkout --quiet -b "featureA"
tag "0.1.0"
addCommit "commit 1 on branch"
addCommit "commit 2 on branch"
tag "0.1.1"
addCommit "commit 2 on branch"

git checkout --quiet master
addCommit "moving fwd on master"
addCommit "moving fwd on master"

git merge --quiet featureA >/dev/null
git checkout --quiet --theirs .
git add .
git commit -m "Use theirs"


graph 
echo ""
#echo "master   : $(git describe --always --match '0.0.*' master)"
echo "master   : $(git describe --always master)"
echo "featureA : $(git describe --always featureA)"

