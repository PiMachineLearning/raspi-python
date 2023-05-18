curl https://www.python.org/ftp/python/ 2>/dev/null | grep -oP '\d+\.\d+\.\d+' | grep -v '2.' | xargs ./main.sh
