# What Is This?
The purpose of this document is to outline the procedure by which **achievement** is to be facilitated. This document is intended to be a detailed
protocol charged with the responsibility of guiding
the user---from the inception to the fulillment of 
each of their **goals**. To realize their goals, the
reader must have a detailed specification in accordance 
with wich they are to perform necessary **tasks**
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
Use the **handwritten medium** to probe your unconscious mind for one's larger purpose. Use standard English, along with alternative modalities of brainstorming.

# Objective Conception
Use the [project document template](templates/project.md) to document your objectives.

# Plan Development
Use the [project document template](templates/project.md) to develop your plans.

# Instruction Construction
According to each project document's specification, use
a **calendar application** to consolidate your executable tasks. This often entails a weekly calendar entry session,
but there is a lot of variety permitted by project specifications.

# Obligatory Advertisement
Use the **reminder system** included in the [project document template](templates/project.md) to keep your instructions
on your mind. Use the calendar application to your advantage. Routine processes should be constructed to
meet the user's needs.

# Execution
Simply execute as specified in the current file `README.md`. This includes the routine processes of the next section
and individual instructions documented in each of your project documents (located at `projects/**/*.md`).

# Routine Processes
The following actions are to be performed at the specified
intervals independent of any individual project:

1. Every Saturday, ensure that the coming week's necessary
actions are inserted into the calendar application. Review the entire week's inbox.
2. Every morning, ensure that the coming day's necessary actions are inserted into the calendar. Review the calendar.
3. Maintain a list of **auxilliary routine actions**. 
Include these in the calendar application. 

## Auxilliary Routine Actions
1. Awake, take medication: 7:00
2. Exercise, hygiene protocol 1: 7:30-9:00
3. Journal: 9:00-9:40
4. Review the **inbox**: 9:40-10:00
5. Read articles on infosec: 18:00-19:00 
6. Hygiene protocol 2: 
7. Power off electronics: 20:00
8. Read in bed, fall asleep: 21:00-

# Directory and Document Structure 
The root project system is to have the following general structure:
```
.
|-- README.md
|-- README.pdf
|-- inbox
|   `-- archive
|-- projects
|   |-- aesthetics
|   |-- archive
|   `-- hacking
|-- resources
|   |-- archive
|   |-- index.md
|   |-- index.pdf
|   |-- mathematics
|   |-- productivity
|   `-- programming
|-- templates
|   |-- capture.md
|   |-- capture.pdf
|   |-- inbox.md
|   |-- inbox.pdf
|   |-- project-doc.md
|   `-- project-doc.pdf
`-- topics
    |-- archive
    |-- cybersecurity
    |-- language
    |-- math
    `-- misc
```
At the root level, we have this document, `README.md`. Below this, we have directories for the inbox, projects,
resources, templates, and topics. The templates directory is for storing a variety of markdown templates used
for inbox entries, project documents, and writing notes.

We require that each inbox entry be named according to the format `inbox-YYYYMMDD.md` and structured according to the [inbox template file](templates/inbox.md).

We require that the
resources directory contain an `index.md` file to catalog each of the directory's child directories that
are not used solely for organizational purposes. For example, the `programming` subdirectory does not contain
an `index.md` file, while the `programming/python` subdirectory does. All index files should adhere to the
format outlined in the [resource index template](templates/index.md)
We do not impose any template restrictions on files within the `projects` or `topics` directories.

Files in the `topics` directory are to be thought of as raw and unrefined. Provided that a note is worthwhile,
one may wish to improve it and **promote** it to a **resource**. A note is deemed a resource once it is sufficiently
refined and proven to be useful. One may want to typeset such a note in LaTeX instead of in Markdown.

## A Note on Physical Media
Sometimes we may prefer, or need, to write something out by hand rather than type it. Such physical documents
should be stored in a **binder**. Physical inbox entries should be stored in the `admin` binder, alongside
**physical credentials**. Each such document shall be dated, page numbered, and discarded following review.

Each note entry should be stored in an appropriately named `topic` binder, which will have a corresponding
directory within the `topics` directory. Each note entry should be page numbered; however, as with digital
entries, have no further global restrictions. Each note entry should be scanned into its corresponding directory in pdf format.

Physical resource entries do not exist, but physical resources do. Each such physical resource shall be
catalogued like digital resources.

Physical project entries do not exist. However, supporting material such as brainstorms or plans should be scanned
and stored accordingly.




# External Tools
The following are the programs that are essential to implementing this protocol:

- `remind`: calendar application
- `pandoc`: markdown compiler
- `pdflatex`: LaTeX compiler
- `gpg`: security suite 
- `mutt`: mail user agent
- `vim`: text editor
- `pass`: password manager
- `syncthing`: cloud server




