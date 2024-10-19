* Settings *
Resource                                         ../resources/base_PRD.robot                
Test Setup                                       Acessar o site
Test Teardown                                    Encerrar teste
* Test Cases *
1
    [Tags]                                       001- Realizar compra via página de categoria, com novo usuário no checkout e pagamento via cartão
    ${dados}                                     Get JSON                                          massa_dados_PRD.json
    FOR  ${categoria}  IN                        @{dados["tc1"]["categorias"]}
      Acessar a categoria                        ${categoria["categoria"]}
      Adicionar produto no carrinho              PLP                                               1
    END
    Acessar página do carrinho
    Acessar página do checkout
    Cadastrar novo usuário                        ${dados["tc1"]}
    Cadastrar novo endereço                      ${dados["tc1"]}
    Ir para pagamento
    Selecionar pagamento                         ${dados["tc1"]}
2
    [Tags]                                       002- Realizar compra via página do produto, com usuário existente no checkout e pagamento parcelado em 2x via cartão
    ${dados}                                     Get JSON                                          massa_dados_PRD.json
    FOR  ${categoria}  IN                        @{dados["tc2"]["categorias"]}
      Acessar a categoria                        ${categoria["categoria"]}
      Acessar PDP 
      Adicionar produto no carrinho              PDP                                               1
    END
    Acessar página do carrinho
    Acessar página do checkout
    Logar com usuário existente                  ${dados["tc2"]}                         Checkout
    Ir para pagamento
    Selecionar pagamento                         ${dados["tc2"]}
3
    [Tags]                                       003- Realizar compra via página de categoria, com usuário existente no início e pagamento via cartão
    ${dados}                                     Get JSON                                          massa_dados_PRD.json
    Acessar página de login
    Logar com usuário existente                  ${dados["tc3"]}                         Inicio
    Limpar MiniCart
    FOR  ${categoria}  IN                        @{dados["tc3"]["categorias"]}
      Acessar a categoria                        ${categoria["categoria"]}
      Adicionar produto no carrinho              PLP                                     1
    END
    Acessar página do carrinho
    Acessar página do checkout
    Ir para pagamento
    Selecionar pagamento                         ${dados["tc3"]}
4
    [Tags]                                       004- Realizar compra via página de busca e categorias, com novo usuário no início e pagamento via PIX
    ${dados}                                     Get JSON                                          massa_dados_PRD.json
    Acessar página de login
    Cadastrar novo usuário                        ${dados["tc4"]}
    Aceitar cookies
    FOR  ${categoria}  IN                        @{dados["tc4"]["categorias"]}
      Acessar a categoria                        ${categoria["categoria"]}
      Adicionar produto no carrinho              PLP                                     1
    END
    FOR  ${produto}  IN                          @{dados["tc4"]["produtos"]}
      Busca no search                            ${produto["produto"]}
     Adicionar produto no carrinho               PLP                                     1
    END
    Acessar página do carrinho
    Acessar página do checkout
    Cadastrar novo endereço                      ${dados["tc4"]}
    Ir para pagamento
    Selecionar pagamento                         ${dados["tc4"]}
5
    [Tags]                                       005- Realizar compra via página de busca, com usuário existente no início e pagamento via boleto
    ${dados}                                     Get JSON                                          massa_dados_PRD.json
    Acessar página de login
    Logar com usuário existente                  ${dados["tc5"]}                         Inicio
    Limpar MiniCart
    FOR  ${produto}  IN                          @{dados["tc5"]["produtos"]}
      Busca no search                            ${produto["produto"]}
      Adicionar produto no carrinho              PLP                                     1
    END
    Acessar página do carrinho
    Acessar página do checkout
    Ir para pagamento
    Selecionar pagamento                         ${dados["tc5"]}
6
    [Tags]                                       006- Realizar compra via página do produto, com usuário existente no início e pagamento via boleto
    ${dados}                                     Get JSON                                          massa_dados_PRD.json
    FOR  ${categoria}  IN                        @{dados["tc6"]["categorias"]}
      Acessar a categoria                        ${categoria["categoria"]}
      Acessar PDP
      Adicionar produto no carrinho              PDP                                     1
    END
    Acessar página do carrinho
    Acessar página do checkout
    Logar com usuário existente                  ${dados["tc6"]}                         Checkout
    Ir para pagamento
    Selecionar pagamento                         ${dados["tc6"]}