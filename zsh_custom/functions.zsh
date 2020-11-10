# Loads `.env` file from a filename passed as an argument
loadenv() {
  while read line; do
    if [ "${line:0:1}" = '#' ]; then
      continue  # comments are ignored
    fi
    export $line > /dev/null
  done < "$1"
  echo 'Loaded!'
}
if [[ -f "$HOME/.functions_local" ]]; then
  source "$HOME/.functions_local"
fi