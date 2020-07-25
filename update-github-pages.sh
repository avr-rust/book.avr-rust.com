#! /bin/sh -ea

# This script can be used to export the book to HTML format and push the
# artifacts to the GitHub 'gh-pages' branch.

BOOK_DIR=$(dirname $0)
TARGET_BRANCH=gh-pages

function note() {
  echo "[note]: $@"
}

cd "${BOOK_DIR}"

repository_url=$(git remote get-url origin)
staging_dir=$(mktemp -qd)

note "created staging directory at '$staging_dir'"


note "generating book "
mdbook build -d "${staging_dir}" "${BOOK_DIR}"

cd "${staging_dir}"
git init

git add .
git commit -m "Generate the HTML version of the book"
git branch -m $TARGET_BRANCH

echo "book.avr-rust.com" > CNAME
git add CNAME
git commit -m "Add CNAME configuring the book.avr-rust.com custom domain"

git remote add origin "${repository_url}"

note "pushing the '$TARGET_BRANCH' branch to '${repository_url}'"

git push origin $TARGET_BRANCH --force

note "staging directory left at '${staging_dir}'"
