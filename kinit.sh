#!/bin/bash

# Copyright (C) 2025 Jason Kenyon
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
# 

# Defaults: these variables are used in the `startup` function to initialize. `$HOME/.kinitrc` is where additional settings are stored,
# most notable of which is the `INIT_ROOT` directory. Feel free to modify these in your `.kinitrc` as it is sourced whenever it exists.
templatesdir='templates'
inboxdir='inbox'
projectsdir='projects'
resourcesdir='resources'
notesdir='notes'
archivedir='archive'
scheduledir='schedule'
config="$HOME/.kinitrc"


[ -f "$HOME/.kinitrc" ] && source "$HOME/.kinitrc"

# Function for creating a new note
function newnote () {
    read -p 'Enter title (alphanumeric or `-` character only): ' title
    read -p "Enter a category (any directory relative to ${INIT_ROOT}/${notesdir}): " category
    [ -f "${INIT_ROOT}/${notesdir}/${category}/$(date '+%Y-%m-%d')-${title}.md" ] && { printf 'Error: A note with the same title and category already exists\n'; exit 1; }
    read -p 'Enter tags (space-separated string of lowercase words, leave empty for none): ' tags
    read -p "Enter template (any file within ${INIT_ROOT}/${templatesdir}, leave empty for none): " template
    read -p "Enter bibliography file (any bib file within ${INIT_ROOT}/${templatesdir}, leave empty for none): " bib
    printf "[-] Creating new note $title\n"
    [ -d "$category" ] || mkdir -p "${INIT_ROOT}/${notesdir}/${category}"
    printf -- '---\n' >> "${INIT_ROOT}/${notesdir}/${category}/$(date '+%Y-%m-%d')-${title}.md"
    printf "title: $title\ndate: $(date '+%Y-%m-%d')\ncategory: $category\ntags: $tags\ntemplate: $template\nbibliography: ${INIT_ROOT}/${templatesdir}/${bib}\n" >> "${INIT_ROOT}/${notesdir}/${category}/$(date '+%Y-%m-%d')-${title}.md"
    printf -- '---' >> "${INIT_ROOT}/${notesdir}/${category}/$(date '+%Y-%m-%d')-${title}.md"
    printf "[+] New note ${title} created\n"
}





# Project initialization function
function newproj () {
    read -p 'Project name: ' projname
    [ -d "${INIT_ROOT}/${projectsdir}/${projname}" ] && { printf 'Error: project with that name already exists\n'; exit 1; }
    mkdir -p "${INIT_ROOT}/${projectsdir}/${projname}/assets"
    cp "${INIT_ROOT}/${templatesdir}/project.md" "${INIT_ROOT}/${projectsdir}/${projname}"
    touch "${INIT_ROOT}/${projectsdir}/${projname}/${projname}.rem" 
    ln -s "${INIT_ROOT}/${projectsdir}/${projname}/${projname}.rem" "${INIT_ROOT}/schedule/${projname}.rem"
    printf '[+] Project successfully initialized\n'
}


# Function for first use
function startup () {
    # Set up directory structure
    [ ! -z "$INIT_ROOT" ] && { printf "Error: Your current init root is $INIT_ROOT\nIf you proceed, YOU WILL OVERWRITE YOUR FILES\n"; exit 1; }
    [ -z "$INIT_ROOT" ] && echo "export INIT_ROOT=$(realpath $1)" >> "$HOME/.kinitrc" && source "$HOME/.kinitrc"
    [ -d "$INIT_ROOT" ] || mkdir "$INIT_ROOT"
    printf "[-] Initializing directory structure at $INIT_ROOT\n"
    mkdir "${INIT_ROOT}/${templatesdir}"
    mkdir "${INIT_ROOT}/${inboxdir}"
    mkdir "${INIT_ROOT}/${projectsdir}"
    mkdir "${INIT_ROOT}/${archivedir}" 
    mkdir "${INIT_ROOT}/${archivedir}/${inboxdir}"
    mkdir "${INIT_ROOT}/${archivedir}/${projectsdir}" 
    mkdir "${INIT_ROOT}/${archivedir}/${resourcesdir}" 
    mkdir "${INIT_ROOT}/${archivedir}/${notesdir}" 
    mkdir "${INIT_ROOT}/${archivedir}/${templatesdir}" 
    mkdir "${INIT_ROOT}/${archivedir}/${scheduledir}"
    mkdir "${INIT_ROOT}/${resourcesdir}"
    mkdir "${INIT_ROOT}/${notesdir}"
    mkdir "${INIT_ROOT}/${scheduledir}"

    read -p "Would you like to synchronize your ${INIT_ROOT}/${notesdir} directory with an existing git repository (Y/N)?" ans
    if [ "$ans" = 'Y' ]; then
	read -p "Remote: " remote
        # Configure notes directory, synchronize with remote repository
        git clone "$remote" "$INIT_ROOT/$notesdir"
    fi
    printf "[-] Linking subdirectory archives to ${INIT_ROOT}/${archivedir}\n"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${templatesdir}" "${INIT_ROOT}/${templatesdir}/${archivedir}"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${notesdir}" "${INIT_ROOT}/${notesdir}/${archivedir}"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${projectsdir}" "${INIT_ROOT}/${projectsdir}/${archivedir}"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${inboxdir}" "${INIT_ROOT}/${inboxdir}/${archivedir}"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${resourcesdir}" "${INIT_ROOT}/${resourcesdir}/${archivedir}"
    ln -s "$(realpath $INIT_ROOT)/${archivedir}/${scheduledir}" "${INIT_ROOT}/${scheduledir}/${archivedir}"
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
    'vim'
    'syncthing'
    'git'
    'python'
    )
for i in "${DEPS[@]}"; do
    command -v "$i" > /dev/null 2>&1 || { echo "Dependency $i not met" >&2; exit 1; }
done

# Usage check
# if [ "$#" -lt 2 ]; then
#     printf 'Insufficient arguments supplied\n'
#     printf 'For help, use the -h flag\n'
# fi


while getopts "hi:pntc" opt; do
    case $opt in
        h)
	    printf 'This is your personal init system\n'
            printf 'Usage: setup.sh [OPTION...]\n'
	    ;;
	p)   
	    newproj
	    ;;
	n) 
	    newnote
	    ;;
	i) 
	    printf 'Ensure that you are in the project root directory before proceeding (the directory to which you cloned the repo)\n'
	    read -p "Are you in the project root directory (Y/N)?" ans
	    if [ "$ans" = 'Y' ]; then 
	        startup "$OPTARG"
	    else
		printf "You answered: $ans\n"
	        printf 'Cannot initialize outside of project root\n'
		exit 1
	    fi
	    ;;
	t)
	    printf 'Your existing tags are:\n'
	    grep -I -rh -E 'tags:' "${INIT_ROOT}/${notesdir}" | cut -d ' ' -f 2- | sed 's/ /\n/g' | sort -u
	    ;;
	c) 
	   printf 'Your existing categories are:\n'
	   grep -I -rh -E 'category:' "${INIT_ROOT}/${notesdir}" | cut -d ' ' -f 2- | sed 's/ /\n/g' | sort -u
	   ;;
	\?)
	    printf 'Unrecognized option\n'
	    ;;
    esac
done

shift $((OPTIND-1)) # Shift positional parameters
