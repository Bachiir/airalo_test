**Airalo API and UI Testing**
This repository includes automated testing for the Airalo Partner API and the Airalo website using Robot Framework. The tests will cover UI Testing as well as API Testing.

Project Description

**UI Testing**: The UI tests will automate searching for eSIMs and validating the details on the Airalo website.  
**API Testing**: These tests will ensure the functionality of the Airalo Partner API, including obtaining an OAuth2 token, making an eSIM order and getting eSIM data. 

Files:
**ui_test.robot**: This file contains a Robot Framework test case automating UI actions on the Airalo website.

**api_test.robot**: This file contains the Robot Framework test cases for interacting with the Airalo Partner API.

**requirements.txt**: This file contains the required dependencies for the tests to run.
command line to execute requirements.txt : **pip install -r requirements.txt**

Prerequisites:
You will need the following installed prior to executing the tests:

Python Version 3.x

pip (package manager for Python)

**Robot execution :**
To run a Robot Framework test, use the following command lines:
For ui_tests.robot: **robot -d results_ui_tests ./ui_tests.robot**
For api_tests.robot: **robot -d results_api_tests ./api_tests.robot**

Note : The -d option specifies the directory where output files (log.html, report.html, output.xml) will be saved.
