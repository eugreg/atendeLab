<?php
require_once __DIR__ . '/Controllers/UsuariosController.php';

$controller = $_GET['controller'] ?? 'home';
$action = $_GET['action'] ?? 'index';

if ($controller == 'Usuarios') {
    $UsuariosController = new UsuariosController();

    switch ($action) {
        case "listar":
            $UsuariosController->listar();
            break;
        case "buscar":
            $UsuariosController->findById();
            break;
        case "criar":
            $UsuariosController->criar();
            break;
        case "atualizar":
            $UsuariosController->atualizar();
            break;
        case "excluir":
            $UsuariosController->delete();
            break;
        default:
            echo "Ação não Existente";
            break;
    }
} else {
    echo "<h1>AtendeLab</h1>";
    echo "<h3>Projeto Execução. Use ?controller=Usuarios&action=listar para ver os usuarios</h3>";
}