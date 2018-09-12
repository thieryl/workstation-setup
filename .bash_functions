function search (){
 egrep -roiI $1 . | sort | uniq
}

# Creates a pull request on GitHub for the currently checked out branch
function pr () {
  if ["$1" == ""]
  then
      echo "Please provide the name of the branch to create a pull request against."
  else
      local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
      local branch=`git name-rev --name-only HEAD`
      echo "... creating pull request for branch \"$branch\" in \"$repo\""
      open https://github.com/$repo/compare/$1...$branch
  fi
}


# Delete a given line number in the known_hosts file.
function knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    echo "error: line number missing" >&2;
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}

function gsync() {
  if [[ ! "$1" ]] ; then
      echo "You must supply a branch."
      return 0
  fi

  BRANCHES=$(git branch --list $1)
  if [ ! "$BRANCHES" ] ; then
     echo "Branch $1 does not exist."
     return 0
  fi

  git checkout "$1" && \
  git pull upstream "$1" && \
  git push origin "$1"
}

genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=16
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

pwg() {
    ENTROPY=${1:-10} # in bytes
    # strip possible newlines if output is wrapped and trailing = signs as they add nothing to the password's entropy
    head -c $ENTROPY /dev/random | base64 | tr -d '\n='
    echo
}

json2yaml() {
  # contentvert json files to yaml using python and PyYAML
  python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' <"$1"
}

yaml2json() {
  # convert yaml files to json using python and PyYAML
  python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' <"$1"
}

httpStatus() {
  # -----------------------------------
  # Shamelessly taken from: https://gist.github.com/rsvp/1171304
  #
  # Usage:  httpStatus URL [timeout] [--code or --status] [see 4.]
  #                                             ^message with code (default)
  #                                     ^code (numeric only)
  #                           ^in secs (default: 3)
  #                   ^URL without "http://" prefix works fine.
  #
  #  4. curl options: e.g. use -L to follow redirects.
  #
  #  Dependencies: curl
  #
  #         Example:  $ httpStatus bit.ly
  #                   301 Redirection: Moved Permanently
  #
  #         Example: $ httpStatus www.google.com 100 -c
  #                  200
  #
  # -----------------------------------
  local curlops
  local arg4
  local arg5
  local arg6
  local arg7
  local flag
  local timeout
  local url

  saveIFS=${IFS}
  IFS=$' \n\t'

  url=${1}
  timeout=${2:-'3'}
  #            ^in seconds
  flag=${3:-'--status'}
  #    curl options, e.g. -L to follow redirects
  arg4=${4:-''}
  arg5=${5:-''}
  arg6=${6:-''}
  arg7=${7:-''}
  curlops="${arg4} ${arg5} ${arg6} ${arg7}"

  #      __________ get the CODE which is numeric:
  code=$(echo "$(curl --write-out %{http_code} --silent --connect-timeout ${timeout} \
    --no-keepalive ${curlops} --output /dev/null ${url})")

  #      __________ get the STATUS (from code) which is human interpretable:
  case $code in
    000) status="Not responding within ${timeout} seconds" ;;
    100) status="Informational: Continue" ;;
    101) status="Informational: Switching Protocols" ;;
    200) status="Successful: OK within ${timeout} seconds" ;;
    201) status="Successful: Created" ;;
    202) status="Successful: Accepted" ;;
    203) status="Successful: Non-Authoritative Information" ;;
    204) status="Successful: No Content" ;;
    205) status="Successful: Reset Content" ;;
    206) status="Successful: Partial Content" ;;
    300) status="Redirection: Multiple Choices" ;;
    301) status="Redirection: Moved Permanently" ;;
    302) status="Redirection: Found residing temporarily under different URI" ;;
    303) status="Redirection: See Other" ;;
    304) status="Redirection: Not Modified" ;;
    305) status="Redirection: Use Proxy" ;;
    306) status="Redirection: status not defined" ;;
    307) status="Redirection: Temporary Redirect" ;;
    400) status="Client Error: Bad Request" ;;
    401) status="Client Error: Unauthorized" ;;
    402) status="Client Error: Payment Required" ;;
    403) status="Client Error: Forbidden" ;;
    404) status="Client Error: Not Found" ;;
    405) status="Client Error: Method Not Allowed" ;;
    406) status="Client Error: Not Acceptable" ;;
    407) status="Client Error: Proxy Authentication Required" ;;
    408) status="Client Error: Request Timeout within ${timeout} seconds" ;;
    409) status="Client Error: Conflict" ;;
    410) status="Client Error: Gone" ;;
    411) status="Client Error: Length Required" ;;
    412) status="Client Error: Precondition Failed" ;;
    413) status="Client Error: Request Entity Too Large" ;;
    414) status="Client Error: Request-URI Too Long" ;;
    415) status="Client Error: Unsupported Media Type" ;;
    416) status="Client Error: Requested Range Not Satisfiable" ;;
    417) status="Client Error: Expectation Failed" ;;
    500) status="Server Error: Internal Server Error" ;;
    501) status="Server Error: Not Implemented" ;;
    502) status="Server Error: Bad Gateway" ;;
    503) status="Server Error: Service Unavailable" ;;
    504) status="Server Error: Gateway Timeout within ${timeout} seconds" ;;
    505) status="Server Error: HTTP Version Not Supported" ;;
    *) echo " !!  httpstatus: status not defined." && safeExit ;;
  esac

  # _______________ MAIN
  case ${flag} in
    --status) echo "${code} ${status}" ;;
    -s) echo "${code} ${status}" ;;
    --code) echo "${code}" ;;
    -c) echo "${code}" ;;
    *) echo " !!  httpstatus: bad flag" && safeExit ;;
  esac

  IFS="${saveIFS}"
}

