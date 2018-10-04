#!/bin/sh
resume_list=resumes.html
formats=(doc html md txt pdf)
json=(material cora elegant paper kendall flat modern classy class short slick onepage spartan stackoverflow)
fresh=(modern compact awesome /usr/local/lib/node_modules/fresh-theme-positive /usr/local/lib/node_modules/fresh-theme-underscore)

cd ./resume

echo "<html><head></head><body><h1>Generated Resume Formats</h1><ul>" > ${resume_list}

## pre convert json-resume format to fresh format 
hackmyresume convert resume.json TO resume-fresh.json

## resume.json is data of record
for t in "${json[@]}"; do
    echo ${t}
    npm i -g jsonresume-theme-${t}
    echo "<li>${t} <a href="generated/resume-json-${t}.html">[ html ]</a> <a href="generated/resume-json-${t}.pdf">[ pdf ]</a> <a href="generated/resume-json-${t}.txt">[ txt ]</a> <a href="generated/resume-json-${t}.md">[ md ]</a> </li>" >> ${resume_list}
    for f in "${formats[@]}"; do
      hackmyresume build resume.json TO generated/resume-json-${t}.${f} -t /usr/local/lib/node_modules/jsonresume-theme-${t}
    done
done

## FRESH / HACK RESUME
for t in "${fresh[@]}"; do
  echo ${t}
  npm i -g fresh-theme-${t}
  echo "<li>${t} <a href="generated/resume-fresh-${t}.html">[ html ]</a> <a href="generated/resume-fresh-${t}.pdf">[ pdf ]</a> <a href="generated/resume-fresh-${t}.txt">[ txt ]</a> <a href="generated/resume-fresh-${t}.md">[ md ]</a></li>" >> ${resume_list}
  for f in "${formats[@]}"; do
    hackmyresume build resume-fresh.json TO generated/resume-fresh-${t}.${f} -t ${t}
  done
done

echo "</ul></body></html>" >> resumes.html