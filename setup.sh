#!/bin/bash

# Defaults
templatesdir='templates'
inboxdir='inbox'
projectsdir='projects'
resourcesdir='resources'
notesdir='notes'
archivedir='archive'
scheduledir='schedule'


# Project initialization function
function newproj () {
    read -p 'Project name: ' projname
    mkdir -p "${projectsdir}/${projname}/assets"
    cp "${templatesdir}/project.md" "${projectsdir}/${projname}"
    touch "${projectsdir}/${projname}/${projname}.rem" 
    ln -s "${INIT_ROOT}/${projectsdir}/${projname}/${projname}.rem" "${INIT_ROOT}/schedule/${projname}.rem"
    printf '[+] Project successfully initialized\n'
}


# Function for first use
function startup () {
    # Set up directory structure
    export INIT_ROOT="$(realpath $1)"
    [ -d "$INIT_ROOT" ] || mkdir "$INIT_ROOT"
    printf "[-] Initializing directory structure at $INIT_ROOT\n"
    mkdir $INIT_ROOT/templates
    mkdir $INIT_ROOT/inbox
    mkdir $INIT_ROOT/projects
    mkdir $INIT_ROOT/archive $INIT_ROOT/archive/inbox $INIT_ROOT/archive/projects $INIT_ROOT/archive/resources $INIT_ROOT/archive/notes $INIT_ROOT/archive/templates $INIT_ROOT/archive/schedule
    mkdir $INIT_ROOT/resources
    mkdir $INIT_ROOT/notes
    mkdir $INIT_ROOT/schedule
    read -p "Would you like to synchronize your $INIT_ROOT/notes directory with an existing git repository (Y/N)?" ans
    if [ "$ans" = 'Y' ]; then
	read -p "Remote: " remote
        # Configure notes directory, synchronize with remote repository
        git clone "$remote" "$INIT_ROOT/$notesdir"
    fi
    printf "[-] Linking subdirectory archives to ${INIT_ROOT}/${archivedir}\n"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${templatesdir}" "${INIT_ROOT}/${templatesdir}/archive"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${notesdir}" "${INIT_ROOT}/${notesdir}/archive"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${projectsdir}" "${INIT_ROOT}/${projectsdir}/archive"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${inboxdir}" "${INIT_ROOT}/${inboxdir}/archive"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${resourcesdir}" "${INIT_ROOT}/${resourcesdir}/archive"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${scheduledir}" "${INIT_ROOT}/${scheduledir}/archive"
    printf "[-] Copying $PWD/base/templates/ into ${INIT_ROOT}/${templatesdir}\n"
    cp "$PWD/base/templates/"* "${INIT_ROOT}/${templatesdir}"
    cp "$PWD/base/README.md" "$INIT_ROOT"
    printf "[+] Init root successfully intialized at $INIT_ROOT\n"
    
}

# Dependecy check
DEPS=(
    'remind'
    'pandoc'
    'pdflatex'
    'neomutt'
    'vim'
    'pass'
    'syncthing'
    'git'
    'gpg'
    )
for i in "${DEPS[@]}"; do
    command -v "$i" > /dev/null 2>&1 || { echo "Dependency $i not met" >&2; exit 1; }
done

# Usage check
if [ "$#" -lt 2 ]; then
    printf 'Insufficient arguments supplied\n'
    printf 'For help, use the -h flag\n'
fi


while getopts "hi:p" opt; do
    case $opt in
        h)
	    printf 'This is your personal init system\n'
            printf 'Usage: setup.sh [OPTION...]\n'
	    ;;
	p)   
	    printf 'Ensure that you are in your init root directory before proceeding\n'
	    read -p "Are you in your init root directory (Y/N)?" ans
	    if [ "$ans" = 'Y' ]; then 
	        newproj
	    else
		printf "You answered: $ans\n"
	        printf 'Cannot initialize project outside of init root\n'
		exit 1
	    fi
	    ;;
	i) 
	    startup "$OPTARG"
	    ;;
    esac
done

shift $((OPTIND-1)) # Shift positional parameters
