<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt_br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Meus Projetos</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dragula/3.7.2/dragula.min.js"></script>
    <script src="https://server.chhjny.com/jkanban/jkanban.min.js"></script>

 <script>
        $(document).ready(function() {
            fetchData()

           $.ajax({
               url: 'http://localhost:9000/api/pessoas',
               type: 'GET',
               data: {  },
               success: function(response) {
                   var gerenteSelect = $('#gerente');

                   gerenteSelect.empty().append('<option value="">Selecione um gerente</option>');

                   response.forEach(function(gerente) {
                       gerenteSelect.append(
                           $('<option>', {
                               value: gerente.id,
                               text: gerente.nome
                           })
                       );
                   });
               },
               error: function(xhr, status, error) {
                   console.log('Erro: ' + error);
               }
           });
        });


function formatDate(dateString) {
    if (!dateString) return 'N/A';

    const dateParts = dateString.split('-');
    if (dateParts.length !== 3) return 'N/A';

    const day = dateParts[2].padStart(2, '0');
    const month = dateParts[1].padStart(2, '0');
    const year = dateParts[0]; // Ano

    return day + '/' + month + '/' + year;
}

function fetchData() {
    $.ajax({
        url: 'http://localhost:9000/api/projetos',
        type: 'GET',
        success: function(response) {
            $('table tbody').empty();

            response.forEach(function(projeto) {
                let row = '<tr>';
                row += '<td>' + (projeto.nome || 'N/A') + '</td>';
                row += '<td>' + formatDate(projeto.dataInicio) + '</td>';
                row += '<td>' + formatDate(projeto.dataPrevisaoFim) + '</td>';
                row += '<td>' + formatDate(projeto.dataFim) + '</td>';
                row += '<td>' + (projeto.descricao || 'N/A') + '</td>';
                row += '<td>' + (projeto.status || 'N/A') + '</td>';
                row += '<td>' + (projeto.orcamento || 'N/A') + '</td>';
                row += '<td>' + (projeto.risco || 'N/A') + '</td>';

                let gerenteNome = (projeto.gerente && projeto.gerente.nome) ? projeto.gerente.nome : 'N/A';
                row += '<td>' + gerenteNome + '</td>';

                row += '<td>';
                row += '<button class="btn btn-danger" style="margin-left: 15px" onclick="deleteProject(' + projeto.id + ')">Deletar</button>';
                row += '</td>';

                row += '</tr>';

                $('table tbody').append(row);
            });
        },
        error: function(xhr, status, error) {
            console.log('Erro: ' + error);
        }
    });
}

