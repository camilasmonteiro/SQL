CREATE TABLE [CodigoQualificacaoAssinante](
    [ID_CODIGO] INT IDENTITY (1,1) NOT NULL,
    [ID] [varchar] (5) NOT NULL,
    [DESCRICAO] [varchar] (255) NOT NULL
)

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (001, 'Signatário da ECD com e-CNPJ ou e-PJ');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (203, 'Diretor');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO)
VALUES (204, 'Conselheiro de Administração');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (205, 'Administrador');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (206, 'Administrador do Grupo');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (207, 'Administrador de Sociedade Filiada');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (220, 'Administrador Judicial – Pessoa Física');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (222, 'Administrador Judicial – Pessoa Jurídica - Profissional Responsável');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (223, 'Administrador Judicial/Gestor');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (226, 'Gestor Judicial');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (309, 'Procurador');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (312, 'Inventariante');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (313, 'Liquidante');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (315, 'Interventor');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (801, 'Empresário');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (900, 'Contador');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (910, 'Contador/Contabilista responsável pelo termo de verificação para fins de substituição da ECD');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (920, 'Auditor independente responsável pelo termo de verificação para fins de substituição da ECD');

INSERT INTO CodigoQualificacaoAssinante(ID, DESCRICAO) 
VALUES (999, 'Outros')
