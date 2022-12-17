## @brief  selfdefined completion for zsh
## @author zhoufei
## @email  gavineaglechou@gmail.com
## @date   2022-12-17-Sat

_feishu() {
_arguments -C -s \
  "*:user:->user" \
  "-v[start a videochat]:chat type:->videochat" \
  "--videochat[start a videochat]:chat type:->videochat" \
  && return 0

case "$state" in
#     videochat) _arguments -C -s $(awk '{if ($0=="name_to_id=\"") p=1; if (p) { if ($0=="\"") exit; print $0}}' /Users/gavin/bin/feishu | \grep , | awk -F= '{gsub(",", "\n", $1);print $1}')
  videochat) compadd "$@" $(awk '{if ($0=="name_to_id=\"") p=1; if (p) { if ($0=="\"") exit; print $0}}' /Users/gavin/bin/feishu | awk -F= '{gsub(",", "\n", $1);print $1}')
  ;;
  user) compadd "$@" $(awk '{if ($0=="name_to_id=\"") p=1; if (p) { if ($0=="\"") exit; print $0}}' /Users/gavin/bin/feishu | awk -F= '{gsub(",", "\n", $1);print $1}')
  ;;
  *) compadd "$@" ""
  ;;
esac
}
compdef _feishu fs
compdef _feishu feishu.sh
compdef _feishu feishu

# vim: et ts=2 sw=2 tw=10086 ft=sh:
