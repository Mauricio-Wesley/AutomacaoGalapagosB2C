*** Settings ***
Documentation                                    Ações da página de carrinho
Resource                                         ../base_PRD.robot 
*** Keywords ***
Aguardar loader
    [Arguments]                                  ${Loader}
    Run Keyword And Ignore Error                 Wait For Elements State                           ${Loader}                     visible  5
    Wait For Elements State                      ${Loader}                                         hidden                        ${DEFAULT_TIMEOUT}
Aceitar cookies
    Wait For Elements State                      ${Button_Accept_Cookies}                          visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Accept_Cookies}
Acessar a categoria
    [Arguments]                                  ${categoria}
    Wait For Elements State                      ${Dropdown_Catalago}                              visible                       ${DEFAULT_TIMEOUT}
    Mouse Move Relative To                       ${Dropdown_Catalago}
    Click                                        css=li[class='list-item list-item-nivel'] >> text='${categoria}'
    Wait For Elements State                      ${Product_Card}                                   hidden                        ${DEFAULT_TIMEOUT}
    Wait For Elements State                      ${Product_Card}                                   visible                       ${DEFAULT_TIMEOUT}
    Wait For Elements State                      ${Button_Adicionar_PLP} [1]                       visible                       ${DEFAULT_TIMEOUT}
    Get Title  ==                                ${categoria}
Adicionar produto no carrinho
    [Arguments]                                  ${Compra}                                         ${Posicao}               
    IF  '${Compra}' == 'PDP'
      Click                                      ${Button_Adiconar_PDP}
    ELSE
      Click                                      ${Button_Adicionar_PLP} [${Posicao}]
    END
    Aguardar loader                              ${Loader_Galapagos}
    Wait For Elements State                      ${MiniCart_Open}                                  visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Close_MiniCart}
    Wait For Elements State                      ${MiniCart_Open}                                  hidden                        ${DEFAULT_TIMEOUT}
Acessar página do carrinho
    Wait For Elements State                      ${Button_Minicart}                                visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Minicart}
    Wait For Elements State                      ${MiniCart_Open}                                  visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Ver_Itens_Bau}
    Wait For Elements State                      ${Title_Cart}                                     visible                       ${DEFAULT_TIMEOUT}
Acessar página do checkout
    Wait For Elements State                      ${Button_Finalizar_Pedido}                        enabled                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Finalizar_Pedido}
    Wait For Elements State                      css=${Input_Email}, ${Title_Checkout}             visible                       ${DEFAULT_TIMEOUT}
Cadastro novo usuário
    [Arguments]                                  ${dados}
    ${email}                                     Run Process                                       python                        ${EXECDIR}/resources/fixtures/create_email.py
    ${cpf}                                       Run Process                                       python                        ${EXECDIR}/resources/fixtures/create_cpf.py
    Wait For Elements State                      ${Input_Email}                                    visible                       ${DEFAULT_TIMEOUT}
    Type Text                                    ${Input_Email}                                    ${email.stdout}               5ms
    Click                                        ${Button_Continue_Login}
    Type Text                                    ${Input_Name}                                     ${dados["name"]}              5ms
    Type Text                                    ${Input_Last_Name}                                ${dados["lastname"]}          5ms
    Type Text                                    ${Input_CPF}                                      ${cpf.stdout}                 5ms
    Type Text                                    ${Input_Telephone}                                ${dados["telephone"]}         5ms
    Type Text                                    ${Input_Create_Password}                          ${dados["password"]}          5ms
    Type Text                                    ${Input_Confirm_Password}                         ${dados["password"]}          5ms
    Click                                        ${Checkbox_Accept_Terms}
    Wait For Elements State                      ${Text_Account_Created}                           visible
    Click                                        ${Button_Go_Home}
Ir para entrega
    Wait For Elements State                      ${button_ir_para_entrega}                         visible                       ${DEFAULT_TIMEOUT}
    Aguardar loader                              ${Loader}
    Click                                        ${button_ir_para_entrega}
    Wait For Elements State                      xpath=//input[@name="firstName"]                  hidden                        ${DEFAULT_TIMEOUT}
Selecionar endereço existente
    [Arguments]                                  ${posicao}
    Wait For Elements State                      ${Button_Enviar_Este_Endereco}                    visible                       ${DEFAULT_TIMEOUT}
    ${CEP_Lista}                                 Get Text    css=div[class="modal-content"] span[data-bind="text: postalCode"]
    Click                                        ${Button_Enviar_Este_Endereco}
    Aguardar loader                              ${Loader}
    Get Text                                     id=CC-checkoutAddressBook-szipcode    ==    ${CEP_Lista}
