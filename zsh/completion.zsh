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
compdef _feishu lk
compdef _feishu lark

_claude() {
  local -a subcommands
  subcommands=(
    'doctor:Check the health of Claude Code auto-updater'
    'install:Install Claude Code native build'
    'mcp:Configure and manage MCP servers'
    'plugin:Manage Claude Code plugins'
    'setup-token:Set up a long-lived authentication token'
    'update:Check for updates and install if available'
    'upgrade:Check for updates and install if available'
  )

  local -a models
  models=(
    'sonnet:Latest Sonnet model'
    'opus:Latest Opus model'
    'haiku:Latest Haiku model'
  )

  local -a permission_modes
  permission_modes=(
    'acceptEdits:Automatically accept edit operations'
    'bypassPermissions:Bypass all permission checks'
    'default:Default permission behavior'
    'delegate:Delegate permission decisions'
    'dontAsk:Never ask for permissions'
    'plan:Use plan mode for permissions'
  )

  local -a output_formats
  output_formats=(
    'text:Plain text output'
    'json:Single JSON result'
    'stream-json:Realtime streaming JSON'
  )

  local -a input_formats
  input_formats=(
    'text:Plain text input'
    'stream-json:Realtime streaming input'
  )

  local -a setting_sources
  setting_sources=(
    'user:User settings'
    'project:Project settings'
    'local:Local settings'
  )

  _arguments -C -s \
    "-m[Select model provider]:model:->model_provider" \
    "(-h --help)"{-h,--help}"[Display help for command]" \
    "(-v --version)"{-v,--version}"[Output the version number]" \
    "(-c --continue)"{-c,--continue}"[Continue the most recent conversation]" \
    "(-p --print)"{-p,--print}"[Print response and exit]" \
    "(-r --resume)"{-r,--resume}"[Resume a conversation]" \
    "(-d --debug)"{-d,--debug}"[Enable debug mode]:filter:" \
    "*--add-dir[Additional directories to allow tool access to]:directories:_directories" \
    "--agent[Agent for the current session]:agent:" \
    "--agents[JSON object defining custom agents]:json:" \
    "--allow-dangerously-skip-permissions[Enable bypassing all permission checks as an option]" \
    "*--allowed-tools[Comma or space-separated list of tool names to allow]:tools:" \
    "*--allowedTools[Comma or space-separated list of tool names to allow]:tools:" \
    "--append-system-prompt[Append a system prompt to the default system prompt]:prompt:" \
    "*--betas[Beta headers to include in API requests]:betas:" \
    "(--no-chrome)--chrome[Enable Claude in Chrome integration]" \
    "--dangerously-skip-permissions[Bypass all permission checks]" \
    "--debug-file[Write debug logs to a specific file path]:path:_files" \
    "--disable-slash-commands[Disable all skills]" \
    "*--disallowed-tools[Comma or space-separated list of tool names to deny]:tools:" \
    "*--disallowedTools[Comma or space-separated list of tool names to deny]:tools:" \
    "--fallback-model[Enable automatic fallback to specified model]:model:->model" \
    "*--file[File resources to download at startup]:specs:" \
    "--fork-session[Create a new session ID instead of reusing the original]" \
    "--from-pr[Resume a session linked to a PR]:value:" \
    "--ide[Automatically connect to IDE on startup if exactly one valid IDE is available]" \
    "--include-partial-messages[Include partial message chunks as they arrive]" \
    "--input-format[Input format]:format:->input_format" \
    "--json-schema[JSON Schema for structured output validation]:schema:" \
    "--max-budget-usd[Maximum dollar amount to spend on API calls]:amount:" \
    "*--mcp-config[Load MCP servers from JSON files or strings]:configs:" \
    "--mcp-debug[DEPRECATED. Use --debug instead. Enable MCP debug mode]" \
    "--model[Model for the current session]:model:->model" \
    "(--chrome)--no-chrome[Disable Claude in Chrome integration]" \
    "--no-session-persistence[Disable session persistence]" \
    "--output-format[Output format]:format:->output_format" \
    "--permission-mode[Permission mode]:mode:->permission_mode" \
    "*--plugin-dir[Load plugins from directories]:paths:_directories" \
    "--replay-user-messages[Re-emit user messages from stdin back on stdout]" \
    "--session-id[Use a specific session ID for the conversation]:uuid:" \
    "--setting-sources[Comma-separated list of setting sources to load]:sources:->setting_source" \
    "--settings[Path to a settings JSON file or JSON string]:file-or-json:_files" \
    "--strict-mcp-config[Only use MCP servers from --mcp-config]" \
    "--system-prompt[System prompt to use for the session]:prompt:" \
    "*--tools[Specify the list of available tools from the built-in set]:tools:" \
    "--verbose[Override verbose mode setting from config]" \
    "*:: :->subcommand_or_args" \
    && return 0

  case $state in
    model_provider)
      compadd "$@" glm qwen kimi minimax ds deepseek claude
      ;;
    model)
      compadd "$@" sonnet opus haiku
      ;;
    input_format)
      compadd "$@" text stream-json
      ;;
    output_format)
      compadd "$@" text json stream-json
      ;;
    permission_mode)
      compadd "$@" acceptEdits bypassPermissions default delegate dontAsk plan
      ;;
    setting_source)
      compadd "$@" user project local
      ;;
    subcommand_or_args)
      _describe 'command' subcommands
      ;;
  esac
}
compdef _claude claude


# vim: et ts=2 sw=2 tw=10086 ft=sh:
