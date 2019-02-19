"'---SQL NOVO 501---'"

INSERT INTO [Movimento Contabil] ( Contador, Data, [Conta Credito], Valor, Historico, [Centro de Custo], Origem, Usuario, CtaPartOrigem, CtaPartIdOrigem, [Data da Gravação] )
SELECT [Parcelas de Titulos a pagar].IdtabTransações, [Parcelas de Titulos a pagar].Pagamento, [PagtoEntreEmpresasPassivo] & "-" & [Devedor] & "-" & [Credor] AS Cr, Round((([Valor]-[Desconto]+[multa]+[Juros]+[Correção]-[Ret])*[Fração]),2) AS Vlrw,"{" & [Obras_1].[Sigla] & "} pagando titulo da {" & [Obras].[Sigla] & "} Id." & [Titulos a pagar].[IdTitulos] & "/" & [Parcelas de Titulos a Pagar].[Parcela] & " " & [Tipos de Documento].[Sigla] & " " & [Titulos a Pagar].[Documento] AS Hist, [Pagto de Titulos de Terceiros Fase3].ObraDevedor, 501 AS Origem, [Currentuser] AS Usuario, 
200 AS CtaPartOrigem, [Titulos a pagar].IdTitulos,Date() AS [Data da Gravação] FROM Parametrização, DataCorteContabilPorObra INNER JOIN (TCFornecedores INNER JOIN ([Tipos de Documento] INNER JOIN ([Multiplas Obras Fração de Rateio] INNER JOIN (((((([Pagto de Titulos de Terceiros Fase3] INNER JOIN [Titulos a pagar] ON [Pagto de Titulos de Terceiros Fase3].IdTitulos = [Titulos a pagar].IdTitulos) INNER JOIN [Parcelas de Titulos a pagar] ON ([Pagto de Titulos de Terceiros Fase3].Parcela = [Parcelas de Titulos a pagar].Parcela) AND ([Pagto de Titulos de Terceiros Fase3].IdTitulos = [Parcelas de Titulos a pagar].IdTitulos)) INNER JOIN [Retenção Calculada] ON ([Pagto de Titulos de Terceiros Fase3].IdTitulos = [Retenção Calculada].IdTitulos) AND ([Pagto de Titulos de Terceiros Fase3].Parcela = [Retenção Calculada].Parcela)) INNER JOIN Obras ON [Pagto de Titulos de Terceiros Fase3].ObraDevedor = Obras.Codigo) INNER JOIN Obras AS Obras_1 ON [Pagto de Titulos de Terceiros Fase3].ObraCredor = Obras_1.Codigo) INNER JOIN Empreendimentos ON Obras_1.Codigo = Empreendimentos.IdEmpreendimento) ON ([Multiplas Obras Fração de Rateio].IdTitutulos = [Pagto de Titulos de Terceiros Fase3].IdTitulos) AND ([Multiplas Obras Fração de Rateio].Obra = [Pagto de Titulos de Terceiros Fase3].ObraDevedor)) ON [Tipos de Documento].IdTipo = [Titulos a pagar].IdTipo) ON TCFornecedores.IdentificaçãoDoFornecedor = [Titulos a pagar].IdentificaçãoDoFornecedor) ON DataCorteContabilPorObra.Obra = [Pagto de Titulos de Terceiros Fase3].ObraDevedor WHERE ((([Parcelas de Titulos a pagar].Pagamento)>[DataCorteContabilPorObra].[Data]) AND (([Titulos a pagar].Flag)=False)) ORDER BY [Parcelas de Titulos a pagar].Pagamento;


"'---SQL NOVO 502---'"

INSERT INTO [Movimento Contabil] ( Contador, Data, [Conta Debito], [Conta Credito], Valor, Historico, [Centro de Custo], Receita, Origem, [Data da Gravação], Usuario )
SELECT [Pagto TabTransacoes Terceiros Fase2].Contador, [Pagto TabTransacoes Terceiros Fase2].DataTrans AS Data, [PagtoEntreEmpresasPassivo] &  "-" & [Credor] & "-" & [Devedor] AS ContaDebito, [Pagto TabTransacoes Terceiros Fase2].CodContabilCCusto AS ContaCredito, Abs([Valor]) AS Vlr, [Pagto TabTransacoes Terceiros Fase2].DescricaoBanco, [Pagto TabTransacoes Terceiros Fase2].ObraCredor, No AS Receita, 502 AS Origem, Date() AS [Data da Gravação], CurrentUser() AS Expr1
FROM Parametrização, DataCorteContabilPorObra INNER JOIN [Pagto TabTransacoes Terceiros Fase2] ON DataCorteContabilPorObra.Obra = [Pagto TabTransacoes Terceiros Fase2].ObraCredor
WHERE ((([Pagto TabTransacoes Terceiros Fase2].DataTrans)>[DataCorteContabilPorObra].[Data]) AND (([Pagto TabTransacoes Terceiros Fase2].IdOperações)=3));