#get database details from Magento local.xml file
function get_info() {
    FILE=$1
    # the given XML is in file.xml
    MYSQL_HOST="$(echo "cat /config/global/resources/default_setup/connection/host/text()" | xmllint --nocdata --shell ${FILE} | sed '1d;$d')"
    MYSQL_USER="$(echo "cat /config/global/resources/default_setup/connection/username/text()" | xmllint --nocdata --shell ${FILE}| sed '1d;$d')"
    MYSQL_PASS="$(echo "cat /config/global/resources/default_setup/connection/password/text()" | xmllint --nocdata --shell ${FILE}| sed '1d;$d')"
    MYSQL_DB="$(echo "cat /config/global/resources/default_setup/connection/dbname/text()" | xmllint --nocdata --shell ${FILE}| sed '1d;$d')"
    printf '%s\n' "host: $MYSQL_HOST" "username: $MYSQL_USER" "password: $MYSQL_PASS" "dbname: $MYSQL_DB"
}

# extract archive_file destination [option1 [option2]]
extract() {
	echo "Extracting \"$1\"..."
	if [[ "$1" == *.tar.gz ]]; then
		command="tar -xzf \"$1\" -C \"$2\""
	elif [[ "$1" == *.tar.xz ]];then
		command="tar -xJf \"$1\" -C \"$2\""
	elif [[ "$1" == *.tar.bz2 ]];then
		command="tar -xjf \"$1\" -C \"$2\""
	elif [[ "$1" == *.tar ]];then
		command="tar -xf \"$1\" -C \"$2\""
	elif [[ "$1" == *.zip ]]; then
		command="unzip -q \"$1\" -d \"$2\""
	else
		disp "${red}Unsupported archive type for $1"
		return 10
	fi
	if [ $# -eq 3 ]; then
		eval $command $3 # Custom options
	elif [ $# -eq 4 ]; then
		eval $command $3 $4 # Custom options
	else
		eval $command
	fi
}

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

prj() {
    A=$1
    cd "/home/$USER/Projects/${A^^}"
}

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

function vs_ci() {
    echo "updating code-insiders..."
    cd ${HOME}/tmp
    wget https://go.microsoft.com/fwlink/?LinkID=760866 -O code-insiders.rpm
    sudo rpm -Uivh code-insiders.rpm
    echo "Cleaning up"
    rm -f code-insiders.rpm
    cd -
}

function ci() {
    if [ $# -eq 0 ]; then
        code-insiders .
    else
        code-insiders "$@"
    fi
}

function vsc() {
    if [ $# -eq 0 ]; then
        code .
    else
        code "$@"
    fi
}

# setup flask project 
function cf_env() {
	if [ $# -eq 0 ]; then 
		touch ${PWD}/.env ${PWD}/.env.leave
		echo "Creating a Python3 Virtual environment"
		pipenv --three
		echo "source .venv/bin/activate" >.env
		echo "deactivate" >.env.leave
	else 
		touch ${PWD}/.env ${PWD}/.env.leave
		echo "Creating a Python Virtual environment"
		pipenv --two
		echo "source .venv/bin/activate" >.env
		echo "deactivate" >.env.leave
	fi
		

}

# Download Oracle Jdk Version 
function jdk_dload() {
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; \
	oraclelicense=accept-securebackup-cookie" \
	"http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz"
}

