#!/bin/sh
################################################
output_path=./generated
output_filename=../resumes.md
formats=(html pdf)
json=(elegant kendall flat class short spartan stackoverflow)
fresh=(positive compact)
################################################
write_markdown_list(){
  echo "==========================================="
  echo "  Building List "
  echo "==========================================="
  echo "[Home](https://jeffwindsor.carrd.co/) > [Github](https://jeffwindsor.github.io/) > Resumes" > ${output_filename}
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
  hackmyresume convert ./resume.json TO ./resume-fresh.json
  ## resume.json is data of record
  for t in "${json[@]}"; do
      for f in "${formats[@]}"; do
        hackmyresume build ./resume.json TO ${output_path}/resume-json-${t}.${f} -t /usr/local/lib/node_modules/jsonresume-theme-${t}
      done
  done
  ## FRESH / HACK RESUME
  for t in "${fresh[@]}"; do
    for f in "${formats[@]}"; do
      hackmyresume build ./resume-fresh.json TO ${output_path}/resume-fresh-${t}.${f} -t ${t}
    done
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