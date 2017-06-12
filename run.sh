# update backend repo

cd brbloggers-backend
git pull
Rscript main.R
git add -A
git commit -m "new content"
git push

# update the blog itself
# change to the submodule directory
cd ../brbloggers/content/

# checkout desired branch
git checkout master

# update
git pull

# get back to your project root
cd ..

# now the submodules are in the state you want, so
git commit -am "submodule updated"