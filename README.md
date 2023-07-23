# Aplicação Rails

Trabalho desenvolvido para a disciplina de Programação Web, do curso de Ciência da Computação da Universidade Federal do Paraná. A aplicação escolhida foi um editor de tabelas de um banco de dados.

- Deve Utilizar o framework rails.
- As views devem inserir, retirar e excluir elementos das tabelas, observando as relações 1x1, 1xn, nxn.
- Deve haver uma tela de login, e o uso de dois tipos de usuário: o administrador (por exemplo para incluir, alterar e excluir novos registros no BD) e usuários (para consultar estes registros). Usuários não podem incluir, alterar e excluir elementos.

## Instalação

Após clonar o repositório, execute os seguintes comandos:

```bash
bundle install
npm install
rails db:migrate
rails db:seed
```

## Execução

Para executar o servidor, execute o comando:

```bash
./bin/dev
```

O servidor estará rodando em localhost:3000

## Detalhes da implementação

### Login

O login é feito setando uma flag durante a sessão do usuário (ver home_controller). Foi criado um helper isAdmin? para as views checarem se o usuário atual é ou não admin.

### Jquery

Foi utilizado JQuery + Ajax para fazer requisições de Mostrar, Editar e criar um novo elemento das tabelas.
Assim, o usuário permanece na mesma página da tabela, e um popup é aberto ao invés de navegar para outra página.
O código está em app/javascripts/controllers/table_controller.js

### Testes

Apesar de criar casos de testes para modelos, não consegui executar o rake. Ao executar rake test obtenho Segmentation Fault, tanto nas máquina do departamento como na minha maquina pessoal.

### CSS

Foi utilizado o framework TailwindCSS com o plugin DaisyUI para estilizar as páginas.
