*** Settings ***
Documentation                                                       Ações da página de carrinho
Resource                                                            ../base_PRD.robot 
*** Keywords ***
Aguardar loader
    [Arguments]                                  ${Loader}
    Run Keyword And Ignore Error                 Wait For Elements State                           ${Loader}                     visible  5
    Wait For Elements State                      ${Loader}                                         hidden                        ${DEFAULT_TIMEOUT}
Aceitar cookies
    Wait For Elements State                      ${button_aceitar_cookies}                         visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${button_aceitar_cookies}
Acessar a categoria
    [Arguments]                                  ${categoria}
    Wait For Elements State                      ${dropdown_catalago}                              visible                       ${DEFAULT_TIMEOUT}
    Mouse Move Relative To                       ${dropdown_catalago}
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
Acessar link não sei meu cep
    Wait For Elements State                      ${Button_Nao_Sei_CEP_Cart}                        visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Nao_Sei_CEP_Cart}
    Sleep                                        3
    ${page_id}                                   Get Page Ids
    Switch Page                                  ${page_id}[0]
    Get Title                                    ==  Busca CEP
    Switch Page                                  ${page_id}[1]
    Close Page                                   ${page_id}[0]
Aumentar quantidade do produto
    [Arguments]                                  ${quantidade}
    ${Vrf_Cart}                                  Get Element Count                                 ${Title_Cart}
    IF    ${Vrf_Cart} > 0
        ${Quantidade_Input}                      Get Text                                          ${Input_Quantidade_Cart}    
        ${Quantidade_Input}                      Convert To Integer                                ${Quantidade_Input}
        Click With Options                       ${Button_Aumentar_Quantidade_Cart}                clickCount=${quantidade}        delay=15ms
        ${Quantidade_Input2}                     Get Text                                          ${Input_Quantidade_Cart}
        ${Quantidade_Input2}                     Convert To Integer                                ${Quantidade_Input2}
        Should Be Equal                          ${Quantidade_Input+${quantidade}}                 ${Quantidade_Input2}
    END
Diminuir quantidade do produto
    [Arguments]                                  ${quantidade}
    ${Vrf_Cart}                                  Get Element Count                                 ${Title_Cart}
    IF    ${Vrf_Cart} > 0
        ${Quantidade_Input}                      Get Text                                          ${Input_Quantidade_Cart}    
        ${Quantidade_Input}                      Convert To Integer                                ${Quantidade_Input}
        Click With Options                       ${Button_Diminuir_Quantidade_Cart}                clickCount=${quantidade}        delay=15ms
        ${Quantidade_Input2}                     Get Text                                          ${Input_Quantidade_Cart}
        ${Quantidade_Input2}                     Convert To Integer                                ${Quantidade_Input2}
        Should Be Equal                          ${Quantidade_Input-${quantidade}}                 ${Quantidade_Input2}
    END
Acessar página do checkout
    Wait For Elements State                      ${Button_Finalizar_Pedido}                        enabled                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Finalizar_Pedido}
    Wait For Elements State                      css=${Title_Acesso_Conta}, ${Title_Checkout}      visible                       ${DEFAULT_TIMEOUT}
