#!/usr/bin/env

bundle config jobs 4
bundle install
JEKYLL_ENV=production bundle exec jekyll build

html-minifier --input-dir _site --output-dir _site --file-ext html --collapse-whitespace --minify-css --remove-comments --remove-attribute-quotes --remove-redundant-attributes

set +x
export NEOCITIES_API_KEY=$(cat /home/user/.neocities/blue-pits)
set -x

gem install --no-document neocities
neocities push --prune _site