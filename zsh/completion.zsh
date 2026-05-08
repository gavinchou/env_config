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

_opencode() {
  local -a subcommands
  subcommands=(
    'completion:Generate shell completion script'
    'acp:Start ACP (Agent Client Protocol) server'
    'mcp:Manage MCP (Model Context Protocol) servers'
    'attach:Attach to a running opencode server'
    'run:Run opencode with a message'
    'debug:Debugging and troubleshooting tools'
    'providers:Manage AI providers and credentials'
    'agent:Manage agents'
    'upgrade:Upgrade opencode to the latest or a specific version'
    'uninstall:Uninstall opencode and remove all related files'
    'serve:Start a headless opencode server'
    'web:Start opencode server and open web interface'
    'models:List all available models'
    'stats:Show token usage and cost statistics'
    'export:Export session data as JSON'
    'import:Import session data from JSON file or URL'
    'github:Manage GitHub agent'
    'pr:Fetch and checkout a GitHub PR branch, then run opencode'
    'session:Manage sessions'
    'db:Database tools'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--port[Port to listen on]:port:" \
    "--hostname[Hostname to listen on]:hostname:" \
    "--mdns[Enable mDNS service discovery]" \
    "--mdns-domain[Custom domain name for mDNS service]:domain:" \
    "*--cors[Additional domains to allow for CORS]:domains:" \
    "(-c --continue)"{-c,--continue}"[Continue the last session]" \
    "(-s --session)"{-s,--session}"[Session id to continue]:session:" \
    "--fork[Fork the session when continuing]" \
    "--prompt[Prompt to use]:prompt:" \
    "--agent[Agent to use]:agent:" \
    "(-m --model)"{-m,--model}"[Model to use in format provider/model]:model:->model_provider:" \
    "--dangerous[allow all commmand permissions]" \
    "--dir[change cwd before running]:dir:_directories" \
    "*:: :->subcommand_or_args" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    model_provider)
      # compadd "$@" bailian/glm-5 bailian/qwen3.5-plus bailian/kimi-2.5 bailian/MiniMax-M2.5
      conf_json="$HOME/.config/opencode/opencode.json"
      compadd "$@" $(ls ${conf_json} > /dev/null 2>&1 && sed 's|^\s*//.*||g' ${conf_json} | jq -r '.provider | to_entries[] | .key as $provider | .value.models | keys[] | "\($provider)/\(.)"')
      ;;
    subcommand_or_args)
      if (( CURRENT >= 3 )) && [[ -n "${words[2]}" ]]; then
        case "${words[2]}" in
          mcp)
            _opencode_mcp
            ;;
          providers)
            _opencode_providers
            ;;
          agent)
            _opencode_agent
            ;;
          session)
            _opencode_session
            ;;
          debug)
            _opencode_debug
            ;;
          github)
            _opencode_github
            ;;
          db)
            _opencode_db
            ;;
          run)
            _opencode_run
            ;;
          attach)
            _opencode_attach
            ;;
          upgrade)
            _opencode_upgrade
            ;;
          stats)
            _opencode_stats
            ;;
          uninstall)
            _opencode_uninstall
            ;;
          models)
            _opencode_models
            ;;
          export)
            _opencode_export
            ;;
          import)
            _opencode_import
            ;;
          pr)
            _opencode_pr
            ;;
          serve|web|acp)
            _opencode_server
            ;;
          *)
            _describe 'command' subcommands
            ;;
        esac
      else
        _describe 'command' subcommands
      fi
      ;;
  esac
}

_opencode_mcp() {
  local -a subcommands
  subcommands=(
    'add:Add an MCP server'
    'list:List MCP servers and their status'
    'auth:Authenticate with an OAuth-enabled MCP server'
    'logout:Remove OAuth credentials for an MCP server'
    'debug:Debug OAuth connection for an MCP server'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    subcommand)
      _describe 'command' subcommands
      ;;
  esac
}

_opencode_providers() {
  local -a subcommands
  subcommands=(
    'list:List providers and credentials'
    'login:Log in to a provider'
    'logout:Log out from a configured provider'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    subcommand)
      _describe 'command' subcommands
      ;;
  esac
}

_opencode_agent() {
  local -a subcommands
  subcommands=(
    'create:Create a new agent'
    'list:List all available agents'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    subcommand)
      _describe 'command' subcommands
      ;;
  esac
}

_opencode_session() {
  local -a subcommands
  subcommands=(
    'list:List sessions'
    'delete:Delete a session'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    subcommand)
      _describe 'command' subcommands
      ;;
  esac
}

_opencode_debug() {
  local -a subcommands
  subcommands=(
    'config:Show resolved configuration'
    'lsp:LSP debugging utilities'
    'rg:Ripgrep debugging utilities'
    'file:File system debugging utilities'
    'scrap:List all known projects'
    'skill:List all available skills'
    'snapshot:Snapshot debugging utilities'
    'agent:Show agent configuration details'
    'paths:Show global paths'
    'wait:Wait indefinitely for debugging'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    subcommand)
      if (( CURRENT >= 4 )) && [[ "${words[2]}" == "debug" && -n "${words[3]}" ]]; then
        case "${words[3]}" in
          lsp)
            local -a lsp_commands
            lsp_commands=(
              'diagnostics:Get diagnostics for a file'
              'symbols:Search workspace symbols'
              'document-symbols:Get symbols from a document'
            )
            _describe 'lsp command' lsp_commands
            ;;
          *)
            _describe 'command' subcommands
            ;;
        esac
      else
        _describe 'command' subcommands
      fi
      ;;
  esac
}

