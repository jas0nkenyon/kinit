# What Is This?
*Feel free to modify this document to fit your own personal needs. This document is meant to serve as a high-level outline of your workflow*.
The purpose of this document is to outline the procedure by which **achievement** is to be facilitated. This document is intended to be a detailed
protocol charged with the responsibility of guiding
the user---from the inception to the fulillment of 
each of their **goals**. To realize their goals, the
reader must have a detailed specification in accordance 
with which they are to perform necessary **tasks**
such as 

1. carrying out regular **introspection**,
2. using the findings from 1. to **devise** a set of objectives,
3. developing, for each objective from 2., a **plan of action**,
4. constructing, from the plans in 3., a set of
**executable** instructions,
5. ensuring that the instructions from 4. enter
and remain in the user's conscious awareness, 
6. and, per the awareness from 5., executing their instructions.

Items 1. through 4. may be viewed as write operations, item 5., a read operation, and 6., an execute operation. In what follows, we specify the procedures
by which the items above shall be performed.

# Introspection
Use the [project document template](templates/project.md) to perform project-based introspection, and use the
[inbox entry template](templates/inbox.md) to perform general introspection.

# Objective Conception
Use the [project document template](templates/project.md) to document your objectives.

# Plan Development
Use the [project document template](templates/project.md) to develop your plans.

# Instruction Construction
For each `project.md` file, specify its executable instructions in the associated `.rem` file.

# Obligatory Advertisement
Use the **reminder system** included in the [project document template](templates/project.md) to keep your instructions
on your mind. Routine processes should be constructed to facilitate **meta-planning** and general administrative tasks.
Specify these tasks in `schedule/routine.rem`.

# Execution
Simply perform each of the tasks listed in the output of `remind schedule`. 

# Directory and Document Structure 
The `kinit` system has the following general structure
```
.
|-- archive
|   |-- inbox
|   |-- notes
|   |-- projects
|   |-- resources
|   |-- schedule
|   `-- templates
|-- inbox
|   `-- archive -> /home/user/test/archive/inbox
|-- notes
|   |-- archive -> /home/user/test/archive/notes
|   `-- foo
|       `-- bar
|           `-- 2025-01-19-note.md
|-- projects
|   |-- archive -> /home/user/test/archive/projects
|   `-- project
|       |-- assets
|       |-- project.md
|       `-- project.rem
|-- README.md
|-- resources
|   |-- archive -> /home/user/test/archive/resources
|   |-- index.md
|   `-- programming
|       `-- C
|           `-- index.md
|-- schedule
|   |-- archive -> /home/user/test/archive/schedule
|   |-- project.rem -> /home/user/test/projects/project/project.rem
|   `-- routine.rem
`-- templates
    |-- archive -> /home/user/test/archive/templates
    |-- capture.md
    |-- inbox.md
    |-- index.md
    |-- project.md
    `-- refs.bib
```
At the root level, we have this document, `README.md`. Below this, we have directories for the inbox, projects,
resources, templates, and topics. The templates directory is for storing a variety of templates and other multi-purpose documents
such as bibliography files used
for inbox entries, project documents, and writing notes.

We require that each inbox entry be named according to the format `inbox-YYYYMMDD.md` and structured according to the [inbox template file](templates/inbox.md).

We require that the
resources directory contain an `index.md` file to catalog each of the directory's child directories that
are not used solely for organizational purposes. For example, the `programming` subdirectory does not contain
an `index.md` file, while the `programming/C` subdirectory does. All index files should adhere to the
format outlined in the [resource index template](templates/index.md)
We do not impose any template restrictions on files within the `projects/**/assets` or `notes` directories.

Files in the `notes` directory are to be thought of as raw and unrefined. Provided that a note is worthwhile,
one may wish to improve it and **promote** it to a **resource**. A note is deemed a resource once it is sufficiently
refined and proven to be useful. One may want to typeset such a note in LaTeX instead of in Markdown.

## A Note on Physical Media
Sometimes we may prefer, or need, to write something out by hand rather than at the keyboard. Such physical documents
should be stored in a binder or folder labeled with its respective note or project title. Physical inbox entries, or other miscellaneous notes,
should be stored in a dedicated binder or folder. Each such miscellaneous document should be dated, page numbered, and discarde
following review (and or transcription/scanning if desired).

# External Tools
The following are the programs that are essential to implementing this protocol:

- `remind`: calendar application
- `pandoc`: markdown compiler
- `pdflatex`: LaTeX compiler
- `vim`: text editor
- `syncthing`: file server