Cadastro novo usuário
    [Arguments]                                  ${dados}
    ${email}                                     Run Process                                       python                        ${EXECDIR}/resources/fixtures/create_email.py
    ${cpf}                                       Run Process                                       python                        ${EXECDIR}/resources/fixtures/create_cpf.py
    Wait For Elements State                      ${text_subtitle_meu_primeiro_acesso}              visible                       ${DEFAULT_TIMEOUT}
    Type Text                                    ${input_nome_primeiro_login}                      ${dados["nome"]}              5ms
    Type Text                                    ${input_sobrenome_primeiro_login}                 ${dados["sobrenome"]}         5ms
    Type Text                                    ${input_cpf_primeiro_login}                       ${cpf.stdout}                 5ms
    Type Text                                    ${input_numero_de_telefone_primeiro_login}        ${dados["telefone"]}          5ms
    Type Text                                    ${input_email_primeiro_login}                     ${email.stdout}               5ms
    Type Text                                    ${input_senha_primeiro_login}                     ${dados["senha"]}             5ms
    Type Text                                    ${input_confirmar_senha_primeiro_login}           ${dados["confirmarSenha"]}    5ms
    Click                                        ${button_acessar_primeiro_login}
    Wait For Elements State                      ${Button_Lupa}, ${Title_Checkout}                 visible                       ${DEFAULT_TIMEOUT}
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
Acessar lista de endereços
    ${Vrf_Checkout}                              Get Element Count                                 ${title_checkout}
    IF    ${Vrf_Checkout} > 0
        Click                                    ${Button_Novo_Endereco_checkout}
        Wait For Elements State                  ${Button_Lista_Endereco_checkout}                 visible                       ${DEFAULT_TIMEOUT}
        Click                                    ${Button_Lista_Endereco_checkout} 
        Wait For Elements State                  ${Button_Enviar_Este_Endereco}                    visible                       ${DEFAULT_TIMEOUT}
    END
Cadastrar novo endereço
    [Arguments]                                  ${dados}
    Wait For Elements State                      ${input_cep}                                      visible                       ${DEFAULT_TIMEOUT}
    Type Text                                    ${input_cep}                                      ${dados["cep"]}               5ms
    Type Text                                    ${input_numero_da_casa}                           254                           5ms
    Click                                        ${input_complemento} 
    Type Text                                    ${input_complemento}                              ${dados["complemento"]}       5ms
    Type Text                                    ${input_numero}                                   ${dados["telefone"]}          5ms
    Aguardar loader                              ${Loader}
Selecionar pagamento
    [Arguments]                                  ${dados}
    IF                                           "${dados["pagamento"]}" == "Cartão de Crédito"
        Wait For Elements State                  ${opt_cartao}                                     visible                       ${DEFAULT_TIMEOUT}
        Click                                    ${opt_boleto}
        Click                                    ${opt_cartao}
        Click                                    ${button_selecionar_bandeira_cartao}
        Type Text                                ${input_numero_do_cartao}                         ${dados["numero_cartao"]}     5ms
        Select Options By                        ${select_parcelamento}                            value                         ${dados["parcelamento"]}
        Type Text                                ${input_nome_do_titular}                          ${dados["nome_titular"]}      5ms
        Select Options By                        ${select_mes_de_vencimento}                       value                         ${dados["mes"]}
        Select Options By                        ${select_ano_de_vencimento}                       value                         ${dados["ano"]}
        Type Text                                ${input_codigo_de_seguranca}                      ${dados["cvv"]}               5ms
    END
    IF                                           "${dados["pagamento"]}" == "Boleto"
        Wait For Elements State                  ${opt_boleto}                                     visible                       ${DEFAULT_TIMEOUT}
        Click                                    ${opt_boleto}
    END
    IF                                           "${dados["pagamento"]}" == "pix"
        Wait For Elements State                  ${opt_cartao}                                     visible                       ${DEFAULT_TIMEOUT}
        Click                                    ${opt_pix}
        Aguardar loader                          ${Loader}
    END
Finalizar pedido
    [Arguments]                                  ${dados}
    Wait For Elements State                      ${button_finalizar_pedido_checkout}               enabled                       50
    Click                                        ${button_finalizar_pedido_checkout}
    Aguardar loader                              ${Loader}
    Aguardar loader                              ${Loader}
    IF                                           "${dados["pagamento"]}" == "Cartão de Crédito"
        Wait For Elements State                  ${Notificao_Header_Error}                         visible                       ${DEFAULT_TIMEOUT}
        Log To Console                           \nPagamento recusado!!!
    ELSE
        Wait For Elements State                  ${num_pedido}                                     visible                       ${DEFAULT_TIMEOUT}
        ${num}                                   Get Text                                          ${num_pedido}
        Log To Console                           \n${num}
    END
