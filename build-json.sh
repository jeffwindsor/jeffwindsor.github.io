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
)
for t in "${templates[@]}"; do
  #npm install -g jsonresume-theme-${t}
  resume export out-json/resume-${t}.html -t ${t}
done

