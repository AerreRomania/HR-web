<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="dbconnection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://${initParam.dbURL}/${initParam.dbinitcat}" user="${initParam.dbuserid}" password="${initParam.dbuserpwd}" />
<sql:query dataSource="${dbconnection}" var="results">
SELECT a.*,b.voce,IF(a.codice IN (8,10,14,25,26,27,39,40,41,45,51,64,65,72,73,82,84),1,0)AS strong FROM (
#--> tot fatturato
SELECT 10 AS codice,
@a:=sum(confezione) AS confezione,
ROUND(100,2) AS perc_confezione
,@b:=sum(stiro) AS stiro
,ROUND(100,2) AS perc_stiro
,@c:=sum(tessitura) AS tessitura
,ROUND(100,2) AS perc_tessitura
,@d:=sum(residuo) AS residuo
,ROUND(100,2) AS perc_residuo
,sum(totale) AS totale FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (1,2,3,4,5,6,7,9)
) b
#<-- tot valore produzione
UNION
SELECT codice,confezione,ROUND((confezione/@a)*100,2)AS perc_conf,stiro,ROUND((stiro/@b)*100,2)AS perc_stiro,tessitura,ROUND((tessitura/@c)*100,2)AS perc_tess,residuo,ROUND((residuo/@d)*100,2)AS perc_res,totale FROM 
centro_di_profitto
WHERE codice IN (1,2,3,4,5,6,7)
UNION
SELECT 8,
sum(confezione),
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)
FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (1,2,3,4,5,6,7)
) b
#<-- tot fatturato
UNION 
#--> tot valore produzione
SELECT * FROM 
centro_di_profitto
WHERE codice IN (9)
UNION

