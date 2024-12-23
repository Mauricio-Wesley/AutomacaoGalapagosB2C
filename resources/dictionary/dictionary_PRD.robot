*** Settings ***
Resource                                                        ../base_PRD.robot 
*** Variables ***
${Input_Email}                                                  input[id=email]
${Title_Cart}                                                   css=h2 >> text='Baú de itens'       
${Button_Finalizar_Pedido}                                      id=CC-orderSummary-checkout
${input_nome}                                                   id=CC-checkoutAddressBook-sfirstname                
${input_sobrenome}                                              id=CC-checkoutAddressBook-slastname                      
${Input_Zip_Code}                                               id=CC-checkoutAddressBook-szipcode
${Input_Address_Name}                                           id=CC-checkoutAddressBook-sfirstname-form
${Input_House_Number}                                           id=CC-checkoutAddressBook-saddress2-form
${Button_Proceed_To_Shipping}                                   css=button.send-success
${Button_proceed_To_Paymen}                                     css=button.btn-shipping
${Input_Card_Number}                                            id=cnumber  
${Input_Card_Name}                                              id=cname
${Input_Card_Validity}                                          id=cvalidity
${Input_CVV}                                                    id=ccvv
${Select_Installment}                                           id=cinstallments
${Button_Entrar_Cadastrar}                                      css=a >> text='Entrar ou Cadastrar'
${Input_Search}                                                 css=.area-input input
${Button_Search}                                                .desktop-search #lupa-desktop img
${Dropdown_Catalago}                                            id=Catalogo
${text_subtitle_meu_primeiro_acesso}                            xpath=//h2[text()='Meu Primeiro Acesso']                                        
${Input_Name}                                                   id=CC-acessoCadastro-firstName
${Input_Last_Name}                                              id=CC-acessoCadastro-lastName
${Input_Social_Name}                                            id=socialName
${Input_CPF}                                                    id=CC-acessoCadastro-document                                                       
${Input_Telephone}                                              id=CC-acessoCadastro-phoneNumber                                                                              
${Input_Create_Password}                                        id=CC-acessoCadastro-password
${Input_Confirm_Password}                                       id=CC-acessoCadastro-confirmpassword
${button_acessar_primeiro_login}                                id=CC-acessoCadastro-register-submit
${input_email_login}                                            id=CC-acessoCadastro-login-email
${input_email_popup}                                            id=CC-login-input
${input_senha_popup}                                            id=CC-login-password-input
${Input_Password}                                               id=password
${Button_Login_In}                                              css=div[class='form-button isActive']
${button_acessar_login_modal}                                   id=CC-userLoginSubmit                                                 
${Button_Adicionar_PLP}                                         xpath=(//div[@class='button-add-cart'])
${Button_Adiconar_PDP}                                          id=cc-prodDetailsAddToCart
${Breadcrumb}                                                   css=#breadcrumbTrail span >> text='
${Itens_Cart}                                                   css=div[class="quantity-cart-items"]>span
${Button_Minicart}                                              css=.cart-container i
${Title_Checkout}                                               [class*="checkoutshoppinglist"]
${Opt_Cartao}                                                   css=.title >> text='Cartão de crédito'
${Opt_Boleto}                                                   css=.title >> text='Boleto bancário'
${Opt_Pix}                                                      css=.title >> text='Pix'
${Loader}                                                       id=cc-spinner
${Loader_Galapagos}                                             css=.logo_iguana
${text_titulo_PDP}                                              css=h1[class='product-title']
${Button_Ver_Itens_Bau}                                         css=a >> text='Ver meus itens em baú'
${Product_Card}                                                 xpath=(//img[@class='img-responsive product-cover-image'])[1]
${Button_Accept_Cookies}                                        css=.acceptCookies
${Button_Close_MiniCart}                                        css=.galapagos-minicart-header .close-icon
${img_produto_cart}                                             xpath=(//img[@class="img-responsive"]) [1]
${Button_Enviar_Este_Endereco}                                  css=button > span >> text=Enviar para este Endereço
${Container_Carrossel_Home}                                     div[class='category-area']
${Product_Box}                                                  xpath=(//div[@class='button-add-cart']/../../../div[@class='product-cover'])
${Title_Acesso_Conta}                                           h2[class='acesso-title']
${Button_Trash_MiniCart}                                        xpath=(//button[@class='trash-icon'])
${Button_Delete_MiniCart}                                       css=.delete-button
${Text_Empty_MiniCart}                                          css=.empty-text
${MiniCart_Open}                                                css=.open .galapagos-minicart-header
${Button_Continue_Login}                                        css=.form-button.continue.isActive
${Checkbox_Accept_Terms}                                        css=.iconTerm[data-bind="click: $parent.acceptTems.bind($parent)"]
${Button_Create_Account}                                        css=button >> text='Criar minha conta'
${Text_Account_Created}                                         text=Conta criada com sucesso!
${Button_Go_Home}                                               css=button >> text='Ir para a home'
${Option_Installment}                                           xpath=//div[@id='cinstallments']//span[contains(.,"