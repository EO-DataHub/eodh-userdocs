# Installing additional packages

To install additional packages in Python notebooks you can use pip. You can install packages globally using `pip install <package_name>`, however these installs will not persist across notebook restarts. If you wish to install a package persistently, you must install it to your user directory with `pip install --user <package_name>`.

!!! example

    If we were to install the `geopandas` package:
    
    ```bash
    pip install geopandas # will not persist
    pip install --user geopandas # will persist
    ```