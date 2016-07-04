# sha-test

Create an archive of every version of a file to have every been committed to a subdirectory.

## Directories

`files/` directory keeps up to date copy of a file.
`archive/` directory will contain list of directories, each the sha of a version of a file, with the contents (retaining directory structure) of that commit inside.

## Considerations

If a file doesn't exist in `files/` directory then it won't get archived. This allows a way to unpublish files from the `archive/` directory. It should be simple enough to step back through all commits and discover historical files though.

## Usage

    # ./archive.sh <source> <archive>

Like so:


    $ ./archive.sh files archive

    [step 1. clean down archive]

    archive/3057a82976e9220d275f4a55f2b8ff5bfc42b19f/js/jquery.js
    archive/3057a82976e9220d275f4a55f2b8ff5bfc42b19f/js
    archive/3057a82976e9220d275f4a55f2b8ff5bfc42b19f
    archive/319d45f8b34ca0bfdc7070ef56f5193b3c5b16d7/js/jquery.js
    archive/319d45f8b34ca0bfdc7070ef56f5193b3c5b16d7/js
    archive/319d45f8b34ca0bfdc7070ef56f5193b3c5b16d7
    archive/5668dcca8cad1e23f1f3f34855f7793e6c8c9750/css/spectre.css
    archive/5668dcca8cad1e23f1f3f34855f7793e6c8c9750/css
    archive/5668dcca8cad1e23f1f3f34855f7793e6c8c9750
    archive/7f885ee675cfda5a2dcf5a7ac6ff0a1b36ad9ae8/css/spectre.css
    archive/7f885ee675cfda5a2dcf5a7ac6ff0a1b36ad9ae8/css
    archive/7f885ee675cfda5a2dcf5a7ac6ff0a1b36ad9ae8
    archive/8bcd7d009b5fe0a11139b8c501a07dbf1c7f462d/js/jquery-migrate.js
    archive/8bcd7d009b5fe0a11139b8c501a07dbf1c7f462d/js
    archive/8bcd7d009b5fe0a11139b8c501a07dbf1c7f462d
    archive/ad146a540bf2f84ba62ef76d4db8d18dbd8c2360/js/jquery.js
    archive/ad146a540bf2f84ba62ef76d4db8d18dbd8c2360/js
    archive/ad146a540bf2f84ba62ef76d4db8d18dbd8c2360

    [step 2. create archive of every file since ever]

    [files/css/spectre.css]
    archive/5668dcca8cad1e23f1f3f34855f7793e6c8c9750//css/spectre.css created
    archive/7f885ee675cfda5a2dcf5a7ac6ff0a1b36ad9ae8//css/spectre.css created

    [files/js/jquery-migrate.js]
    archive/8bcd7d009b5fe0a11139b8c501a07dbf1c7f462d//js/jquery-migrate.js created

    [files/js/jquery.js]
    archive/ad146a540bf2f84ba62ef76d4db8d18dbd8c2360//js/jquery.js created
    archive/319d45f8b34ca0bfdc7070ef56f5193b3c5b16d7//js/jquery.js created
    archive/3057a82976e9220d275f4a55f2b8ff5bfc42b19f//js/jquery.js created
