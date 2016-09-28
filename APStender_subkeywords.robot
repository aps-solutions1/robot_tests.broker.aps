*** Settings ***
Library           Selenium2Library
Library           String
Library           DateTime
Library           Collections
Library           Screenshot
Resource          aps.robot
Library           aps_service.py

*** Keywords ***
Додати предмет
    [Arguments]    ${item}    ${lot_title}
    [Documentation]    ${ARGUMENTS[0]} == ${tender_data}
    ...    ${ARGUMENTS[1]} == ${INDEX}
    ...    ${ARGUMENTS[1]} ==${txt_title} \ \ \ (lots title)
    WaitClickID    AddPoss
    Wait Until Page Contains Element    id=AddItemButton    10
    \    #
    ${editItemDetails}=    Get From Dictionary    ${item}    description
    WaitInputID    editItemDetails    ${editItemDetails}
    Run Keyword And Ignore Error    Select From List By Label    id=lot_combo    ${lot_title}
    ${unit}=    Get From Dictionary    ${item}    unit
    ${tov}=    Get From Dictionary    ${unit}    code
    ${editItemQuantity}=    Get From Dictionary    ${item}    quantity
    WaitInputID    editItemQuantity    ${editItemQuantity}
    WaitClickXPATH    //button[@data-id="tov"]
    WaitInputID    input_tov    ${tov}
    Press Key    id=input_tov    \\\13
    #choise CPV
    ${cpv_id}=    Get From Dictionary    ${item.classification}    id
    ${dkpp_id}=    Get From Dictionary    ${item.additionalClassifications[0]}    id
    WaitClickID    button_add_cpv
    WaitInputID    cpv_search    ${cpv_id}
    Press Key    id=cpv_search    \\\13
    WaitClickID    populate_cpv
    #choise DKPP
    Wait Until Element Is Enabled    id=button_add_dkpp
    WaitClickID    button_add_dkpp
    WaitInputID    dkpp_search    ${dkpp_id}
    Press Key    id=dkpp_search    \\\13
    WaitClickID    populate_dkpp
    WaitClickCSS    div.checkbox > label
    ${countryName}=    Get From Dictionary    ${item.deliveryAddress}    countryName_en
    ${latitude}=    Get From Dictionary    ${item.deliveryLocation}    latitude
    ${locality}=    Get From Dictionary    ${item.deliveryAddress}    locality
    Wait Until Element Is Enabled    id=latitude
    ${text}=    Convert To String    ${latitude}
    WaitInputID    latitude    ${text}
    ${longitude}=    Get From Dictionary    ${item.deliveryLocation}    longitude
    ${text}=    Convert To String    ${longitude}
    WaitInputID    longitude    ${text}
    WaitInputID    elevation    111
    WaitClickID    div_combo_selectCountry
    Wait Until Element Is Visible    input_combo_selectCountry
    WaitInputID    input_combo_selectCountry    ${countryName}
    Press Key    input_combo_selectCountry    \\\13
    ${region}=    Get From Dictionary    ${item.deliveryAddress}    region
    WaitClickXPATH    //button[@class="btn dropdown-toggle btn-default"][@title="Оберіть регіон"]
    Wait Until Element Is Visible    id=input_combo_selectRegion
    WaitInputID    input_combo_selectRegion    ${region}
    Press Key    id=input_combo_selectRegion    \\\13
    ${locality}=    Get From Dictionary    ${item.deliveryAddress}    locality
    WaitInputID    addr_locality    ${locality}
    \    #
    ${items_description}=    Get From Dictionary    ${item.additionalClassifications[0]}    description
    ${quantity}=    Get From Dictionary    ${item}    quantity
    ${cpv}=    Get From Dictionary    ${item.classification}    description
    ${unit}=    Get From Dictionary    ${item.unit}    code
    #
    ${latitude}=    Get From Dictionary    ${item.deliveryLocation}    latitude
    ${postalCode}=    Get From Dictionary    ${item.deliveryAddress}    postalCode
    ${streetAddress}=    Get From Dictionary    ${item.deliveryAddress}    streetAddress
    #add address    -------------------------------------------
    ${deliveryDate}=    Get From Dictionary    ${item.deliveryDate}    endDate
    ${deliveryDate}=    aps_service.Convert Date To String    ${deliveryDate}
    \    #
    WaitClickID    post_code
    ${postalCode}    Get From Dictionary    ${item.deliveryAddress}    postalCode
    WaitInputID    post_code    ${postalCode}
    ${streetAddress}=    Get From Dictionary    ${item.deliveryAddress}    streetAddress
    WaitInputID    addr_street    ${streetAddress}
    WaitInputID    date_delivery_end    ${deliveryDate}
    Press Key    id=date_delivery_end    \\\13
    \    #
    WaitClickID    AddItemButton