#--> tot consumi
SELECT * FROM 
centro_di_profitto
WHERE codice IN (11,12,13)
UNION
SELECT 14,
sum(confezione),
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)
FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (11,12,13)
) b
#<-- tot consumi
UNION
#--> tot lavorazioni esterne
SELECT * FROM 
centro_di_profitto
WHERE codice IN (15,16,17,18,19,20,21,22,23,24)
UNION
SELECT 25,
sum(confezione),
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)
 FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (15,16,17,18,19,20,21,22,23,24)
) b
#<-- tot lavorazioni esterne
UNION
#--> tot lavoro diretto e indiretto
SELECT * FROM 
centro_di_profitto
WHERE codice IN (26,27)
#<-- tot lavoro diretto e indiretto
UNION
#--> tot altri consumi industriali
SELECT * FROM 
centro_di_profitto
WHERE codice IN (28,29,30,31,32,33,34,35,36,37,38)
UNION
SELECT 39,
sum(confezione),
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)
 FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (28,29,30,31,32,33,34,35,36,37,38)
) b
#<-- 39 - tot altri costi industriali
UNION
#--> 40 - tot costo del venduto
SELECT 40,
sum(confezione),
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)
 FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (11,12,13,15,16,17,18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38)
) b
#<-- 40 - tot costo del venduto
UNION
#--> 41 - margine industriale lordo
SELECT 41,
@milc:=sum(confezione),
@milpc:=ROUND((sum(confezione)/@a)*100,2),
@mils:=sum(stiro),
@milps:=ROUND((sum(stiro)/@b)*100,2),
@milt:=sum(tessitura),
@milpt:=ROUND((sum(tessitura)/@c)*100,2),
@milr:=sum(residuo),
@milpr:=ROUND((sum(residuo)/@d)*100,2),
@miltot:=sum(totale) FROM (
SELECT 10,
sum(confezione)AS confezione,
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)AS stiro
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)AS tessitura
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)AS residuo
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)AS totale
FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (1,2,3,4,5,6,7,9)
) b
)c
UNION
SELECT 40,
sum(confezione)AS confezione,
ROUND((sum(confezione)/@a)*100,2)
,sum(stiro)AS stiro
,ROUND((sum(stiro)/@b)*100,2)
,sum(tessitura)AS tessitura
,ROUND((sum(tessitura)/@c)*100,2)
,sum(residuo)AS residuo
,ROUND((sum(residuo)/@d)*100,2)
,sum(totale)AS totale
FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (11,12,13,15,16,17,18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38)
) b
#<-- 41 - margine industriale lordo
UNION
#--> 45 - lavoro ind. generale
SELECT 45,
@ligc:=sum(confezione),
@ligpc:=ROUND((sum(confezione)/@a)*100,2),
@ligs:=sum(stiro),
@ligps:=ROUND((sum(stiro)/@b)*100,2),
@ligt:=sum(tessitura),
@ligpt:=ROUND((sum(tessitura)/@c)*100,2),
@ligr:=sum(residuo),
@ligpr:=ROUND((sum(residuo)/@d)*100,2),
@ligtot:=sum(totale) FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (42,43,44)
) b
#<-- 45 - lavoro ind. generale
UNION
#--> 51 - Tot. costi commerciali
SELECT * FROM 
centro_di_profitto
WHERE codice IN (46,47,48,49,50)
UNION
SELECT 51,
@tccc:=sum(confezione),
@tccpc:=ROUND((sum(confezione)/@a)*100,2),
@tccs:=sum(stiro),
@tccps:=ROUND((sum(stiro)/@b)*100,2),
@tcct:=sum(tessitura),
@tccpt:=ROUND((sum(tessitura)/@c)*100,2),
@tccr:=sum(residuo),
@tccpr:=ROUND((sum(residuo)/@d)*100,2),
@tcctot:=sum(totale) FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (46,47,48,49,50)
) b	
#<-- 51 - Tot. costi commerciali
UNION
#--> 64 - Tot. spese generali
SELECT * FROM 
centro_di_profitto
WHERE codice IN (52,53,54,55,56,57,58,59,60,61,62,63)
UNION
SELECT 64,
@tsgc:=sum(confezione),
@tsgpc:=ROUND((sum(confezione)/@a)*100,2),
@tsgs:=sum(stiro),
@tsgps:=ROUND((sum(stiro)/@b)*100,2),
@tsgt:=sum(tessitura),
@tsgpt:=ROUND((sum(tessitura)/@c)*100,2),
@tsgr:=sum(residuo),
@tsgpr:=ROUND((sum(residuo)/@d)*100,2),
@tsgtot:=sum(totale) FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (52,53,54,55,56,57,58,59,60,61,62,63)
) b	
#<-- 64 - Tot. spese generali
UNION
#--> 65 - Risultato operativo lordo
SELECT 65,
@rolc:=@milc+@ligc+@tccc+@tsgc,
@rolpc:=ROUND((@rolc/@a)*100,2),
@rols:=@mils+@ligs+@tccs+@tsgs,
@rolps:=ROUND((@rols/@b)*100,2),
@rolt:=@milt+@ligt+@tcct+@tsgt,
@rolpt:=ROUND((@rolt/(@c))*100,2),
@rolr:=@milr+@ligr+@tccr+@tsgr,
@rolpr:=ROUND((@rolr/(@d))*100,2),
@roltot:=@miltot+@ligtot+@tcctot+@tsgtot
#<-- 65 - Risultato operativo lordo
UNION
#<-- 72 - Tot. Amm. Leasing
SELECT * FROM 
centro_di_profitto
WHERE codice IN (66,67,68,69,70,71)
UNION
SELECT 72,
@talc:=sum(confezione),
@talpc:=ROUND((sum(confezione)/@a)*100,2),
@tals:=sum(stiro),
@talps:=ROUND((sum(stiro)/@b)*100,2),
@talt:=sum(tessitura),
@talpt:=ROUND((sum(tessitura)/@c)*100,2),
@talr:=sum(residuo),
@talpr:=ROUND((sum(residuo)/@d)*100,2),
@taltot:=sum(totale) FROM (
SELECT * FROM 
centro_di_profitto
WHERE codice IN (66,67,68,69,70,71)
) b	
#<-- 72 - Tot. Amm. Leasing
UNION
#--> 73 - Risultato operativo netto
SELECT 73,
@ronc:=@rolc+@talc,
@ronpc:=ROUND((@ronc/(@a))*100,2),
@rons:=@rols+@tals,
@ronps:=ROUND((@rons/(@b))*100,2),
@ront:=@rolt+@talt,
@ronpt:=ROUND((@ront/(@c))*100,2),
@ronr:=@rolr+@talr,
@ronpr:=ROUND((@ronr/(@d))*100,2),
@rontot:=@roltot+@taltot
#<-- 73 - Risultato operativo netto
UNION
#--> 81 - Somma ultimi valori
SELECT
	codice,@suvc:=confezione, 
	@suvpc:=ROUND(confezione /(@a)*100,2) AS perc_confezione,
	@suvs:=stiro,
	@suvps:=ROUND(stiro /(@b)*100,2) AS perc_stiro,
	@suvt:=tessitura,
	@suvpt:=ROUND(tessitura /(@c)*100,2) AS perc_tessitura,
	@suvr:=residuo,
	@suvpr:=ROUND(residuo /(@d)*100,2) AS perc_residuo,
	@suvtot:=confezione+stiro+tessitura+residuo AS totale
