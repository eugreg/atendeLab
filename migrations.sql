
CREATE TABLE IF NOT EXISTS `pessoas` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `documento` VARCHAR(20) NOT NULL UNIQUE,
    `telefone` VARCHAR(20) NULL,
    `curso` VARCHAR(100) NULL,
    `periodo` VARCHAR(100) NULL,
    `status` VARCHAR(100) NOT NULL DEFAULT 'ativo',
    PRIMARY KEY (`id`),
    INDEX `idx_pessoas_documento` (`documento`),
    INDEX `idx_pessoas_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 
CREATE TABLE IF NOT EXISTS `tipos_atendimentos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` TEXT NULL,
    `status` ENUM('ativo', 'inativo') NOT NULL DEFAULT 'ativo',
    PRIMARY KEY (`id`),
    INDEX `idx_tipos_atendimentos_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 
CREATE TABLE IF NOT EXISTS `usuarios` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `senha` VARCHAR(255) NOT NULL,
    `perfil` ENUM('admin', 'atendente', 'usuario') NOT NULL DEFAULT 'usuario',
    `status` ENUM('ativo', 'inativo') NOT NULL DEFAULT 'ativo',
    `criado_em` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_usuarios_email` (`email`),
    INDEX `idx_usuarios_status` (`status`),
    INDEX `idx_usuarios_perfil` (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `atendimentos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `pessoa_id` INT NOT NULL,
    `tipo_atendimento` INT NOT NULL,
    `usuario_id` INT NOT NULL,
    `data_atendimento` DATE NOT NULL,
    `hora_atendimento` TIME NOT NULL,
    `descricao` TEXT NULL,
    `observacao` TEXT NULL,
    `status` ENUM('agendado', 'em_andamento', 'concluido', 'cancelado') NOT NULL DEFAULT 'agendado',
    `criado_em` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_atendimentos_pessoa` (`pessoa_id`),
    INDEX `idx_atendimentos_tipo` (`tipo_atendimento`),
    INDEX `idx_atendimentos_usuario` (`usuario_id`),
    INDEX `idx_atendimentos_data` (`data_atendimento`),
    INDEX `idx_atendimentos_status` (`status`),
    CONSTRAINT `fk_atendimentos_pessoa`
        FOREIGN KEY (`pessoa_id`)
        REFERENCES `pessoas` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT `fk_atendimentos_tipo`
        FOREIGN KEY (`tipo_atendimento`)
        REFERENCES `tipos_atendimentos` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT `fk_atendimentos_usuario`
        FOREIGN KEY (`usuario_id`)
        REFERENCES `usuarios` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