Додати багато лотів
    [Arguments]    ${tender_data}
    ${lots}=    Get From Dictionary    ${tender_data}    lots
    ${length}=    Get Length    ${lots}
    ${items}=    Get From Dictionary    ${tender_data}    items
    Run Keyword If    '${number_of_lots}' >= 1    DeleteDefaultLot
    : FOR    ${INDEX}    IN RANGE    0    ${length}
    \    Click Element    AddLot
    \    Wait Until Element Is Visible    lot_name
    \    ${txt_title}=    Get From Dictionary    ${lots[${INDEX}]}    title
    \    Input Text    lot_name    ${txt_title}
    \    ${txt}=    Get From Dictionary    ${lots[${INDEX}]}    description
    \    Input Text    lot_description_edit    ${txt}
    \    ${txt}=    Get From Dictionary    ${lots[${INDEX}].value}    amount
    \    ${txt}=    Convert To String    ${txt}
    \    Input Text    lot_budget    ${txt}
    \    ${txt}=    Get From Dictionary    ${lots[${INDEX}].minimalStep}    amount
    \    ${txt}=    Convert To String    ${txt}
    \    Input Text    lot_auction_min_step    ${txt}
    \    Wait Until Element Is Enabled    button_add_lot
    \    Click Button    button_add_lot
    \    Додати предмет    ${items[${INDEX}]}    ${txt_title}
    \    Log To Console    item ${INDEX} added
    \    \    #

Додати багато предметів
    [Arguments]    ${items}
    [Documentation]    ${ARGUMENTS[0]} == tender_data
    #${items}=    Get From Dictionary    ${tender_data}    items
    ${Items_length}=    Get Length    ${items}
    : FOR    ${INDEX}    IN RANGE    0    ${Items_length}
    \    Додати предмет    ${items[${INDEX}]}    0

Опублікувати тендер
    Sleep    3
    WaitClickID    btnPublishTop
    Element Should Not Be Visible    id=divAlert    message='Error public'
    WaitClickID    btnView
    ${starttime}=    Get Current Date
    ${tender_id}=    Get Text    id=titleTenderUcode
    [Return]    ${tender_id}

TenderInfo
    [Arguments]    ${tender_data}
    ${title}=    Get From Dictionary    ${tender_data}    title
    ${description}=    Get From Dictionary    ${tender_data}    description
    ${budget}=    Get From Dictionary    ${tender_data.value}    amount
    ${step_rate}=    Get From Dictionary    ${tender_data.minimalStep}    amount
    ${PDV}=    Get From Dictionary    ${tender_data.value}    valueAddedTaxIncluded
    \    #
    WaitInputID    ${locator.tenderTitle}    ${title}
    WaitInputID    ${locator.tenderDetail}    ${description}
    ${text}=    Convert To string    ${budget}
    WaitInputID    ${locator.tenderBudget}    ${text}
    ${text}=    Convert To String    ${step_rate}
    WaitInputID    ${locator.tenderStep}    ${text}
    #Click Element    xpath=.//*[@id='mt']/div[4]/div/div/li/div[5]/div/div[3]/div/div/label/span/label    ???
    Run Keyword If    ${PDV}    Select Checkbox    id=chkPDVIncluded

