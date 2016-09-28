*** Settings ***
Resource          aps.robot

*** Variables ***
${item_index}     0
${locator.tenderID}    id=titleTenderUcode
${locatorDeals}    tab_view_bids
${locatot.cabinetEnter}    id=login_ribbon
${locator.emailField}    id=LoginBox
${locator.passwordField}    id=LoginPasswordBox
${locator.loginButton}    id=ButtonLogin
${locator.buttonTenderAdd}    //a[@href="/Tenders/Add"]    # додати допорогову закупівлю
${locator.tenderTitle}    edtTenderTitle
${locator.tenderDetail}    edtTenderDetail
${locator.tenderBudget}    edtTenderBudget
${locator.tenderStep}    edtMinStep
${locator.tenderComStart}    id=date_enquiry_start
${locator.tenderComEnd}    id=date_enquiry_end
${locator.tenderStart}    id=date_tender_start
${locator.tenderEnd}    id=date_tender_end
${locator.tenderAdd}    btnAdd
${locator.topSearch}    id=topsearch
${locator.searchButton}    id=btnSearch
${locator.findTender}    xpath=//p[@class='cut_title']
${locator.informationTable}    xpath=//li[@id='tab1']
${locator.title}    id=edtTenderTitle
${locator.descriptions}    id=edtTenderDetail
${locator.value.amount}    id=edtTenderBudget
${locator.tenderId}    id=titleTenderUcode
${locator.procuringEntity.name}    id=author_legal_name
${locator.enquiryPeriod.startDate}    id=date_enquiry_start
${locator.enquiryPeriod.endDate}    id=date_enquiry_end
${locator.tenderPeriod.startDate}    id=date_tender_start
${locator.tenderPeriod.endDate}    id=date_tender_end
${locator.value.valueAddedTaxIncluded}    id=lblPDV
${locator.minimalStep.amount}    id=edtMinStep
${locator.items[0].deliveryDate.endDate}    id=deliv_date_end1
${locator.items[0].deliveryLocation.latitude}    id=qdelivlatitude1
${locator.items[0].deliveryLocation.longitude}    id=qdelivlongitude1
${locator.items[0].deliveryAddress.postalCode}    id=qdelivaddrpost_code1
${locator.items[0].deliveryAddress.countryName}    id=_qdelivaddrcountry1
${locator.items[0].deliveryAddress.locality}    id=qdeliv_addr_locality1
${locator.items[0].deliveryAddress.streetAddress}    id=qdeliv_addrstreet1
${locator.items[0].classification.scheme}    id=scheme2015_1
${locator.items[0].classification.id}    id=cpv_code_1
${locator.items[0].classification.description}    id=cpv_name1
${locator.items[0].additionalClassifications[0].scheme}    id=scheme2010_1
${locator.items[0].additionalClassifications[0].id}    id=dkpp_code_1
${locator.items[0].additionalClassifications[0].description}    id=dkpp_name1
${locator.items[0].description}    xpath=//div[@class="col-md-8 col-sm-8 col-xs-7"]
${locator.questions[0].title}    id=questionTitlespan1
${locator.questions[0].description}    id=label_question_description
${locator.questions[0].date}    xpath=//div[@class="col-md-2 text-right"][@style="font-size: 11px; color: black;"]
${locator.items.deliveryDate.endDate}    /div/div/div[4]/div[2]/p/span    #deliv_date_end
${locator.value.currency}    id=lblTenderCurrency2
${locator.items[0].deliveryAddress.region}    id=_qdeliv_addr_region1
${locator.items[0].unit.code}    id=measure_prozorro_code1
${locator.items[0].unit.name}    id=measure_name1
${locator.items[0].quantity}    id=quantity1
${locator.questions[0].answer}    id=answer
${lot.titleEdt}    //*[@id="divLotsItemsDynamic"]/div[@class="panel panel-default"]/a/div/h4/div/div[@class="col-md-9"]/p/b    # заголовок лота на странице редктирования
${lot.hrefEdt}    //*[@id="divLotsItemsDynamic"]/div[@class="panel panel-default"]/a    # ссылка для раскрытия блока лота на странице редактирования
${lot.btnEditEdt}    //*[@id="divLotsItemsDynamic"]/div[@class="panel panel-default"]/div/div/div/div/button[@class="btn btn-dark_blue btn-sm"]    # кнопка редактирования лота
${lot.btnDelEdt}    //*[@id="divLotsItemsDynamic"]/div[@class="panel panel-default"]/div/div/div/div/button[@class="btn btn-yellow btn-sm"]    # кнопка удаления лота
${locator.buttonAdd}    //a[@href="tenderadd"]    # розкрити меню \ з варіантами створення
${locator.lots.title}    /div[1]/div[2]/p/b
${locator.lots.description}    /../../../div/div/div/div/small
${locator.lots.value.amount}    /div[2]/div/p/small/mark[1]/span[1]
${locator.lots.minimalStep.amount}    /div[2]/div/p/small/mark[1]/span[2]/b
${locator.lots.value.valueAddedTaxIncluded}    /div[2]/div/p/small/mark[1]/span[2]/b
##########################################################
${locator.items.Description}    /a/div/h4/div/div[2]
${locator.items.deliveryAddress.countryName}    /tr[5]/td[2]
${locator.items.deliveryLocation.latitude}    //div/div/div[3]/div[2]/p/span[1]
${locator.items.deliveryLocation.longitude}    //div/div/div[3]/div[2]/p/span[2]
${locator.items.deliveryAddress.postalCode}    /div/div/div[3]/div[2]/p/span[4]
${locator.items.deliveryAddress.locality}    /div/div/div[3]/div[2]/p/span[5]
${locator.items.deliveryAddress.streetAddress}    /div/div/div[3]/div[2]/p/span[6]
${locator.items.deliveryAddress.region}    /tr[5]/td[2]
${locator.items.deliveryDate.endDate}    /div/div/div[4]/div[2]/p/span
${locator.items.classification.scheme}    /div/div/div[1]/div[1]/p
${locator.items.classification.id}    /div/div/div[1]/div[2]/p/span[1]
${locator.items.classification.description}    /div/div/div[1]/div[2]/p/span[2]
${locator.items.additionalClassifications[0].scheme}    /div/div/div[2]/div[1]/p
${locator.items.additionalClassifications[0].id}    /div/div/div[2]/div[2]/p/span[1]
${locator.items.additionalClassifications[0].description}    /div/div/div[2]/div[2]/p/span[2]
${locator.items.quantity}    /a/div/h4/div/div[3]/p/span[1]
${locator.items.unit.code}    /a/div/h4/div/div[3]/p/span[4]
${locator.items.unit.name}    /a/div/h4/div/div[3]/p/span[2]
