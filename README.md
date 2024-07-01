# Microsoft Fabric - Python Utilities
## Overview

This repository contains a collection of utility functions packaged as a Python wheel. It provides a centralized way to share and distribute these utilities across different environments such as development, staging, and production - this repo has in the moment only implementation for single environment setup.

![fabric_utilities_flow](/img/fabric_utilities.svg)

## Deployment process
The deployment is made as a Azure DevOps Pipeline (.yml). The proposed process:

* Pip install requirements
* Run python tests
* Build python wheel
* Copy the wheel to OneLake


## Benefits

**Centralized Utilities Repository**

* Maintains consistency across projects.
* Reduces duplication of code.
* Simplifies updates and maintenance.
* Enhances discoverability of utilities for developers.

**Sharing Utility Functions**
* Promotes collaboration across teams.
* Ensures best practices are shared and implemented.
* Saves time by reducing the need to redevelop common functionalities.
* Standardizes approaches to common tasks.

**Distributing a Python Wheel**

* Simplifies distribution and installation with pip.
* Facilitates version control and dependency management.
* Streamlines updates to utility functions.
* Enhances manageability of utility functions across environments.


## Setup and Pre-requirements
*I recommend doing this the IaC way!*
### Prerequisites

**Assign Service Principal as Contributor**
   - Ensure the deploying service principal is assigned as a “contributor” to the workspace. This can be done through the “Manage access” section. For more information, visit [Microsoft Fabric - Manage Access](https://learn.microsoft.com/en-us/fabric/get-started/give-access-workspaces).


### Installation of this repo

1. **Install Required Packages**

    ```bash
    pip install -r requirements.txt
    ```

2. **Install Development Packages**

    ```bash
    pip install -r requirements_dev.txt
    ```

## Installation in Microsoft Fabric

**Install the Utilities Wheel in Fabric Notebook**

```python
%pip install --force-reinstall /lakehouse/default/Files/PythonUtilities/fabricutilities-1.0-py3-none-any.whl

# Restart
mssparkutils.session.restartPython()

# Verify Installation
%pip show fabricutilities

# Import the library
from company.utilites import dummy_function

```

## Tools and notes

**Using AzCopy for Uploading Wheel**

Use AzCopy to copy the wheel file into OneLake. Follow the instructions [here](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10).

**Fabric Python Inline Installation Guide**

Refer to the guide for inline installation of Python packages in Fabric notebooks: [Python Inline Installation](https://learn.microsoft.com/en-us/fabric/data-engineering/library-management#python-inline-installation).

**Default lakehouse** 

Ensure the utilities lakehouse is set as the default. Installing from a non-default lakehouse has not been successful.

## Current Isues

* The wheel needs to be located in the default workspace

* *probably a lot more.....* 


## Use your code and contribute

To set up a development environment, follow these steps:

1. **Clone the Repository**

    ```bash
    git clone https://github.com/LauJohansson/fabric-python-utilities.git
    cd <repository_name>
    ```

2. **Install Development Dependencies**

    ```bash
    pip install -r requirements_dev.txt
    ```

3. **Run Tests**

    Use `pytest` to run the test suite.

    ```bash
    pytest
    ```


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for review.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.


