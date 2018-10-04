#!/bin/sh
cd ./resume

templates=(
  elegant
  paper
  kendall
  flat
  modern
  classy
  class
  short
  slick
  kwan
  onepage
  spartan
  stackoverflow
)
for t in "${templates[@]}"; do
  npm install -g jsonresume-theme-${t}
  resume export resume-${t}.html -t ${t}
done

