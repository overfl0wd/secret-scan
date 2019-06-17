# secret-scan
This is a small wrapper for Gittyleaks to add recursiveness and better output control.

I wrote this because I had a need to scan multiple Git repositories w/ Gittyleaks. This script will iterate through the target directory, assuming each nested directory is a Git repo, and run GL on them. The output will then be written to the output directory, with the following format: <b>\<output dir>/\<scanned repo>_secrets.txt
  
 If you couldn't tell, it requires [Gittyleaks](https://github.com/kootenpv/gittyleaks) to be installed.

## Usage 
#### ./secretScan.sh \<target directory> \<output directory>

- ./secretScan.sh /repositories /repositories/secrets 
<br />

### Assumed Directory Structure
>-> repositories/ <br />
----> repo1 <br />
----> repo2 <br />
----> repo3
 <br />

### Example Output Structure
#### With command arguments: ./secretScan.sh /repositories /repositories/secrets
>-> repositories/ <br />
----> repo1 <br />
----> repo2 <br />
----> repo3 <br />
<b>----> secrets/ <br />
-------> repo1_secrets.txt <br />
-------> repo2_secrets.txt <br />
-------> repo3_secrets.txt <br />
