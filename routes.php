<?php
require_once __DIR__ . '/Controllers/AuthController.php';
require_once __DIR__ . '/Controllers/UsuariosController.php';
require_once __DIR__ . '/Middleware/auth.php';

$controller = $_GET['controller'] ?? 'auth';
$action = $_GET['action'] ?? 'login';

switch($controller){
    case ' auth':
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
    
} 
    echo "<h1>AtendeLab</h1>";
    echo "<h3>Projeto Execução. Use ?controller=Usuarios&action=listar para ver os usuarios</h3>";
}