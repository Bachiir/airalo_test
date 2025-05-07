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

**Introduction of Our Test Cases**
This project leverages Robot Framework to create API and UI test cases to verify Airalo's partner API functionality and website attributes.

**API Test Cases**

**Get Access Token:**
   -  We authenticate using OAuth2 client credentials to retrieve a bearer token required for further API calls.

**Submit Order:**
   -  We simulate the purchase of 6 eSIMs with a package slug by posting to the order endpoint with a valid token.
 
**Get eSIM List and Verifies:**
   -  We retrieve the eSIM list from the account and check:

There are exactly 6 eSIMs returned.

Each eSIM has the expected package_slug "merhaba-7days-1gb".

These tests ensure the API is operating correctly, and the data is consistent.

**UI Test Case**
Search and Verify Japan eSIM:
We use SeleniumLibrary to help automate the following steps:

Open the Airalo website.

Type "Japa" into the search bar and select "Japan".

Click the data pack and verify the country name, data volume, duration, and price.
