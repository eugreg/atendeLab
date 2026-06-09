<?php

if(session_status() === PHP_SESSION_NONE){
    session_start()
}

function usuarioAutenticado():boll {
    return isset($_SESSION['usuario']) && is_array($_SESSION['usuario'])
}

function exigirAutenticacao():void {
    if(!usuarioAutenticado()){
        $_SESSION['mensagem'] =
            'Faca login para acessar a aerea restrita.';

        header('Location: ?controller=auth&action=login');
        exit;    
    }
}

function usuarioAtual(): ?array{
    return $_SESSION['usuario'] ?? null;
}