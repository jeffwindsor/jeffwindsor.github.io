#!/bin/sh
resume_list=resumes.html
formats=(doc html md txt pdf)
json=(material cora elegant paper kendall flat modern classy class short slick onepage spartan stackoverflow)
fresh=(positive modern compact awesome underscore)

cd ./resume

echo "<html><head><body>" > ${resume_list}

## pre convert json-resume format to fresh format 
hackmyresume convert resume.json TO resume-fresh.json

## resume.json is data of record
for t in "${json[@]}"; do
    echo ${t}
    npm i -g jsonresume-theme-${t}
    echo "<a href="generated/resume-json-${t}.html">${t}</a>" >> ${resume_list}
    for f in "${formats[@]}"; do
      hackmyresume build resume.json TO generated/resume-json-${t}.${f} -t /usr/local/lib/node_modules/jsonresume-theme-${t}
    done
done

## FRESH / HACK RESUME
for t in "${fresh[@]}"; do
  echo ${t}
  npm i -g fresh-theme-${t}
  echo "<a href="generated/resume-fresh-${t}.html">${t}</a>" >> ${resume_list}
  for f in "${formats[@]}"; do
    hackmyresume build resume-fresh.json TO generated/resume-fresh-${t}.${f} -t /usr/local/lib/node_modules/fresh-theme-${t}
  done
done

echo "</body></head></html>" >> resumes.html