"'---SQL NOVO 503---'"

INSERT INTO [Movimento Contabil] ( Contador, Data, [Conta Debito], [Conta Credito], Valor, Historico, [Centro de Custo], Receita, Origem, [Data da Gravação], Usuario )
SELECT [Pagto TabTransacoes Terceiros Fase2].Contador, [Pagto TabTransacoes Terceiros Fase2].DataTrans AS Data, [Pagto TabTransacoes Terceiros Fase2].CodContabilCCusto AS ContaDebito, [PagtoEntreEmpresasPassivo] & "-" & [Devedor] & "-" & [Credor] AS ContaCredito, Abs([Valor]) AS Vlr, [Pagto TabTransacoes Terceiros Fase2].DescricaoBanco, [Pagto TabTransacoes Terceiros Fase2].ObraDevedor, No AS Receita, 503 AS Origem, Date() AS [Data da Gravação], [currentuser] AS Expr1
FROM Parametrização, DataCorteContabilPorObra INNER JOIN ([Pagto TabTransacoes Terceiros Fase2] INNER JOIN Obras ON [Pagto TabTransacoes Terceiros Fase2].ObraDevedor = Obras.Codigo) ON DataCorteContabilPorObra.Obra = [Pagto TabTransacoes Terceiros Fase2].ObraCredor
WHERE ((([Pagto TabTransacoes Terceiros Fase2].DataTrans)>[DataCorteContabilPorObra].[Data]) AND (([Pagto TabTransacoes Terceiros Fase2].IdOperações)=3) AND (([Pagto TabTransacoes Terceiros Fase2].ObraCredor) Is Not Null));


"'---SQL NOVO 504---'"

INSERT INTO [Movimento Contabil] ( Contador, Data, [Conta Debito], [Conta Credito], Valor, Historico, [Centro de Custo], Receita, Origem, [Data da Gravação], Usuario )
SELECT [Pagto TabTransacoes Terceiros Fase2].Contador, [Pagto TabTransacoes Terceiros Fase2].DataTrans AS Data, [Pagto TabTransacoes Terceiros Fase2].CodContabilTabContas AS ContaDebito, [PagtoEntreEmpresasPassivo] & "-" & [Devedor] & "-" & [Credor] AS ContaCredito, Abs([Valor]) AS Vlr, [Pagto TabTransacoes Terceiros Fase2].DescricaoBanco, [Pagto TabTransacoes Terceiros Fase2].ObraCredor, No AS Receita, 504 AS Origem, Date() AS [Data da Gravação], [currentuser] AS Expr1
FROM Parametrização, DataCorteContabilPorObra INNER JOIN ([Pagto TabTransacoes Terceiros Fase2] INNER JOIN Obras ON [Pagto TabTransacoes Terceiros Fase2].ObraDevedor = Obras.Codigo) ON DataCorteContabilPorObra.Obra = [Pagto TabTransacoes Terceiros Fase2].ObraCredor
WHERE ((([Pagto TabTransacoes Terceiros Fase2].DataTrans)>[DataCorteContabilPorObra].[Data]) AND (([Pagto TabTransacoes Terceiros Fase2].IdOperações)=4) AND (([Pagto TabTransacoes Terceiros Fase2].ObraCredor) Is Not Null));



"'---SQL NOVO 505---'"

