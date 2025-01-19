# Kinit
Init is a command-line-centric knowledge management and productivity system.

## Description
There is an overwhelmingly large number of applications designed for note taking and project management. This is yet another
such application. What distinguishes Kinit from other similar projects is its firm adherence to the unix philosophy; Kinit
is meant for users who prefer extensibility and simplicity over pretty UIs. 

## Getting Started

### Dependencies

- A GNU/Linux Distribution
- A command-line text editor 
- Git
- Pandoc
- Remind
- File synchronization solution (not strictly necessary, but highly encouraged. Syncthing is an excellent alternative to proprietary services)


### Installing

1. Clone the repository
    ```
    git clone https://github.com/jas0nkenyon/kinit
    ```
2. Change directories
    ```
    cd kinit
    ```
3. Initialize kinit in the desired location (This will create a configuration file `$HOME/.kinitrc`. You may modify this if you prefer an alternate location.)
    ```
    ./kinit.sh -i PATH/TO/ROOT
    ```

### Executing program
- To create a new project, use the `-p` flag 
    ```
    kinit.sh -p
    ```
- To create a new note, use the `-n` flag
    ```
    kinit.sh -n
    ```
- To list the tags that you have used in your notes, use the `-t` flag
    ```
    kinit -t
    ```

## Help
If you see an error like `Dependency FOO is not met`, one of
the dependencies is not in your `$PATH` or not installed. To fix this, ensure that you have installed all
the dependencies listed previously; if the issue persists, append the directory in which the program is stored to your path with the following command

```
export "PATH=$PATH:/PATH/TO/PROGDIR" 
```

If you encounter any other errors, feel free to contact me or create an issue; however, I can not guarantee that
I will respond swiftly. If this project happens to be of interest of others, some generous community members may
assist you.

## Authors
[Jason Kenyon](https://jason-kenyon.com)

## Version History

- 0.1
    - Initial Release

## License

This project is licensed under the GPLv3 License - see the LICENSE file for details.

## Acknowledgments
- [remind](https://dianne.skoll.ca/projects/remind/)
- [markdown](https://daringfireball.net/projects/markdown/)
