*** Settings ***
Library    Browser

*** Variables ***
${URL}       http://localhost:8080/auth/login
${USERNAME}  haoran
${PASSWORD}  901113

*** Test Cases ***
Enter Username Password
    [Documentation]    Hello, this is a doucmentation.
    [Tags]    Login
    Given CVAT App is open
    Fill Text    id=credential    ${USERNAME}
    Fill Text    id=password     ${PASSWORD}
    Press Keys    id=password     Enter
    Get Text    .cvat-header-menu-user-dropdown-user    contains    haoran

Test Search Box
    [Documentation]    test search box
    [Tags]    Search
    Given CVAT App is open
    When Enter the CVAT
    And I Add A New search "123"
    Get Text    id=root    contains      No results matched your search...

Test Click Icon
    [Documentation]     test click icon
    [Tags]    Project
    Given CVAT App is open
    When Enter the CVAT
    Click    xpath=//a[span[text()='Tasks']]

*** Keywords ***
CVAT App is open
    New Page    ${URL}

Enter the CVAT
    Fill Text    id=credential    ${USERNAME}
    Fill Text    id=password     ${PASSWORD}
    Press Keys    id=password     Enter
    Wait For

I Add A New search "${search}"
    Fill Text    css=input[placeholder='Search ...']    ${search}
    Press Keys    css=input[placeholder='Search ...']    Enter