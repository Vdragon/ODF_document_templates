#!/usr/bin/env bash
# 上列為宣告執行 script 程式用的殼程式(shell)的 shebang
# Clean filter for SVG
# 林博仁 © 2016

######## File scope variable definitions ########
# Defensive Bash Programming - not-overridable primitive definitions
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
declare -r PROGRAM_FILENAME="$(basename "$0")"
declare -r PROGRAM_DIRECTORY="$(realpath --no-symlinks "$(dirname "$0")")"
declare -r PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
declare -r PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#

## Unofficial Bash Script Mode
## http://redsymbol.net/articles/unofficial-bash-strict-mode/
# 將未定義的變數的參考視為錯誤
set -u

# Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.  The shell does not exit if the command that fails is part of the command list immediately following a `while' or `until' keyword, part of the test in an `if' statement, part of any command executed in a `&&' or `||' list except the command following the final `&&' or `||', any command in a pipeline but the last, or if the command's return status is being inverted with `!'.  If a compound command other than a subshell returns a non-zero status because a command failed while `-e' was being ignored, the shell does not exit.  A trap on `ERR', if set, is executed before the shell exits.
set -e

# If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
set -o pipefail

######## File scope variable definitions ended ########

######## Included files ########

######## Included files ended ########

######## Program ########
# Defensive Bash Programming - main function, program entry point
# http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
main() {
	printf "Clean 過濾器：正在移除 SVG 非必要資訊與美化代碼……\n" 1>&2
	xmlstarlet edit --pf --ps --delete "/_:svg/@inkscape:export-filename | /_:svg/@inkscape:version | /_:svg/sodipodi:namedview/@inkscape:cx | /_:svg/sodipodi:namedview/@inkscape:cy | /_:svg/sodipodi:namedview/@inkscape:current-layer | /_:svg/sodipodi:namedview/@inkscape:zoom | /_:svg/sodipodi:namedview/@inkscape:snap-nodes | /_:svg/sodipodi:namedview/@inkscape:window-width | /_:svg/sodipodi:namedview/@inkscape:window-height" | \
		xmlstarlet format --indent-tab

	exit 0
}
main

