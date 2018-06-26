scriptname=${BASH_SOURCE%/*}
if [[ ! -d "$scriptname" ]]
then
  scriptname=$(dirname $0)
fi

. $scriptname ./0

