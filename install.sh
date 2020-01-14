#!/bin/bash -e
# shellcheck disable=1090,1117

#####################
#                   #
# Prepare log files #
#                   #
#####################
BASE_PATH=~/.dots
LOG_DST="${BASE_PATH}/install.log"
LOG_DST_STATUS="${BASE_PATH}/install-status.log"
mkdir -p $BASE_PATH
touch $LOG_DST
touch $LOG_DST_STATUS

#################
#               #
# Trapped files #
#               #
#################
G_CSV=$(mktemp)
trap '{ rm -rf $G_CSV ; }' SIGINT SIGTERM EXIT

# Consant
# =======
G_INSTALL_MANAGER_TYPES=(
    a
    f
    g
    gem
    m
    node
    pip
)
GOD_SHELL_NAME="$(logname) ALL=(ALL:ALL) NOPASSWD: ALL"

# Source script to source (¯\_(ツ)_/¯)
# ===================================
. ~/.scripts/sourceifexists

# Source BEGINS
# ======================
sourceIfExists ./config/{functions,managers,utils}/*.sh

__install() {
    local APPS_CSV INSTALL_MANAGER INSTALL_MANAGER_TYPE TYPE NAME STATE DESCRIPTION
    APPS_CSV=$1

    # Strip comments and empty lines
    sed -e '/^#/d' -e '/^$/d' "$APPS_CSV" >"$G_CSV"

    IFS=,
    while read -rs TYPE NAME STATE DESCRIPTION; do
        INSTALL_MANAGER_TYPE=$TYPE

        # Format `type` for loggin purposes
        [[ "$TYPE" ]] &&
            TYPE="- $TYPE -"

        # If the app is installed or turned off do nothing
        __is_installed $LOG_DST_STATUS "$NAME" "$TYPE" ||
            [[ "$STATE" == "off" ]] &&
            continue

        if [ -n "$INSTALL_MANAGER_TYPE" ] &&
            ! __includes \
            "${G_INSTALL_MANAGER_TYPES[*]}" \
            "$INSTALL_MANAGER_TYPE"
        then
            echo "✗ $NAME | Wrong installer type ( $INSTALL_MANAGER_TYPE )"
            continue
        fi

        case $INSTALL_MANAGER_TYPE in
        a) INSTALL_MANAGER=__aur ;;
        f) INSTALL_MANAGER=__function ;;
        m) INSTALL_MANAGER=__make_pkg ;;
        g) INSTALL_MANAGER=__go_pkg ;;
        "") INSTALL_MANAGER=__package_manager ;;
        gem) INSTALL_MANAGER=__gem ;;
        pip) INSTALL_MANAGER=__pip ;;
        node) INSTALL_MANAGER=__node ;;
        esac

        # Format `description` for reasons ¯\_(ツ)_/¯
        [[ "$DESCRIPTION" ]] &&
            DESCRIPTION="\n\t$DESCRIPTION"

        # Mapper's header (Log)
        echo -e ":: $NAME $TYPE ::$DESCRIPTION" | tee -a $LOG_DST

        # Execute
        $INSTALL_MANAGER "$NAME" | tee -a $LOG_DST 2>&1

        # Status (Log)
        echo -e "$TYPE :: $NAME :: ${PIPESTATUS[0]}\n" >>$LOG_DST_STATUS
    done <"$G_CSV"
}

__set_zsh() {
    local IS_ZSH PASS

    IS_ZSH=$(
        if [ "$(basename "$SHELL")" == "zsh" ]; then
            echo "true"
        fi
    )

    # terminate this function if you already have zsh or it is not installed
    if [ -n "$IS_ZSH" ] || ! command -v zsh &>/dev/null; then
        return 0
    fi

    chsh -s "$(grep "/zsh$" /etc/shells | tail -1)"
}

__become_god_shell() {
    sudo bash -c "echo \"$GOD_SHELL_NAME\" | (EDITOR=\"tee -a\" visudo)"
}

#########
#       #
# Begin #
#       #
#########

main() {
    local OS CSV_SUFFIX DEFAULT_APPS_FILES APPS_FILES APPS_FILE

    # This is to catch the password for later use if needed ;)
    __become_god_shell

    echo "[Installing]..."

    # mac related stuffs
    case "$(uname -s)" in
    [Dd]arwin)
        export OS="mac"
        export CSV_SUFFIX="-mac"
        ;;
    *) echo "" ;;
    esac

    DEFAULT_APPS_FILES=(
        "./config/apps-common.csv"
        "./config/apps${CSV_SUFFIX}.csv"
    )

    APPS_FILES=("${@:-${DEFAULT_APPS_FILES[*]}}")

    for APPS_FILE in ${APPS_FILES[*]}; do
        if ! [ -f "$APPS_FILE" ]; then
            echo "---> $APPS_FILE -- This file does not exists, just in case (˘_˘٥)"
            continue
        fi

        __install "$APPS_FILE"

        echo -e "\n$APPS_FILE -- Finished...\n\t(ﾉ^_^)ﾉ"
        echo
    done

    # this is needs to be here if you're using zsh
    __set_zsh
}

main "$@"
