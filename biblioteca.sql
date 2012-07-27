--Criando um schema de banco de dados
create schema biblioteca;

/*
Estrutura Basica tabela
CREATE TABLE schema.tabela (
  tabelaid serial not null,
  tabelacampos varchar(10) not null,
  ...
//start campos obrigatorios
  _user integer,
  _insert timestamp(0) without time zone NOT NULL DEFAULT now(),
  _update timestamp(0) without time zone NOT NULL DEFAULT now(),
  //fim campos obrigatorios  
  PRIMARY KEY("tabelaid"),
CONSTRAINT tabela_user_fk FOREIGN KEY (_user)
      REFERENCES titan._user (_id) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT
);
*/


CREATE TABLE biblioteca.autor (
  autorid serial not null,
  autornome varchar(100) not null,
  _user integer,
  _insert timestamp(0) without time zone NOT NULL DEFAULT now(),
  _update timestamp(0) without time zone NOT NULL DEFAULT now(),
  PRIMARY KEY("autorid"),
  CONSTRAINT autor_user_fk FOREIGN KEY (_user)
      REFERENCES titan._user (_id) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE biblioteca.livro (
  livroid serial not null,
  livronome varchar(100) not null,
  _autor integer not null,
  _user integer not null,
  _insert timestamp(0) without time zone NOT NULL DEFAULT now(),
  _update timestamp(0) without time zone NOT NULL DEFAULT now(),
  PRIMARY KEY("livroid"),
  CONSTRAINT livro_user_fk FOREIGN KEY (_user)
      REFERENCES titan._user (_id) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT livro_autor_fk FOREIGN KEY (_autor)
      REFERENCES biblioteca.autor (autorid) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE biblioteca.estudante (
  estudanteid serial not null,
  estudantenome varchar(100) not null,
  _user integer,
  _insert timestamp(0) without time zone NOT NULL DEFAULT now(),
  _update timestamp(0) without time zone NOT NULL DEFAULT now(),
  PRIMARY KEY("estudanteid"),
  CONSTRAINT autor_user_fk FOREIGN KEY (_user)
      REFERENCES titan._user (_id) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT
);


CREATE TABLE biblioteca.emprestimo (
  emprestimoid serial not null,
  emprestimodata date not null,
  _estudante integer not null,
  _livro integer not null,
  _user integer,
  _insert timestamp(0) without time zone NOT NULL DEFAULT now(),
  _update timestamp(0) without time zone NOT NULL DEFAULT now(),
  PRIMARY KEY("emprestimoid"),
  CONSTRAINT emprestimo_user_fk FOREIGN KEY (_user)
      REFERENCES titan._user (_id) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT emprestimo_estudante_fk FOREIGN KEY (_estudante)
      REFERENCES biblioteca.estudante (estudanteid) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT emprestimo_livro_fk FOREIGN KEY (_livro)
      REFERENCES biblioteca.livro (livroid) MATCH FULL
      ON UPDATE RESTRICT ON DELETE RESTRICT
);

