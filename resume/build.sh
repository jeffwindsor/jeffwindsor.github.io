#!/bin/sh
################################################
output_path=./resume/generated
output_filename=../resumes.md
formats=(html pdf)
json=(short stackoverflow)
fresh=(positive)
jsonex=(elegant kendall flat class spartan)
freshex=(compact)


################################################
write_markdown_list(){
  echo "==========================================="
  echo "  Building List "
  echo "==========================================="
  echo "[Home](https://jeffwindsor.carrd.co/) > [Github.io](https://jeffwindsor.github.io/) > Resumes" > ${output_filename}
  echo ""  >> ${output_filename}
  echo "## Resume by Format" >> ${output_filename}
  echo ""  >> ${output_filename}
  echo "|Format|HTML|PDF|"  >> ${output_filename}
  echo "|---|---|---|"  >> ${output_filename}
  for t in "${json[@]}"; do
    echo "| ${t} | [[ html ](${output_path}/resume-json-${t}.html)] | [[ pdf ](${output_path}/resume-json-${t}.pdf)] |" >> ${output_filename}
  done
  for t in "${fresh[@]}"; do
    echo "| ${t} | [[ html ](${output_path}/resume-fresh-${t}.html)] | [[ pdf ](${output_path}/resume-fresh-${t}.pdf)] |" >> ${output_filename}
  done

    echo "## Experimental Formats" >> ${output_filename}
  echo ""  >> ${output_filename}
  echo "|Format|HTML|"  >> ${output_filename}
  echo "|---|---|"  >> ${output_filename}
  for t in "${json[@]}"; do
    echo "| ${t} | [[ html ](${output_path}/resume-json-${t}.html)] | " >> ${output_filename}
  done
  for t in "${fresh[@]}"; do
    echo "| ${t} | [[ html ](${output_path}/resume-fresh-${t}.html)] |" >> ${output_filename}
  done
}

init(){
  echo "==========================================="
  echo "  Initializing Packages "
  echo "==========================================="
  for t in "${json[@]}"; do
      npm i -g jsonresume-theme-${t}
  done
  for t in "${fresh[@]}"; do
    npm i -g fresh-theme-${t}
  done
  npm i -g hackmyresume
  brew cask install wkhtmltopdf
}

generate_resumes(){
  echo "==========================================="
  echo "  Generating Resumes "
  echo "==========================================="
  ## pre convert json-resume format to fresh format
  ## resume.json is data of record
  hackmyresume convert ./resume.json TO ./resume-fresh.json
  for t in "${json[@]}"; do
    hackmyresume build ./resume.json TO ${output_path}/resume-json-${t}.html -t /usr/local/lib/node_modules/jsonresume-theme-${t}
    hackmyresume build ./resume.json TO ${output_path}/resume-json-${t}.pdf -t /usr/local/lib/node_modules/jsonresume-theme-${t}
  done
  for t in "${fresh[@]}"; do
    hackmyresume build ./resume-fresh.json TO ${output_path}/resume-fresh-${t}.html -t ${t}
    hackmyresume build ./resume-fresh.json TO ${output_path}/resume-fresh-${t}.pdf -t ${t}
  done

  for t in "${jsonex[@]}"; do
    hackmyresume build ./resume.json TO ${output_path}/resume-json-${t}.html -t /usr/local/lib/node_modules/jsonresume-theme-${t}
  done
  for t in "${freshex[@]}"; do
    hackmyresume build ./resume-fresh.json TO ${output_path}/resume-fresh-${t}.html -t ${t}
  done
}

usage(){
  echo "usage: build [-g | --generate-resumes] [-i | --init-packages]"
  echo "             [-m | --markdown-list]"
  echo "             [-f | --output-file <output file name>]"
  echo "             [-p | --output-path <output relative path>]"
}

################################################
# MAIN
################################################
post_eval=();
if [ "$1" == ""  ]; then
  usage
  exit 1
fi
while [ "$1" != "" ]; do
    case $1 in
        -p | --output-path )    shift
                                output_path=$1
                                ;;
        -o | --output-file )    shift
                                output_filename=$1
                                ;;
        -m | --markdown-list )  post_eval+=(write_markdown_list)
                                ;;
        -i | --init-packages )  post_eval=("init" "${post_eval[@]}")
                                ;;
        -g | --generate-resumes )
                                post_eval+=(generate_resumes)
                                ;;
        -h | --help )           usag
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done
for c in "${post_eval[@]}"; do
  eval $c;
done