FROM
	(
		SELECT
			SUBSTRING_INDEX(puntamento, '.', 1)AS codice,
			sum(IF(SUBSTRING_INDEX(puntamento, '.' ,- 1) = 'CNF', avere_rsd - dare_rsd, 0))AS confezione,
			sum(IF(SUBSTRING_INDEX(puntamento, '.' ,- 1) = 'STR', avere_rsd - dare_rsd, 0))AS stiro,
			sum(IF(SUBSTRING_INDEX(puntamento, '.' ,- 1) = 'TES', avere_rsd - dare_rsd, 0))AS tessitura,
			sum(IF(SUBSTRING_INDEX(puntamento, '.' ,- 1) = 'RES', avere_rsd - dare_rsd, 0))AS residuo
		FROM
			chiusure
		GROUP BY
			SUBSTRING_INDEX(puntamento, '.', 1)
		ORDER BY
			codice
	)a
WHERE codice IN (74,75,76,77,78,79,80,81)
#<-- 81 - Somma ultimi valori
UNION
#--> 82 - E.b.i.t
SELECT 82,
@ebitc:=@ronc+@suvc,
@ebitpc:=ROUND((@ebitc/(@a))*100,2),
@ebits:=@rons+@suvs,
@ebitps:=ROUND((@ebits/(@b))*100,2),
@ebitt:=@ront+@suvt,
@ebitpt:=ROUND((@ebitt/(@c))*100,2),
@ebitr:=@ronr+@suvr,
@ebitpr:=ROUND((@ebitr/(@d))*100,2),
@ebittot:=@rontot+@suvtot
#<-- 82 - E.b.i.t
UNION
#--> 83 - Oneri e proventi finanziari
SELECT codice,confezione,ROUND((confezione/@a)*100,2)AS perc_conf,stiro,ROUND((stiro/@b)*100,2)AS perc_stiro,tessitura,ROUND((tessitura/@c)*100,2)AS perc_tess,residuo,ROUND((residuo/@d)*100,2)AS perc_res,totale FROM 
centro_di_profitto
WHERE codice IN (83)
#<-- 83 - Oneri e proventi finanziari
UNION
#--> 84 - Risultato ante imposte
SELECT 84,
@raic:=@ronc+@suvc,
ROUND((@raic/(@a))*100,2),
@rais:=@rons+@suvs,
ROUND((@rais/(@b))*100,2),
@rait:=@ront+@suvt,
ROUND((@rait/(@c))*100,2),
@rair:=@ronr+@suvr,
ROUND((@rair/(@d))*100,2),
@rontot+@suvtot
#<-- 84 - Risultato ante imposte
) a
INNER JOIN ce_ric_prof_voci b ON a.codice = b.codice
ORDER BY ABS(a.codice) ASC
</sql:query>