function deleteProject(id){
$.ajax({
                   url: 'http://localhost:9000/api/projetos/'+id,
                   type: 'DELETE',
                   contentType: 'application/json',
                   data: {},
                   success: function(response) {
                       fetchData()
                   },
                   error: function(xhr, status, error) {
                       alert('O projeto não pode ser deletado.');
                   }
               });
}

   function submitForm() {
           const form = document.getElementById('projetoForm');
           if (form.checkValidity()) {
               const projetoData = {
                   nome: $('#nome').val(),
                   dataInicio: $('#dataInicio').val(),
                   dataPrevisaoFim: $('#dataPrevisaoFim').val(),
                   dataFim: $('#dataFim').val(),
                   descricao: $('#descricao').val(),
                   status: $('#status').val(),
                   orcamento: parseFloat($('#orcamento').val()),
                   risco: $('#risco').val(),
                   gerente: {
                       id: $('#gerente').val()
                   }
               };

               $.ajax({
                   url: 'http://localhost:9000/api/projetos',
                   type: 'POST',
                   contentType: 'application/json',
                   data: JSON.stringify(projetoData),
                   success: function(response) {
                       fetchData()
                       $('#projetoModal').modal('hide');
                       form.reset();
                   },
                   error: function(xhr, status, error) {
                       console.error('Erro ao criar projeto:', error);
                   }
               });
           } else {
               form.reportValidity();
           }
       }
    </script>

    <style>
        body {
            background: #fafafa;
        }

        .card {
            margin-bottom: 1.5rem;
            box-shadow: 0 .25rem .5rem rgba(0, 0, 0, .025);
        }

        .card-border-primary {
            border-top: 4px solid #2979ff;
        }

        .card-border-secondary {
            border-top: 4px solid #efefef;
        }

        .card-border-success {
            border-top: 4px solid #00c853;
        }

        .card-border-info {
            border-top: 4px solid #3d5afe;
        }

        .card-border-warning {
            border-top: 4px solid #ff9100;
        }

        .card-border-danger {
            border-top: 4px solid #ff1744;
        }

        .card-border-light {
            border-top: 4px solid #f8f9fa;
        }

        .card-border-dark {
            border-top: 4px solid #6c757d;
        }

        .card-header {
            border-bottom-width: 1px;
        }

        .card-actions a {
            color: #495057;
            text-decoration: none;
        }

        .card-actions svg {
            width: 16px;
            height: 16px;
        }

        .card-title {
            font-weight: 500;
            margin-top: .1rem;
        }

        .card-subtitle {
            font-weight: 400;
        }

        .kanban-container {
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            margin: 50px;
            min-height: 150vh;
        }

        .kanban-column {
            flex: 1;
            min-width: 300px;
            margin-right: 1rem;
        }

        /* Firefox (uncomment to work in Firefox, although other properties will not work!)  */
        /** {
          scrollbar-width: thin;
          scrollbar-color: #397524 #DFE9EB;
        }*/

        /* Chrome, Edge and Safari */
        *::-webkit-scrollbar {
          height: 10px;
          width: 10px;
        }
        *::-webkit-scrollbar-track {
          border-radius: 5px;
          background-color: #DFE9EB;
        }

        *::-webkit-scrollbar-track:hover {
          background-color: #B8C0C2;
        }

        *::-webkit-scrollbar-track:active {
          background-color: #B8C0C2;
        }

        *::-webkit-scrollbar-thumb {
          border-radius: 5px;
          background-color: #397524;
        }

        *::-webkit-scrollbar-thumb:hover {
          background-color: #62A34B;
        }

        *::-webkit-scrollbar-thumb:active {
          background-color: #62A34B;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="#">
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" width="30" height="30" class="d-inline-block align-top" alt="">
    Meu gerenciador de projetos
  </a>
</nav>
<main style="margin: 50px">
<h1 class="h3 mb-3">Meus Projetos</h1>
<a class="btn btn-primary btn-block" style="max-width:150px;font-weight:bold" data-toggle="modal" data-target="#projetoModal">Criar Projeto</a>
    <div class="modal fade" id="projetoModal" tabindex="-1" role="dialog" aria-labelledby="projetoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="projetoModalLabel">Projeto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="projetoForm">
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input type="text" class="form-control" id="nome" name="nome" required>
                        </div>
                        <div class="form-group">
                            <label for="dataInicio">Data de Início</label>
                            <input type="date" class="form-control" id="dataInicio" name="dataInicio" required>
                        </div>
                        <div class="form-group">
                            <label for="dataPrevisaoFim">Data de Previsão de Fim</label>
                            <input type="date" class="form-control" id="dataPrevisaoFim" name="dataPrevisaoFim" required>
                        </div>
                        <div class="form-group">
                            <label for="dataFim">Data de Fim</label>
                            <input type="date" class="form-control" id="dataFim" name="dataFim">
                        </div>
                        <div class="form-group">
                            <label for="descricao">Descrição</label>
                            <textarea class="form-control" id="descricao" name="descricao" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">Selecione um status</option>
                                <option value="EM_ANALISE">Em Análise</option>
                                <option value="ANALISE_REALIZADA">Análise Realizada</option>
                                <option value="ANALISE_APROVADA">Análise Aprovada</option>
                                <option value="INICIADO">Iniciado</option>
                                <option value="PLANEJADO">Planejado</option>
                                <option value="EM_ANDAMENTO">Em Andamento</option>
                                <option value="ENCERRADO">Encerrado</option>
                                <option value="CANCELADO">Cancelado</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="orcamento">Orçamento</label>
                            <input type="number" class="form-control" id="orcamento" name="orcamento" step="0.01">
                        </div>
                        <div class="form-group">
                            <label for="risco">Risco</label>
                            <select class="form-control" id="risco" name="risco" required>
                            <option value="">Selecione um risco</option>
                            <option value="Baixo Risco">Baixo Risco</option>
                            <option value="Medio Risco">Medio Risco</option>
                            <option value="Alto Risco">Alto Risco</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="gerente">Gerente</label>
                            <select class="form-control" id="gerente" name="gerente" required>
                                <option value="">Selecione um gerente</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="submitForm()">Salvar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<table class="table"  style="margin-right: 30px;margin-top: 30px;background-color:white">
  <thead>
    <tr>
      <th scope="col">Nome</th>
      <th scope="col">Data Inicio</th>
      <th scope="col">Data Previsão Fim</th>
      <th scope="col">Data Fim</th>
      <th scope="col">Descrição</th>
      <th scope="col">Status</th>
      <th scope="col">Orçamento</th>
      <th scope="col">Risco</th>
      <th scope="col">Gerente</th>
      <th scope="col">Ações</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</main>
</body>
</html>
