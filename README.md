## Login

O login é feito setando uma flag durante a sessão do usuário (ver home_controller). Foi criado um helper isAdmin? para as views checarem se o usuário atual é ou não admin.

## Jquery

Foi utilizado JQuery + Ajax para fazer requisições de Mostrar, Editar e criar um novo elemento das tabelas.
Assim, o usuário permanece na mesma página da tabela, e um popup é aberto ao invés de navegar para outra página.
O código está em app/javascripts/controllers/table_controller.js

## Testes

Apesar de criar casos de testes para modelos, não consegui executar o rake. Ao executar rake test obtenho Segmentation Fault, tanto nas máquina do departamento como na minha maquina pessoal.

## CSS

Foi utilizado o framework TailwindCSS com o plugin DaisyUI para estilizar as páginas.
