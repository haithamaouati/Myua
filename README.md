# Myua
**Myua** — What's my User-Agent (UA)

```
  __  __                         
 |  \/  |  _   _   _   _    __ _ 
 | |\/| | | | | | | | | |  / _` |
 | |  | | | |_| | | |_| | | (_| |
 |_|  |_|  \__, |  \__,_|  \__,_|
           |___/                 
```

## Install

To use the Myua script, follow these steps:

1. Clone the repository:

    ```
    git clone https://github.com/haithamaouati/Myua.git
    ```

2. Change to the Myua directory:

    ```
    cd Myua
    ```
    
3. Change the file modes
    ```
    chmod +x myua.sh
    ```
    
5. Run the script:

    ```
    ./myua.sh
    ```

## Usage
Usage: `./myua.sh -u <USER_AGENT>`

##### Options:

`-u`, `--ua`     Provide the User-Agent string to parse

`-h`, `--help`    Show this help message

## Dependencies

The script requires the following dependencies:

- [figlet](http://www.figlet.org/): `pkg install figlet - y`
- [curl](https://curl.se/): `pkg install curl - y`
- [jq](https://jqlang.org/): `pkg install jq -y`

Make sure to install these dependencies before running the script.

## Author

Made with :coffee: by **Haitham Aouati**
  - GitHub: [github.com/haithamaouati](https://github.com/haithamaouati)

## License

Myua is licensed under [Unlicense license](LICENSE)
