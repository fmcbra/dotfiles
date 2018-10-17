##
# ~/.bashrc
##

# Keep track of the number of times this file has been sourced
[[ -z $_bashrc_sourced ]] && _bashrc_sourced=0
((_bashrc_sourced += 1))

## {{{ Check to see if running interactively
case "$-" in
  *i*)
    # Interactive; do nothing
    ;;
  *)
    # Non-interactive; return immediately
    return
    ;;
esac
## }}}

# Execute "uname -a" on first invokation
clear
echo >&2 -e "$(uname -a)\n"

# Source additional .bashrc_* files
for _bashrc_file_path in "$HOME"/.bashrc_*
do
  _bashrc_file="$(basename "$_bashrc_file_path")"

  # Source .bashrc_local last
  [[ $_bashrc_file == .bashrc_local ]] && continue

  # Make sure $_bashrc_file_path exists
  [[ -f $_bashrc_file_path ]] || continue

  echo >&2 "... Sourcing ${_bashrc_file_path/$HOME/\~}"
  source "$_bashrc_file_path"
done

# Source ~/.bashrc_local if it exists
if [[ -f ~/.bashrc_local ]]
then
  echo >&2 "... Sourcing ~/.bashrc_local"
  source ~/.bashrc_local
fi

# Handle $SCREEN_CHDIR as set in .screenrc
if [[ -n $SCREEN_CHDIR ]]
then
  cd "$SCREEN_CHDIR"
  unset SCREEN_CHDIR
else
  # Change to $HOME directory on first invokation
  [[ $_bashrc_sourced -eq 1 ]] && cd "$HOME"
fi

##
# vim: ts=2 sw=2 et fdm=marker :
##
