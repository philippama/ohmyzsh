function update_location {
# In Mac OS X, what network location is set?
    if [ -f "/usr/sbin/scselect" ]; then
        export LOCATION=$(/usr/sbin/scselect 2>&1 | perl -ne 'if (m/^\s+\*\s+(\S+)\s+\((.+)\)$/) { print "$2\n"; }')
    fi
}

export GRADLE_HOME=~/Applications/gradle-1.12
export GRADLE_OPTS=-Dorg.gradle.daemon=true

# export IDEA_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home/

#export M2_HOME=/usr/local/Cellar/maven/3.2.5/libexec
#export M2=$M2_home/bin
#export MAVEN_OPTS="-Xmx1024m -Xms512m -XX:MaxPermSize=512m"
export MAVEN_OPTS="-Xmx1024m -Xms512m"

export SCALA_HOME=$HOME/Applications/scala-2.11.7

#export HADOOP_HOME=/usr/local/Cellar/hadoop/2.7.2
#export PATH=$PATH:$HADOOP_HOME/bin
#export HADOOP_CONF_DIR=$HADOOP_HOME/conf
#export HADOOP_USER_NAME=spark

#export SPARK_HOME=/usr/local/Cellar/apache-spark/1.6.0
#export SPARK_HOME=/Users/philippa.main/Applications/spark-1.5.0-bin-hadoop2.6
#export SPARK_HOME=/Users/philippa.main/Applications/spark-1.6.2-bin-hadoop2.6
#export SPARK_DIST_CLASSPATH=`$HADOOP_HOME/bin/hadoop classpath`

export KAFKA_HOME=/usr/local/Cellar/kafka/2.2.0

#export GATLING_HOME=/Users/philippa.main/Applications/gatling-charts-highcharts-bundle-2.2.5

function set_path {
    PATH=/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:$GRADLE_HOME/bin:~/bin
    PATH=$PATH:$JAVA_HOME/bin
    PATH=$PATH:$M2
    PATH=$PATH:$SCALA_HOME/bin
    PATH=$PATH:~/.local/bin

    # Initialise Groovy for the current JDK - NB sets node version
    #export GROOVY_HOME=/usr/local/opt/groovy/libexec
    export GVM_INIT=
    [[ -s "/Users/philippa.main/.gvm/bin/gvm-init.sh" ]] && source "/Users/philippa.main/.gvm/bin/gvm-init.sh"
    export PATH
}
set_path

# Set node version
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# JAVA SETUP FUNCTIONS
function jdk {
    if [ -n "$1" ] && [ "$1" -gt "8" ]; then
        export JAVA_HOME=`/usr/libexec/java_home -v $1*`
    else
        export JAVA_HOME=`/usr/libexec/java_home -v 1.$1*`
    fi
    set_path
    echo "Using Java $1 $JAVA_HOME"
}

jdk 8

# function runPortal {
#     local MODE=${1:-local}
#     echo -e "Press \033[1;7;32m RETURN \033[0m (or wait 5 seconds) to run Portal in \033[1;7;91m--> $MODE <--\033[0m mode (can be local, dev or qa)..."
#     read -t 5
#     jdk 7
#     export MAVEN_OPTS="-Xmx1G -XX:MaxPermSize=512m"
#     mvn clean install -DskipTests -P$MODE
#     local EXIT_CODE=$?
#     if [[ $EXIT_CODE -ne 0 ]]; then
#         echo "Failed"
#         return $EXIT_CODE
#     fi
#     pushd portal-webapp
#     mvn jetty:run
#     popd
# }

function server {
    if [ "$#" -ne 1 ]
    then
        PORT=8000
    else
        PORT=$1
    fi
    open "http://localhost:${1}" && python -m SimpleHTTPServer $1
}

# function dwqLogs {
#     echo Parameters: [ENV]live*/qa/dev [DC]1/2 [TYPE]DWQuery-console/dw-query/dw-query_perf/dw-query-requests
#     local ENV=${1:-live}
#     local DC=${2:-dc?}
#     local TYPE=${3:-DWQuery-console}
#     echo -e "\033[1;7;32m Scanning ${ENV} ${DC} for ${TYPE} logs... \033[0m ..."
#     ssh -t philippa-ma@livelog002.live.dc2.tradermedia.net "tail -f /logs/${ENV}_${DC}_*/*/autotrader/DWQuery/${TYPE}.log"
# }

# function odsLogs {
#     echo Parameters: [ENV]live*/qa/dev [DC]1/2 [TYPE]query*/consumer/consumer_perf/webapp/webapp_perf/webapp_user_data/query/query_perf
#     local ENV=${1:-live}
#     local DC=${2:-dc?}
#     local TYPE=${3:-query}
#     echo -e "\033[1;7;32m Scanning ${ENV} ${DC} for ${TYPE} logs... \033[0m ..."
#     # ssh -t philippa-ma@livelog002.live.dc2.tradermedia.net "tail -f /logs/${ENV}_${DC}_*/*/jetty_logs/ods_${TYPE}.log"
#     ssh -t philippa-ma@livelog002.live.dc2.tradermedia.net "tail -f /logs/${ENV}_${DC}_*/*/autotrader/ods*/ods_${TYPE}.log"
# }

function awslogin {
   if [ "$#" -ne 1 ]
    then
        echo Usage: awslogin environment
        echo where environment is one of dev, nonprod or prod
    else
        unset AWS_PROFILE
        echo philippa.main@autotrader.co.uk
        aws-azure-login --mode gui
        export AWS_PROFILE=$1
        echo To test access, try: aws s3 ls
    fi
}

# Aliases
alias sqlgen='cd ~/Applications/SQLSCRIPTGENERATOR && nohup ./SQLScriptGenerator.sh &'
alias ods='cd ~/workspace/operational-data-store-2 && jdk 8'
# Aliases for docker
alias dclean='docker system prune -a'
# Aliases for docker-compose
alias dcb='docker-compose build'
alias dcd='docker-compose down -v'
alias dcu='docker-compose up'
alias dcdu='docker-compose down -v && docker-compose up'
alias dcbu='docker-compose build && docker-compose down -v && docker-compose up'
# Aliases for Kubernetes
alias k=kubectl

# Git prompt and auto-complete
. ~/.git_svn_bash_prompt.sh
. ~/.git-completion.bash
. ~/.git-shortcuts.sh

# Kubernetes CLI auto-complete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Ruby for emr-aws-spec
#rbenv global 2.1.1
#rbenv init -

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

export PATH=~/.npm-global/bin:$PATH # Must have /.npm-global/bin first


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/philippa.main/google-cloud-sdk/path.bash.inc' ]; then source '/Users/philippa.main/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/philippa.main/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/philippa.main/google-cloud-sdk/completion.bash.inc'; fi

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
