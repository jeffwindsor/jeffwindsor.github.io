#!/bin/sh
cd ./resume
hackmyresume convert resume.json TO resume-fresh.json

templates=(
  positive
  modern
  compact
  awesome
)
for t in "${templates[@]}"; do
  hackmyresume build resume-fresh.json TO out/resume-${t}.html -t ${t}
  hackmyresume build resume-fresh.json TO out/resume-${t}.md -t ${t}
  hackmyresume build resume-fresh.json TO out/resume-${t}.pdf -t ${t}
  hackmyresume build resume-fresh.json TO out/resume-${t}.doc -t ${t}
done

