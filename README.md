# Projeto de Automação de Testes para E-commerce

Este repositório contém o projeto de automação de testes desenvolvido para um site de e-commerce, focado em garantir a qualidade e funcionalidade da plataforma.

## Tecnologias Utilizadas

No projeto de automação de testes, foi utilizado o **Robot Framework** com as seguintes bibliotecas:

- **Library Browser**: Para automação de testes de interface web usando navegadores modernos.
- **Library OperatingSystem**: Para interagir com o sistema operacional, como manipulação de arquivos e diretórios.
- **Library String**: Para manipulação e verificação de strings dentro dos testes.
- **Library Process**: Para execução de processos externos, como comandos do sistema ou scripts auxiliares.

## Funcionalidades Testadas
- Fluxo completo de compras (desde o login até a finalização da compra).
- Adição e remoção de produtos no carrinho.
- Validação de formas de pagamento.

## Execução dos Testes

### Execução Individual de Testes

Para executar um teste individual, utilize o seguinte comando, onde `1` é o nome do caso de teste específico e `241019` é a data:

```bash
robot -d ./logs/PRD/20241019/1 -s "regressao_PRD" -t 1 tests
```

### Execução de Todos os Testes
Para executar todos os testes, utilize o comando abaixo, onde 241019 é a data atual:

```bash
robot -d ./logs/PRD/20241019 -s "regressao_PRD" tests
```