INSERT INTO [Movimento Contabil] ( Contador, Data, [Conta Debito], [Conta Credito], Valor, Historico, [Centro de Custo], Receita, Origem, [Data da Gravação], Usuario )
SELECT [Pagto TabTransacoes Terceiros Fase2].Contador, [Pagto TabTransacoes Terceiros Fase2].DataTrans AS Data, [PagtoEntreEmpresasPassivo] & "-" & [Devedor] & "-" & [Credor] AS ContaDebito, [Pagto TabTransacoes Terceiros Fase2].CodContabilCCusto AS ContaCredito, Abs([Valor]) AS Vlr, [Pagto TabTransacoes Terceiros Fase2].DescricaoBanco, [Pagto TabTransacoes Terceiros Fase2].ObraDevedor, No AS Receita, 505 AS Origem, Date() AS [Data da Gravação], [currentuser] AS Expr1
FROM Parametrização, DataCorteContabilPorObra INNER JOIN ([Pagto TabTransacoes Terceiros Fase2] INNER JOIN Obras ON [Pagto TabTransacoes Terceiros Fase2].ObraDevedor = Obras.Codigo) ON DataCorteContabilPorObra.Obra = [Pagto TabTransacoes Terceiros Fase2].ObraCredor
WHERE ((([Pagto TabTransacoes Terceiros Fase2].DataTrans)>[DataCorteContabilPorObra].[Data]) AND (([Pagto TabTransacoes Terceiros Fase2].IdOperações)=4) AND (([Pagto TabTransacoes Terceiros Fase2].ObraCredor) Is Not Null));

















































INSERT INTO [Movimento Contabil] ( Contador, Data, [Conta Credito], Valor, Historico, [Centro de Custo], Origem, Usuario, CtaPartOrigem, CtaPartIdOrigem, [Data da Gravação] )
SELECT [Parcelas de Titulos a pagar].IdtabTransações, [Parcelas de Titulos a pagar].Pagamento, [PagtoEntreEmpresasPassivo] & '" - "' & [Devedor] & '" - "' & [Credor] AS Cr, Round((([Valor]-[Desconto]+[multa]+[Juros]+[Correção]-[Ret])*[Fração]),2) AS Vlrw, '{' & [Obras_1].[Sigla] & '}' & ' pagando titulo da ' & '{' & [Obras].[Sigla] & '}' & ' Id.' & [Titulos a pagar].[IdTitulos] & '/' & [Parcelas de Titulos a Pagar].[Parcela] & '"  "' & [Tipos de Documento].[Sigla] & '" "' & [Titulos a Pagar].[Documento] AS Hist, [Pagto de Titulos de Terceiros Fase3].ObraDevedor, 501 AS Origem, [Currentuser] AS Usuario, 200 AS CtaPartOrigem, [Titulos a pagar].IdTitulos,Date() AS [Data da Gravação]
FROM Parametrização, DataCorteContabilPorObra INNER JOIN (TCFornecedores INNER JOIN ([Tipos de Documento] INNER JOIN ([Multiplas Obras Fração de Rateio] INNER JOIN (((((([Pagto de Titulos de Terceiros Fase3] INNER JOIN [Titulos a pagar] ON [Pagto de Titulos de Terceiros Fase3].IdTitulos = [Titulos a pagar].IdTitulos) INNER JOIN [Parcelas de Titulos a pagar] ON ([Pagto de Titulos de Terceiros Fase3].Parcela = [Parcelas de Titulos a pagar].Parcela) AND ([Pagto de Titulos de Terceiros Fase3].IdTitulos = [Parcelas de Titulos a pagar].IdTitulos)) INNER JOIN [Retenção Calculada] ON ([Pagto de Titulos de Terceiros Fase3].IdTitulos = [Retenção Calculada].IdTitulos) AND ([Pagto de Titulos de Terceiros Fase3].Parcela = [Retenção Calculada].Parcela)) INNER JOIN Obras ON [Pagto de Titulos de Terceiros Fase3].ObraDevedor = Obras.Codigo) INNER JOIN Obras AS Obras_1 ON [Pagto de Titulos de Terceiros Fase3].ObraCredor = Obras_1.Codigo) INNER JOIN Empreendimentos ON Obras_1.Codigo = Empreendimentos.IdEmpreendimento) ON ([Multiplas Obras Fração de Rateio].IdTitutulos = [Pagto de Titulos de Terceiros Fase3].IdTitulos) AND ([Multiplas Obras Fração de Rateio].Obra = [Pagto de Titulos de Terceiros Fase3].ObraDevedor)) ON [Tipos de Documento].IdTipo = [Titulos a pagar].IdTipo) ON TCFornecedores.IdentificaçãoDoFornecedor = [Titulos a pagar].IdentificaçãoDoFornecedor) ON DataCorteContabilPorObra.Obra = [Pagto de Titulos de Terceiros Fase3].ObraDevedor
WHERE ((([Parcelas de Titulos a pagar].Pagamento)>[DataCorteContabilPorObra].[Data]) AND (([Titulos a pagar].Flag)=False)) ORDER BY [Parcelas de Titulos a pagar].Pagamento;