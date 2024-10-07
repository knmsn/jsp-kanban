<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt_br">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Kanban Board</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dragula/3.7.2/dragula.min.js"></script>
    <script src="https://server.chhjny.com/jkanban/jkanban.min.js"></script>

    <style>
        body {
            margin-top: 20px;
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
<main class="content">
    <div class="container-fluid p-0">
        <h1 class="h3 mb-3" style="margin-left: 70px">Kanban Board</h1>

        <div class="kanban-container">
        <div class="col-12 col-lg-4 col-xl-2">
                                    <div class="card card-border-primary">
                                        <div class="card-header">
                                            <div class="card-actions float-right">
                                                <div class="dropdown show">
                                                    <a href="#" data-toggle="dropdown" data-display="static">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                                            <circle cx="12" cy="12" r="1"></circle>
                                                            <circle cx="19" cy="12" r="1"></circle>
                                                            <circle cx="5" cy="12" r="1"></circle>
                                                        </svg>
                                                    </a>

                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Another action</a>
                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <h5 class="card-title">Planejado</h5>
                                            <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="card mb-3 bg-light">
                                                <div class="card-body p-3">
                                                    <div class="float-right mr-n2">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </div>
                                                    <p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</p>
                                                    <div class="float-right mt-n1">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar6.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                                    </div>
                                                    <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                                                </div>
                                            </div>
                                            <a href="#" class="btn btn-primary btn-block">Add new</a>
                                        </div>
                                    </div>
                                </div>
            <div class="col-12 col-lg-4 col-xl-2">
                <div class="card card-border-primary">
                    <div class="card-header">
                        <div class="card-actions float-right">
                            <div class="dropdown show">
                                <a href="#" data-toggle="dropdown" data-display="static">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                        <circle cx="12" cy="12" r="1"></circle>
                                        <circle cx="19" cy="12" r="1"></circle>
                                        <circle cx="5" cy="12" r="1"></circle>
                                    </svg>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h5 class="card-title">Em análise</h5>
                        <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                    </div>
                    <div class="card-body p-3">
                        <div class="card mb-3 bg-light">
                            <div class="card-body p-3">
                                <div class="float-right mr-n2">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-label"></span>
                                    </label>
                                </div>
                                <p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</p>
                                <div class="float-right mt-n1">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar4.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                </div>
                                <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                            </div>
                        </div>
                        <a href="#" class="btn btn-primary btn-block">Add new</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 col-xl-2">
                <div class="card card-border-primary">
                    <div class="card-header">
                        <div class="card-actions float-right">
                            <div class="dropdown show">
                                <a href="#" data-toggle="dropdown" data-display="static">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                        <circle cx="12" cy="12" r="1"></circle>
                                        <circle cx="19" cy="12" r="1"></circle>
                                        <circle cx="5" cy="12" r="1"></circle>
                                    </svg>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h5 class="card-title">Análise Realizada</h5>
                        <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                    </div>
                    <div class="card-body">

                        <div class="card mb-3 bg-light">
                            <div class="card-body p-3">
                                <div class="float-right mr-n2">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-label"></span>
                                    </label>
                                </div>
                                <p>Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada.</p>
                                <div class="float-right mt-n1">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                </div>
                                <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                            </div>
                        </div>

                        <a href="#" class="btn btn-primary btn-block">Add new</a>

                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 col-xl-2">
                <div class="card card-border-success">
                    <div class="card-header">
                        <div class="card-actions float-right">
                            <div class="dropdown show">
                                <a href="#" data-toggle="dropdown" data-display="static">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                        <circle cx="12" cy="12" r="1"></circle>
                                        <circle cx="19" cy="12" r="1"></circle>
                                        <circle cx="5" cy="12" r="1"></circle>
                                    </svg>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h5 class="card-title">Análise Aprovada</h5>
                        <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                    </div>
                    <div class="card-body">

                        <div class="card mb-3 bg-light">
                            <div class="card-body p-3">
                                <div class="float-right mr-n2">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-label"></span>
                                    </label>
                                </div>
                                <p>In hac habitasse platea dictumst. Curabitur at lacus ac velit ornare lobortis. Curabitur a felis tristique.</p>
                                <div class="float-right mt-n1">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                </div>
                                <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                            </div>
                        </div>

                        <a href="#" class="btn btn-primary btn-block">Add new</a>

                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 col-xl-2">
                <div class="card card-border-primary">
                    <div class="card-header">
                        <div class="card-actions float-right">
                            <div class="dropdown show">
                                <a href="#" data-toggle="dropdown" data-display="static">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                        <circle cx="12" cy="12" r="1"></circle>
                                        <circle cx="19" cy="12" r="1"></circle>
                                        <circle cx="5" cy="12" r="1"></circle>
                                    </svg>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h5 class="card-title">Iniciado</h5>
                        <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                    </div>
                    <div class="card-body">
                        <div class="card mb-3 bg-light">
                            <div class="card-body p-3">
                                <div class="float-right mr-n2">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-label"></span>
                                    </label>
                                </div>
                                <p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</p>
                                <div class="float-right mt-n1">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                </div>
                                <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                            </div>
                        </div>
                        <a href="#" class="btn btn-primary btn-block">Add new</a>
                    </div>
                </div>
            </div>

                        <div class="col-12 col-lg-4 col-xl-2">
                                        <div class="card card-border-primary">
                                            <div class="card-header">
                                                <div class="card-actions float-right">
                                                    <div class="dropdown show">
                                                        <a href="#" data-toggle="dropdown" data-display="static">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                                                <circle cx="12" cy="12" r="1"></circle>
                                                                <circle cx="19" cy="12" r="1"></circle>
                                                                <circle cx="5" cy="12" r="1"></circle>
                                                            </svg>
                                                        </a>

                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="#">Action</a>
                                                            <a class="dropdown-item" href="#">Another action</a>
                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h5 class="card-title">Em Andamento</h5>
                                                <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="card mb-3 bg-light">
                                                    <div class="card-body p-3">
                                                        <div class="float-right mr-n2">
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </div>
                                                        <p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</p>
                                                        <div class="float-right mt-n1">
                                                            <img src="https://bootdey.com/img/Content/avatar/avatar6.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                                        </div>
                                                        <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                                                    </div>
                                                </div>
                                                <a href="#" class="btn btn-primary btn-block">Add new</a>
                                            </div>
                                        </div>
                                    </div>

<div class="col-12 col-lg-4 col-xl-2">
                <div class="card card-border-success">
                    <div class="card-header">
                        <div class="card-actions float-right">
                            <div class="dropdown show">
                                <a href="#" data-toggle="dropdown" data-display="static">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                        <circle cx="12" cy="12" r="1"></circle>
                                        <circle cx="19" cy="12" r="1"></circle>
                                        <circle cx="5" cy="12" r="1"></circle>
                                    </svg>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h5 class="card-title">Encerrado</h5>
                        <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                    </div>
                    <div class="card-body">
                        <div class="card mb-3 bg-light">
                            <div class="card-body p-3">
                                <div class="float-right mr-n2">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-label"></span>
                                    </label>
                                </div>
                                <p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</p>
                                <div class="float-right mt-n1">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                </div>
                                <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                            </div>
                        </div>
                        <a href="#" class="btn btn-primary btn-block">Add new</a>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-4 col-xl-2">
                            <div class="card card-border-danger">
                                <div class="card-header">
                                    <div class="card-actions float-right">
                                        <div class="dropdown show">
                                            <a href="#" data-toggle="dropdown" data-display="static">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                                    <circle cx="12" cy="12" r="1"></circle>
                                                    <circle cx="19" cy="12" r="1"></circle>
                                                    <circle cx="5" cy="12" r="1"></circle>
                                                </svg>
                                            </a>

                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <h5 class="card-title">Cancelado</h5>
                                    <h6 class="card-subtitle text-muted">Nam pretium turpis et arcu. Duis arcu tortor.</h6>
                                </div>
                                <div class="card-body">
                                    <div class="card mb-3 bg-light">
                                        <div class="card-body p-3">
                                            <div class="float-right mr-n2">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input">
                                                    <span class="custom-control-label"></span>
                                                </label>
                                            </div>
                                            <p>Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.</p>
                                            <div class="float-right mt-n1">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar6.png" width="32" height="32" class="rounded-circle" alt="Avatar">
                                            </div>
                                            <a class="btn btn-outline-primary btn-sm" href="#">View</a>
                                        </div>
                                    </div>
                                    <a href="#" class="btn btn-primary btn-block">Add new</a>
                                </div>
                            </div>
                        </div>


        </div>

    </div>
</main>
</body>
</html>
