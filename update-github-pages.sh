#! /bin/sh -ea

# This script can be used to export the book to HTML format and push the
# artifacts to the GitHub 'gh-pages' branch.

BOOK_DIR=$(dirname $0)

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
git branch -m gh-pages

git remote add origin "${repository_url}"

note "pushing the 'gh-pages' branch to '${repository_url}'"

git push origin gh-pages --force

note "staging directory left at '${staging_dir}'"