Cadastrar novo endereço
    [Arguments]                                  ${dados}
    Wait For Elements State                      ${input_cep}                                      visible                       ${DEFAULT_TIMEOUT}
    Type Text                                    ${input_cep}                                      ${dados["cep"]}               5ms
    Type Text                                    ${input_numero_da_casa}                           254                           5ms
    Click                                        ${input_complemento} 
    Type Text                                    ${input_complemento}                              ${dados["fullname"]}          5ms
    Type Text                                    ${input_numero}                                   ${dados["telephone"]}          5ms
    Aguardar loader                              ${Loader}
Selecionar pagamento
    [Arguments]                                  ${dados}
    IF  "${dados["payment"]}" == "Cartão de Crédito"
        Click                                    ${Opt_cartao}
        Type Text                                ${Input_Card_Number}                              4001020000000009              5ms
        Type Text                                ${Input_Card_Name}                                ${dados["fullname"]}          5ms
        Type Text                                ${Input_Card_Validity}                            0526                          5ms
        Type Text                                ${Input_CVV}                                      123                           5ms
        Click                                    ${Select_Select_Installment}
        Click                                    xpath=(//div[@id='cinstallments']//div) [4]
    END
    IF  "${dados["payment"]}" == "Boleto"
        Click                                    ${Opt_Boleto}
    END
    IF  "${dados["payment"]}" == "pix"
        Click                                    ${Opt_Pix}
    END
Ir para pagamento
    Wait For Elements State                      ${Button_proceed_To_Paymen}                       visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_proceed_To_Paymen}
    Aguardar loader                              ${Loader}
Login com usuário existente
    [Arguments]                                  ${dados}                                          ${pagina}
    Type Text                                    ${Input_Email}                                    ${dados["email"]}             50ms
    Wait For Elements State                      ${Button_Continue_Login}
    Click                                        ${Button_Continue_Login}
    Type Text                                    ${Input_Password}                                 ${dados["password"]}          50ms
    Click                                        ${Button_Login_In}
    Wait For Elements State                      css=${Container_Carrossel_Home}, ${Title_Checkout}                              visible                   
Acessar página de login
    Wait For Elements State                      ${Button_Entrar_Cadastrar}                        visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Entrar_Cadastrar}
    Wait For Elements State                      ${Input_Email}                                    visible                       ${DEFAULT_TIMEOUT}
Acessar PDP
    ${Vrf_Cart}                                  Get Element Count                                 ${Title_Cart}
    IF  ${Vrf_Cart} > 0
        Wait For Elements State                  ${img_produto_cart}                               visible                       ${DEFAULT_TIMEOUT}
        Click                                    ${img_produto_cart}
    ELSE
        Wait For Elements State                  ${Product_Box} [1]                                visible                       ${DEFAULT_TIMEOUT}
        Click                                    ${Product_Box} [1]
    END
    Wait For Elements State                      ${Text_Titulo_PDP}                                visible                       ${DEFAULT_TIMEOUT}
Busca no search
    [Arguments]                                  ${produto}
    Wait For Elements State                      ${Button_Lupa}                                    visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Lupa}
    Type Text                                    ${Input_Search}                                   ${produto}                    5ms
    Keyboard Key                                 press                                             Enter
    Wait For Elements State                      ${Breadcrumb}${produto}'                          visible                      ${DEFAULT_TIMEOUT}
    Wait For Elements State                      ${Button_Adicionar_PLP} [1]                       visible                      ${DEFAULT_TIMEOUT}
Limpar MiniCart
    ${Verifica_Itens}  Run Keyword And Return Status  Wait For Elements State                      ${itens_cart}                 visible  5
    IF  '${Verifica_Itens}' == 'True'
      Click                                      ${Button_Minicart}
      Wait For Elements State                    ${MiniCart_Open}                                  visible                       ${DEFAULT_TIMEOUT}
    #   ${Get_Quantidade}                          Get Element Count                                 ${Button_Trash_MiniCart}
      FOR  ${i}  IN RANGE                        20
        Click                                    ${Button_Trash_MiniCart} [1]
        Click                                    ${Button_Delete_MiniCart}
        Wait For Elements State                  ${Button_Delete_MiniCart}                         hidden                        ${DEFAULT_TIMEOUT}
        Sleep                                    2
        ${Get_Quantidade_MiniCart}               Get Element Count                                 ${Button_Trash_MiniCart}
        Exit For Loop If                         ${Get_Quantidade_MiniCart} == 0
      END
      Wait For Elements State                    ${Text_Empty_MiniCart}
      Click                                      ${Button_Close_MiniCart}
      Wait For Elements State                    ${MiniCart_Open}                                  hidden                       
    END