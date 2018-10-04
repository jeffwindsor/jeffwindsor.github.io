#!/bin/sh
resume_list=resumes.md
formats=(html pdf)
json=(elegant kendall flat class short spartan stackoverflow)
fresh=(modern compact)

echo "[Home](https://jeffwindsor.carrd.co/) > [Github](https://jeffwindsor.github.io/) > Resumes" > ${resume_list}
echo ""  >> ${resume_list}
echo "## Resume by Format" >> ${resume_list}
echo ""  >> ${resume_list}
echo "|Format|HTML|PDF|"  >> ${resume_list}
echo "|---|---|---|"  >> ${resume_list}

## pre convert json-resume format to fresh format 
hackmyresume convert ./resume/resume.json TO ./resume/resume-fresh.json

## resume.json is data of record
for t in "${json[@]}"; do
    npm i -g jsonresume-theme-${t}
    echo "| ${t} | [[ html ](resume/generated/resume-json-${t}.html)] | [[ pdf ](resume/generated/resume-json-${t}.pdf)] |" >> ${resume_list}
    for f in "${formats[@]}"; do
      hackmyresume build ./resume/resume.json TO ./resume/generated/resume-json-${t}.${f} -t /usr/local/lib/node_modules/jsonresume-theme-${t}
    done
done

## FRESH / HACK RESUME
for t in "${fresh[@]}"; do
  npm i -g fresh-theme-${t}
  echo "| ${t} [[ html ](resume/generated/resume-fresh-${t}.html)] | [[ pdf ](resume/generated/resume-fresh-${t}.pdf)] |" >> ${resume_list}
  for f in "${formats[@]}"; do
    hackmyresume build ./resume/resume-fresh.json TO ./resume/generated/resume-fresh-${t}.${f} -t ${t}
  done
done