Заповнити дати тендеру
    [Arguments]    ${enquiryPeriod}    ${tenderPeriod}
    ${enquiry_start}=    Get From Dictionary    ${enquiryPeriod}    startDate
    ${enquiry_end}=    Get From Dictionary    ${enquiryPeriod}    endDate
    #
    ${tender_start}=    Get From Dictionary    ${tenderPeriod}    startDate
    ${tender_end}=    Get From Dictionary    ${tenderPeriod}    endDate
    #
    ${dt1}=    aps_service.Convert Date To String    ${enquiry_start}
    Input text    ${locator.tenderComStart}    ${dt1}
    Press Key    ${locator.tenderComStart}    \\\13
    ${dt2}=    aps_service.Convert Date To String    ${enquiry_end}
    Input text    ${locator.tenderComEnd}    ${dt2}
    Press Key    ${locator.tenderComEnd}    \\\13
    #
    ${dt3}=    aps_service.Convert Date To String    ${tender_start}
    Input text    ${locator.tenderStart}    ${dt3}
    Press Key    ${locator.tenderStart}    \\\13
    ${dt4}=    aps_service.Convert Date To String    ${tender_end}
    Input text    ${locator.tenderEnd}    ${dt4}
    Press Key    ${locator.tenderEnd}    \\\13

SearchIdViewer
    [Arguments]    ${tender_UAid}    ${username}
    Go To    ${USERS.users['${username}'].homepage}/Tenders/${tender_UAid}
    Wait Until Page Contains    ${tender_UAid}    10

DeleteDefaultLot
    Wait Until Page Contains Element    ${lot.titleEdt}    50
    Click Element    ${lot.hrefEdt}
    Wait Until Element Is Visible    ${lot.btnDelEdt}
    Click Element    ${lot.btnDelEdt}
    Wait Until Element Is Visible    button_delete_lot
    Click Element    button_delete_lot
    Wait Until Element Is Visible    AddLot

WaitClickID
    [Arguments]    ${id}
    Wait Until Page Contains Element    id=${id}
    Wait Until Element Is Enabled    id=${id}
    Click Element    id=${id}

WaitClickXPATH
    [Arguments]    ${id}
    Wait Until Page Contains Element    xpath=${id}    20
    Wait Until Element Is Enabled    xpath=${id}
    Click Element    xpath=${id}

WaitInputID
    [Arguments]    ${id}    ${text}
    Wait Until Page Contains Element    id=${id}
    Wait Until Element Is Enabled    id=${id}
    Input Text    id=${id}    ${text}

WaitClickCSS
    [Arguments]    ${id}
    Wait Until Page Contains Element    css=${id}
    Wait Until Element Is Enabled    css=${id}
    Click Element    css=${id}

WaitInputXPATH
    [Arguments]    ${id}    ${text}
    Wait Until Page Contains Element    xpath=${id}
    Wait Until Element Is Enabled    xpath=${id}
    Input Text    xpath=${id}    ${text}

CPV(below)
    [Arguments]    ${items}
    ${items}=    Replace String    ${items}    :    ${EMPTY}
    [Return]    ${items}

DKPP
    [Arguments]    ${items}
    ${items}=    Replace String    ${items}    :    ${EMPTY}
    [Return]    ${items}

deliveryDate
    [Arguments]    ${items}
    ${items}=    aps_service.parse_date    ${items}
    [Return]    ${items}

itemquantity
    [Arguments]    ${items}
    ${items}=    Convert To Integer    ${items}
    [Return]    ${items}

valueAddedTaxIncluded
    [Arguments]    ${items}
    ${return_value}=    Run Keyword And Return If    'з ПДВ.' == '${items}'    Set Variable    ${True}
    ${return_value}=    Run Keyword And Return If    'без ПДВ.' == '${items}'    Set Variable    ${False}
    [Return]    ${items}

lots.value.amount
    [Arguments]    ${items}
    ${items}=    Replace String    ${items}    ,    .
    ${items}=    Convert To Number    ${items}
    [Return]    ${items}

longitudelatitude
    [Arguments]    ${items}
    ${items}=    Convert To Number    ${items}
    [Return]    ${items}
