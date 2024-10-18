* Settings *
Documentation                                    Arquivo que implementa a estrutura inicial do projeto de teste
Library                                          Browser                                 run_on_failure=None
Library                                          OperatingSystem
Library                                          String
Library                                          Process
Resource                                         actions/actions_PRD.robot
Resource                                         dictionary/dictionary_PRD.robot
*** Variables ***
${BROWSER}                                       chromium
${HEADLESS}                                      ${True}
${DEFAULT_TIMEOUT}                               15
${HOME_PAGE}                                     https://www.mundogalapagos.com.br/
* Keywords *
Acessar o site
    New Browser                                  browser=${BROWSER}                      headless=${HEADLESS}
    New Page                                     url=${HOME_PAGE}
    Aceitar cookies
Encerrar teste
    Run Keyword If Test Failed                   Take Screenshot                         embed                         fullPage=True
    Close Browser
Get JSON
    [Arguments]                                  ${nome_arquivo}
    ${arquivo}                                   Get File                                ${EXECDIR}/resources/fixtures/${nome_arquivo}
    ${super_var}                                 Evaluate                                json.loads($arquivo)          json
    RETURN                                       ${super_var}