Ir para pagamento
    Wait For Elements State                      ${button_ir_para_pagamento}                       visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${button_ir_para_pagamento}
    Wait For Elements State                      ${button_ir_para_pagamento}                       hidden                        ${DEFAULT_TIMEOUT}
    Wait For Elements State                      ${opt_boleto}                                     visible                       ${DEFAULT_TIMEOUT}
Login com usuário existente
    [Arguments]                                  ${dados}                                          ${pagina}
    Type Text                                    ${input_email_login}                              ${dados["email"]}             50ms
    Type Text                                    ${input_senha_login}                              ${dados["senha"]}             50ms
    Click                                        ${Button_Acessar_Login}
    Wait For Elements State                      css=${Title_Acesso_Conta}                         hidden                        ${DEFAULT_TIMEOUT}
    IF  "${pagina}" == "Checkout"
      Wait For Elements State                    css=${Title_Checkout}                             visible                       ${DEFAULT_TIMEOUT}
    ELSE IF  "${pagina}" == "Inicio"
      Wait For Elements State                    ${Container_Carrossel_Home}                       visible                       ${DEFAULT_TIMEOUT}
    END
Acessar profile
    Wait For Elements State                      ${Dropdown_Profile}                               visible                       ${DEFAULT_TIMEOUT}
    Mouse Move Relative To                       ${Dropdown_Profile}
    Wait For Elements State                      ${Button_Meu_Perfil}                              visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Meu_Perfil}
    Wait For Elements State                      ${Text_Meus_Pedidos}                              visible                       ${DEFAULT_TIMEOUT}
Acessar página de login
    Wait For Elements State                      ${Button_Entrar_Cadastrar}                        visible                       ${DEFAULT_TIMEOUT}
    Click                                        ${Button_Entrar_Cadastrar}
    Wait For Elements State                      ${input_email_login}                              visible                       ${DEFAULT_TIMEOUT}
Adicionar cupom
    [Arguments]                                  ${dados}
    Wait For Elements State                      ${input_cupom}                                    visible                       ${DEFAULT_TIMEOUT}
    Type Text                                    ${input_cupom}                                    ${dados["cupom"]}             5ms
    Click                                        ${button_aplicar_cupom}
    ${chk}  Run Keyword And Return Status  Wait For Elements State                                 ${error_cupom}                visible  2
    IF                                           ${chk} == True
        ${erro}=                                 Get Text    ${error_cupom}
        Log To Console                           Cupom não aplicado devido ao erro "${erro}"
    ELSE
        Wait For Elements State                  ${modal_cupom_aplicado}                           visible                       ${DEFAULT_TIMEOUT}
        Evaluate JavaScript                      ${modal_cupom_aplicado}                           (elem) => elem.click()    
        Wait For Elements State                  ${text_desconto_aplicado}                         visible                       ${DEFAULT_TIMEOUT}
    END
    
Acessar PDP
    ${Vrf_Cart}                                  Get Element Count                                 ${Title_Cart}
    IF    ${Vrf_Cart} > 0
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
Ir para home
    ${Vrf_Cart}                                  Get Element Count                       css=div[id="breadcrumbTrail"] > span >> text=Carrinho
    IF    ${Vrf_Cart} == 1
        Wait For Elements State                  ${button_logo_cart}                     visible                       ${DEFAULT_TIMEOUT}
        Sleep                                    3
        Click With Options                       ${button_logo_cart}                     position_x=5                  position_y=5   
    ELSE
        Wait For Elements State                  ${button_logo}                          visible                       ${DEFAULT_TIMEOUT}
        Sleep                                    3
        Click With Options                       ${button_logo}                          position_x=5                  position_y=5   
    END
    
    Wait For Elements State                      ${Container_Carrossel_Home}             visible                       ${DEFAULT_TIMEOUT}