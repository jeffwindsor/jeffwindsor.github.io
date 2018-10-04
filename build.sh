#!/bin/sh
cd ./resume

resume export resume.html -t short

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
  onepage
  spartan
  stackoverflow
  kwan
)
for t in "${templates[@]}"; do
  #npm install -g jsonresume-theme-${t}
  resume export resume-${t}.html -t ${t}
done

