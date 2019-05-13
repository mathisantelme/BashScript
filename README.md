# **Bash Scripts**

## **Description**

A repository used to collect and store all of my utilitary bash scripts

---
## **Installation**

To install any of the scripts used in this repository, you just need to download the script you'd like and run it. If you want to use it as a command, you shall place it in **/usr/bin**.

---

## **Scripts**

- [Update File](#update-file)
- 

### **Update File**

#### *Description*

This script is used to append the content of a source file to a destination file if the content of the source file isn't already present in the destination file.

#### *Configuration*

To configure this script you just need to change the file paths in the script it self.

| Variable                  | Use                                       | Line number |
|:-:                        |:-:                                        |:-:          |
| DEFAULT_DESTINATION_FILE  | The default path of the destination file  | 6           |
| DEFAULT_SOURCE_FILE       | The default path of the source file       | 7           |

#### *Usage*

To use this, just call the script as follows:

```bash
./main.sh
```

**Note:**<br>
This script can be used in a debian package preinst script to complete configuration files.

---