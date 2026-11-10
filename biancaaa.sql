
use saep_simulado;

-- Tabela de usuarios
create table usuarios (
id_usuario int auto_increment primary key,
nome varchar(100) not null,
email varchar(150) not null unique,
senha varchar(255) not null
);

-- Tabela de equipamentos
create table equipamentos (
id_equipamento int auto_increment primary key,
nome varchar(100) not null,
setor varchar(100) not null
);

-- Tabela de chamadas
create table chamadas (
id_chamada int auto_increment primary key,
id_usuario int not null,
id_equipamento int not null,
descricao text not null,
    prioridade ENUM('Baixa', 'Média', 'Alta') NOT NULL,
    status ENUM('Aberto', 'Em andamento', 'Concluído')
	   NOT NULL DEFAULT 'Aberto',
	data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_usuario)
	  REFERENCES usuarios(id_usuario),
      
	FOREIGN KEY (id_equipamento)
      REFERENCES equipamentos(id_equipamentos)
);
