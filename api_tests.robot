*** Settings ***
Library           RequestsLibrary
Library           Collections
Resource          variables.robot


*** Test Cases ***
Get Access Token
    [Documentation]    Obtain OAuth2 token from Airalo API using client_credentials
    Create Session     airalo    ${TOKEN_URL}    verify=False
    ${payload}=    Create Dictionary    client_id=${CLIENT_ID}    client_secret=${CLIENT_SECRET}    grant_type=client_credentials
    ${headers}=    Create Dictionary    Accept=application/json
    ${response}=    POST On Session    airalo    url=/    data=${payload}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    ${response_json}=     To Json    ${response.content}
    Should Contain    ${response_json['meta']['message']}    success
    Set Suite Variable    ${ACCESS_TOKEN}    ${response_json['data']['access_token']}
Submit Order
    [Documentation]    Submit an order using valid token
    ${headers}=    Create Dictionary
    ...    Accept=application/json
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ${data}=    Create Dictionary
    ...    quantity=${QUANTITY}
    ...    package_id=${PACKAGE_ID}
    ${response}=    POST On Session    airalo    ${ORDER_URL}    data=${data}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To JSON    ${response.content}
    Log    ${json}

Get eSIM List and Verify
    [Documentation]    Ensure the list contains 6 eSIMs, and that all of them have the "merhaba-7days-1gb" package slug.

    ${headers}=    Create Dictionary
    ...             Accept=application/json
    ...             Authorization=Bearer ${ACCESS_TOKEN}

    # Construct URL with pagination and limit set to 6
    ${url}=        Set Variable    ${eSIM_URL}?limit=6&page=1

    # Send GET request
    ${response}=   Get Request
    ...             airalo
    ...             ${url}
    ...             headers=${headers}

    Should Be Equal As Integers    ${response.status_code}    200

    ${json}=       To JSON    ${response.content}

    # Log the full response for debugging
    Log To Console    Full Response:\n${json}

    # Extract eSIMs from response
    ${esims}=      Get From Dictionary    ${json}    data
    log     ${esims}      console=yes
    # Ensure the list contains exactly 6 eSIMs
    Length Should Be    ${esims}    6

    # Check each eSIM's package_slug
    FOR    ${esim}    IN    @{esims}
        ${keys}=     Get Dictionary Keys    ${esim}
        log     ${keys}     console=yes
        Log To Console    eSIM keys:\n${keys}

        # Check if the eSIM contains the package_slug key
        Run Keyword If    'package_slug' in ${keys}
        ...    ${slug}=    Get From Dictionary    ${esim}    package_slug
        ...    Should Be Equal    ${slug}    ${PACKAGE_ID}
    END
