# LeetCode em Go com `leetgo`

Workspace local para resolver problemas do LeetCode em Go usando [`leetgo`](https://github.com/j178/leetgo).

## Estrutura

- `leetgo.yaml`: configuração principal do `leetgo` para este workspace.
- `go/`: pasta onde o `leetgo` gera as soluções.
- `go/0001.two-sum/`: exemplo de problema já gerado.
  - `solution.go`: código da solução.
  - `testcases.txt`: casos de teste locais.
  - `question.md`: enunciado salvo localmente.

## Por que `leetgo`

O `leetgo` é a ferramenta Go mais completa que encontrei para esse fluxo. Ele:

- gera o esqueleto da solução;
- baixa enunciado e casos de teste;
- roda teste local com o binário gerado;
- integra com cookies da sua conta LeetCode para buscar problemas e submeter respostas.

Existem outras opções em Go para resolver problemas do LeetCode, mas elas costumam ser bibliotecas menores de utilitários ou repositórios de soluções. Para o fluxo de praticar localmente, gerar arquivos e testar, o `leetgo` é a peça central deste setup.

## Suporte por linguagem

O `leetgo` funciona com várias linguagens, mas existe uma diferença importante entre:

- gerar código/template para a linguagem;
- rodar teste local com `-L`.

Em geral, as linguagens mais interessantes para esse fluxo são:

- Go
- Python
- C++
- Rust

Essas aparecem com suporte mais forte para geração e teste local. Outras linguagens podem até gerar skeleton code, mas nem sempre têm local testing completo.

### Exemplos

```bash
leetgo init -t us -l go
leetgo init -t us -l python3
leetgo init -t us -l cpp
leetgo init -t us -l rust
```

## Multi-workspace

Se você quiser usar mais de uma linguagem, o jeito mais limpo é separar por workspace:

- `~/code/leetgo-go`
- `~/code/leetgo-python`
- `~/code/leetgo-cpp`
- `~/code/leetgo-rust`

Isso evita misturar `go.mod`, ambiente Python, build de C++ e artefatos gerados por cada linguagem.

## Setup

### 1. Instalar o `leetgo`

```bash
go install github.com/j178/leetgo@latest
```

### 2. Garantir o `PATH`

No seu ambiente, o Go instalou o binário em:

```bash
$(go env GOPATH)/bin
```

Se `leetgo` aparece como `command not found`, o problema normalmente é só o diretório do binário fora do `PATH`.

Adicione isto ao seu shell:

```bash
export PATH="$(go env GOPATH)/bin:$PATH"
```

Se quiser persistir:

```bash
echo 'export PATH="$(go env GOPATH)/bin:$PATH"' >> ~/.bashrc
```

ou, se usar Zsh:

```bash
echo 'export PATH="$(go env GOPATH)/bin:$PATH"' >> ~/.zshrc
```

## Uso

### Inicializar o workspace

```bash
leetgo init -t us -l go
```

Isso cria/atualiza a configuração local e prepara o diretório do projeto.

### Pegar um problema

```bash
leetgo pick 1
```

Você também pode usar slug ou data, por exemplo `two-sum` ou `today`.

### Testar localmente

```bash
leetgo test last -L
```

Esse é o teste local/offline:

- usa o `testcases.txt` gerado no projeto;
- compila e executa o código localmente;
- não depende de submeter na LeetCode.

### Testar com comportamento remoto

```bash
leetgo test last
```

Sem `-L`, o `leetgo` pode buscar o resultado esperado na LeetCode usando a autenticação configurada.

### Submeter

```bash
leetgo submit last
```

### Abrir a solução

```bash
leetgo edit last
```

## Autenticação

O `leetgo` lê cookies do navegador por padrão neste workspace, conforme `leetgo.yaml`.

Se a leitura automática falhar, você pode configurar cookies manualmente ou ajustar o navegador usado.

## Fluxo recomendado

1. `make setup`
2. `make init`
3. `make pick ID=1`
4. editar `go/<id>/solution.go`
5. `make test-local`
6. `make submit`

## Comandos úteis

```bash
make help
make setup
make init
make pick ID=1
make test-local
make test-remote
make submit
make edit
make init-go
make init-python
make init-cpp
make init-rust
make pick-go ID=1
make pick-python ID=1
make pick-cpp ID=1
make pick-rust ID=1
make test-local-go
make test-local-python
make test-local-cpp
make test-local-rust
make submit-go
make submit-python
make submit-cpp
make submit-rust
make edit-go
make edit-python
make edit-cpp
make edit-rust
make open-go
make open-python
make open-cpp
make open-rust
```

## Make targets por linguagem

Os alvos por linguagem seguem o mesmo padrão:

- `init-<lang>` cria o workspace com a linguagem escolhida;
- `pick-<lang>` gera um problema para aquela linguagem;
- `test-local-<lang>` roda o caso local com `-L`;
- `test-remote-<lang>` roda o teste sem `-L`;
- `submit-<lang>` submete a solução;
- `edit-<lang>` abre a solução;
- `open-<lang>` abre a página do problema.

Para este repo, as linguagens mais úteis continuam sendo:

- Go
- Python
- C++
- Rust

Observação: `test-local-<lang>` só funciona de forma completa nas linguagens que o `leetgo` suporta para teste local. Se a linguagem não tiver suporte local, use `test-remote-<lang>`.