_opencode_github() {
  local -a subcommands
  subcommands=(
    'install:Install the GitHub agent'
    'run:Run the GitHub agent'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    subcommand)
      _describe 'command' subcommands
      ;;
  esac
}

_opencode_db() {
  local -a subcommands
  subcommands=(
    'path:Print the database path'
    'migrate:Migrate JSON data to SQLite'
  )

  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--format[Output format]:format:->format" \
    "*:: :->subcommand" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    format)
      compadd "$@" json tsv
      ;;
    subcommand)
      _describe 'command' subcommands
      ;;
  esac
}

_opencode_run() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--command[The command to run]:command:" \
    "(-c --continue)"{-c,--continue}"[Continue the last session]" \
    "(-s --session)"{-s,--session}"[Session id to continue]:session:" \
    "--fork[Fork the session before continuing]" \
    "--share[Share the session]" \
    "(-m --model)"{-m,--model}"[Model to use]:model:" \
    "--agent[Agent to use]:agent:" \
    "--format[Output format]:format:->format" \
    "(-f --file)"{-f,--file}"[File(s) to attach to message]:file:_files" \
    "--title[Title for the session]:title:" \
    "--attach[Attach to a running opencode server]:url:" \
    "(-p --password)"{-p,--password}"[Basic auth password]:password:" \
    "--dir[Directory to run in]:dir:_directories" \
    "--port[Port for the local server]:port:" \
    "--variant[Model variant]:variant:" \
    "--thinking[Show thinking blocks]" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    format)
      compadd "$@" default json
      ;;
  esac
}

_opencode_attach() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--dir[Directory to run in]:dir:_directories" \
    "(-c --continue)"{-c,--continue}"[Continue the last session]" \
    "(-s --session)"{-s,--session}"[Session id to continue]:session:" \
    "--fork[Fork the session when continuing]" \
    "(-p --password)"{-p,--password}"[Basic auth password]:password:" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_upgrade() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "(-m --method)"{-m,--method}"[Installation method]:method:->method" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
    method)
      compadd "$@" curl npm pnpm bun brew choco scoop
      ;;
  esac
}

_opencode_stats() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--days[Show stats for the last N days]:days:" \
    "--tools[Number of tools to show]:tools:" \
    "--models[Show model statistics]:models:" \
    "--project[Filter by project]:project:" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_uninstall() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "(-c --keep-config)"{-c,--keep-config}"[Keep configuration files]" \
    "(-d --keep-data)"{-d,--keep-data}"[Keep session data and snapshots]" \
    "--dry-run[Show what would be removed without removing]" \
    "(-f --force)"{-f,--force}"[Skip confirmation prompts]" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_models() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--verbose[Use more verbose model output]" \
    "--refresh[Refresh the models cache from models.dev]" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_export() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_import() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "1:file:_files" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_pr() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "1:number:" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

_opencode_server() {
  _arguments -C -s \
    "(-h --help)"{-h,--help}"[Show help]" \
    "(-v --version)"{-v,--version}"[Show version number]" \
    "--print-logs[Print logs to stderr]" \
    "--log-level[Log level]:level:->log_level" \
    "--port[Port to listen on]:port:" \
    "--hostname[Hostname to listen on]:hostname:" \
    "--mdns[Enable mDNS service discovery]" \
    "--mdns-domain[Custom domain name for mDNS service]:domain:" \
    "*--cors[Additional domains to allow for CORS]:domains:" \
    && return 0

  case $state in
    log_level)
      compadd "$@" DEBUG INFO WARN ERROR
      ;;
  esac
}

compdef _opencode opencode
compdef _opencode oc

_oc_list() {
    local -a cmds subcmds
    cmds=(list prompts help)
    if (( CURRENT == 2 )); then
        _describe -t commands 'command' cmds
        return
    fi
    case "$words[2]" in
        list)
            _arguments \
                '-n+[Limit number of sessions]:number' \
                '--limit=[Limit number of sessions]:number' \
                '(-h --help)'{-h,--help}'[Show help]'
            ;;
        prompts)
            if (( CURRENT == 3 )); then
                local -a sessions
                sessions=("${(@f)$(sqlite3 ~/.local/share/opencode/opencode.db "SELECT id || ':' || datetime(time_updated/1000,'unixepoch','localtime') || ' ' || title FROM session WHERE parent_id IS NULL OR parent_id = '' OR title NOT LIKE '%(@%subagent)' ORDER BY time_updated DESC LIMIT 50;")}")
                _describe -t sessions 'session' sessions
            else
                _arguments \
                    '-n+[Show last N prompts]:number' \
                    '--last=[Show last N prompts]:number' \
                    '(-h --help)'{-h,--help}'[Show help]'
            fi
            ;;
        help)
            if (( CURRENT == 3 )); then
                _describe -t topics 'help topic' cmds
            fi
            ;;
    esac
}

compdef _oc_list oc_list

# vim: et ts=2 sw=2 tw=10086 ft=sh:
