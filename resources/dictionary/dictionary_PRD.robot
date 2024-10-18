*** Settings ***
Resource                                                        ../base_PRD.robot 
*** Variables ***
${Title_Cart}                                                   css=h2 >> text='Baú de itens'       
${Button_Finalizar_Pedido}                                      id=CC-orderSummary-checkout
${input_cupom}                                                  id=CC-promotionDetails-promoCode      
${button_aplicar_cupom}                                         id=CC-promotion-applyCode
${text_desconto_aplicado}                                       id=CC-orderSummary-discountText                             
${modal_pdp}                                                    id=scroll-see-more
${button_ir_para_entrega}                                       id=delivery
${input_nome}                                                   id=CC-checkoutAddressBook-sfirstname                
${input_sobrenome}                                              id=CC-checkoutAddressBook-slastname                      
${input_cep}                                                    id=CC-checkoutAddressBook-szipcode                       
${input_numero_da_casa}                                         id=CC-checkoutAddressBook-saddress2                      
${input_complemento}                                            id=CC-checkoutAddressBook-saddress3                      
${input_numero}                                                 id=CC-checkoutAddressBook-sphone                         
${button_ir_para_pagamento}                                     id=handlePayment
${button_selecionar_bandeira_cartao}                            xpath=(//span[@class="paymentimages"]/div/span)[1]
${input_numero_do_cartao}                                       id=CC-checkoutPaymentDetails-cardNumber                  
${select_parcelamento}                                          xpath=(//select[@class='col-md-12 form-control'])[3]             
${input_nome_do_titular}                                        id=CC-checkoutPaymentDetails-nameOnCard               
${select_mes_de_vencimento}                                     id=CC-checkoutPaymentDetails-endMonth       
${select_ano_de_vencimento}                                     id=CC-checkoutPaymentDetails-endYear       
${input_codigo_de_seguranca}                                    id=CC-checkoutPaymentDetails-cardCVV                     
${button_finalizar_pedido_checkout}                             xpath=//span[text()="Finalizar pedido"]/..
${button_logo}                                                  css=img[alt="Galápagos Jogos"]
${button_logo_cart}                                             css=span[class="icon-logo"]
${Button_Entrar_Cadastrar}                                      css=a >> text='Entrar ou Cadastrar'
${dropdown_meu_cadastro}                                        id=profileTitle
${product_grid}                                                 id=product-grid
${Input_Search}                                                 css=.area-input input
${Button_Lupa}                                                  .desktop-search #lupa-desktop img
${dropdown_catalago}                                            id=Catalogo
${dropdown_title_quem_somos}                                    id=aboutTitle
${button_sobrenos}                                              css=#about a[title='Sobre nós']
${button_sobrenos_footer}                                       css=.footer-list-item a[title='Sobre nós']
${text_sobrenos}                                                css=#rd-text-k56ra4si strong >> text='SOBRE NÓS'
${button_imprensa}                                              css=#about a[title='Imprensa']
${button_imprensa_footer}                                       css=.footer-list-item a[title='Imprensa']
${text_imprensa}                                                css=#rd-text-k56ra4si strong >> text='Atendimento à Imprensa'                 
${button_atendimento}                                           css=.actions-bar-group-items a >> text='Atendimento'
${button_atendimento_footer}                                    css=.footer-list-item a[title='Atendimento']
${text_serviço_atendimento}                                     css=h1 >> text=Fale Conosco
${button_central_de_report}                                     css=.footer-list-item a[title='Central de Report']
${title_central_de_report}                                      css=#rd-text-k56ra4si strong >> text='Central de Report'
${title_loja_e_prazo}                                           css=#rd-text-k56ra4si strong >> text='LOJA E PRAZOS'
${button_loja_e_prazo}                                          css=.footer-list-item a[title='Loja & Prazo']
${button_politica_de_troca_e_devolucao}                         css=.footer-list-item a[title='Política de Troca & Devoluções']
${title_politica_de_troca_e_devolucao}                          css=#rd-text-k56ra4si strong >> text='POLÍTICA DE TROCAS E DEVOLUÇÕES'
${button_trabalhe_conosco}                                      css=#about a[title='Trabalhe Conosco']
${button_trabalhe_conosco_footer}                               css=.footer-list-item a[title='Trabalhe conosco']
${button_termos_e_condicoes}                                    css=.footer-list-item a[title='Termos e condições']
${text_trabalhe_conosco}                                        css=#rd-text-k7awmlpc strong >> text='Trabalhe conosco'                       
${button_encontre_uma_loja}                                     css=.item a >>text='Encontre uma Loja'
${text_acesse_sua_conta}                                        xpath=//h2[text()='Acesse sua conta'] | //div[@class="header-content"]//h2[text()="Finalizar Compra"]
${Text_AcesseSuaConta}                                          css=h2 >> text="Acesse sua conta"
${dropdown_area_do_lojista}                                     id=logistTitle
${button_quero_ser_lojista}                                     css=.item-sub-item a >> text='Quero ser um lojista oficial'
${text_seja_um_parceiro_galapagos}                              css=#rd-text-joq3m2ly strong >> text='Seja um parceiro Galápagos!'                 
${button_ja_sou_lojista}                                        css=.item-sub-item a >> text='Já sou um lojista oficial'
${text_bemvindo_parceiros}                                      text=Bem vindo à loja de parceiros da Galápagos!           
${button_acessar_portal}                                        xpath=//a[@target][contains(text(), 'Acessar o portal')]
${dropdown_seta_meu_cadastro}                                   xpath=//a[@id= 'profileTitle']/span[1]                           
${text_subtitle_meu_primeiro_acesso}                            xpath=//h2[text()='Meu Primeiro Acesso']                                        
${input_nome_primeiro_login}                                    id=CC-acessoCadastro-firstName                                                 
${input_sobrenome_primeiro_login}                               id=CC-acessoCadastro-lastName                                        
${input_cpf_primeiro_login}                                     id=CC-acessoCadastro-document                                                            
${input_numero_de_telefone_primeiro_login}                      id=CC-acessoCadastro-phoneNumber                                          
${input_email_primeiro_login}                                   xpath=(//input[@id='CC-userRegistration-emailAddress'])[2]                                            
${input_senha_primeiro_login}                                   id=CC-acessoCadastro-password        
${input_confirmar_senha_primeiro_login}                         id=CC-acessoCadastro-confirmpassword                            
${button_acessar_primeiro_login}                                id=CC-acessoCadastro-register-submit
${input_email_login}                                            id=CC-acessoCadastro-login-email
${input_email_popup}                                            id=CC-login-input
${input_senha_popup}                                            id=CC-login-password-input
${input_senha_login}                                            id=CC-acessoCadastro-login-Passwd
${Button_Acessar_Login}                                         id=CC-acessoCadastro-login-submit
${button_acessar_login_modal}                                   id=CC-userLoginSubmit                                                 
${buttom_adicionar_ao_carrinho_pdp}                             id=cc-prodDetails-addToCart                                                                                                              
${text_cupom_de_desconto_carrinho}                              xpath=//h2[@class='promotion-details-title']                        
${img_produto_plp}                                              xpath=(//div[@class='button-add-cart']/../../../div[@class='product-cover']) [1]
${Button_Adicionar_PLP}                                         xpath=(//div[@class='button-add-cart'])
${Button_Adiconar_PDP}                                          id=cc-prodDetailsAddToCart
${Breadcrumb}                                                   css=#breadcrumbTrail span >> text='
${modal_pdt_add_cart}                                           xpath=//p[text()='foi adicionado com sucesso em seu carrinho']                                              
${button_ver_carrinho_plp}                                      xpath=//button[@class='button icon-gj-tick-orange']
${itens_cart}                                                   css=div[class="quantity-cart-items"]>span
${number_cart}                                                  xpath=//label[@class="number-items"]
${button_minicart}                                              css=.cart-container i
${Title_Checkout}                                               div[class='header-content'] h2[class='header-title-page']
${opt_cartao}                                                   xpath=(//ul[@class="nav nav-tabs"]/li)[1]
${opt_boleto}                                                   xpath=(//ul[@class="nav nav-tabs"]/li)[2]
${opt_pix}                                                      xpath=(//ul[@class="nav nav-tabs"]/li)[3]
${Loader}                                                       id=cc-spinner
${Loader_Galapagos}                                             css=.logo_iguana
${num_pedido}                                                   xpath=//div[@class="well"]/b
${modal_cupom_aplicado}                                         xpath=//img[@class="image-close-modal"]
${text_searchresult}                                            xpath=//div[@id="breadcrumbTrail"]//span[contains(text(),"Resultado")]
${error_cupom}                                                  id=CC-promotionDetails-promoCodeApply-error
${button_remover_cart}                                          xpath=(//div[@class="col-sm-1 col-md-1 hidden-xs product-center-row"]/a[@class="product-close"]/span)
${text_nosearch}                                                xpath=//h1[text()="Foi Mal :("]
${button_voltar_catalogo}                                       xpath=//button[@class="CC-orderSummary-continue"]
${text_titulo_PDP}                                              css=h1[class='product-title']
${title_social_media}                                           text=Acompanhe Nossas Aventuras!
${button_criar_conta}                                           id=CC-loginHeader-createAccount
${text_no_account}                                              text=Não tem uma conta?
${input_first_name_popup}                                       id=CC-userRegistration-firstname
${input_last_name_popup}                                        id=CC-userRegistration-lastname
${input_email_registration_popup}                               id=CC-userRegistration-emailAddress
${input_password_popup}                                         id=CC-userRegistration-password
${input_confirm_password}                                       id=CC-userRegistration-confirmPassword
${button_registrar_conta}                                       id=CC-userRegistrationSubmit
${title_minha_conta}                                            css=h2 >> text='Minha Conta'
${product_title_cart}                                           xpath=(//a[@class='title']) [1]
${input_name_newsletter}                                        css=input[placeholder='digite seu NOME']
${input_email_newsletter}                                       css=input[placeholder='digite seu EMAIL']
${button_receber_newsletter}                                    css=.newsletter-form-submit
${button_close_newsletter}                                      css=.modal-newsletter-button button
${link_youtube}                                                 css=.footer-social-list-item a[title='Assista no Youtube']
${text_youtube}                                                 css=#inner-header-container yt-formatted-string >> text=Galápagos
${link_instagram}                                               css=.footer-social-list-item a[title='Siga no Instagram']
${text_instagram}                                               css=h2 >> text='mundogalapagos'
${link_facebook}                                                css=.footer-social-list-item a[title='Curta no Facebook']
${text_facebook}                                                css=h1 >> text='Galápagos'
${link_twitter}                                                 css=.footer-social-list-item a[title='Siga no Twitter']
${text_twitter}                                                 css=.css-1dbjc4n.r-6gpygo.r-14gqq1x span >> text='@MundoGalapagos'
${link_linkedin}                                                css=.footer-social-list-item a[title='Acompanhe no LinkedIn']
${text_linkedin}                                                css=h1 >> text='Galápagos'
${link_entre_linkedin}                                          css=.authwall-join-form__swap-cta button
${button_entrar_linkedin}                                       css=button[type="submit"] >> text=Entrar
${input_email_linkedin}                                         id=session_key
${input_senha_linkedin}                                         id=session_password
${title_termos_e_condicoes}                                     css=#rd-text-k56ra4si strong >> text='TERMOS E CONDIÇÃO'
${button_politica_de_privacidade}                               css=.footer-list-item a[title='Política de privacidade']
${title_privacidade_e_seguranca}                                css=h1 >> text='Política de privacidade e segurança'
${button_acessorios_footer}                                     css=.footer-list-item a[title='Acessórios']
${button_cooperativo}                                           css=.footer-list-item a[title='Cooperativo']
${button_competitivo}                                           css=.footer-list-item a[title='Competitivo']
${button_quebra_cabecas}                                        css=.footer-list-item a[title='Quebra-cabeças']
${button_rpg}                                                   css=.footer-list-item a[title='RPG']
${Notificao_Header_Error}                                       css=.cc-notification-message.cc-notification-message-only.container
${Text_Bau_Itens}                                               text=Baú de itens
${Button_Ver_Itens_Bau}                                         css=a >> text='Ver meus itens em baú'
${Product_Card}                                                 xpath=(//img[@class='img-responsive product-cover-image'])[1]
${Button_Options_User}                                          css=img[alt='Exibir opções']
${Title_Historico_Pedidos}                                      text=Histórico do Pedido
${button_aceitar_cookies}                                       css=.acceptCookies
${Menu_Catalogo}                                                id=Catalogo
${Button_Close_MiniCart}                                        css=.galapagos-minicart-header .close-icon
${Logo_Sem_Resultado}                                           id=logo-sem-resultados
${title_acompanhe_nossas_aventuras}                             css=h2 >> text=Acompanhe nossas aventuras!
${Produto_Sugerido}                                             xpath=(//span[text()="
${Dropdown_Profile}                                             css=img[alt="Exibir opções"]
${Button_Meu_Perfil}                                            css=span>a[data-bind="ccLink:'profile'"]
${Text_Meus_Pedidos}                                            id=CC-customerProfile-myorders-title
${Text_Foi_Mal}                                                 css=h1 >> text="Foi Mal :("
${Input_Quantidade_Cart}                                        xpath=(//input[@class="input-quantity"]) [1]
${Button_Aumentar_Quantidade_Cart}                              xpath=(//button[@id="add-button"]) [1]
${Button_Diminuir_Quantidade_Cart}                              xpath=(//button[@id="minus-button"]) [1]
${Button_Excluir_Produto_Cart}                                  xpath=(//span[@class="remove"])
${Button_Nao_Sei_CEP_Cart}                                      css=a[title="Buscar CEP"]
${Text_Subtotal_Cart}                                           xpath=//b[text()="Subtotal"]/../span
${img_produto_cart}                                             xpath=(//img[@class="img-responsive"]) [1]
${Input_CEP_Cart}                                               id=CC-cartShippingDetails-szipcode
${Button_Calcular_CEP_Cart}                                     css=button[aria-label="Calcular"]
${Text_Erro_CEP}                                                css=p >> text=Nenhum método de entrega encontrado para o CEP informado.
${Text_Frete_Selecionado_Cart}                                  xpath=//p[@id="CC-orderSummary-shipping"]/span
${Text_Total_Cart}                                              xpath=//p[@class="order-summary-item order-summary-total"]/span
${Opcoes_Frete_Cart}                                            css=ul[class="list-shipping"]
${Button_Novo_Endereco_checkout}                                id=cc-checkout-add-address
${Button_Lista_Endereco_checkout}                               id=cc-checkout-show-address-book
${Button_Enviar_Este_Endereco}                                  css=button > span >> text=Enviar para este Endereço
${Text_Valor_Frete_Resumo}                                      id=CC-checkoutOrderSummary-shippingPrice
${Text_Total_Checkout}                                          css=#CC-checkoutOrderSummary-orderTotal span[class="ordersumprice pull-right"]
${Msg_Erro_Campos_Obrigatorios}                                 css=div[id="cc-notification-inline-0"]>div >> text=Os campos em destaque são obrigatórios
${Input_Nome_Endereco_Profile}                                  id=CC-customerProfile-sfirstname
${Container_Carrossel_Home}                                     div[class='category-area']
${Button_Filtro}                                                css=.dimension-title >> text=
${Tag_Filtro}                                                   xpath=(//span[@id='CC-overlayedGuidedNavigation-refinementCrumbText-0']//span)
${Button_Close_Tag}                                             id=CC-overlayedGuidedNavigation-refinementCrumbCloseButton-0
${Button_ordenar}                                               css=#CC-product-listing-sortby-controls .order-by-label
${Button_Proxima_Pagina}                                        css=a[rel='next']
${Button_Numero_Pagina}                                         css=#cc-paginated-controls .pageNumber >> text='2'
${MiniCart_Open}                                                css=.open .galapagos-minicart-header
${Product_Box}                                                  xpath=(//div[@class='button-add-cart']/../../../div[@class='product-cover'])
${Title_Acesso_Conta}                                           h2[class='acesso-title']
${Button_Trash_MiniCart}                                        xpath=(//button[@class='trash-icon'])
${Button_Delete_MiniCart}                                       css=.delete-button
${Text_Empty_MiniCart}                                          css=.empty-text
${MiniCart_Open}                                                css=.open .galapagos-minicart-header