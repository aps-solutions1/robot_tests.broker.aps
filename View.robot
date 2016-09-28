*** Settings ***
Resource          aps.robot    # Отримання інформації про ...

*** Keywords ***
Відображення бюджету оголошеного тендера
    ${return_value}=    Отримати текст із поля і показати на сторінці    id=edtTenderBudget

aps.Отримати інформацію із тендера
    [Arguments]    ${username}    ${field_name}
    [Documentation]    *SingleItemstendetr* \ \ \ - ${ARGUMENTS[0]} == username \ ${ARGUMENTS[1]} == fieldname \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ *below* \ ---- \ \ \ \ (${username} | ${tender_uaid} | ${field_name})
    Switch Browser    ${username}
    Run Keyword And Return    Отримати інформацію про ${field_name}

Отримати текст із поля і показати на сторінці
    [Arguments]    ${fieldname}
    sleep    1
    Wait Until Page Contains Element    ${locator.${fieldname}}    22
    ${return_value}=    Get Text    ${locator.${fieldname}}
    [Return]    ${return_value}

Отримати інформацію про title
    ${return_value}=    Отримати текст із поля і показати на сторінці    title
    ${return_value}=    Convert To String    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про description
    ${return_value}=    Отримати текст із поля і показати на сторінці    descriptions
    [Return]    ${return_value}

Отримати інформацію про value.amount
    ${return_value}=    Отримати текст із поля і показати на сторінці    value.amount
    ${return_value}=    Replace String    ${return_value}    ,    .
    ${return_value}=    Convert To Number    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про value.currency
    ${return_value}=    Отримати текст із поля і показати на сторінці    value.currency
    [Return]    ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded
    ${value}=    Отримати текст із поля і показати на сторінці    value.valueAddedTaxIncluded
    ${return_value}=    Run Keyword And Return If    'без ПДВ.' == '${value}'    Set Variable    ${False}
    ${return_value}=    Run Keyword And Return If    'з ПДВ.' == '${value}'    Set Variable    ${True}
    [Return]    ${return_value}

Отримати інформацію про tenderID
    ${return_value}=    Отримати текст із поля і показати на сторінці    tenderId
    [Return]    ${return_value}

Отримати інформацію про procuringEntity.name
    ${return_value}=    Отримати текст із поля і показати на сторінці    procuringEntity.name
    [Return]    ${return_value}

Отримати інформацію про enquiryPeriod.startDate
    ${return_value}=    Отримати текст із поля і показати на сторінці    enquiryPeriod.startDate
    ${return_value}=    aps_service.parse_date    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про enquiryPeriod.endDate
    ${return_value}=    Отримати текст із поля і показати на сторінці    enquiryPeriod.endDate
    ${return_value}=    aps_service.parse_date    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про tenderPeriod.startDate
    ${return_value}=    Отримати текст із поля і показати на сторінці    tenderPeriod.startDate
    ${return_value}=    aps_service.parse_date    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про tenderPeriod.endDate
    ${return_value}=    Отримати текст із поля і показати на сторінці    tenderPeriod.endDate
    ${return_value}=    aps_service.parse_date    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про minimalStep.amount
    ${return_value}=    Отримати текст із поля і показати на сторінці    minimalStep.amount
    ${return_value}=    Replace String    ${return_value}    ,    .
    ${return_value}=    Convert To Number    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryDate.endDate
    WaitClickXPATH    //div[@class="col-md-8 col-sm-8 col-xs-7"]
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryDate.endDate
    ${return_value}=    aps_service.parse_date    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryLocation.latitude
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryLocation.latitude
    ${return_value}=    Convert To Number    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryLocation.longitude
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryLocation.longitude
    ${return_value}=    Convert To Number    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryAddress.countryName
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryAddress.countryName
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryAddress.postalCode
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryAddress.postalCode
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryAddress.region
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryAddress.region
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryAddress.locality
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryAddress.locality
    [Return]    ${return_value}

Отримати інформацію про items[0].deliveryAddress.streetAddress
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].deliveryAddress.streetAddress
    [Return]    ${return_value}

Отримати інформацію про items[0].classification.scheme
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].classification.scheme
    ${return_value}=    Replace String    ${return_value}    021:2015:    CPV
    [Return]    ${return_value}

Отримати інформацію про items[0].classification.id
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].classification.id
    [Return]    ${return_value}

Отримати інформацію про items[0].classification.description
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].classification.description
    [Return]    ${return_value}

Отримати інформацію про items[0].additionalClassifications[0].scheme
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].additionalClassifications[0].scheme
    ${return_value}=    Replace String    ${return_value}    ДК 016:2010    ДКПП
    [Return]    ${return_value}

Отримати інформацію про items[0].additionalClassifications[0].id
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].additionalClassifications[0].id
    [Return]    ${return_value}

Отримати інформацію про items[0].additionalClassifications[0].description
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].additionalClassifications[0].description
    [Return]    ${return_value}

Отримати інформацію про items[0].unit.name
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].unit.name
    [Return]    ${return_value}

Отримати інформацію про items[0].unit.code
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].unit.code
    [Return]    ${return_value}

Отримати інформацію про items[0].quantity
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].quantity
    ${return_value}=    Convert To Integer    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про items[0].description
    [Arguments]    @{ARGUMENTS}
    ${return_value}=    Отримати текст із поля і показати на сторінці    items[0].description
    [Return]    ${return_value}

Отримати інформацію про questions[0].title
    [Arguments]    @{ARGUMENTS[0]}
    sleep    120
    Reload Page
    WaitClickXPATH    //a[@href="#questions"]
    ${return_value}=    Отримати текст із поля і показати на сторінці    questions[0].title
    [Return]    ${return_value}

Отримати інформацію про questions[0].description
    WaitClickCSS    div.panel-title > div.row > div.col-md-9
    ${return_value}=    Отримати текст із поля і показати на сторінці    questions[0].description
    [Return]    ${return_value}

Отримати інформацію про questions[0].date
    ${return_value}=    Отримати текст із поля і показати на сторінці    questions[0].date
    ${return_value}=    aps_service.parse_date    ${return_value}
    [Return]    ${return_value}

Отримати інформацію про questions[0].answer
    sleep    210
    Reload Page
    WaitClickXPATH    //a[@href="#questions"]
    WaitClickCSS    div.panel-title > div.row > div.col-md-9
    ${return_value}=    Отримати текст із поля і показати на сторінці    questions[0].answer
    [Return]    ${return_value}

aps.Отримати інформацію із предмету
    [Arguments]    ${username}    ${tender_uaid}    ${item_id}    ${field_name}
    Run Keyword If    '${field_name} == 'classification.scheme'    Click Element    xpath=.//*[@id='headingThree']/h4/div/div[2][contains(text(), '${item_id}')]
    ${item_value}=    Get Text    xpath=.//div[@id='headingThree']/h4/div/div[2][contains(text(), '${item_id}')]/../../../../..${locator.items.${field_name}}
    ###########################################################
    Run Keyword And Return If    '${field_name} == 'classification.scheme'    CPV(below)    ${item_value}
    Run Keyword And Return If    ${field_name} == 'additionalClassifications.description'    DKPP    ${item_value}
    Run Keyword And Return If    ${field_name} == 'deliveryDate'    deliveryDate    ${item_value}
    Run Keyword And Return If    ${field_name} == 'quantity'    itemquantity    ${item_value}
    [Return]    ${item_value}
