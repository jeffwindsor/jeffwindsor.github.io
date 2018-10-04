#!/bin/sh
resume_list=resumes.md
formats=(html pdf)
json=(elegant kendall flat class short spartan stackoverflow)
fresh=(modern compact)

echo "# Jeff Windsor's Resumes" > ${resume_list}
echo ""  >> ${resume_list}
echo "[Home](https://jeffwindsor.carrd.co/) > Resumes"
echo ""  >> ${resume_list}
echo "## Resume by Format" >> ${resume_list}
echo ""  >> ${resume_list}

## pre convert json-resume format to fresh format 
hackmyresume convert ./resume/resume.json TO ./resume/resume-fresh.json

## resume.json is data of record
for t in "${json[@]}"; do
    echo ${t}
    npm i -g jsonresume-theme-${t}
    echo "  * ${t} [[ html ](generated/resume-json-${t}.html)] [[ pdf ](generated/resume-json-${t}.pdf)]" >> ${resume_list}
    for f in "${formats[@]}"; do
      hackmyresume build ./resume/resume.json TO ./resume/generated/resume-json-${t}.${f} -t /usr/local/lib/node_modules/jsonresume-theme-${t}
    done
done

## FRESH / HACK RESUME
for t in "${fresh[@]}"; do
  echo ${t}
  npm i -g fresh-theme-${t}
  echo "  * ${t} [[ html ](generated/resume-fresh-${t}.html)] [[ pdf ](generated/resume-fresh-${t}.pdf)]" >> ${resume_list}
  for f in "${formats[@]}"; do
    hackmyresume build ./resume/resume-fresh.json TO ./resume/generated/resume-fresh-${t}.${f} -t ${t}
  done
done
