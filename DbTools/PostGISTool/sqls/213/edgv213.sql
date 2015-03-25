CREATE SCHEMA topology#
ALTER SCHEMA topology OWNER TO postgres#
CREATE SCHEMA dominios#
CREATE SCHEMA complexos#
ALTER SCHEMA complexos OWNER TO postgres#
CREATE SCHEMA cb#
CREATE EXTENSION postgis#
COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions'#
CREATE EXTENSION postgis_topology#
COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions'#
SET search_path TO pg_catalog,public,topology,dominios,complexos,cb#
CREATE TABLE cb.hid_area_umida_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoareaumida smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_area_umida_a_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_area_umida_a OWNER TO postgres#
CREATE TABLE cb.hid_banco_areia(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipobanco smallint NOT NULL,
	situacaoemagua smallint NOT NULL,
	materialpredominante smallint NOT NULL,
	CONSTRAINT hid_banco_areia_l_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_banco_areia OWNER TO postgres#
CREATE TABLE cb.hid_recife(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 1,
	tiporecife smallint NOT NULL DEFAULT 0,
	situamare smallint NOT NULL,
	situacaocosta smallint NOT NULL DEFAULT 0,
	CONSTRAINT hid_recife_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_recife OWNER TO postgres#
CREATE TABLE cb.hid_barragem(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	matconstr smallint NOT NULL,
	usoprincipal smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_complexo_gerad_energ_eletr uuid,
	CONSTRAINT hid_barragem_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_barragem OWNER TO postgres#
CREATE TABLE cb.hid_comporta(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	CONSTRAINT hid_comporta_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)WITH ( OIDS = TRUE )#
ALTER TABLE cb.hid_comporta OWNER TO postgres#
CREATE TABLE cb.hid_queda_dagua(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoqueda smallint NOT NULL,
	altura real,
	CONSTRAINT hid_queda_dagua_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_queda_dagua OWNER TO postgres#
CREATE TABLE cb.hid_corredeira(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	CONSTRAINT hid_corredeira_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_corredeira OWNER TO postgres#
CREATE TABLE cb.hid_fonte_dagua_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipofontedagua smallint NOT NULL,
	qualidagua smallint NOT NULL,
	regime smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_fonte_dagua_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_fonte_dagua_p OWNER TO postgres#
CREATE TABLE cb.hid_foz_maritima(
	id serial NOT NULL,
	nome character(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	CONSTRAINT hid_foz_maritima_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_foz_maritima OWNER TO postgres#
CREATE TABLE cb.rel_elemento_fisiografico(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	CONSTRAINT rel_elemento_fisiografico_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.hid_limite_massa_dagua_l(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	tipolimmassa smallint NOT NULL,
	materialpredominante smallint NOT NULL,
	alturamediamargem real,
	nomeabrev varchar(50),
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_limite_massa_dagua_l_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_limite_massa_dagua_l OWNER TO postgres#
CREATE TABLE cb.hid_massa_dagua_a(
	id serial NOT NULL,
	nome character(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipomassadagua smallint NOT NULL,
	regime smallint NOT NULL,
	salinidade smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_massa_dagua_a_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_massa_dagua_a OWNER TO postgres#
CREATE TABLE cb.hid_ponto_drenagem_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	relacionado smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_ponto_drenagem_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_ponto_drenagem_p OWNER TO postgres#
CREATE TABLE cb.hid_quebramar_molhe(
	id serial NOT NULL,
	nome character(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoquebramolhe smallint NOT NULL,
	matconstr smallint NOT NULL,
	situamare smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	CONSTRAINT hid_quebramar_molhe_a_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_quebramar_molhe OWNER TO postgres#
CREATE TABLE cb.hid_quebramar_molhe_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_quebramar_molhe_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_quebramar_molhe)
#
ALTER TABLE cb.hid_quebramar_molhe_l OWNER TO postgres#
CREATE TABLE cb.hid_queda_dagua_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_queda_dagua_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_queda_dagua)
#
CREATE TABLE cb.hid_recife_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_recife_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_recife)
#
CREATE TABLE cb.rel_elemento_fisiog_natural(
	tipoelemnat smallint NOT NULL DEFAULT 99,
	CONSTRAINT rel_elemento_fisiog_natural_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiografico)
#
CREATE TABLE cb.hid_reservatorio_hidrico_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	usoprincipal smallint NOT NULL,
	volumeutil integer,
	namaximomaximorum integer,
	namaximooperacional integer,
	id_complexo_gerad_energ_eletr uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_reservatorio_hidrico_a_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_reservatorio_hidrico_a OWNER TO postgres#
CREATE TABLE cb.hid_trecho_massa_dagua_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tipotrechomassa smallint NOT NULL,
	regime smallint NOT NULL,
	salinidade smallint NOT NULL,
	id_trecho_curso_dagua uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_trecho_massa_dagua_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.hid_trecho_massa_dagua_a OWNER TO postgres#
CREATE TABLE cb.hid_barragem_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_barragem_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_barragem)
#
CREATE TABLE cb.hid_sumidouro_vertedouro_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tiposumvert smallint NOT NULL,
	causa smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_sumidouro_vertedouro_p_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)WITH ( OIDS = TRUE )#
ALTER TABLE cb.hid_sumidouro_vertedouro_p OWNER TO postgres#
CREATE TABLE cb.hid_terreno_suj_inundacao_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	periodicidadeinunda character(20),
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_terreno_sujeito_inundacao_a_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_terreno_suj_inundacao_a OWNER TO postgres#
CREATE TABLE cb.hid_trecho_drenagem_l(
	id serial NOT NULL,
	nome character(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	coincidecomdentrode smallint NOT NULL,
	dentrodepoligono smallint NOT NULL,
	compartilhado smallint NOT NULL,
	eixoprincipal smallint NOT NULL,
	navegabilidade smallint NOT NULL DEFAULT 0,
	caladomax real,
	regime smallint NOT NULL DEFAULT 0,
	larguramedia real,
	velocidademedcorrente real,
	profundidademedia real,
	id_trecho_curso_dagua uuid,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_trecho_drenagem_l_pkey PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
ALTER TABLE cb.hid_trecho_drenagem_l OWNER TO postgres#
CREATE TABLE cb.hid_quebramar_molhe_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_quebramar_molhe_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_quebramar_molhe)
#
ALTER TABLE cb.hid_quebramar_molhe_a OWNER TO postgres#
CREATE TABLE cb.hid_banco_areia_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_banco_areia_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_banco_areia)
#
CREATE TABLE cb.hid_banco_areia_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_banco_areia_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_banco_areia)
#
ALTER TABLE cb.hid_banco_areia_a OWNER TO postgres#
CREATE TABLE cb.hid_barragem_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_barragem_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_barragem)
#
CREATE TABLE cb.hid_recife_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_recife_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_recife)
#
ALTER TABLE cb.hid_recife_l OWNER TO postgres#
CREATE TABLE cb.hid_recife_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_recife_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_recife)
#
ALTER TABLE cb.hid_recife_a OWNER TO postgres#
CREATE TABLE cb.hid_barragem_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_barragem_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_barragem)
#
CREATE TABLE cb.rel_alter_fisiog_antropica(
	tipoalterantrop smallint NOT NULL DEFAULT 0,
	CONSTRAINT rel_alter_fisiog_antropica_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiografico)
#
CREATE TABLE cb.rel_elemento_fisiog_natural_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT rel_elemento_fisiog_natural_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural)
#
CREATE TABLE cb.hid_comporta_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_comporta_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_comporta)
WITH ( OIDS = TRUE )#
CREATE TABLE cb.hid_queda_dagua_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_queda_dagua_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_queda_dagua)
#
CREATE TABLE cb.hid_queda_dagua_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_queda_dagua_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_queda_dagua)
#
CREATE TABLE cb.hid_corredeira_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_corredeira_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_corredeira)
#
CREATE TABLE cb.hid_corredeira_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_corredeira_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_corredeira)
#
CREATE TABLE cb.hid_comporta_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_comporta_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_comporta)
WITH ( OIDS = TRUE )#
ALTER TABLE cb.hid_comporta_l OWNER TO postgres#
CREATE TABLE cb.hid_corredeira_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_corredeira_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_corredeira)
#
CREATE TABLE cb.hid_ponto_inicio_drenagem_p(
	nascente smallint NOT NULL DEFAULT 0,
	CONSTRAINT hid_ponto_inicio_drenagem_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_ponto_drenagem_p)
#
CREATE TABLE cb.hid_confluencia_p(
	CONSTRAINT hid_confluencia_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_ponto_drenagem_p)
#
CREATE TABLE cb.hid_foz_maritima_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_foz_maritima_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_foz_maritima)
#
CREATE TABLE cb.hid_foz_maritima_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_foz_maritima_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_foz_maritima)
#
CREATE TABLE cb.hid_foz_maritima_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_foz_maritima_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_foz_maritima)
#
CREATE TABLE cb.veg_vegetacao_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	denso smallint NOT NULL,
	antropizada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT veg_vegetacao_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.veg_veg_cultivada_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipolavoura smallint NOT NULL DEFAULT 0,
	finalidade smallint NOT NULL DEFAULT 0,
	terreno smallint NOT NULL,
	classificacaoporte smallint NOT NULL,
	espacamentoindividuos real,
	espessuradap real,
	denso smallint NOT NULL,
	alturamediaindividuos real,
	cultivopredominante smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT veg_veg_cultivada_a_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.veg_veg_area_contato_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	classificacaoporte smallint NOT NULL,
	denso smallint NOT NULL,
	alturamediaindividuos real,
	antropizada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT veg_veg_area_contato_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.veg_campo_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipocampo smallint NOT NULL,
	ocorrenciaem smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT veg_campo_a_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.veg_cerrado_cerradao_a(
	tipocerr smallint NOT NULL,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_cerrado_cerradao_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.veg_caatinga_a(
	alturamediaindividuos real,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_caatinga_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.veg_campinarana_a(
	alturamediaindividuos real,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_campinarana_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.veg_veg_restinga_a(
	alturamediaindividuos real,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_veg_restinga_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.veg_mangue_a(
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_mangue_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.veg_brejo_pantano_a(
	tipobrejopantano smallint NOT NULL DEFAULT 0,
	alturamediaindividuos real,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_brejo_pantano_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.veg_floresta_a(
	especiepredominante smallint NOT NULL,
	caracteristicafloresta smallint NOT NULL,
	alturamediaindividuos real,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_floresta_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
CREATE TABLE cb.rel_isolinha_hipsometrica(
	id serial NOT NULL,
	CONSTRAINT rel_isolinha_hipsometrica_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.rel_curva_nivel_l(
	geometriaaproximada smallint NOT NULL,
	cota integer NOT NULL,
	depressao smallint NOT NULL,
	indice smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT rel_curva_nivel_l_pk PRIMARY KEY (id)
) INHERITS(cb.rel_isolinha_hipsometrica)
#
CREATE TABLE cb.rel_curva_batimetrica_l(
	profundidade integer NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT rel_curva_batimetrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.rel_isolinha_hipsometrica)
#
CREATE TABLE cb.rel_terreno_exposto_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL DEFAULT 1,
	tipoterrexp smallint NOT NULL DEFAULT 0,
	causaexposicao smallint NOT NULL DEFAULT 0,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT rel_terreno_exposto_a_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.rel_ponto_hipsometrico(
	id serial NOT NULL,
	CONSTRAINT rel_ponto_hipsometrico_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.rel_ponto_cotado_batimetrico_p(
	profundidade float NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT rel_ponto_cotado_batimetrico_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_ponto_hipsometrico)
#
CREATE TABLE cb.rel_ponto_cotado_altimetrico_p(
	geometriaaproximada smallint NOT NULL,
	cotacomprovada smallint NOT NULL,
	cota float NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT rel_ponto_cotado_altimetrico_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_ponto_hipsometrico)
#
CREATE TABLE cb.rel_elemento_fisiog_natural_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT rel_elemento_fisiog_natural_l_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural)
#
CREATE TABLE cb.rel_rocha_p(
	tiporocha smallint NOT NULL,
	CONSTRAINT rel_rocha_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_p)
#
CREATE TABLE cb.loc_edificacao(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	matconstr smallint NOT NULL,
	CONSTRAINT edificacao_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.rel_alter_fisiog_antropica_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT rel_alter_fisiog_antropica_l_pk PRIMARY KEY (id)
) INHERITS(cb.rel_alter_fisiog_antropica)
#
CREATE TABLE cb.rel_alter_fisiog_antropica_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT rel_alter_fisiog_antropica_a_pk PRIMARY KEY (id)
) INHERITS(cb.rel_alter_fisiog_antropica)
#
CREATE TABLE cb.eco_ext_mineral(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tiposecaocnae smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	tipoextmin smallint NOT NULL,
	tipoprodutoresiduo smallint NOT NULL,
	tipopocomina smallint NOT NULL,
	procextracao smallint NOT NULL,
	formaextracao smallint NOT NULL,
	atividade smallint NOT NULL,
	id_org_ext_mineral uuid,
	CONSTRAINT eco_ext_mineral_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.loc_edificacao_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT loc_edificacao_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao)
#
CREATE TABLE cb.rel_duna_p(
	fixa smallint NOT NULL,
	CONSTRAINT rel_duna_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_p)
#
CREATE TABLE cb.loc_edificacao_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT loc_edificacao_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao)
#
CREATE TABLE cb.rel_elemento_fisiog_natural_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT rel_elemento_fisiog_natural_a_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural)
#
CREATE TABLE cb.rel_gruta_caverna_p(
	tipogrutacaverna smallint NOT NULL,
	CONSTRAINT rel_gruta_caverna_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_p)
#
CREATE TABLE cb.asb_edif_abast_agua_p(
	tipoedifabast smallint NOT NULL,
	id_complexo_abast_agua uuid,
	CONSTRAINT asb_edif_abast_agua_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.asb_edif_saneamento_p(
	tipoedifsaneam smallint NOT NULL,
	id_complexo_saneamento uuid,
	CONSTRAINT asb_edif_saneamento_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.rel_duna_a(
	fixa smallint NOT NULL,
	CONSTRAINT rel_duna_a_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_a)
#
CREATE TABLE cb.hid_ilha_l(
	tipoilha smallint NOT NULL DEFAULT 1,
	CONSTRAINT hid_ilha_l_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_l)
#
ALTER TABLE cb.hid_ilha_l OWNER TO postgres#
CREATE TABLE cb.hid_ilha_a(
	tipoilha smallint NOT NULL DEFAULT 1,
	CONSTRAINT hid_ilha_a_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_a)
#
ALTER TABLE cb.hid_ilha_a OWNER TO postgres#
CREATE TABLE cb.rel_dolina_a(
	CONSTRAINT rel_dolina_a_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_a)
#
CREATE TABLE cb.rel_rocha_a(
	tiporocha smallint NOT NULL,
	CONSTRAINT rel_rocha_a_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_a)
#
CREATE TABLE cb.rel_pico_p(
	CONSTRAINT rel_pico_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_p)
#
CREATE TABLE cb.sau_edif_saude_p(
	tipoclassecnae smallint NOT NULL,
	nivelatencao smallint NOT NULL,
	id_org_saude uuid,
	CONSTRAINT sau_edif_saude_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.sau_edif_servico_social_p(
	tipoclassecnae smallint NOT NULL,
	id_org_servico_social uuid,
	CONSTRAINT sau_edif_servico_social_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.hid_ilha_p(
	tipoilha smallint NOT NULL DEFAULT 1,
	CONSTRAINT hid_ilha_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_p)
#
ALTER TABLE cb.hid_ilha_p OWNER TO postgres#
CREATE TABLE cb.rel_dolina_p(
	CONSTRAINT rel_dolina_p_pk PRIMARY KEY (id)
) INHERITS(cb.rel_elemento_fisiog_natural_p)
#
CREATE TABLE cb.asb_edif_abast_agua_a(
	tipoedifabast smallint NOT NULL,
	id_complexo_abast_agua uuid,
	CONSTRAINT asb_edif_abast_agua_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.asb_edif_saneamento_a(
	tipoedifsaneam smallint NOT NULL,
	id_complexo_saneamento uuid,
	CONSTRAINT asb_edif_saneamento_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.adm_edif_pub_militar_p(
	tipousoedif smallint NOT NULL,
	tipoedifmil smallint NOT NULL,
	id_org_pub_militar uuid,
	CONSTRAINT adm_edif_pub_militar_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.adm_edif_pub_militar_a(
	tipoedifmil smallint NOT NULL,
	tipousoedif smallint NOT NULL,
	id_org_pub_militar uuid,
	CONSTRAINT adm_edif_pub_militar_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.sau_edif_servico_social_a(
	tipoclassecnae smallint NOT NULL,
	id_org_servico_social uuid,
	CONSTRAINT sau_edif_servico_social_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.edu_edif_ensino_a(
	tipoclassecnae smallint NOT NULL,
	id_org_ensino uuid,
	CONSTRAINT edu_edif_ensino_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.adm_edif_pub_civil_p(
	tipoedifcivil smallint NOT NULL,
	tipousoedif smallint NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT adm_edif_pub_civil_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.adm_edif_pub_civil_a(
	tipoedifcivil smallint NOT NULL,
	tipousoedif smallint NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT adm_edif_pub_civil_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.edu_edif_religiosa_p(
	tipoedifrelig smallint NOT NULL,
	ensino smallint NOT NULL,
	religiao varchar(80),
	id_org_religiosa uuid,
	CONSTRAINT edu_edif_religiosa_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.sau_edif_saude_a(
	tipoclassecnae smallint NOT NULL,
	nivelatencao smallint NOT NULL,
	id_org_saude uuid,
	CONSTRAINT sau_edif_saude_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.edu_edif_religiosa_a(
	tipoedifrelig smallint NOT NULL,
	ensino smallint NOT NULL,
	religiao varchar(80),
	id_org_religiosa uuid,
	CONSTRAINT edu_edif_religiosa_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.edu_edif_const_lazer_p(
	tipoediflazer smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_edif_const_lazer_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.edu_edif_const_lazer_a(
	tipoediflazer smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_edif_const_lazer_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.hid_rocha_em_agua(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	situacaoemagua smallint NOT NULL,
	alturalamina real,
	CONSTRAINT hid_rocha_em_agua_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.hid_rocha_em_agua_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_rocha_em_agua_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_rocha_em_agua)
#
ALTER TABLE cb.hid_rocha_em_agua_a OWNER TO postgres#
CREATE TABLE cb.edu_edif_const_turistica_p(
	tipoedifturist smallint NOT NULL,
	ovgd smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_edif_const_turistica_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.edu_edif_const_turistica_a(
	tipoedifturist smallint NOT NULL,
	ovgd smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_edif_const_turistica_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.eco_edif_comerc_serv_p(
	tipoedifcomercserv smallint NOT NULL,
	finalidade smallint NOT NULL,
	id_org_comerc_serv uuid,
	CONSTRAINT eco_edif_comerc_serv_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.eco_edif_comerc_serv_a(
	tipoedifcomercserv smallint NOT NULL,
	finalidade smallint NOT NULL,
	id_org_comerc_serv uuid,
	CONSTRAINT eco_edif_comerc_serv_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.pto_edif_constr_est_med_fen_p(
	CONSTRAINT pto_edif_constr_est_med_fen_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.pto_edif_constr_est_med_fen_a(
	CONSTRAINT pto_edif_constr_est_med_fen_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.asb_dep_abast_agua(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipodepabast smallint NOT NULL,
	situacaoagua smallint NOT NULL,
	construcao smallint NOT NULL,
	matconstr smallint NOT NULL,
	finalidade smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	operacional smallint NOT NULL,
	id_complexo_abast_agua uuid,
	id_org_ext_mineral uuid,
	id_org_agropec_ext_veg_pesca uuid,
	id_org_comerc_serv uuid,
	id_org_industrial uuid,
	CONSTRAINT asb_dep_abast_agua_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.asb_dep_abast_agua_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT asb_dep_abast_agua_a_pk PRIMARY KEY (id)
) INHERITS(cb.asb_dep_abast_agua)
#
CREATE TABLE cb.asb_dep_saneamento(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipodepsaneam smallint NOT NULL,
	construcao smallint NOT NULL,
	matconstr smallint NOT NULL,
	finalidade smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	residuo smallint NOT NULL,
	tiporesiduo smallint NOT NULL,
	id_complexo_saneamento uuid,
	CONSTRAINT asb_dep_saneamento_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.asb_dep_saneamento_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT asb_dep_saneamento_a_pk PRIMARY KEY (id)
) INHERITS(cb.asb_dep_saneamento)
#
CREATE TABLE cb.eco_deposito_geral(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	tipodepgeral smallint NOT NULL,
	matconstr smallint NOT NULL,
	tipoexposicao smallint NOT NULL,
	tipoprodutoresiduo smallint NOT NULL,
	tipoconteudo smallint NOT NULL,
	unidadevolume smallint,
	valorvolume float,
	tratamento smallint NOT NULL,
	id_org_comerc_serv uuid,
	id_org_ext_mineral uuid,
	id_org_agropec_ext_veg_pesca uuid,
	id_complexo_gerad_energ_eletr uuid,
	id_estrut_transporte uuid,
	id_org_industrial uuid,
	CONSTRAINT eco_deposito_geral_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_deposito_geral_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT eco_deposito_geral_a_pk PRIMARY KEY (id)
) INHERITS(cb.eco_deposito_geral)
#
CREATE TABLE complexos.eco_org_industrial(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tiposecaocnae smallint NOT NULL,
	id_org_pub_civil uuid,
	id_org_pub_militar uuid,
	CONSTRAINT eco_org_industrial_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.eco_madeireira(
	id_org_agropec_ext_veg_pesca uuid,
	CONSTRAINT eco_madeireira_pk PRIMARY KEY (id)
) INHERITS(complexos.eco_org_industrial)
#
CREATE TABLE cb.eco_equip_agropec(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	tipoequipagropec smallint NOT NULL,
	matconstr smallint NOT NULL,
	id_org_agropec_ext_veg_pesca uuid,
	CONSTRAINT eco_equip_agropec_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_equip_agropec_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT eco_equip_agropec_l_pk PRIMARY KEY (id)
) INHERITS(cb.eco_equip_agropec)
#
CREATE TABLE cb.eco_equip_agropec_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT eco_equip_agropec_a_pk PRIMARY KEY (id)
) INHERITS(cb.eco_equip_agropec)
#
CREATE TABLE cb.eco_plataforma(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoplataforma smallint NOT NULL,
	CONSTRAINT eco_plataforma_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_plataforma_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT eco_plataforma_a_pk PRIMARY KEY (id)
) INHERITS(cb.eco_plataforma)
#
CREATE TABLE complexos.edu_org_ensino(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	administracao smallint NOT NULL,
	tipogrupocnae smallint NOT NULL,
	CONSTRAINT edu_org_ensino_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.adm_org_pub_militar(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	tipoclassecnae smallint NOT NULL,
	administracao smallint NOT NULL,
	id_org_pub_militar uuid,
	id_instituicao_publica uuid,
	instituicao smallint NOT NULL,
	classificsigiloso smallint NOT NULL,
	CONSTRAINT adm_org_pub_militar_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.adm_org_pub_civil(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	tipoclassecnae smallint NOT NULL,
	administracao smallint NOT NULL,
	poderpublico smallint NOT NULL,
	id_instituicao_publica uuid,
	id_org_pub_civil uuid,
	CONSTRAINT adm_org_pub_civil_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.edu_org_religiosa(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	tipoclassecnae smallint NOT NULL,
	CONSTRAINT adm_org_religiosa_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_grupo_transformadores(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	id_subestacao_ener_eletr uuid,
	CONSTRAINT enc_grupo_transformadores_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_grupo_transformadores_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT enc_grupo_transformadores_a_pk PRIMARY KEY (id)
) INHERITS(cb.enc_grupo_transformadores)
#
CREATE TABLE cb.enc_est_gerad_energia_eletr(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoestgerad smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	destenergelet smallint NOT NULL,
	codigoestacao varchar(80),
	potenciaoutorgada float,
	potenciafiscalizada float,
	id_complexo_gerad_energ_eletr uuid,
	CONSTRAINT enc_est_gerad_energia_eletrica_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_est_gerad_energia_eletr_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT enc_est_gerad_energia_eletr_l_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr)
#
CREATE TABLE cb.enc_est_gerad_energia_eletr_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT enc_est_gerad_energia_eletr_a_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr)
#
CREATE TABLE cb.enc_termeletrica_a(
	tipocombustivel smallint NOT NULL,
	combrenovavel smallint NOT NULL,
	tipomaqtermica smallint NOT NULL,
	geracao smallint NOT NULL,
	CONSTRAINT enc_termeletrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr_a)
#
CREATE TABLE cb.enc_est_gerad_energia_eletr_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT enc_est_gerad_energia_eletr_p_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr)
#
CREATE TABLE cb.enc_hidreletrica_p(
	codigohidreletrica varchar(30),
	CONSTRAINT enc_hidreletrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr_p)
#
CREATE TABLE cb.enc_hidreletrica_l(
	codigohidreletrica varchar(30),
	CONSTRAINT enc_hidreletrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr_l)
#
CREATE TABLE cb.enc_hidreletrica_a(
	codigohidreletrica varchar(30),
	CONSTRAINT enc_hidreletrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr_a)
#
CREATE TABLE cb.enc_edif_energia_p(
	tipoedifenergia smallint NOT NULL DEFAULT 0,
	id_complexo_gerad_energ_eletr uuid,
	id_subestacao_ener_eletr uuid,
	CONSTRAINT enc_edif_energia_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.pto_pto_geod_topo_controle_p(
	id serial NOT NULL,
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tiporef smallint NOT NULL,
	latitude varchar(80),
	longitude varchar(80),
	altitudeortometrica float,
	sistemageodesico smallint NOT NULL,
	referencialaltim smallint NOT NULL,
	outrarefalt varchar(80),
	outrarefplan varchar(20),
	orgaoenteresp varchar(80),
	codponto varchar(80),
	obs varchar(255),
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT pto_pto_geod_topo_controle_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_edif_energia_a(
	tipoedifenergia smallint NOT NULL,
	id_complexo_gerad_energ_eletr uuid,
	id_subestacao_ener_eletr uuid,
	CONSTRAINT enc_edif_energia_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.pto_pto_controle_p(
	tipoptocontrole smallint NOT NULL,
	materializado smallint NOT NULL DEFAULT 0,
	codprojeto varchar(80),
	CONSTRAINT pto_pto_controle_p_pk PRIMARY KEY (id)
) INHERITS(cb.pto_pto_geod_topo_controle_p)
#
CREATE TABLE cb.enc_edif_comunic_p(
	modalidade smallint NOT NULL,
	tipoedifcomunic smallint NOT NULL,
	id_complexo_comunicacao uuid,
	CONSTRAINT enc_edif_comunic_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.tra_pista_ponto_pouso(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	tipopista smallint NOT NULL,
	revestimento smallint NOT NULL DEFAULT 0,
	usopista smallint NOT NULL DEFAULT 0,
	homologacao smallint NOT NULL DEFAULT 0,
	operacional smallint NOT NULL DEFAULT 0,
	situacaofisica smallint NOT NULL DEFAULT 0,
	largura float,
	extensao float,
	id_complexo_aeroportuario uuid,
	CONSTRAINT tra_pista_ponto_pouso_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_edif_comunic_a(
	modalidade smallint NOT NULL DEFAULT 0,
	tipoedifcomunic smallint NOT NULL DEFAULT 0,
	id_complexo_comunicacao uuid,
	CONSTRAINT enc_edif_comunic_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.tra_pista_ponto_pouso_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_pista_ponto_pouso_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_pista_ponto_pouso)
#
CREATE TABLE cb.tra_edif_constr_aeroportuaria_p(
	tipoedifaero smallint NOT NULL DEFAULT 0,
	administracao smallint NOT NULL DEFAULT 0,
	id_complexo_aeroportuario uuid,
	CONSTRAINT tra_edif_constr_aeroportuaria_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.tra_pista_ponto_pouso_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_pista_ponto_pouso_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_pista_ponto_pouso)
#
CREATE TABLE cb.tra_edif_constr_portuaria_a(
	tipoedifport smallint NOT NULL,
	administracao smallint NOT NULL,
	id_complexo_portuario uuid,
	CONSTRAINT tra_edif_constr_portuaria_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.tra_trecho_duto_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	tipotrechoduto smallint NOT NULL DEFAULT 0,
	mattransp smallint NOT NULL DEFAULT 0,
	setor smallint NOT NULL DEFAULT 0,
	posicaorelativa smallint NOT NULL DEFAULT 0,
	matconstr smallint NOT NULL DEFAULT 0,
	ndutos integer,
	situacaoespacial smallint NOT NULL DEFAULT 0,
	operacional smallint NOT NULL DEFAULT 0,
	situacaofisica smallint NOT NULL DEFAULT 0,
	id_duto uuid,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_trecho_duto_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_edif_metro_ferroviaria_p(
	funcaoedifmetroferrov smallint,
	multimodal smallint NOT NULL,
	administracao smallint NOT NULL,
	id_estrut_apoio uuid,
	CONSTRAINT tra_edif_metro_ferroviaria_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE complexos.tra_estrut_transporte(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	CONSTRAINT tra_estrut_transporte_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_edif_constr_portuaria_p(
	tipoedifport smallint NOT NULL,
	administracao smallint NOT NULL,
	id_complexo_portuario uuid,
	CONSTRAINT tra_edif_constr_portuaria_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE complexos.tra_estrut_apoio(
	tipoestrut smallint NOT NULL,
	CONSTRAINT tra_estrut_apoio_pk PRIMARY KEY (id)
) INHERITS(complexos.tra_estrut_transporte)
#
CREATE TABLE cb.tra_edif_constr_aeroportuaria_a(
	tipoedifaero smallint NOT NULL,
	administracao smallint NOT NULL,
	id_complexo_aeroportuario uuid,
	CONSTRAINT tra_edif_constr_aeroportuaria_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.tra_edif_metro_ferroviaria_a(
	funcaoedifmetroferrov smallint NOT NULL,
	multimodal smallint NOT NULL,
	administracao smallint NOT NULL,
	id_estrut_apoio uuid,
	CONSTRAINT tra_edif_metro_ferroviaria_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.tra_edif_rodoviaria_p(
	tipoedifrod smallint NOT NULL,
	administracao smallint NOT NULL,
	id_estrut_apoio uuid,
	CONSTRAINT tra_edif_rodoviaria_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.tra_edif_rodoviaria_a(
	tipoedifrod smallint NOT NULL,
	administracao smallint NOT NULL,
	id_estrut_apoio uuid,
	CONSTRAINT tra_edif_rodoviaria_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.eco_edif_ext_mineral_p(
	tipodivisaocnae smallint NOT NULL,
	id_org_ext_mineral uuid,
	CONSTRAINT eco_edif_ext_mineral_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.eco_edif_ext_mineral_a(
	tipodivisaocnae smallint NOT NULL,
	id_org_ext_mineral uuid,
	CONSTRAINT eco_edif_ext_mineral_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE complexos.tra_complexo_aeroportuario(
	indicador varchar(4),
	siglaaero varchar(3),
	tipocomplexoaero smallint NOT NULL,
	classificacao smallint NOT NULL,
	latoficial varchar(80),
	longoficial varchar(80),
	altitude integer,
	CONSTRAINT tra_complexo_aeroportuario_pk PRIMARY KEY (id)
) INHERITS(complexos.tra_estrut_transporte)
#
CREATE TABLE cb.eco_edif_agrop_ext_veg_pesca_p(
	tipoedifagropec smallint NOT NULL,
	id_org_agropec_ext_veg_pesca uuid,
	CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.asb_dep_abast_agua_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT asb_dep_abast_agua_p_pk PRIMARY KEY (id)
) INHERITS(cb.asb_dep_abast_agua)
#
CREATE TABLE cb.eco_edif_agrop_ext_veg_pesca_a(
	tipoedifagropec smallint NOT NULL,
	id_org_agropec_ext_veg_pesca uuid,
	CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.eco_edif_industrial_p(
	chamine smallint NOT NULL,
	tipodivisaocnae smallint NOT NULL,
	id_org_industrial uuid,
	CONSTRAINT eco_edif_industrial_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE cb.asb_dep_saneamento_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT asb_dep_saneamento_p_pk PRIMARY KEY (id)
) INHERITS(cb.asb_dep_saneamento)
#
CREATE TABLE cb.eco_edif_industrial_a(
	chamine smallint NOT NULL,
	tipodivisaocnae smallint NOT NULL,
	id_org_industrial uuid,
	CONSTRAINT eco_edif_industrial_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
CREATE TABLE cb.eco_deposito_geral_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT eco_deposito_geral_p_pk PRIMARY KEY (id)
) INHERITS(cb.eco_deposito_geral)
#
CREATE TABLE cb.tra_patio(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	modaluso smallint NOT NULL,
	administracao smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_estrut_transporte uuid,
	id_org_ext_mineral uuid,
	id_org_comerc_serv uuid,
	id_org_agropec_ext_veg_pesca uuid,
	id_org_industrial uuid,
	id_org_ensino uuid,
	id_complexo_lazer uuid,
	CONSTRAINT tra_patio_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.eco_frigorifico_matadouro(
	frigorifico smallint NOT NULL,
	id_org_agropec_ext_veg_pesca uuid,
	CONSTRAINT eco_frigorifico_matadouro_pk PRIMARY KEY (id)
) INHERITS(complexos.eco_org_industrial)
#
CREATE TABLE cb.tra_patio_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_patio_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_patio)
#
CREATE TABLE cb.eco_equip_agropec_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT eco_equip_agropec_p_pk PRIMARY KEY (id)
) INHERITS(cb.eco_equip_agropec)
#
CREATE TABLE cb.tra_patio_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_patio_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_patio)
#
CREATE TABLE complexos.asb_complexo_saneamento(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	tipoclassecnae smallint NOT NULL,
	administracao smallint NOT NULL,
	organizacao smallint,
	id_org_comerc_serv uuid,
	CONSTRAINT asb_complexo_saneamento_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.asb_complexo_abast_agua(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tipoclassecnae smallint NOT NULL,
	organizacao varchar(50),
	id_org_comerc_serv uuid,
	CONSTRAINT asb_complexo_abast_agua_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_plataforma_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT eco_plataforma_p_pk PRIMARY KEY (id)
) INHERITS(cb.eco_plataforma)
#
CREATE TABLE cb.tra_funicular(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_org_ext_mineral uuid,
	id_complexo_lazer uuid,
	CONSTRAINT tra_funicular_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.eco_org_comerc_serv(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	tipodivisaocnae smallint NOT NULL,
	finalidade smallint NOT NULL,
	CONSTRAINT adm_org_comerc_serv_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_funicular_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_funicular_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_funicular)
#
CREATE TABLE complexos.edu_org_ensino_militar(
	tipoclassecnae smallint NOT NULL,
	instituicao smallint NOT NULL,
	classificsigiloso smallint NOT NULL,
	id_org_pub_militar uuid,
	CONSTRAINT edu_org_ensino_militar_pk PRIMARY KEY (id)
) INHERITS(complexos.edu_org_ensino)
#
CREATE TABLE complexos.edu_org_ensino_pub(
	tipoclassecnae smallint NOT NULL,
	poderpublico smallint NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT edu_org_ensino_pub_pk PRIMARY KEY (id)
) INHERITS(complexos.edu_org_ensino)
#
CREATE TABLE cb.tra_passag_elevada_viaduto(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipopassagviad smallint NOT NULL,
	modaluso smallint NOT NULL,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	vaolivrehoriz real,
	vaovertical real,
	gabhorizsup real,
	gabvertsup real,
	cargasuportmaxima real,
	nrpistas integer,
	nrfaixas integer,
	posicaopista smallint NOT NULL,
	extensao float,
	largura float,
	CONSTRAINT tra_passag_elevada_viaduto_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.eco_org_ext_mineral(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tiposecaocnae smallint NOT NULL,
	CONSTRAINT eco_org_ext_mineral_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.eco_org_agrop_ext_veg_pesca(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	tipodivisaocnae smallint NOT NULL,
	CONSTRAINT org_agropec_ext_vegetal_pesca_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_area_agrop_ext_veg_pesca_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	destinadoa smallint NOT NULL,
	id_org_agropec_ext_veg_pesca uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT eco_area_agropec_ext_vegetal_pesca_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.edu_org_ensino_religioso(
	tipoclassecnae smallint NOT NULL,
	id_org_religiosa uuid,
	CONSTRAINT edu_org_ensino_religioso_pk PRIMARY KEY (id)
) INHERITS(complexos.edu_org_ensino)
#
CREATE TABLE cb.enc_grupo_transformadores_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT enc_grupo_transformadores_p_pk PRIMARY KEY (id)
) INHERITS(cb.enc_grupo_transformadores)
#
CREATE TABLE cb.tra_ponte(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoponte smallint NOT NULL,
	modaluso smallint NOT NULL,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	vaolivrehoriz real,
	vaolivrevertical real,
	cargasuportmaxima real,
	nrfaixas integer,
	nrpistas integer,
	posicaopista smallint NOT NULL,
	largura float,
	extensao float,
	CONSTRAINT tra_ponte_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_ponte_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_ponte_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_ponte)
#
CREATE TABLE cb.tra_tunel(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipotunel smallint NOT NULL,
	modaluso smallint NOT NULL,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint,
	nrpistas integer,
	nrfaixas integer,
	posicaopista smallint NOT NULL,
	altura float,
	extensao real,
	CONSTRAINT tra_tunel_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.tra_tunel_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_tunel_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_tunel)
#
CREATE TABLE cb.tra_tunel_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_tunel_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_tunel)
#
CREATE TABLE cb.eco_area_ext_mineral_a(
	id serial NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_org_ext_mineral uuid,
	CONSTRAINT eco_ext_mineral_a_pk_1 PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_termeletrica_p(
	tipocombustivel smallint NOT NULL DEFAULT 0,
	combrenovavel smallint NOT NULL DEFAULT 0,
	tipomaqtermica smallint NOT NULL DEFAULT 0,
	geracao smallint NOT NULL,
	CONSTRAINT enc_termeletrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.enc_est_gerad_energia_eletr_p)
#
CREATE TABLE cb.tra_travessia_pedestre(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipotravessiaped smallint NOT NULL,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	largura float,
	extensao float,
	CONSTRAINT tra_travessia_pedestre_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.tra_travessia_pedestre_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_travessia_pedestre_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_travessia_pedestre)
#
CREATE TABLE complexos.enc_complexo_gerad_energ_eletr(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tipoclassecnae smallint NOT NULL DEFAULT 0,
	id_org_comerc_serv uuid,
	CONSTRAINT enc_comp_gerad_energ_ele_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.enc_subestacao_ener_eletr(
	id uuid NOT NULL,
	nome varchar(80),
	tipoclassecnae smallint NOT NULL,
	tipooperativo smallint NOT NULL,
	operacional smallint NOT NULL DEFAULT 0,
	id_complexo_gerad_energ_eletr uuid,
	CONSTRAINT enc_subest_transm_distrib_energia_eletrica_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.enc_complexo_comunicacao(
	id uuid NOT NULL,
	nome varchar(80),
	tipoclassecnae smallint NOT NULL,
	id_org_comerc_serv uuid,
	id_complexo_comunicacao uuid,
	CONSTRAINT enc_complexo_comunicacao_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_travessia_pedestre_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_travessia_pedestre_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_travessia_pedestre)
#
CREATE TABLE cb.pto_pto_ref_geod_topo_p(
	nome varchar(80),
	proximidade smallint NOT NULL,
	tipoptorefgeodtopo smallint NOT NULL,
	rede smallint NOT NULL,
	referencialgrav smallint NOT NULL,
	situacaomarco smallint NOT NULL,
	datavisita varchar(80),
	CONSTRAINT pto_pto_ref_geod_topo_p_pk PRIMARY KEY (id)
) INHERITS(cb.pto_pto_geod_topo_controle_p)
#
CREATE TABLE cb.tra_travessia(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	tipotravessia smallint NOT NULL DEFAULT 0,
	CONSTRAINT tra_travessia_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.enc_area_energia_eletrica_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_subestacao_ener_eletr uuid,
	id_complexo_gerad_energ_eletr uuid,
	CONSTRAINT enc_area_energia_eletrica_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_zona_linhas_energia_com_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT enc_zona_lin_energ_comunic_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_torre_energia_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	ovgd smallint NOT NULL,
	alturaestimada float,
	tipotorre smallint NOT NULL,
	arranjofases varchar(80),
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT enc_torre_energia_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_antena_comunic_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	posicaoreledific smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	id_complexo_comunicacao uuid,
	CONSTRAINT enc_antena_comunic_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_torre_comunic_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	posicaoreledific smallint NOT NULL,
	ovgd smallint NOT NULL,
	alturaestimada float,
	id_complexo_comunicacao uuid,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT enc_torre_comunic_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_trecho_energia_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	especie smallint NOT NULL,
	posicaorelativa smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	emduto smallint NOT NULL,
	tensaoeletrica float,
	numcircuitos integer,
	id_org_comerc_serv uuid,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT enc_trecho_comunic_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.enc_trecho_comunic_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipotrechocomunic smallint NOT NULL,
	posicaorelativa smallint NOT NULL,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	emduto smallint NOT NULL,
	id_org_comerc_serv uuid,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT enc_trecho_comunic_l_pk_1 PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_travessia_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_travessia_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_travessia)
#
CREATE TABLE cb.tra_pista_ponto_pouso_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_pista_ponto_pouso_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_pista_ponto_pouso)
#
CREATE TABLE cb.tra_trecho_rodoviario_l(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	codtrechorodov varchar(80),
	tipotrechorod smallint NOT NULL,
	jurisdicao smallint NOT NULL,
	administracao smallint NOT NULL,
	concessionaria varchar(100),
	revestimento smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	nrpistas integer,
	nrfaixas integer,
	trafego smallint NOT NULL,
	canteirodivisorio smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	id_via_rodoviaria uuid,
	CONSTRAINT tra_trecho_rodoviario_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_cremalheira(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	operacional smallint NOT NULL DEFAULT 0,
	situacaofisica smallint NOT NULL DEFAULT 0,
	CONSTRAINT tra_cremalheira_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_cremalheira_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_cremalheira_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_cremalheira)
#
CREATE TABLE cb.tra_atracadouro(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	tipoatracad smallint NOT NULL,
	administracao smallint NOT NULL,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_complexo_portuario uuid,
	CONSTRAINT tra_atracadouro_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_condutor_hidrico_l(
	tipocondutor smallint NOT NULL,
	id_complexo_gerad_energ_eletr uuid,
	CONSTRAINT tra_condutor_hidrico_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_trecho_duto_l)
#
CREATE TABLE complexos.tra_complexo_portuario(
	tipotransporte smallint NOT NULL DEFAULT 0,
	tipocomplexoportuario smallint NOT NULL,
	CONSTRAINT tra_complexo_portuario_pk PRIMARY KEY (id)
) INHERITS(complexos.tra_estrut_transporte)
#
CREATE TABLE cb.tra_atracadouro_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_atracadouro_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_atracadouro)
#
CREATE TABLE cb.tra_atracadouro_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_atracadouro_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_atracadouro)
#
CREATE TABLE cb.tra_fundeadouro(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	destinacaofundeadouro smallint NOT NULL,
	administracao smallint NOT NULL DEFAULT 0,
	id_complexo_portuario uuid,
	CONSTRAINT tra_fundeadouro_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_fundeadouro_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_fundeadouro_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_fundeadouro)
#
CREATE TABLE cb.tra_fundeadouro_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_fundeadouro_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_fundeadouro)
#
CREATE TABLE cb.tra_obstaculo_navegacao(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipoobst smallint NOT NULL,
	situacaoemagua smallint NOT NULL,
	CONSTRAINT tra_obstaculo_navegacao_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.pto_est_med_fenomenos(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tipoestmed smallint,
	codigoest varchar(50),
	orgaoenteresp varchar(80),
	id_est_med_fenomenos uuid,
	CONSTRAINT pto_est_med_fenomenos_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.pto_pto_est_med_fenomenos_p(
	id serial NOT NULL,
	nome varchar(80),
	geometriaaproximada smallint NOT NULL,
	tipoptoestmed smallint NOT NULL,
	codestacao varchar(80),
	orgaoenteresp varchar(15),
	id_est_med_fenomenos uuid,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT pto_est_med_fenomenos_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_obstaculo_navegacao_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_obstaculo_navegacao_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_obstaculo_navegacao)
#
CREATE TABLE cb.tra_obstaculo_navegacao_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_obstaculo_navegacao_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_obstaculo_navegacao)
#
CREATE TABLE cb.tra_eclusa(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	desnivel float,
	largura float,
	extensao float,
	calado float,
	matconstr smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	CONSTRAINT tra_eclusa_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_eclusa_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_eclusa_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_eclusa)
#
CREATE TABLE cb.tra_faixa_seguranca_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	largura float,
	extensao float,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_faixa_seguranca_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE complexos.tra_duto(
	id uuid NOT NULL,
	nome varchar(80),
	CONSTRAINT dut_duto_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_eclusa_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_eclusa_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_eclusa)
#
CREATE TABLE cb.tra_funicular_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_funicular_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_funicular)
#
CREATE TABLE cb.tra_ponto_duto_p(
	id serial NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	relacionado smallint NOT NULL,
	CONSTRAINT tra_ponto_duto_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.lim_linha_de_limite_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	coincidecomdentrode smallint NOT NULL,
	geometriaaproximada smallint NOT NULL,
	extensao float,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT lim_linha_de_limite_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.lim_limite_intra_munic_adm_l(
	tipolimintramun smallint NOT NULL,
	obssituacao varchar(100),
	CONSTRAINT lim_limite_intra_munic_adm_l_pk PRIMARY KEY (id)
) INHERITS(cb.lim_linha_de_limite_l)
#
CREATE TABLE cb.lim_limite_operacional_l(
	tipolimoper smallint NOT NULL,
	obssituacao varchar(100),
	CONSTRAINT lim_limite_operacional_l_pk PRIMARY KEY (id)
) INHERITS(cb.lim_linha_de_limite_l)
#
CREATE TABLE cb.tra_passag_elevada_viaduto_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_passag_elevada_viaduto_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_passag_elevada_viaduto)
#
CREATE TABLE cb.lim_outros_limites_oficiais_l(
	tipooutlimofic smallint NOT NULL,
	obssituacao varchar(100),
	CONSTRAINT lim_outros_limites_oficiais_l_pk PRIMARY KEY (id)
) INHERITS(cb.lim_linha_de_limite_l)
#
CREATE TABLE cb.lim_limite_particular_l(
	obssituacao varchar(100),
	CONSTRAINT lim_limite_particular_l_pk PRIMARY KEY (id)
) INHERITS(cb.lim_linha_de_limite_l)
#
CREATE TABLE cb.lim_limite_area_especial_l(
	tipolimareaesp smallint NOT NULL,
	obssituacao varchar(100),
	CONSTRAINT lim_limite_area_especial_l_pk PRIMARY KEY (id)
) INHERITS(cb.lim_linha_de_limite_l)
#
CREATE TABLE cb.lim_area_politico_adm_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT lim_area_politico_adm_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.lim_unidade_federacao_a(
	sigla smallint NOT NULL,
	geocodigo varchar(80),
	CONSTRAINT lim_unidade_federacao_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.lim_municipio_a(
	geocodigo varchar(80),
	anodereferencia integer,
	CONSTRAINT lim_municipio_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.lim_regiao_administrativa_a(
	anodereferencia integer,
	CONSTRAINT lim_regiao_administrativa_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.lim_bairro_a(
	anodereferencia integer,
	CONSTRAINT lim_bairro_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.tra_caminho_aereo_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipocaminhoaereo smallint NOT NULL,
	tipousocaminhoaer smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	id_org_ext_mineral uuid,
	id_complexo_lazer uuid,
	CONSTRAINT tra_caminho_aereo_l_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.tra_entroncamento_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	tipoentroncamento smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_entroncamento_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.lim_distrito_a(
	geocodigo varchar(80),
	anodereferencia varchar(80),
	CONSTRAINT lim_distrito_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.lim_sub_distrito_a(
	geocodigo varchar(80),
	anodereferencia varchar(80),
	CONSTRAINT lim_sub_distrito_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.lim_area_especial(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	CONSTRAINT lim_area_especial_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.lim_area_especial OWNER TO postgres#
CREATE TABLE cb.lim_area_especial_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT lim_area_especial_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial)
#
CREATE TABLE cb.loc_localidade_p(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geocodigo varchar(80),
	identificador varchar(80),
	latitude varchar(15),
	latitude_gms real,
	longitude varchar(15),
	longitude_gms real,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT loc_localidade_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_travessia_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_travessia_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_travessia)
#
CREATE TABLE cb.loc_vila_p(
	CONSTRAINT loc_vila_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_localidade_p)
#
CREATE TABLE cb.loc_cidade_p(
	CONSTRAINT loc_cidade_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_localidade_p)
#
CREATE TABLE cb.loc_capital_p(
	tipocapital smallint NOT NULL,
	CONSTRAINT loc_capital_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_cidade_p)
#
CREATE TABLE cb.tra_cremalheira_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_cremalheira_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_cremalheira)
#
CREATE TABLE cb.tra_atracadouro_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_atracadouro_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_atracadouro)
#
CREATE TABLE cb.tra_fundeadouro_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_fundeadouro_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_fundeadouro)
#
CREATE TABLE cb.tra_obstaculo_navegacao_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_obstaculo_navegacao_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_obstaculo_navegacao)
#
CREATE TABLE cb.tra_ponto_rodoviario_ferrov(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	relacionado smallint NOT NULL,
	CONSTRAINT tra_ponto_rodoviario_ferrov_pk PRIMARY KEY (id)
)#
CREATE TABLE complexos.edu_complexo_lazer(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	tipocomplexolazer smallint NOT NULL,
	tipodivisaocnae smallint NOT NULL,
	administracao smallint NOT NULL,
	id_org_religiosa uuid,
	id_org_pub_civil uuid,
	id_org_pub_militar uuid,
	id_org_ensino uuid,
	CONSTRAINT laz_complexo_lazer_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_passagem_nivel_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_passagem_nivel_p_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.tra_girador_ferroviario_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL DEFAULT 2,
	administracao smallint NOT NULL DEFAULT 0,
	operacional smallint NOT NULL DEFAULT 0,
	situacaofisica smallint NOT NULL DEFAULT 0,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	id_estrut_apoio uuid,
	CONSTRAINT tra_girador_ferroviario_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_trecho_ferroviario_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	codtrechoferrov varchar(80),
	posicaorelativa smallint NOT NULL,
	tipotrechoferrov smallint NOT NULL,
	bitola smallint NOT NULL,
	eletrificada smallint NOT NULL,
	nrlinhas smallint NOT NULL,
	emarruamento smallint NOT NULL,
	jurisdicao smallint NOT NULL,
	administracao smallint NOT NULL,
	concessionaria varchar(80),
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	cargasuportmaxima float,
	id_via_ferrea uuid,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_trecho_ferroviario_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_eclusa_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_eclusa_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_eclusa)
#
CREATE TABLE cb.lim_limite_politico_adm_l(
	tipolimpol smallint NOT NULL,
	obssituacao varchar(100),
	CONSTRAINT lim_limite_politico_adm_l_pk PRIMARY KEY (id)
) INHERITS(cb.lim_linha_de_limite_l)
#
CREATE TABLE cb.tra_sinalizacao_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tiposinal smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_sinalizacao_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.lim_pais_a(
	sigla varchar(80),
	codiso3166 varchar(80) NOT NULL DEFAULT 'BRA',
	CONSTRAINT lim_pais_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_politico_adm_a)
#
CREATE TABLE cb.edu_arquibancada(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_arquibancada_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.lim_area_desenv_controle_a(
	classificacao varchar(80),
	CONSTRAINT lim_area_desenv_controle_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
CREATE TABLE cb.lim_area_uso_comunitario_a(
	tipoareausocomun smallint NOT NULL,
	CONSTRAINT lim_area_uso_comunitario_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
CREATE TABLE cb.edu_arquibancada_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT edu_arquibancada_a_pk PRIMARY KEY (id)
) INHERITS(cb.edu_arquibancada)
#
CREATE TABLE cb.loc_aglomerado_rural_p(
	CONSTRAINT loc_aglomerado_rural_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_localidade_p)
#
CREATE TABLE cb.edu_campo_quadra(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	tipocampoquadra smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_campo_quadra_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.lim_delimitacao_fisica_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipodelimfis smallint NOT NULL,
	matconstr smallint NOT NULL,
	eletrificada smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT lim_delimitacao_fisica_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.lim_marco_de_limite_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipomarcolim smallint NOT NULL,
	latitude_gms float,
	latitude varchar(15),
	longitude_gms float,
	longitude varchar(15),
	altitudeortometrica float,
	sistemageodesico smallint NOT NULL,
	outrarefplan varchar(80),
	referencialaltim smallint NOT NULL,
	outrarefalt varchar(80),
	orgresp varchar(80),
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT lim_marco_de_limite_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.lim_area_de_litigio_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	descricao varchar(255),
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT lim_area_de_litigio_a_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.edu_campo_quadra_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT edu_campo_quadra_a_pk PRIMARY KEY (id)
) INHERITS(cb.edu_campo_quadra)
#
CREATE TABLE cb.edu_pista_competicao_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	tipopista smallint NOT NULL,
	id_complexo_lazer uuid,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT edu_pista_competicao_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_ruina(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT laz_ruina_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_ruina_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT edu_ruina_a_pk PRIMARY KEY (id)
) INHERITS(cb.edu_ruina)
#
CREATE TABLE cb.loc_nome_local_p(
	id serial NOT NULL,
	nome varchar(80),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT loc_nome_local_p_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_arquibancada_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT edu_arquibancada_p_pk PRIMARY KEY (id)
) INHERITS(cb.edu_arquibancada)
#
CREATE TABLE cb.edu_campo_quadra_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT edu_campo_quadra_p_pk PRIMARY KEY (id)
) INHERITS(cb.edu_campo_quadra)
#
CREATE TABLE cb.tra_arruamento_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	revestimento smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	nrfaixas integer,
	trafego smallint NOT NULL,
	canteirodivisorio smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_arruamento_l_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_ruina_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT edu_ruina_p_pk PRIMARY KEY (id)
) INHERITS(cb.edu_ruina)
#
CREATE TABLE cb.asb_cemiterio(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipocemiterio smallint NOT NULL,
	denominacaoassociada smallint NOT NULL,
	CONSTRAINT asb_cemiterio_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.asb_cemiterio_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT asb_cemiterio_a_pk PRIMARY KEY (id)
) INHERITS(cb.asb_cemiterio)
#
CREATE TABLE complexos.sau_org_saude(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	administracao smallint NOT NULL,
	tipogrupocnae smallint NOT NULL,
	CONSTRAINT sau_org_saude_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.sau_org_saude_pub(
	tipoclassecnae smallint NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT sau_org_saude_pub_pk PRIMARY KEY (id)
) INHERITS(complexos.sau_org_saude)
#
CREATE TABLE complexos.sau_org_servico_social(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	administracao smallint NOT NULL,
	tipogrupocnae smallint NOT NULL,
	CONSTRAINT sau_org_servico_social_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.enc_area_comunicacao_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_complexo_comunicacao uuid,
	CONSTRAINT cbc_area_comunicacao_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.asb_area_abast_agua_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_complexo_abast_agua uuid,
	CONSTRAINT cbc_area_abast_agua_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.asb_area_saneamento_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_complexo_saneamento uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT cbc_area_saneamento_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_area_duto_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_area_duto_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.sau_area_servico_social_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_org_servico_social uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT sau_area_servico_social_a_pk PRIMARY KEY (id)
)#
CREATE TABLE cb.sau_area_saude_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_org_saude uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT sau_area_saude_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_area_ruinas_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT cbc_area_ruinas_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_area_lazer_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_area_lazer_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_area_comerc_serv_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_org_comerc_serv uuid,
	CONSTRAINT eco_area_comerc_serv_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_area_ensino_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_org_ensino uuid,
	CONSTRAINT cbc_area_ensino_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.edu_area_religiosa_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_org_religiosa uuid,
	CONSTRAINT cbc_area_religiosa_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.tra_ponto_ferroviario_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_ponto_ferroviario_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_ponto_rodoviario_ferrov)
#
CREATE TABLE cb.tra_ponto_rodoviario_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_ponto_rodoviario_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_ponto_rodoviario_ferrov)
#
CREATE TABLE cb.asb_cemiterio_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT asb_cemiterio_p_pk PRIMARY KEY (id)
) INHERITS(cb.asb_cemiterio)
#
CREATE TABLE cb.edu_edif_ensino_p(
	tipoclassecnae smallint NOT NULL,
	id_org_ensino uuid,
	CONSTRAINT edu_edif_ensino_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
CREATE TABLE complexos.sau_org_saude_militar(
	tipoclassecnae smallint NOT NULL,
	instituicao smallint NOT NULL,
	classificsigiloso smallint NOT NULL,
	id_org_pub_militar uuid,
	CONSTRAINT sau_org_saude_militar_pk PRIMARY KEY (id)
) INHERITS(complexos.sau_org_saude)
#
CREATE TABLE complexos.sau_org_servico_social_pub(
	tipoclassecnae smallint NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT sau_org_servico_social_pub_pk PRIMARY KEY (id)
) INHERITS(complexos.sau_org_servico_social)
#
CREATE EXTENSION "uuid-ossp"
      WITH SCHEMA public#
CREATE TABLE complexos.adm_instituicao_publica(
	id uuid NOT NULL,
	nome varchar(80) NOT NULL,
	nomeabrev varchar(50),
	tipogrupocnae smallint NOT NULL,
	id_instituicao_publica uuid,
	CONSTRAINT adm_instituicao_publica_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.eco_area_industrial_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_org_industrial uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT eco_area_industrial_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.tra_area_estrut_transporte_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_estrut_transporte uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT cbc_area_estrut_transporte_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE cb.loc_aglomerado_rural_isolado_p(
	tipoaglomrurisol smallint NOT NULL,
	CONSTRAINT loc_aglomerado_rural_isolado_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_aglomerado_rural_p)
#
CREATE TABLE cb.loc_aglom_rural_de_ext_urbana_p(
	CONSTRAINT loc_aglom_rural_de_ext_urbana_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_aglomerado_rural_p)
#
CREATE TABLE cb.pto_area_est_med_fenom_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	id_est_med_fenomenos uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT cbc_area_est_med_fenom_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE public.aux_geometria(
	id serial NOT NULL,
	classe varchar(80),
	CONSTRAINT aux_geometria_1 PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE public.aux_objeto_desconhecido(
	id serial NOT NULL,
	classe varchar(80),
	descricao varchar(80),
	CONSTRAINT aux_objeto_desconhecido_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE public.aux_objeto_desconhecido_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT aux_objeto_desconhecido_l_pk PRIMARY KEY (id)
) INHERITS(public.aux_objeto_desconhecido)
#
CREATE TABLE public.aux_ponto_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT aux_ponto_p_pk PRIMARY KEY (id)
) INHERITS(public.aux_geometria)
#
CREATE TABLE public.aux_linha_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT aux_linha_l_pk PRIMARY KEY (id)
) INHERITS(public.aux_geometria)
#
CREATE TABLE public.aux_area_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT aux_area_a_pk PRIMARY KEY (id)
) INHERITS(public.aux_geometria)
#
CREATE TABLE public.aux_objeto_desconhecido_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT aux_objeto_desconhecido_p_pk PRIMARY KEY (id)
) INHERITS(public.aux_objeto_desconhecido)
#
CREATE TABLE public.aux_objeto_desconhecido_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT aux_objeto_desconhecido_a_pk PRIMARY KEY (id)
) INHERITS(public.aux_objeto_desconhecido)
#
CREATE TABLE public.aux_moldura_a(
	id serial NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	mi varchar(80),
	inom varchar(80),
	escala varchar(80),
	nomecarta varchar(80),
	anoaquisicao varchar(80),
	engrespaquisicao varchar(80),
	opaquisicao varchar(80),
	datainicioaquisicao date,
	datafimaquisicao date,
	engresprevisaoaquisicao varchar(80),
	oprevisaoaquisicao varchar(80),
	datainiciorevaquisicao date,
	datafimrevaquisicao date,
	engrespreambulacao varchar(80),
	opreambulacao varchar(80),
	datainicioreambulacao date,
	datafimreambulacao date,
	oprevisaoreambulacao varchar(80),
	engrespvalidacaoedicao varchar(80),
	opvalidacao varchar(80),
	datainiciovalidacao date,
	datafimvalidacao date,
	opedicao1 varchar(80),
	datainicioedicao1 date,
	datafimedicao1 date,
	oprevedicao1 varchar(80),
	datainiciorevedicao1 date,
	datafimrevedicao1 date,
	opedicao2 varchar(80),
	datainicioedicao2 date,
	datafimedicao2 date,
	CONSTRAINT aux_moldura_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 10)
)#
CREATE TABLE public.db_metadata(
	edgvversion varchar(6) NOT NULL DEFAULT '2.1.3',
	dbimplversion varchar(50) NOT NULL DEFAULT 1,
	CONSTRAINT edgvversioncheck CHECK (edgvversion = '2.1.3')
)#
INSERT INTO public.db_metadata (edgvversion,dbimplversion) VALUES ('2.1.3','1')#
CREATE TABLE complexos.hid_curso_dagua(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	CONSTRAINT hid_curso_dagua_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE complexos.hid_trecho_curso_dagua(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	id_curso_dagua uuid,
	CONSTRAINT hid_trecho_curso_dagua_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.hid_natureza_fundo(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	materialpredominante smallint NOT NULL,
	espessalgas smallint NOT NULL,
	CONSTRAINT hid_natureza_fundo_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE TABLE cb.hid_natureza_fundo_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_natureza_fundo_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_natureza_fundo)
#
CREATE TABLE cb.hid_natureza_fundo_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT hid_natureza_fundo_l_pk PRIMARY KEY (id)
) INHERITS(cb.hid_natureza_fundo)
#
CREATE TABLE cb.hid_natureza_fundo_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_natureza_fundo_a_pk PRIMARY KEY (id)
) INHERITS(cb.hid_natureza_fundo)
#
CREATE TABLE cb.hid_rocha_em_agua_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT hid_rocha_em_agua_p_pk PRIMARY KEY (id)
) INHERITS(cb.hid_rocha_em_agua)
#
ALTER TABLE cb.hid_rocha_em_agua_p OWNER TO postgres#
CREATE TABLE cb.hid_bacia_hidrografica_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	codigootto integer,
	nivelotto integer,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT hid_bacia_hidrografica_a_pk PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
)#
CREATE INDEX hid_area_umida_a_geom_1408997021488 ON cb.hid_area_umida_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_fonte_dagua_p_geom_1408997017228 ON cb.hid_fonte_dagua_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_limite_massa_dagua_l_geom_140899701845 ON cb.hid_limite_massa_dagua_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_massa_dagua_a_geom_1408997018171 ON cb.hid_massa_dagua_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_ponto_drenagem_p_geom_1408997018772 ON cb.hid_ponto_drenagem_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_quebramar_molhe_l_geom_1408997019419 ON cb.hid_quebramar_molhe_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_queda_dagua_p_gist ON cb.hid_queda_dagua_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_recife_p_gist ON cb.hid_recife_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_reservatorio_hidrico_a_geom_1408997020482 ON cb.hid_reservatorio_hidrico_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_barragem_p_gist ON cb.hid_barragem_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_sumidouro_vertedouro_p_geom_1408997020972 ON cb.hid_sumidouro_vertedouro_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_terreno_sujeito_inundacao_a_geom_140899702189 ON cb.hid_terreno_suj_inundacao_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_trecho_drenagem_l_geom_1408997021361 ON cb.hid_trecho_drenagem_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_quebramar_molhe_a_geom_1408997019255 ON cb.hid_quebramar_molhe_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_banco_areia_l_gist ON cb.hid_banco_areia_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_banco_areia_a_geom_1408997016227 ON cb.hid_banco_areia_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_barragem_l_gist ON cb.hid_barragem_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_recife_l_gist ON cb.hid_recife_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_recife_a_gist ON cb.hid_recife_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_barragem_a_gist ON cb.hid_barragem_a
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_elemento_fisiog_natural_p_gist ON cb.rel_elemento_fisiog_natural_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_comporta_p_gist ON cb.hid_comporta_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_queda_dagua_l_gist ON cb.hid_queda_dagua_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_queda_dagua_a_gist ON cb.hid_queda_dagua_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_corredeira_p_gist ON cb.hid_corredeira_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_corredeira_l_gist ON cb.hid_corredeira_l
	USING btree
	(
	  geom
	)#
CREATE INDEX hid_comporta_l_geom_1408997016713 ON cb.hid_comporta_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_corredeira_a_gist ON cb.hid_corredeira_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_foz_maritima_p_gist ON cb.hid_foz_maritima_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_foz_maritima_l_gist ON cb.hid_foz_maritima_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_foz_maritima_a_gist ON cb.hid_foz_maritima_a
	USING gist
	(
	  geom
	)#
CREATE INDEX veg_vegetacao_a_gist ON cb.veg_vegetacao_a
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_curva_nivel_l_gist ON cb.rel_curva_nivel_l
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_curva_batimetrica_l_gist ON cb.rel_curva_batimetrica_l
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_ponto_cotado_batimetrico_p_gist ON cb.rel_ponto_cotado_batimetrico_p
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_ponto_cotado_altimetrico_p_gist ON cb.rel_ponto_cotado_altimetrico_p
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_elemento_fisiog_natural_l_gist ON cb.rel_elemento_fisiog_natural_l
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_alter_fisiog_antropica_l_gist ON cb.rel_alter_fisiog_antropica_l
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_alter_fisiog_antropica_a_gist ON cb.rel_alter_fisiog_antropica_a
	USING gist
	(
	  geom
	)#
CREATE INDEX loc_edificacao_p_gist ON cb.loc_edificacao_p
	USING gist
	(
	  geom
	)#
CREATE INDEX loc_edificacao_a_gist ON cb.loc_edificacao_a
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_elemento_fisiog_natural_a_gist ON cb.rel_elemento_fisiog_natural_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_rocha_em_agua_p_gist ON cb.hid_rocha_em_agua_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_rocha_em_agua_a_gist ON cb.hid_rocha_em_agua_a
	USING gist
	(
	  geom
	)#
CREATE INDEX "äsb_dep_abast_agua_a_gist" ON cb.asb_dep_abast_agua_a
	USING gist
	(
	  geom
	)#
CREATE INDEX asb_dep_saneamento_a_gist ON cb.asb_dep_saneamento_a
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_deposito_geral_a_gist ON cb.eco_deposito_geral_a
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_equip_agropec_l_gist ON cb.eco_equip_agropec_l
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_equip_agropec_a_1 ON cb.eco_equip_agropec_a
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_plataforma_a_gist ON cb.eco_plataforma_a
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_grupo_transformadores_a_gist ON cb.enc_grupo_transformadores_a
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_est_gerad_energia_eletrica_l_gist ON cb.enc_est_gerad_energia_eletr_l
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_est_gerad_energia_eletrica_a_gist ON cb.enc_est_gerad_energia_eletr_a
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_est_gerad_energia_eletrica_p_gist ON cb.enc_est_gerad_energia_eletr_p
	USING gist
	(
	  geom
	)#
CREATE INDEX pto_pto_geod_topo_controle_p_gist ON cb.pto_pto_geod_topo_controle_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_pista_ponto_pouso_l_gist ON cb.tra_pista_ponto_pouso_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_pista_ponto_pouso_a_gist ON cb.tra_pista_ponto_pouso_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_trecho_duto_l_gist ON cb.tra_trecho_duto_l
	USING gist
	(
	  geom
	)#
CREATE INDEX asb_dep_abast_agua_p_gist ON cb.asb_dep_abast_agua_p
	USING gist
	(
	  geom
	)#
CREATE INDEX asb_dep_saneamento_p_gist ON cb.asb_dep_saneamento_p
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_deposito_geral_p_gist ON cb.eco_deposito_geral_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_patio_a_gist ON cb.tra_patio_a
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_equip_agropec_p_gist ON cb.eco_equip_agropec_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_patio_p_gist ON cb.tra_patio_p
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_plataforma_p_gist ON cb.eco_plataforma_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_funicular_l_gist ON cb.tra_funicular_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_passagem_elevada_viaduto_l_gist ON cb.tra_passag_elevada_viaduto_l
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_grupo_transformadores_p_gist ON cb.enc_grupo_transformadores_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_ponte_l_gist ON cb.tra_ponte_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_tunel_p_gist ON cb.tra_tunel_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_tunel_l_gist ON cb.tra_tunel_l
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_area_ext_mineral_a_gist ON cb.eco_area_ext_mineral_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_travesssia_pedestre_p_gist ON cb.tra_travessia_pedestre_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_travessia_pedestre_l_gist ON cb.tra_travessia_pedestre_l
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_area_energia_eletrica_a_gist ON cb.enc_area_energia_eletrica_a
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_zona_lin_energ_comunic_a_gist ON cb.enc_zona_linhas_energia_com_a
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_torre_energia_p_gist ON cb.enc_torre_energia_p
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_antena_comunic_p_gist ON cb.enc_antena_comunic_p
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_torre_comunic_p_gist ON cb.enc_torre_comunic_p
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_trecho_energia_l_gist ON cb.enc_trecho_energia_l
	USING gist
	(
	  geom
	)#
CREATE INDEX enc_trecho_comunic_l_gist ON cb.enc_trecho_comunic_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_travessia_l_gist ON cb.tra_travessia_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_pista_ponto_pouso_p_gist ON cb.tra_pista_ponto_pouso_p
	USING gist
	(
	  geom
	)#
CREATE INDEX fer_cremalheira_l_gist ON cb.tra_cremalheira_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_atracadouro_l_gist ON cb.tra_atracadouro_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_atracadouro_a_gist ON cb.tra_atracadouro_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_fundeadouro_l_gist ON cb.tra_fundeadouro_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_fundeadouro_a_gist ON cb.tra_fundeadouro_a
	USING gist
	(
	  geom
	)#
CREATE INDEX pto_est_med_fenomenos_p_gist ON cb.pto_pto_est_med_fenomenos_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_obstaculo_navegacao_l_gist ON cb.tra_obstaculo_navegacao_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_obstaculo_navegacao_a_gist ON cb.tra_obstaculo_navegacao_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_eclusa_l_gist ON cb.tra_eclusa_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_faixa_seguranca_a_gist ON cb.tra_faixa_seguranca_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_eclusa_a_gist ON cb.tra_eclusa_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_funicular_p_gist ON cb.tra_funicular_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_ponto_duto_p_gist ON cb.tra_ponto_duto_p
	USING gist
	(
	  geom
	)#
CREATE INDEX lim_linha_de_limite_l_gist ON cb.lim_linha_de_limite_l
	USING gist
	(
	  geom
	)#
CREATE INDEX lim_area_politico_adm_a_gist ON cb.lim_area_politico_adm_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_caminho_aereo_l_gist ON cb.tra_caminho_aereo_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_entroncamento_p_gist ON cb.tra_entroncamento_p
	USING gist
	(
	  geom
	)#
CREATE INDEX loc_localidade_p_gist ON cb.loc_localidade_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_travessia_p_gist ON cb.tra_travessia_p
	USING gist
	(
	  geom
	)#
CREATE INDEX fer_cremalheira_p_gist ON cb.tra_cremalheira_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_atracadouro_p_gist ON cb.tra_atracadouro_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_fundeadouro_p_gist ON cb.tra_fundeadouro_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_obstaculo_navegacao_p_gist ON cb.tra_obstaculo_navegacao_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_passagem_nivel_p_gist ON cb.tra_passagem_nivel_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_girador_ferroviario_p_gist ON cb.tra_girador_ferroviario_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_trecho_ferroviario_l_gist ON cb.tra_trecho_ferroviario_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_eclusa_p_gist ON cb.tra_eclusa_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_sinalizacao_p_gist ON cb.tra_sinalizacao_p
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_arquibancada_a_gist ON cb.edu_arquibancada_a
	USING gist
	(
	  geom
	)#
CREATE INDEX lim_delimitacao_fisica_l_gist ON cb.lim_delimitacao_fisica_l
	USING gist
	(
	  geom
	)#
CREATE INDEX lim_marco_de_limite_p_gist ON cb.lim_marco_de_limite_p
	USING gist
	(
	  geom
	)#
CREATE INDEX lim_area_de_litigio_a_gist ON cb.lim_area_de_litigio_a
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_campo_quadra_a_gist ON cb.edu_campo_quadra_a
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_ruina_a_gist ON cb.edu_ruina_a
	USING gist
	(
	  geom
	)#
CREATE INDEX loc_nome_local_p_gist ON cb.loc_nome_local_p
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_arquibancada_p_gist ON cb.edu_arquibancada_p
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_campo_quadra_p_gist ON cb.edu_campo_quadra_p
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_ruina_p_gist ON cb.edu_ruina_p
	USING gist
	(
	  geom
	)#
CREATE INDEX abs_cemiterio_a_gist ON cb.asb_cemiterio_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_comunicacao_a_gist ON cb.enc_area_comunicacao_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_abast_agua_a_gist ON cb.asb_area_abast_agua_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_saneamento_a_gist ON cb.asb_area_saneamento_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_area_duto_a_gist ON cb.tra_area_duto_a
	USING gist
	(
	  geom
	)#
CREATE INDEX sau_area_servico_social_a_gist ON cb.sau_area_servico_social_a
	USING gist
	(
	  geom
	)#
CREATE INDEX sau_area_saude_a_gist ON cb.sau_area_saude_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_ruinas_a_gist ON cb.edu_area_ruinas_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_lazer_a_gist ON cb.edu_area_lazer_a
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_area_comerc_serv_a_gist ON cb.eco_area_comerc_serv_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_ensino_a_gist ON cb.edu_area_ensino_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_religiosa_a_gist ON cb.edu_area_religiosa_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_ponto_ferroviario_p_gist ON cb.tra_ponto_ferroviario_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_ponto_rodoviario_p_gist ON cb.tra_ponto_rodoviario_p
	USING gist
	(
	  geom
	)#
CREATE INDEX asb_cemiterio_p_gist ON cb.asb_cemiterio_p
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_area_industrial_a_gist ON cb.eco_area_industrial_a
	USING gist
	(
	  geom
	)#
CREATE INDEX cbc_area_est_med_fenom_a_gist ON cb.pto_area_est_med_fenom_a
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_objeto_desconhecido_l_gist ON public.aux_objeto_desconhecido_l
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_ponto_p_gist ON public.aux_ponto_p
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_linha_l_gist ON public.aux_linha_l
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_area_a_gist ON public.aux_area_a
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_objeto_desconhecido_p_gist ON public.aux_objeto_desconhecido_p
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_objeto_desconhecido_a_gist ON public.aux_objeto_desconhecido_a
	USING gist
	(
	  geom
	)#
CREATE INDEX aux_moldura_a_gist ON public.aux_moldura_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_natureza_fundo_p_gist ON cb.hid_natureza_fundo_p
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_natureza_fundo_l_gist ON cb.hid_natureza_fundo_l
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_natureza_fundo_a_gist ON cb.hid_natureza_fundo_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_bacia_hidrografica_a_gist ON cb.hid_bacia_hidrografica_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.eco_ext_mineral_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT eco_ext_mineral_p_pk PRIMARY KEY (id)
) INHERITS(cb.eco_ext_mineral)
#
ALTER TABLE cb.eco_ext_mineral_p OWNER TO postgres#
CREATE INDEX eco_ext_mineral_p_gist ON cb.eco_ext_mineral_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.eco_ext_mineral_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT eco_ext_mineral_a_pk PRIMARY KEY (id)
) INHERITS(cb.eco_ext_mineral)
#
ALTER TABLE cb.eco_ext_mineral_a OWNER TO postgres#
CREATE INDEX eco_ext_mineral_a_gist ON cb.eco_ext_mineral_a
	USING gist
	(
	  geom
	)#
CREATE INDEX rel_terreno_exposto_a_gist ON cb.rel_terreno_exposto_a
	USING gist
	(
	  geom
	)#
CREATE INDEX veg_veg_area_contato_gist ON cb.veg_veg_area_contato_a
	USING gist
	(
	  geom
	)#
CREATE INDEX veg_veg_cultivada_a_gist ON cb.veg_veg_cultivada_a
	USING gist
	(
	  geom
	)#
CREATE INDEX veg_campo_a_gist ON cb.veg_campo_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.veg_macega_chavascal_a(
	tipomacchav smallint NOT NULL,
	alturamediaindividuos real,
	classificacaoporte smallint NOT NULL,
	CONSTRAINT veg_macega_chavascal_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
ALTER TABLE cb.veg_macega_chavascal_a OWNER TO postgres#
CREATE TABLE cb.veg_estepe_a(
	alturamediaindividuos real,
	CONSTRAINT veg_estepe_a_pk PRIMARY KEY (id)
) INHERITS(cb.veg_vegetacao_a)
#
ALTER TABLE cb.veg_estepe_a OWNER TO postgres#
CREATE TABLE complexos.tra_via_rodoviaria(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	sigla varchar(6) NOT NULL,
	CONSTRAINT tra_via_rodoviaria_pk PRIMARY KEY (id)
)#
ALTER TABLE complexos.tra_via_rodoviaria OWNER TO postgres#
CREATE INDEX tra_trecho_rodoviario_l_gist ON cb.tra_trecho_rodoviario_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_identific_trecho_rod_p(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	sigla varchar(6) NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	id_via_rodoviaria uuid,
	CONSTRAINT tra_identific_trecho_rod_p_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.tra_identific_trecho_rod_p OWNER TO postgres#
CREATE INDEX tra_identific_trecho_rod_p_gist ON cb.tra_identific_trecho_rod_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_galeria_bueiro(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	matconstr smallint NOT NULL,
	pesosuportmaximo real,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	CONSTRAINT tra_galeria_bueiro_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.tra_galeria_bueiro OWNER TO postgres#
CREATE TABLE cb.tra_galeria_bueiro_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_galeria_bueiro_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_galeria_bueiro)
#
ALTER TABLE cb.tra_galeria_bueiro_p OWNER TO postgres#
CREATE INDEX tra_galeria_bueiro_p_gist ON cb.tra_galeria_bueiro_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_galeria_bueiro_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_galeria_bueiro_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_galeria_bueiro)
#
ALTER TABLE cb.tra_galeria_bueiro_l OWNER TO postgres#
CREATE INDEX tra_galeria_bueiro_l_gist ON cb.tra_galeria_bueiro_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_ponte_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_ponte_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_ponte)
#
CREATE TABLE cb.tra_passag_elevada_viaduto_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_passag_elevada_viaduto_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_passag_elevada_viaduto)
#
CREATE TABLE cb.tra_trilha_picada_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_trilha_picada_l_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.tra_trilha_picada_l OWNER TO postgres#
CREATE INDEX tra_trilha_picada_l_gist ON cb.tra_trilha_picada_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_ciclovia_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	administracao smallint NOT NULL,
	revestimento smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	trafego smallint NOT NULL,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL
)#
ALTER TABLE cb.tra_ciclovia_l OWNER TO postgres#
CREATE INDEX tra_ciclovia_l_gist ON cb.tra_ciclovia_l
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_arruamento_l_gist ON cb.tra_arruamento_l
	USING gist
	(
	  geom
	)#
CREATE TABLE complexos.tra_via_ferrea(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	CONSTRAINT tra_via_ferrea_pk PRIMARY KEY (id)
)#
ALTER TABLE complexos.tra_via_ferrea OWNER TO postgres#
CREATE TABLE cb.tra_local_critico(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	tipolocalcrit smallint NOT NULL,
	CONSTRAINT tra_local_critico_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.tra_local_critico OWNER TO postgres#
CREATE TABLE cb.tra_local_critico_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_local_critico_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_local_critico)
#
ALTER TABLE cb.tra_local_critico_p OWNER TO postgres#
CREATE INDEX tra_local_critico_p_gist ON cb.tra_local_critico_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_local_critico_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT tra_local_critico_l_pk PRIMARY KEY (id)
) INHERITS(cb.tra_local_critico)
#
ALTER TABLE cb.tra_local_critico_l OWNER TO postgres#
CREATE INDEX tra_local_critico_l_gist ON cb.tra_local_critico_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_local_critico_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_local_critico_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_local_critico)
#
ALTER TABLE cb.tra_local_critico_a OWNER TO postgres#
CREATE INDEX tra_local_critico_a_gist ON cb.tra_local_critico_a
	USING gist
	(
	  geom
	)#
CREATE TABLE complexos.tra_hidrovia(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	administracao smallint NOT NULL,
	extensaototal real,
	CONSTRAINT tra_hidrovia_pk PRIMARY KEY (id)
)#
ALTER TABLE complexos.tra_hidrovia OWNER TO postgres#
CREATE TABLE cb.tra_trecho_hidroviario_l(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	regime smallint NOT NULL,
	extensaotrecho real,
	caladomaxseca real,
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	id_hidrovia uuid,
	CONSTRAINT tra_trecho_hidroviario_l_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.tra_trecho_hidroviario_l OWNER TO postgres#
CREATE INDEX tra_trecho_hidroviario_l_gist ON cb.tra_trecho_hidroviario_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_ponto_hidroviario_p(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	relacionado smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL
)#
ALTER TABLE cb.tra_ponto_hidroviario_p OWNER TO postgres#
CREATE INDEX tra_ponto_hidroviario_p_gist ON cb.tra_ponto_hidroviario_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_ponte_p_gist ON cb.tra_ponte_p
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_passagem_elevada_viaduto_p_gist ON cb.tra_passag_elevada_viaduto_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_posto_combustivel(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	administracao smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	matconstr smallint NOT NULL,
	id_estrut_transporte uuid,
	CONSTRAINT tra_posto_combustivel_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.tra_posto_combustivel OWNER TO postgres#
CREATE TABLE cb.tra_posto_combustivel_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT tra_posto_combustivel_p_pk PRIMARY KEY (id)
) INHERITS(cb.tra_posto_combustivel)
#
ALTER TABLE cb.tra_posto_combustivel_p OWNER TO postgres#
CREATE INDEX tra_posto_combustivel_p_gist ON cb.tra_posto_combustivel_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.tra_posto_combustivel_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT tra_posto_combustivel_a_pk PRIMARY KEY (id)
) INHERITS(cb.tra_posto_combustivel)
#
ALTER TABLE cb.tra_posto_combustivel_a OWNER TO postgres#
CREATE INDEX tra_posto_combustivel_a_gist ON cb.tra_posto_combustivel_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.enc_ponto_trecho_energia_p(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	tipoptoenergia smallint NOT NULL,
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT enc_ponto_trecho_energia_p_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.enc_ponto_trecho_energia_p OWNER TO postgres#
CREATE INDEX enc_ponto_trecho_energia_p_gist ON cb.enc_ponto_trecho_energia_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.edu_piscina_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_complexo_lazer uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT edu_piscina_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.edu_piscina_a OWNER TO postgres#
CREATE INDEX edu_piscina_a_gist ON cb.edu_piscina_a
	USING gist
	(
	  geom
	)#
CREATE INDEX edu_pista_competicao_l_gist ON cb.edu_pista_competicao_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.edu_coreto_tribuna(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_complexo_lazer uuid,
	CONSTRAINT edu_coreto_tribuna_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.edu_coreto_tribuna OWNER TO postgres#
CREATE TABLE cb.edu_coreto_tribuna_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT edu_coreto_tribuna_p_pk PRIMARY KEY (id)
) INHERITS(cb.edu_coreto_tribuna)
#
ALTER TABLE cb.edu_coreto_tribuna_p OWNER TO postgres#
CREATE INDEX edu_coreto_tribuna_p_gist ON cb.edu_coreto_tribuna_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.edu_coreto_tribuna_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT edu_coreto_tribuna_a_pk PRIMARY KEY (id)
) INHERITS(cb.edu_coreto_tribuna)
#
ALTER TABLE cb.edu_coreto_tribuna_a OWNER TO postgres#
CREATE INDEX edu_coreto_tribuna_a_gist ON cb.edu_coreto_tribuna_a
	USING gist
	(
	  geom
	)#
CREATE INDEX eco_area_agrop_ext_veg_pesca_a_gist ON cb.eco_area_agrop_ext_veg_pesca_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.adm_area_pub_civil_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT adm_area_pub_civil_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.adm_area_pub_civil_a OWNER TO postgres#
CREATE TABLE cb.adm_posto_fiscal(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	tipopostofisc smallint NOT NULL,
	id_org_pub_civil uuid,
	CONSTRAINT adm_posto_fiscal_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.adm_posto_fiscal OWNER TO postgres#
CREATE TABLE cb.adm_posto_fiscal_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT adm_posto_fiscal_p_pk PRIMARY KEY (id)
) INHERITS(cb.adm_posto_fiscal)
#
ALTER TABLE cb.adm_posto_fiscal_p OWNER TO postgres#
CREATE TABLE cb.adm_area_pub_militar_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	id_org_pub_militar uuid,
	CONSTRAINT adm_area_pub_militar_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.adm_area_pub_militar_a OWNER TO postgres#
CREATE TABLE cb.adm_posto_pol_rod(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tipopostopol smallint NOT NULL,
	geometriaaproximada smallint NOT NULL,
	operacional smallint NOT NULL,
	situacaofisica smallint NOT NULL,
	id_org_pub_militar uuid,
	id_org_pub_civil uuid,
	CONSTRAINT adm_posto_pol_rod_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.adm_posto_pol_rod OWNER TO postgres#
CREATE TABLE cb.adm_posto_pol_rod_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT adm_posto_pol_rod_p_pk PRIMARY KEY (id)
) INHERITS(cb.adm_posto_pol_rod)
#
ALTER TABLE cb.adm_posto_pol_rod_p OWNER TO postgres#
CREATE TABLE complexos.loc_complexo_habitacional(
	id uuid NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	CONSTRAINT loc_complexo_habitacional_pk PRIMARY KEY (id)
)#
ALTER TABLE complexos.loc_complexo_habitacional OWNER TO postgres#
CREATE TABLE complexos.loc_aldeia_indigena(
	codigofunai varchar(12),
	terraindigena varchar(100),
	etnia varchar(100),
	CONSTRAINT loc_aldeia_indigena_pk PRIMARY KEY (id)
) INHERITS(complexos.loc_complexo_habitacional)
#
ALTER TABLE complexos.loc_aldeia_indigena OWNER TO postgres#
CREATE TABLE cb.loc_edif_habitacional_p(
	id_complexo_habitacional uuid,
	CONSTRAINT loc_edif_habitacional_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_p)
#
ALTER TABLE cb.loc_edif_habitacional_p OWNER TO postgres#
CREATE TABLE cb.loc_hab_indigena(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	coletiva smallint NOT NULL,
	isolada smallint NOT NULL,
	id_aldeia_indigena uuid,
	CONSTRAINT loc_hab_indigena_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.loc_hab_indigena OWNER TO postgres#
CREATE TABLE cb.loc_edif_habitacional_a(
	id_complexo_habitacional uuid,
	CONSTRAINT loc_edif_habitacional_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_edificacao_a)
#
ALTER TABLE cb.loc_edif_habitacional_a OWNER TO postgres#
CREATE TABLE cb.loc_hab_indigena_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT loc_hab_indigena_a_pk PRIMARY KEY (id)
) INHERITS(cb.loc_hab_indigena)
#
ALTER TABLE cb.loc_hab_indigena_a OWNER TO postgres#
CREATE TABLE cb.loc_area_habitacional_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	id_complexo_habitacional uuid,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT loc_area_habitacional_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.loc_area_habitacional_a OWNER TO postgres#
CREATE INDEX loc_area_habitacional_a_gist ON cb.loc_area_habitacional_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.loc_area_edificada_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT loc_area_edificada_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.loc_area_edificada_a OWNER TO postgres#
CREATE TABLE cb.lim_terra_publica_a(
	classificacao varchar(100),
	CONSTRAINT lim_terra_publica_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
ALTER TABLE cb.lim_terra_publica_a OWNER TO postgres#
CREATE TABLE cb.lim_terra_indigena(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	nometi varchar(100),
	situacaojuridica smallint NOT NULL,
	datasituacaojuridica date,
	grupoetnico varchar(100),
	areaoficialha real,
	perimetrooficial real,
	CONSTRAINT lim_terra_indigena_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.lim_terra_indigena OWNER TO postgres#
CREATE TABLE cb.lim_terra_indigena_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT lim_terra_indigena_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_terra_indigena)
#
ALTER TABLE cb.lim_terra_indigena_p OWNER TO postgres#
CREATE INDEX lim_terra_indigena_p_gist ON cb.lim_terra_indigena_p
	USING gist
	(
	  geom
	)#
CREATE INDEX adm_area_pub_civil_a_gist ON cb.adm_area_pub_civil_a
	USING gist
	(
	  geom
	)#
CREATE INDEX adm_area_pub_militar_a_gist ON cb.adm_area_pub_militar_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.lim_terra_indigena_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT lim_terra_indigena_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_terra_indigena)
#
ALTER TABLE cb.lim_terra_indigena_a OWNER TO postgres#
CREATE INDEX lim_terra_indigena_a_gist ON cb.lim_terra_indigena_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.lim_outras_unid_protegidas_a(
	tipooutunidprot smallint NOT NULL,
	anocriacao varchar(4),
	historicomodificacao varchar(255),
	sigla varchar(6),
	areaoficial varchar(15),
	administracao smallint NOT NULL,
	CONSTRAINT lim_outras_unid_protegidas_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
ALTER TABLE cb.lim_outras_unid_protegidas_a OWNER TO postgres#
CREATE TABLE cb.lim_unidade_conserv_nao_snuc_a(
	atolegal varchar(100),
	administracao smallint NOT NULL,
	classificacao varchar(100),
	anocriacao varchar(4),
	sigla varchar(6),
	areaoficial varchar(15),
	CONSTRAINT lim_unidade_conserv_nao_snuc_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_a OWNER TO postgres#
CREATE TABLE cb.lim_unidade_protecao_integral_a(
	tipounidprotinteg smallint NOT NULL,
	administracao smallint NOT NULL,
	atolegal varchar(100),
	areaoficial varchar(15),
	anocriacao integer,
	sigla varchar(6),
	CONSTRAINT lim_unidade_protecao_integral_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
ALTER TABLE cb.lim_unidade_protecao_integral_a OWNER TO postgres#
CREATE TABLE cb.lim_unidade_uso_sustentavel_a(
	anocriacao integer,
	sigla varchar(6),
	areaoficialha float,
	atolegal varchar(100),
	administracao smallint NOT NULL,
	tipounidusosust smallint NOT NULL,
	CONSTRAINT lim_unidade_uso_sustentavel_a_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_a)
#
ALTER TABLE cb.lim_unidade_uso_sustentavel_a OWNER TO postgres#
CREATE TABLE cb.lim_area_especial_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT lim_area_especial_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial)
#
CREATE TABLE cb.lim_area_uso_comunitario_p(
	tipoareausocomun smallint NOT NULL,
	CONSTRAINT lim_area_uso_comunitario_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
CREATE TABLE cb.lim_area_desenv_controle_p(
	classificacao varchar(80),
	CONSTRAINT lim_area_desenv_controle_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
CREATE TABLE cb.lim_terra_publica_p(
	classificacao varchar(100),
	CONSTRAINT lim_terra_publica_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
ALTER TABLE cb.lim_terra_publica_p OWNER TO postgres#
CREATE TABLE cb.lim_outras_unid_protegidas_p(
	tipooutunidprot smallint NOT NULL,
	anocriacao varchar(4),
	historicomodificacao varchar(255),
	sigla varchar(6),
	areaoficial varchar(15),
	administracao smallint NOT NULL,
	CONSTRAINT lim_outras_unid_protegidas_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
ALTER TABLE cb.lim_outras_unid_protegidas_p OWNER TO postgres#
CREATE TABLE cb.lim_unidade_conserv_nao_snuc_p(
	atolegal varchar(100),
	administracao smallint NOT NULL,
	classificacao varchar(100),
	anocriacao varchar(4),
	sigla varchar(6),
	areaoficial varchar(15),
	CONSTRAINT lim_unidade_conserv_nao_snuc_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_p OWNER TO postgres#
CREATE TABLE cb.lim_unidade_protecao_integral_p(
	anocriacao integer,
	areaoficial varchar(15),
	atolegal varchar(100),
	administracao smallint NOT NULL,
	tipounidprotinteg smallint NOT NULL,
	sigla varchar(6),
	CONSTRAINT lim_unidade_protecao_integral_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
ALTER TABLE cb.lim_unidade_protecao_integral_p OWNER TO postgres#
CREATE TABLE cb.lim_unidade_uso_sustentavel_p(
	anocriacao integer,
	sigla varchar(6),
	areaoficialha float,
	atolegal varchar(100),
	administracao smallint NOT NULL,
	tipounidusosust smallint NOT NULL,
	CONSTRAINT lim_unidade_uso_sustentavel_p_pk PRIMARY KEY (id)
) INHERITS(cb.lim_area_especial_p)
#
ALTER TABLE cb.lim_unidade_uso_sustentavel_p OWNER TO postgres#
CREATE INDEX lim_area_especial_p_gist ON cb.lim_area_especial_p
	USING gist
	(
	  geom
	)#
CREATE INDEX lim_area_especial_a_gist ON cb.lim_area_especial_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.lim_area_particular_a(
	id serial NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	geometriaaproximada smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT lim_area_particular_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.lim_area_particular_a OWNER TO postgres#
CREATE INDEX lim_area_particular_a_gist ON cb.lim_area_particular_a
	USING gist
	(
	  geom
	)#
CREATE INDEX adm_posto_pol_rod_p_gist ON cb.adm_posto_pol_rod_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.adm_posto_pol_rod_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT adm_posto_pol_rod_a_pk PRIMARY KEY (id)
) INHERITS(cb.adm_posto_pol_rod)
#
ALTER TABLE cb.adm_posto_pol_rod_a OWNER TO postgres#
CREATE INDEX adm_posto_pol_rod_a_gist ON cb.adm_posto_pol_rod_a
	USING gist
	(
	  geom
	)#
CREATE INDEX adm_posto_fiscal_p_gist ON cb.adm_posto_fiscal_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.adm_posto_fiscal_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT adm_posto_fiscal_a_pk PRIMARY KEY (id)
) INHERITS(cb.adm_posto_fiscal)
#
ALTER TABLE cb.adm_posto_fiscal_a OWNER TO postgres#
CREATE INDEX adm_posto_fiscal_a_gist ON cb.adm_posto_fiscal_a
	USING gist
	(
	  geom
	)#
CREATE INDEX tra_area_estrut_transporte_a_gist ON cb.tra_area_estrut_transporte_a
	USING gist
	(
	  geom
	)#
CREATE INDEX loc_area_edificada_a_gist ON cb.loc_area_edificada_a
	USING gist
	(
	  geom
	)#
CREATE INDEX hid_trecho_massa_dagua_a_gist ON cb.hid_trecho_massa_dagua_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.loc_hab_indigena_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT loc_hab_indigena_p_pk PRIMARY KEY (id)
) INHERITS(cb.loc_hab_indigena)
#
ALTER TABLE cb.loc_hab_indigena_p OWNER TO postgres#
CREATE INDEX loc_hab_indigena_p_gist ON cb.loc_hab_indigena_p
	USING gist
	(
	  geom
	)#
CREATE INDEX loc_hab_indigena_a_gist ON cb.loc_hab_indigena_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.loc_area_urbana_isolada_a(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	nome varchar(80),
	nomeabrev varchar(50),
	tipoassociado smallint NOT NULL,
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT loc_area_urbana_isolada_a_pk PRIMARY KEY (id)
)#
ALTER TABLE cb.loc_area_urbana_isolada_a OWNER TO postgres#
CREATE INDEX loc_area_urbana_isolada_a_gist ON cb.loc_area_urbana_isolada_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.aux_descontinuidade_geometrica(
	id serial NOT NULL,
	geometriaaproximada smallint NOT NULL,
	motivodescontinuidade smallint NOT NULL,
	CONSTRAINT descontinuidade_geometrica_ok PRIMARY KEY (id)
)#
ALTER TABLE cb.aux_descontinuidade_geometrica OWNER TO postgres#
CREATE TABLE cb.aux_descontinuidade_geometrica_p(
	geom geometry(MULTIPOINT, [epsg]) NOT NULL,
	CONSTRAINT aux_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica)
#
ALTER TABLE cb.aux_descontinuidade_geometrica_p OWNER TO postgres#
CREATE INDEX aux_descontinuidade_geometrica_p_gist ON cb.aux_descontinuidade_geometrica_p
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.aux_descontinuidade_geometrica_l(
	geom geometry(MULTILINESTRING, [epsg]) NOT NULL,
	CONSTRAINT aux_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica)
#
ALTER TABLE cb.aux_descontinuidade_geometrica_l OWNER TO postgres#
CREATE INDEX aux_descontinuidade_geom_l_gist ON cb.aux_descontinuidade_geometrica_l
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.aux_descontinuidade_geometrica_a(
	geom geometry(MULTIPOLYGON, [epsg]) NOT NULL,
	CONSTRAINT aux_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica)
#
ALTER TABLE cb.aux_descontinuidade_geometrica_a OWNER TO postgres#
CREATE INDEX aux_descontinuidade_geometrica_a_gist ON cb.aux_descontinuidade_geometrica_a
	USING gist
	(
	  geom
	)#
CREATE TABLE cb.hid_descontinuidade_geometrica_p(
	CONSTRAINT hid_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.hid_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.hid_descontinuidade_geometrica_l(
	CONSTRAINT hid_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.hid_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.rel_descontinuidade_geometrica_p(
	CONSTRAINT rel_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.rel_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.rel_descontinuidade_geometrica_l(
	CONSTRAINT rel_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.rel_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.rel_descontinuidade_geometrica_a(
	CONSTRAINT rel_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.rel_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.veg_descontinuidade_geometrica_p(
	CONSTRAINT veg_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.veg_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.veg_descontinuidade_geometrica_l(
	CONSTRAINT veg_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.veg_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.tra_descontinuidade_geometrica_p(
	CONSTRAINT tra_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.tra_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.tra_descontinuidade_geometrica_l(
	CONSTRAINT tra_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.tra_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.tra_descontinuidade_geometrica_a(
	CONSTRAINT tra_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.tra_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.enc_descontinuidade_geometrica_a(
	CONSTRAINT enc_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.enc_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.enc_descontinuidade_geometrica_p(
	CONSTRAINT enc_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.enc_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.asb_descontinuidade_geometrica_p(
	CONSTRAINT asb_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.asb_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.asb_descontinuidade_geometrica_l(
	CONSTRAINT asb_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.asb_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.asb_descontinuidade_geometrica_a(
	CONSTRAINT asb_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.asb_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.edu_descontinuidade_geometrica_a(
	CONSTRAINT edu_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.edu_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.edu_descontinuidade_geometrica_l(
	CONSTRAINT edu_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.edu_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.edu_descontinuidade_geometrica_p(
	CONSTRAINT edu_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.edu_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.eco_descontinuidade_geometrica_p(
	CONSTRAINT eco_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.eco_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.eco_descontinuidade_geometrica_l(
	CONSTRAINT eco_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.eco_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.eco_descontinuidade_geometrica_a(
	CONSTRAINT eco_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.eco_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.loc_descontinuidade_geometrica_a(
	CONSTRAINT loc_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.loc_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.loc_descontinuidade_geometrica_l(
	CONSTRAINT loc_descontinuidade_geometrica_l_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_l)
#
ALTER TABLE cb.loc_descontinuidade_geometrica_l OWNER TO postgres#
CREATE TABLE cb.loc_descontinuidade_geometrica_p(
	CONSTRAINT loc_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.loc_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.pto_descontinuidade_geometrica_p(
	CONSTRAINT pto_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.pto_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.pto_descontinuidade_geometrica_a(
	CONSTRAINT pto_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.pto_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.lim_descontinuidade_geometrica_p(
	CONSTRAINT lim_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.lim_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.lim_descontinuidade_geometrica_a(
	CONSTRAINT lim_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.lim_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.adm_descontinuidade_geometrica_p(
	CONSTRAINT adm_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.adm_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE cb.adm_descontinuidade_geometrica_a(
	CONSTRAINT adm_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.adm_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.sau_descontinuidade_geometrica_a(
	CONSTRAINT sau_descontinuidade_geometrica_a_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_a)
#
ALTER TABLE cb.sau_descontinuidade_geometrica_a OWNER TO postgres#
CREATE TABLE cb.sau_descontinuidade_geometrica_p(
	CONSTRAINT sau_descontinuidade_geometrica_p_pk PRIMARY KEY (id)
) INHERITS(cb.aux_descontinuidade_geometrica_p)
#
ALTER TABLE cb.sau_descontinuidade_geometrica_p OWNER TO postgres#
CREATE TABLE dominios.geracao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 geracao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoplataforma (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoplataforma_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.posicaoreledific (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 posicaoreledific_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoextmin (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoextmin_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.canteirodivisorio (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 canteirodivisorio_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolocalcrit (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolocalcrit_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocomplexolazer (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocomplexolazer_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.indice (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 indice_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoaglomrurisol (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoaglomrurisol_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.denso (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 denso_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipodepgeral (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipodepgeral_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.materializado (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 materializado_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.referencialgrav (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 referencialgrav_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.nrlinhas (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 nrlinhas_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoareaumida (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoareaumida_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.destenergelet (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 destenergelet_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiporef (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiporef_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.coletiva (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 coletiva_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocaminhoaereo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocaminhoaereo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaofisica (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaofisica_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotrechocomunic (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotrechocomunic_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.destinadoa (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 destinadoa_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipomacchav (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipomacchav_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.motivodescontinuidade (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 motivodescontinuidade_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoponte (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoponte_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoptocontrole (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoptocontrole_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.mattransp (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 mattransp_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolavoura (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolavoura_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifcivil (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifcivil_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiposecaocnae (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiposecaocnae_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.emduto (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 emduto_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolimpol (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolimpol_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.salinidade (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 salinidade_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoconteudo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoconteudo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoprodutoresiduo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoprodutoresiduo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifabast (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifabast_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.posicaopista (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 posicaopista_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.especie (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 especie_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoestgerad (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoestgerad_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiporesiduo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiporesiduo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifenergia (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifenergia_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.bitola (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 bitola_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotravessiaped (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotravessiaped_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifaero (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifaero_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.funcaoedifmetroferrov (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 funcaoedifmetroferrov_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipopostopol (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipopostopol_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoelemnat (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoelemnat_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocombustivel (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocombustivel_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoalterantrop (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoalterantrop_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.especiepredominante (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 especiepredominante_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotrechoferrov (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotrechoferrov_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocampo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocampo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoptoestmed (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoptoestmed_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.referencialaltim (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 referencialaltim_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.caracteristicafloresta (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 caracteristicafloresta_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.relacionado_hid (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 relacionado_hid_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoqueda (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoqueda_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.poderpublico (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 poderpublico_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoediflazer (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoediflazer_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.administracao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 administracao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifturist (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifturist_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.usoprincipal (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 usoprincipal_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoilha (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoilha_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipousocaminhoaer (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipousocaminhoaer_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.residuo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 residuo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.jurisdicao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 jurisdicao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipobanco (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipobanco_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.nascente (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 nascente_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.construcao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 construcao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocemiterio (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocemiterio_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipofontedagua (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipofontedagua_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipopostofisc (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipopostofisc_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.causa (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 causa_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tratamento (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tratamento_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.proximidade (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 proximidade_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocondutor (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocondutor_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaomarco (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaomarco_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoentroncamento (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoentroncamento_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoestmed (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoestmed_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipooutunidprot (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipooutunidprot_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipodepsaneam (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipodepsaneam_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipounidprotinteg (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipounidprotinteg_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.eletrificada (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 eletrificada_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.frigorifico (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 frigorifico_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolimmassa (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolimmassa_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotransporte (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotransporte_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.navegabilidade (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 navegabilidade_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipogrutacaverna (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipogrutacaverna_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.fixa (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 fixa_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.terreno (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 terreno_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocomplexoportuario (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocomplexoportuario_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotorre (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotorre_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifagropec (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifagropec_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.classificacaoporte (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 classificacaoporte_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.finalidade_asb (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 finalidade_asb_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipomassadagua (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipomassadagua_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipomarcolim (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipomarcolim_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.instituicao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 instituicao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifport (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifport_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoptoenergia (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoptoenergia_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.antropizada (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 antropizada_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipomaqtermica (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipomaqtermica_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipounidusosust (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipounidusosust_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaocosta (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaocosta_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.operacional (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 operacional_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolimintramun (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolimintramun_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoclassecnae (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoclassecnae_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiposinal (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiposinal_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.modaluso (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 modaluso_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaoemagua (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaoemagua_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiporecife (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiporecife_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.rede (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 rede_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.cultivopredominante (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 cultivopredominante_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoassociado (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoassociado_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoequipagropec (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoequipagropec_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotunel (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotunel_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.classificsigiloso (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 classificsigiloso_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.dentrodepoligono (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 dentrodepoligono_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotrechomassa (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotrechomassa_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.unidadevolume (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 unidadevolume_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifrelig (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifrelig_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.trafego (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 trafego_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipooutlimofic (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipooutlimofic_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.coincidecomdentrode_hid (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 coincidecomdentrode_hid_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoestrut (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoestrut_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.destinacaofundeadouro (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 destinacaofundeadouro_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.formaextracao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 formaextracao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoquebramolhe (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoquebramolhe_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.revestimento (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 revestimento_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.ocorrenciaem (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 ocorrenciaem_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.denominacaoassociada (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 denominacaoassociada_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.coincidecomdentrode_lim (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 coincidecomdentrode_lim_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoptorefgeodtopo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoptorefgeodtopo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifrod (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifrod_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.finalidade_eco (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 finalidade_eco_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipopocomina (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipopocomina_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.modalidade (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 modalidade_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotravessia (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotravessia_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifsaneam (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifsaneam_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.ovgd (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 ovgd_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.relacionado_fer (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 relacionado_fer_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.qualidagua (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 qualidagua_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifmil (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifmil_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.cotacomprovada (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 cotacomprovada_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipooperativo (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipooperativo_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.procextracao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 procextracao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.matconstr (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 matconstr_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.materialpredominante (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 materialpredominante_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.finalidade_veg (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 finalidade_veg_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.classificacao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 classificacao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoterrexp (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoterrexp_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.chamine (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 chamine_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaojuridica (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaojuridica_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situamare (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situamare_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.homologacao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 homologacao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.multimodal (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 multimodal_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipogrupocnae (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipogrupocnae_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaoagua (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaoagua_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.emarruamento (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 emarruamento_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.relacionado_dut (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 relacionado_dut_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipobrejopantano (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipobrejopantano_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.regime (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 regime_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoexposicao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoexposicao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocapital (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocapital_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.atividade (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 atividade_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.situacaoespacial (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 situacaoespacial_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocomplexoaero (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocomplexoaero_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.relacionado_hdr (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 relacionado_hdr_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.relacionado_rod (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 relacionado_rod_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoobst (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoobst_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoatracad (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoatracad_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolimoper (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolimoper_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.depressao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 depressao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipodepabast (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipodepabast_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipodivisaocnae (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipodivisaocnae_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.sigla (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 sigla_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.usopista (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 usopista_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.espessalgas (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 espessalgas_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifcomercserv (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifcomercserv_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiposumvert (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiposumvert_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoareausocomun (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoareausocomun_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.nivelatencao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 nivelatencao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.compartilhado (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 compartilhado_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipopista (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipopista_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tiporocha (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tiporocha_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotrechoduto (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotrechoduto_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipousoedif (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipousoedif_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocerr (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocerr_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.sistemageodesico (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 sistemageodesico_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipocampoquadra (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipocampoquadra_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipolimareaesp (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipolimareaesp_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.ensino (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 ensino_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.combrenovavel (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 combrenovavel_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.eixoprincipal (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 eixoprincipal_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.posicaorelativa (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 posicaorelativa_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.geometriaaproximada (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 geometriaaproximada_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.relacionado (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 relacionado_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipodelimfis (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipodelimfis_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.isolada (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 isolada_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipoedifcomunic (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipoedifcomunic_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.setor (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 setor_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipotrechorod (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipotrechorod_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.causaexposicao (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 causaexposicao_pk PRIMARY KEY (code)
)#
CREATE TABLE dominios.tipopassagviad (
 code smallint NOT NULL,
 code_name text NOT NULL, CONSTRAINT
 tipopassagviad_pk PRIMARY KEY (code)
)#
INSERT INTO dominios.geracao (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.geracao (code,code_name) VALUES (1,'Eletricidade - GER 0')#
INSERT INTO dominios.geracao (code,code_name) VALUES (2,'CoGeração')#
INSERT INTO dominios.tipoplataforma (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoplataforma (code,code_name) VALUES (3,'Petróleo')#
INSERT INTO dominios.tipoplataforma (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipoplataforma (code,code_name) VALUES (5,'Gás')#
INSERT INTO dominios.posicaoreledific (code,code_name) VALUES (17,'Adjacente a edificação')#
INSERT INTO dominios.posicaoreledific (code,code_name) VALUES (18,'Sobre edificação')#
INSERT INTO dominios.posicaoreledific (code,code_name) VALUES (14,'Isolado')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (5,'Garimpo')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (4,'Mina')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (6,'Salina')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (8,'Ponto de Prospecção')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (7,'Pedreira')#
INSERT INTO dominios.tipoextmin (code,code_name) VALUES (1,'Poço')#
INSERT INTO dominios.canteirodivisorio (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.canteirodivisorio (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (7,'Outras interferências')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (2,'Risco geotécnico')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (4,'Interferência com hidrografia')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (5,'Interferência com áreas especiais')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (6,'Interferência com vias')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (3,'Interferência com localidades')#
INSERT INTO dominios.tipolocalcrit (code,code_name) VALUES (1,'Subestação de válvulas e/ou bombas')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (13,'Camping')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (6,'Parque aquático')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (7,'Parque temático')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (14,'Complexo desportivo')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (4,'Parque de diversões')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (12,'Parque de eventos culturais')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (9,'Hípica')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (11,'Campo de golfe')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (8,'Hipódromo')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (1,'Complexo recreativo')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (3,'Autódromo')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (16,'Jardim botânico')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (5,'Parque urbano')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (15,'Zoológico')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (10,'Estande de tiro')#
INSERT INTO dominios.tipocomplexolazer (code,code_name) VALUES (2,'Clube')#
INSERT INTO dominios.indice (code,code_name) VALUES (1,'Mestra')#
INSERT INTO dominios.indice (code,code_name) VALUES (2,'Normal')#
INSERT INTO dominios.indice (code,code_name) VALUES (3,'Auxiliar')#
INSERT INTO dominios.tipoaglomrurisol (code,code_name) VALUES (7,'Outros Aglomerados Rurais Isolados')#
INSERT INTO dominios.tipoaglomrurisol (code,code_name) VALUES (5,'Aglomerado Rural Isolado - Povoado')#
INSERT INTO dominios.tipoaglomrurisol (code,code_name) VALUES (6,'Aglomerado Rural Isolado - Núcleo')#
INSERT INTO dominios.denso (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.denso (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.denso (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (9,'Silo')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (11,'Depósito frigorífico')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (32,'Armazém')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (19,'Reservatório de Combustível')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (8,'Galpão')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipodepgeral (code,code_name) VALUES (10,'Composteira')#
INSERT INTO dominios.materializado (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.materializado (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.materializado (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.referencialgrav (code,code_name) VALUES (4,'Local')#
INSERT INTO dominios.referencialgrav (code,code_name) VALUES (1,'Postdam 1930')#
INSERT INTO dominios.referencialgrav (code,code_name) VALUES (2,'IGSN71')#
INSERT INTO dominios.referencialgrav (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.referencialgrav (code,code_name) VALUES (3,'Absoluto')#
INSERT INTO dominios.referencialgrav (code,code_name) VALUES (97,'Não Aplicável')#
INSERT INTO dominios.nrlinhas (code,code_name) VALUES (1,'Simples')#
INSERT INTO dominios.nrlinhas (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.nrlinhas (code,code_name) VALUES (3,'Múltipla')#
INSERT INTO dominios.nrlinhas (code,code_name) VALUES (2,'Dupla')#
INSERT INTO dominios.tipoareaumida (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoareaumida (code,code_name) VALUES (4,'Arenoso')#
INSERT INTO dominios.tipoareaumida (code,code_name) VALUES (3,'Lamacento')#
INSERT INTO dominios.destenergelet (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.destenergelet (code,code_name) VALUES (3,'Comercialização de Energia (COM)')#
INSERT INTO dominios.destenergelet (code,code_name) VALUES (1,'Auto-Produção de Energia (APE)')#
INSERT INTO dominios.destenergelet (code,code_name) VALUES (4,'Produção Independente de Energia (PIE)')#
INSERT INTO dominios.destenergelet (code,code_name) VALUES (5,'Serviço Público (SP)')#
INSERT INTO dominios.destenergelet (code,code_name) VALUES (2,'Auto-Produção com Comercialização de Excedente (APE-COM)')#
INSERT INTO dominios.tiporef (code,code_name) VALUES (2,'Planimétrico')#
INSERT INTO dominios.tiporef (code,code_name) VALUES (1,'Altimétrico')#
INSERT INTO dominios.tiporef (code,code_name) VALUES (4,'Gravimétrico')#
INSERT INTO dominios.tiporef (code,code_name) VALUES (3,'Planialtimétrico')#
INSERT INTO dominios.coletiva (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.coletiva (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.coletiva (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipocaminhoaereo (code,code_name) VALUES (12,'Teleférico')#
INSERT INTO dominios.tipocaminhoaereo (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.situacaofisica (code,code_name) VALUES (4,'Planejada')#
INSERT INTO dominios.situacaofisica (code,code_name) VALUES (1,'Abandonada')#
INSERT INTO dominios.situacaofisica (code,code_name) VALUES (5,'Construída')#
INSERT INTO dominios.situacaofisica (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.situacaofisica (code,code_name) VALUES (3,'Em Construção')#
INSERT INTO dominios.situacaofisica (code,code_name) VALUES (2,'Destruída')#
INSERT INTO dominios.tipotrechocomunic (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipotrechocomunic (code,code_name) VALUES (4,'Dados')#
INSERT INTO dominios.tipotrechocomunic (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipotrechocomunic (code,code_name) VALUES (6,'Telegráfica')#
INSERT INTO dominios.tipotrechocomunic (code,code_name) VALUES (7,'Telefônica')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (40,'Palmito')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (38,'Coco')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (39,'Jaborandi')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (37,'Carnaúba')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (18,'Açaí')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (44,'Pesca')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (34,'Turfa')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (36,'Castanha')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (5,'Madeira')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (41,'Babaçu')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (43,'Pecuária')#
INSERT INTO dominios.destinadoa (code,code_name) VALUES (35,'Látex')#
INSERT INTO dominios.tipomacchav (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipomacchav (code,code_name) VALUES (1,'Macega')#
INSERT INTO dominios.tipomacchav (code,code_name) VALUES (2,'Chavascal')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (5,'Descontinuidade por diferente interpretação das classes')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (4,'Descontinuidade por falta de acurácia')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (3,'Descontinuidade por escala de insumo')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (7,'Descontinuidade por excesso')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (6,'Descontinuidade por omissão')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (2,'Descontinuidade devido a transformação')#
INSERT INTO dominios.motivodescontinuidade (code,code_name) VALUES (1,'Descontinuidade Temporal')#
INSERT INTO dominios.tipoponte (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoponte (code,code_name) VALUES (1,'Móvel')#
INSERT INTO dominios.tipoponte (code,code_name) VALUES (3,'Fixa')#
INSERT INTO dominios.tipoponte (code,code_name) VALUES (2,'Pênsil')#
INSERT INTO dominios.tipoptocontrole (code,code_name) VALUES (9,'Ponto de Controle')#
INSERT INTO dominios.tipoptocontrole (code,code_name) VALUES (12,'Ponto Perspectivo')#
INSERT INTO dominios.tipoptocontrole (code,code_name) VALUES (13,'Ponto Fotogramétrico')#
INSERT INTO dominios.tipoptocontrole (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (29,'Gasolina')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (4,'Nafta')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (8,'Efluentes')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (3,'Petróleo')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (5,'Gás')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (30,'Álcool')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (31,'Querosene')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (7,'Minério')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (1,'Água')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (2,'Óleo')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (6,'Grãos')#
INSERT INTO dominios.mattransp (code,code_name) VALUES (9,'Esgoto')#
INSERT INTO dominios.tipolavoura (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipolavoura (code,code_name) VALUES (2,'Semi-perene')#
INSERT INTO dominios.tipolavoura (code,code_name) VALUES (3,'Anual')#
INSERT INTO dominios.tipolavoura (code,code_name) VALUES (1,'Perene')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (3,'Cartorial')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (7,'Seguridade Social')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (22,'Prefeitura')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (5,'Eleitoral')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (2,'Prisional')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (6,'Produção e/ou pesquisa')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (9,'Assembléia Legislativa')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (4,'Gestão')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (1,'Policial')#
INSERT INTO dominios.tipoedifcivil (code,code_name) VALUES (8,'Câmara Municipal')#
INSERT INTO dominios.tiposecaocnae (code,code_name) VALUES (3,'F - Construção')#
INSERT INTO dominios.tiposecaocnae (code,code_name) VALUES (1,'C - Indústrias Extrativas')#
INSERT INTO dominios.tiposecaocnae (code,code_name) VALUES (2,'D - Indústrias de Transformação')#
INSERT INTO dominios.tiposecaocnae (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tiposecaocnae (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.emduto (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.emduto (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipolimpol (code,code_name) VALUES (1,'Internacional')#
INSERT INTO dominios.tipolimpol (code,code_name) VALUES (2,'Estadual')#
INSERT INTO dominios.tipolimpol (code,code_name) VALUES (3,'Municipal')#
INSERT INTO dominios.salinidade (code,code_name) VALUES (1,'Doce')#
INSERT INTO dominios.salinidade (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.salinidade (code,code_name) VALUES (2,'Salgada')#
INSERT INTO dominios.tipoconteudo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoconteudo (code,code_name) VALUES (3,'Resíduo')#
INSERT INTO dominios.tipoconteudo (code,code_name) VALUES (1,'Insumo')#
INSERT INTO dominios.tipoconteudo (code,code_name) VALUES (2,'Produto')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (6,'Grãos')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (36,'Escória')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (41,'Forragem')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (34,'Sal')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (24,'Mármore')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (19,'Semente')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (21,'Folhagens')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (40,'Pedras preciosas')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (28,'Óleo diesel')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (35,'Ferro')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (33,'Carvão')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (22,'Pedra')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (39,'Prata')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (3,'Petróleo')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (32,'Cobre')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (16,'Vinhoto')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (25,'Bauxita')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (42,'Areia')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (23,'Granito')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (5,'Gás')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (30,'Álcool')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (26,'Manganês')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (31,'Querosene')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (27,'Talco')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (38,'Diamante')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (37,'Ouro')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (20,'Inseticida')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (44,'Piçarra')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (18,'Cascalho')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (17,'Estrume')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (43,'Saibro')#
INSERT INTO dominios.tipoprodutoresiduo (code,code_name) VALUES (29,'Gasolina')#
INSERT INTO dominios.tipoedifabast (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifabast (code,code_name) VALUES (2,'Tratamento')#
INSERT INTO dominios.tipoedifabast (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifabast (code,code_name) VALUES (1,'Captação')#
INSERT INTO dominios.tipoedifabast (code,code_name) VALUES (3,'Recalque')#
INSERT INTO dominios.tipoedifabast (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.posicaopista (code,code_name) VALUES (12,'Adjacentes')#
INSERT INTO dominios.posicaopista (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.posicaopista (code,code_name) VALUES (13,'Superpostas')#
INSERT INTO dominios.posicaopista (code,code_name) VALUES (97,'Não Aplicável')#
INSERT INTO dominios.especie (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.especie (code,code_name) VALUES (2,'Transmissão')#
INSERT INTO dominios.especie (code,code_name) VALUES (3,'Distribuição')#
INSERT INTO dominios.tipoestgerad (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoestgerad (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoestgerad (code,code_name) VALUES (5,'Eólica')#
INSERT INTO dominios.tipoestgerad (code,code_name) VALUES (7,'Maré-motriz')#
INSERT INTO dominios.tipoestgerad (code,code_name) VALUES (6,'Solar')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (14,'Lixo séptico')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (15,'Chorume')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (9,'Esgoto')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (12,'Lixo domiciliar e comercial')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (13,'Lixo tóxico')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tiporesiduo (code,code_name) VALUES (16,'Vinhoto')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (3,'Segurança')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (1,'Administração')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (2,'Oficinas')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (4,'Depósito')#
INSERT INTO dominios.tipoedifenergia (code,code_name) VALUES (5,'Chaminé')#
INSERT INTO dominios.bitola (code,code_name) VALUES (1,'Métrica')#
INSERT INTO dominios.bitola (code,code_name) VALUES (3,'Larga')#
INSERT INTO dominios.bitola (code,code_name) VALUES (6,'Mista Internacional Larga')#
INSERT INTO dominios.bitola (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.bitola (code,code_name) VALUES (2,'Internacional')#
INSERT INTO dominios.bitola (code,code_name) VALUES (4,'Mista Métrica Internacional')#
INSERT INTO dominios.bitola (code,code_name) VALUES (5,'Mista Métrica Larga')#
INSERT INTO dominios.tipotravessiaped (code,code_name) VALUES (7,'Passagem subterrânea')#
INSERT INTO dominios.tipotravessiaped (code,code_name) VALUES (8,'Passarela')#
INSERT INTO dominios.tipotravessiaped (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.tipotravessiaped (code,code_name) VALUES (9,'Pinguela')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (29,'Hangar')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (27,'Terminal de cargas')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (28,'Torre de controle')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (15,'Administrativa')#
INSERT INTO dominios.tipoedifaero (code,code_name) VALUES (26,'Terminal de passageiros')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (15,'Administrativa')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (20,'Oficina de manutenção')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (17,'Estação metroviária')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (18,'Terminal ferroviário de cargas')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (16,'Estação ferroviária de passageiros')#
INSERT INTO dominios.funcaoedifmetroferrov (code,code_name) VALUES (19,'Terminal ferroviário de passageiros e cargas')#
INSERT INTO dominios.tipopostopol (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipopostopol (code,code_name) VALUES (21,'Posto PRF')#
INSERT INTO dominios.tipopostopol (code,code_name) VALUES (20,'Posto PM')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (13,'Falésia')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (8,'Escarpa')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (9,'Península')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (5,'Maciço')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (3,'Montanha')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (11,'Cabo')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (14,'Talude')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (10,'Ponta')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (4,'Chapada')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (7,'Planície')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (12,'Praia')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (6,'Planalto')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (2,'Morro')#
INSERT INTO dominios.tipoelemnat (code,code_name) VALUES (1,'Serra')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (5,'Gás')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (3,'Diesel')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (33,'Carvão')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (1,'Nuclear')#
INSERT INTO dominios.tipocombustivel (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (27,'Aterro')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (28,'Resíduo de bota-fora')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (25,'Área aterrada')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (26,'Corte')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (29,'Resíduo sólido em geral')#
INSERT INTO dominios.tipoalterantrop (code,code_name) VALUES (24,'Caixa de empréstimo')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (96,'Não identificado')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (10,'Cipó')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (11,'Bambu')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (17,'Palmeira')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (27,'Araucária')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (41,'Babaçu')#
INSERT INTO dominios.especiepredominante (code,code_name) VALUES (12,'Sororoca')#
INSERT INTO dominios.tipotrechoferrov (code,code_name) VALUES (6,'Aeromóvel')#
INSERT INTO dominios.tipotrechoferrov (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipotrechoferrov (code,code_name) VALUES (7,'Ferrovia')#
INSERT INTO dominios.tipotrechoferrov (code,code_name) VALUES (8,'Metrovia')#
INSERT INTO dominios.tipotrechoferrov (code,code_name) VALUES (5,'Bonde')#
INSERT INTO dominios.tipocampo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocampo (code,code_name) VALUES (1,'Sujo')#
INSERT INTO dominios.tipocampo (code,code_name) VALUES (2,'Limpo')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (1,'Estação Climatológica Principal - CP')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (11,'Estação Maregráfica - MA')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (2,'Estação Climatológica Auxiliar - CA')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (9,'Estação de Radiossonda - RS')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (4,'Estação Pluviométrica - PL')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (8,'Estação de Radar Meteorológico - RD')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (5,'Estação Eólica - EO')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (7,'Estação Solarimétrica - SL')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (6,'Estação Evaporimétrica - EV')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (10,'Estação Fluviométrica - FL')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (3,'Estação Agroclimatológica - AC')#
INSERT INTO dominios.tipoptoestmed (code,code_name) VALUES (12,'Estação de Marés Terrestres - Crosta')#
INSERT INTO dominios.referencialaltim (code,code_name) VALUES (2,'Imbituba')#
INSERT INTO dominios.referencialaltim (code,code_name) VALUES (4,'Local')#
INSERT INTO dominios.referencialaltim (code,code_name) VALUES (5,'Outra referência')#
INSERT INTO dominios.referencialaltim (code,code_name) VALUES (1,'Torres')#
INSERT INTO dominios.referencialaltim (code,code_name) VALUES (3,'Santana')#
INSERT INTO dominios.caracteristicafloresta (code,code_name) VALUES (3,'Bosque')#
INSERT INTO dominios.caracteristicafloresta (code,code_name) VALUES (1,'Floresta')#
INSERT INTO dominios.caracteristicafloresta (code,code_name) VALUES (2,'Mata')#
INSERT INTO dominios.caracteristicafloresta (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (2,'Barragem')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (13,'Entre trechos de drenagem')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (4,'Queda d’água')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (15,'Confluência')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (5,'Corredeira')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (7,'Sumidouro')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (14,'Ponto início de drenagem')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (3,'Comporta')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (19,'Ramificação')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (9,'Lago / Lagoa')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (6,'Foz marítima')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (17,'Interrupção à Jusante')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (11,'Laguna')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (16,'Vertedouro')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (8,'Meandro abandonado')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (12,'Represa/ açude')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (1,'Eclusa')#
INSERT INTO dominios.relacionado_hid (code,code_name) VALUES (18,'Interrupção à Montante')#
INSERT INTO dominios.tipoqueda (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoqueda (code,code_name) VALUES (2,'Salto')#
INSERT INTO dominios.tipoqueda (code,code_name) VALUES (1,'Cachoeira')#
INSERT INTO dominios.tipoqueda (code,code_name) VALUES (3,'Catarata')#
INSERT INTO dominios.poderpublico (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.poderpublico (code,code_name) VALUES (2,'Legislativo')#
INSERT INTO dominios.poderpublico (code,code_name) VALUES (1,'Executivo')#
INSERT INTO dominios.poderpublico (code,code_name) VALUES (3,'Judiciário')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (1,'Estádio')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (7,'Centro cultural')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (8,'Plataforma de pesca')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (2,'Ginásio')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (4,'Teatro')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (5,'Anfiteatro')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (6,'Cinema')#
INSERT INTO dominios.tipoediflazer (code,code_name) VALUES (3,'Museu')#
INSERT INTO dominios.administracao (code,code_name) VALUES (15,'Privada')#
INSERT INTO dominios.administracao (code,code_name) VALUES (12,'Federal/Estadual/Municipal')#
INSERT INTO dominios.administracao (code,code_name) VALUES (3,'Municipal')#
INSERT INTO dominios.administracao (code,code_name) VALUES (11,'Estadual/Municipal')#
INSERT INTO dominios.administracao (code,code_name) VALUES (5,'Distrital')#
INSERT INTO dominios.administracao (code,code_name) VALUES (2,'Estadual')#
INSERT INTO dominios.administracao (code,code_name) VALUES (98,'Mista')#
INSERT INTO dominios.administracao (code,code_name) VALUES (6,'Particular')#
INSERT INTO dominios.administracao (code,code_name) VALUES (10,'Federal/Municipal')#
INSERT INTO dominios.administracao (code,code_name) VALUES (4,'Estadual/Municipal')#
INSERT INTO dominios.administracao (code,code_name) VALUES (1,'Federal')#
INSERT INTO dominios.administracao (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.administracao (code,code_name) VALUES (7,'Concessionada')#
INSERT INTO dominios.administracao (code,code_name) VALUES (97,'Não aplicável')#
INSERT INTO dominios.administracao (code,code_name) VALUES (9,'Federal/Estadual')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (10,'Estátua')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (13,'Panteão')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (11,'Mirante')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (9,'Cruzeiro')#
INSERT INTO dominios.tipoedifturist (code,code_name) VALUES (12,'Monumento')#
INSERT INTO dominios.usoprincipal (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.usoprincipal (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.usoprincipal (code,code_name) VALUES (3,'Energia')#
INSERT INTO dominios.usoprincipal (code,code_name) VALUES (1,'Irrigação')#
INSERT INTO dominios.usoprincipal (code,code_name) VALUES (97,'Não aplicável')#
INSERT INTO dominios.usoprincipal (code,code_name) VALUES (2,'Abastecimento')#
INSERT INTO dominios.tipoilha (code,code_name) VALUES (1,'Fluvial')#
INSERT INTO dominios.tipoilha (code,code_name) VALUES (2,'Marítima')#
INSERT INTO dominios.tipoilha (code,code_name) VALUES (98,'Mista')#
INSERT INTO dominios.tipoilha (code,code_name) VALUES (3,'Lacustre')#
INSERT INTO dominios.tipousocaminhoaer (code,code_name) VALUES (22,'Cargas')#
INSERT INTO dominios.tipousocaminhoaer (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipousocaminhoaer (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipousocaminhoaer (code,code_name) VALUES (21,'Passageiros')#
INSERT INTO dominios.residuo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.residuo (code,code_name) VALUES (1,'Líquido')#
INSERT INTO dominios.residuo (code,code_name) VALUES (2,'Sólido')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (9,'Federal/Estadual')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (3,'Municipal')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (11,'Estadual/Municipal')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (12,'Federal/Estadual/Municipal')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (10,'Federal/Municipal')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (1,'Federal')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (2,'Estadual')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (6,'Particular')#
INSERT INTO dominios.jurisdicao (code,code_name) VALUES (8,'Propriedade particular')#
INSERT INTO dominios.tipobanco (code,code_name) VALUES (2,'Marítimo')#
INSERT INTO dominios.tipobanco (code,code_name) VALUES (1,'Fluvial')#
INSERT INTO dominios.tipobanco (code,code_name) VALUES (3,'Lacustre')#
INSERT INTO dominios.tipobanco (code,code_name) VALUES (4,'Cordão Arenoso')#
INSERT INTO dominios.nascente (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.nascente (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.construcao (code,code_name) VALUES (97,'Não aplicável')#
INSERT INTO dominios.construcao (code,code_name) VALUES (2,'Aberta')#
INSERT INTO dominios.construcao (code,code_name) VALUES (1,'Fechada')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (1,'Crematório')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (5,'Túmulo Isolado')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (2,'Parque')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (3,'Vertical')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipocemiterio (code,code_name) VALUES (4,'Comum')#
INSERT INTO dominios.tipofontedagua (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipofontedagua (code,code_name) VALUES (2,'Poço Artesiano')#
INSERT INTO dominios.tipofontedagua (code,code_name) VALUES (3,'Olho d`água')#
INSERT INTO dominios.tipofontedagua (code,code_name) VALUES (1,'Poço')#
INSERT INTO dominios.tipopostofisc (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipopostofisc (code,code_name) VALUES (11,'Fiscalização')#
INSERT INTO dominios.tipopostofisc (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipopostofisc (code,code_name) VALUES (98,'Mista')#
INSERT INTO dominios.tipopostofisc (code,code_name) VALUES (10,'Tributação')#
INSERT INTO dominios.causa (code,code_name) VALUES (3,'Absorção')#
INSERT INTO dominios.causa (code,code_name) VALUES (1,'Canalização')#
INSERT INTO dominios.causa (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.causa (code,code_name) VALUES (2,'Gruta ou Fenda')#
INSERT INTO dominios.tratamento (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.tratamento (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tratamento (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tratamento (code,code_name) VALUES (97,'Não aplicável')#
INSERT INTO dominios.proximidade (code,code_name) VALUES (15,'Adjacente')#
INSERT INTO dominios.proximidade (code,code_name) VALUES (16,'Coincidente')#
INSERT INTO dominios.proximidade (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.proximidade (code,code_name) VALUES (14,'Isolado')#
INSERT INTO dominios.tipocondutor (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocondutor (code,code_name) VALUES (4,'Tubulação')#
INSERT INTO dominios.tipocondutor (code,code_name) VALUES (2,'Calha')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (5,'Não encontrado')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (2,'Destruído')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (6,'Não visitado')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (3,'Destruído sem chapa')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (7,'Não construído')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (4,'Destruído com chapa danificada')#
INSERT INTO dominios.situacaomarco (code,code_name) VALUES (1,'Bom')#
INSERT INTO dominios.tipoentroncamento (code,code_name) VALUES (5,'Entroncamento ferroviário')#
INSERT INTO dominios.tipoentroncamento (code,code_name) VALUES (1,'Cruzamento rodoviário')#
INSERT INTO dominios.tipoentroncamento (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoentroncamento (code,code_name) VALUES (4,'Rótula')#
INSERT INTO dominios.tipoentroncamento (code,code_name) VALUES (3,'Trevo rodoviário')#
INSERT INTO dominios.tipoentroncamento (code,code_name) VALUES (2,'Círculo rodoviário')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (1,'Estação Climatológica Principal - CP')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (11,'Estação Maregráfica - MA')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (2,'Estação Climatológica Auxiliar - CA')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (9,'Estação de Radiossonda - RS')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (4,'Estação Pluviométrica - PL')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (8,'Estação de Radar Meteorológico - RD')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (5,'Estação Eólica - EO')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (7,'Estação Solarimétrica - SL')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (6,'Estação Evaporimétrica - EV')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (10,'Estação Fluviométrica - FL')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (3,'Estação Agroclimatológica - AC')#
INSERT INTO dominios.tipoestmed (code,code_name) VALUES (12,'Estação de Marés Terrestres - Crosta')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (5,'Corredor ecológico')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (4,'Distrito florestal')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (8,'Sítios do patrimônio')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (2,'Reserva legal')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (9,'Reserva da biosfera')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (6,'Floresta pública')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (3,'Mosaico')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (1,'Área de preservação permanente')#
INSERT INTO dominios.tipooutunidprot (code,code_name) VALUES (7,'Sítios RAMSAR')#
INSERT INTO dominios.tipodepsaneam (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipodepsaneam (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipodepsaneam (code,code_name) VALUES (1,'Tanque')#
INSERT INTO dominios.tipodepsaneam (code,code_name) VALUES (5,'Aterro sanitário')#
INSERT INTO dominios.tipodepsaneam (code,code_name) VALUES (6,'Aterro controlado')#
INSERT INTO dominios.tipodepsaneam (code,code_name) VALUES (4,'Depósito de lixo')#
INSERT INTO dominios.tipounidprotinteg (code,code_name) VALUES (3,'Monumento batural - MONA')#
INSERT INTO dominios.tipounidprotinteg (code,code_name) VALUES (2,'Parque - PAR')#
INSERT INTO dominios.tipounidprotinteg (code,code_name) VALUES (1,'Estação Ecológica - ESEC')#
INSERT INTO dominios.tipounidprotinteg (code,code_name) VALUES (5,'Refúgio de Vida Silvestre - RVS')#
INSERT INTO dominios.tipounidprotinteg (code,code_name) VALUES (4,'Reserva Biológica - REBIO')#
INSERT INTO dominios.eletrificada (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.eletrificada (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.eletrificada (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.frigorifico (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.frigorifico (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.frigorifico (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (2,'Margem de massa d`água')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (5,'Limite interno entre massas e/ou trechos')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (1,'Costa visível da carta')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (4,'Margem direita de trechos de massa d`água')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (7,'Limite interno com foz marítima')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (6,'Limite com elemento artificial')#
INSERT INTO dominios.tipolimmassa (code,code_name) VALUES (3,'Margem esquerda de trechos de massa d`água')#
INSERT INTO dominios.tipotransporte (code,code_name) VALUES (22,'Cargas')#
INSERT INTO dominios.tipotransporte (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipotransporte (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipotransporte (code,code_name) VALUES (21,'Passageiros')#
INSERT INTO dominios.navegabilidade (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.navegabilidade (code,code_name) VALUES (2,'Não navegável')#
INSERT INTO dominios.navegabilidade (code,code_name) VALUES (1,'Navegável')#
INSERT INTO dominios.tipogrutacaverna (code,code_name) VALUES (20,'Caverna')#
INSERT INTO dominios.tipogrutacaverna (code,code_name) VALUES (19,'Gruta')#
INSERT INTO dominios.fixa (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.fixa (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.fixa (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.terreno (code,code_name) VALUES (1,'Seco')#
INSERT INTO dominios.terreno (code,code_name) VALUES (2,'Irrigado')#
INSERT INTO dominios.terreno (code,code_name) VALUES (3,'Inundado')#
INSERT INTO dominios.tipocomplexoportuario (code,code_name) VALUES (31,'Instalação portuária')#
INSERT INTO dominios.tipocomplexoportuario (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocomplexoportuario (code,code_name) VALUES (30,'Porto organizado')#
INSERT INTO dominios.tipotorre (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipotorre (code,code_name) VALUES (1,'Autoportante')#
INSERT INTO dominios.tipotorre (code,code_name) VALUES (2,'Estaiada')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (14,'Apiário')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (18,'Curral')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (12,'Sede operacional de fazenda')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (17,'Pocilga')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (13,'Aviário')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (15,'Viveiro de plantas')#
INSERT INTO dominios.tipoedifagropec (code,code_name) VALUES (16,'Viveiro para acquicultura')#
INSERT INTO dominios.classificacaoporte (code,code_name) VALUES (1,'Arbórea')#
INSERT INTO dominios.classificacaoporte (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.classificacaoporte (code,code_name) VALUES (2,'Arbustiva')#
INSERT INTO dominios.classificacaoporte (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.classificacaoporte (code,code_name) VALUES (3,'Herbácea')#
INSERT INTO dominios.finalidade_asb (code,code_name) VALUES (8,'Armazenamento')#
INSERT INTO dominios.finalidade_asb (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.finalidade_asb (code,code_name) VALUES (2,'Tratamento')#
INSERT INTO dominios.finalidade_asb (code,code_name) VALUES (3,'Recalque')#
INSERT INTO dominios.finalidade_asb (code,code_name) VALUES (4,'Distribuição')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (10,'Represa/Açude')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (5,'Enseada')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (3,'Oceano')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (7,'Lago/Lagoa')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (4,'Baía')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (6,'Meandro Abandonado')#
INSERT INTO dominios.tipomassadagua (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.tipomarcolim (code,code_name) VALUES (1,'Internacional')#
INSERT INTO dominios.tipomarcolim (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipomarcolim (code,code_name) VALUES (2,'Estadual')#
INSERT INTO dominios.tipomarcolim (code,code_name) VALUES (3,'Municipal')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (6,'Aeronáutica')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (8,'Corpo de bombeiros')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (5,'Exército')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (4,'Marinha')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (7,'Polícia militar')#
INSERT INTO dominios.instituicao (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (34,'Dique de estaleiro')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (32,'Armazém')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (37,'Terminal privativo')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (15,'Administrativa')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (36,'Carreira')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (27,'Terminal de cargas')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (35,'Rampa')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (33,'Estaleiro')#
INSERT INTO dominios.tipoedifport (code,code_name) VALUES (26,'Terminal de passageiros')#
INSERT INTO dominios.tipoptoenergia (code,code_name) VALUES (3,'Subestação de  distribuição')#
INSERT INTO dominios.tipoptoenergia (code,code_name) VALUES (4,'Ponto de ramificação')#
INSERT INTO dominios.tipoptoenergia (code,code_name) VALUES (1,'Estação geradora de energia')#
INSERT INTO dominios.tipoptoenergia (code,code_name) VALUES (2,'Subestação de transmissão')#
INSERT INTO dominios.tipoptoenergia (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.antropizada (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.antropizada (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.antropizada (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipomaqtermica (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipomaqtermica (code,code_name) VALUES (2,'Turbina à vapor (TBVP)')#
INSERT INTO dominios.tipomaqtermica (code,code_name) VALUES (4,'Motor de Combustão Interna (NCIA)')#
INSERT INTO dominios.tipomaqtermica (code,code_name) VALUES (1,'Turbina à gás (TBGS)')#
INSERT INTO dominios.tipomaqtermica (code,code_name) VALUES (3,'Ciclo combinado (CLCB)')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (5,'Reserva Extrativista - RESEX')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (3,'Floresta - FLO')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (7,'Reserva Particular do Patrimônio Natural - RPPN')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (6,'Reserva de Fauna - REFAU')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (1,'Área de Proteção Ambiental - APA')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (2,'Área de Relevante Interesse Ecológico - ARIE')#
INSERT INTO dominios.tipounidusosust (code,code_name) VALUES (4,'Reserva de Desenvolvimento Sustentável - RDS')#
INSERT INTO dominios.situacaocosta (code,code_name) VALUES (11,'Afastado')#
INSERT INTO dominios.situacaocosta (code,code_name) VALUES (10,'Contíguo')#
INSERT INTO dominios.operacional (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.operacional (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.operacional (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipolimintramun (code,code_name) VALUES (5,'Bairro')#
INSERT INTO dominios.tipolimintramun (code,code_name) VALUES (2,'Sub-distrital')#
INSERT INTO dominios.tipolimintramun (code,code_name) VALUES (1,'Distrital')#
INSERT INTO dominios.tipolimintramun (code,code_name) VALUES (4,'Região administrativa')#
INSERT INTO dominios.tipolimintramun (code,code_name) VALUES (3,'Perímetro urbano legal')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (35,'91.91-0 - Atividades de Organizações Religiosas')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (16,'80.13-6 - Educação Infantil - Creche')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (32,'85.31-6 - Serviços Sociais com alojamento')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (21,'80.32-2 - Educação Superior - Graduação e Pós-Graduação')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (28,'85.13-8 Atenção Ambulatorial (Posto e Centro de Saúde)')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (7,'75.12-4 - Regulação das Atividades Sociais e Culturais')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (8,'75.13-2 - Regulação das Atividades Econômicas')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (19,'80.20-9 - Ensino Médio')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (3,'40.14-2 - Distribuição de Energia Elétrica')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (13,'75.24-8 - Segurança e Ordem Pública')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (18,'80.15-2 - Ensino Fundamental')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (17,'80.14-4 - Educação Infantil - Pré-Escola')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (10,'75.21-3 - Relações Exteriores')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (12,'75.23-0 - Justiça')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (27,'85.12-0 Atendimento a Urgência e Emergências (Pronto Socorro)')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (34,'90.00-0 - Limpeza Urbana e Esgoto e Atividades Relacionadas')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (97,'Não Aplicável')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (30,'85.16-2 Outras Atividades Relacionadas com a Atenção à Saúde (Instituto de Pesquisa)')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (24,'80.97-7 - Educação Profissional de Nível Tecnológico')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (11,'75.22-1 - Defesa')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (9,'75.14-0 - Atividades de Apoio à Administração Pública')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (6,'75.11-6 - Administração Pública em Geral')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (15,'75.30-2 - Seguridade Social')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (5,'64.20-3 - Telecomunicações')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (26,'85.11-1 Atendimento Hospitalar (Hospital)')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (14,'75.25-6 - Defesa Civil')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (25,'80.99-3 - Outras Atividades de Ensino')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (33,'85.32-4 - Serviços Sociais sem alojamento')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (4,'41.00-9 - Captação Tratamento e Distribuição de Água')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (1,'40.11-8 - Produção de Energia Elétrica')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (20,'80.31-4 - Educação Superior - Graduação')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (2,'40.12-6 - Transmissão de Energia Elétrica')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (23,'80.96-9 - Educação Profissional de Nível Técnico')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (22,'80.33-0 - Educação Superior - Pós-Graduação e Extensão')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (31,'85.20-0 Serviços Veterinários')#
INSERT INTO dominios.tipoclassecnae (code,code_name) VALUES (29,'85.14-6 Serviços de Complementação Diagnóstica ou Terapêutica')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (5,'Barca farol')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (6,'Sinalização de margem')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (2,'Bóia cega')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (1,'Bóia luminosa')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (4,'Farol ou farolete')#
INSERT INTO dominios.tiposinal (code,code_name) VALUES (3,'Bóia de amarração')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (14,'Portuário')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (9,'Aeroportuário')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (5,'Ferroviário')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (7,'Dutos')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (8,'Rodoferroviário')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (4,'Rodoviário')#
INSERT INTO dominios.modaluso (code,code_name) VALUES (6,'Metroviário')#
INSERT INTO dominios.situacaoemagua (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.situacaoemagua (code,code_name) VALUES (4,'Emerso')#
INSERT INTO dominios.situacaoemagua (code,code_name) VALUES (7,'Cobre e Descobre')#
INSERT INTO dominios.situacaoemagua (code,code_name) VALUES (5,'Submerso')#
INSERT INTO dominios.tiporecife (code,code_name) VALUES (20,'Coral')#
INSERT INTO dominios.tiporecife (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tiporecife (code,code_name) VALUES (1,'Arenito')#
INSERT INTO dominios.tiporecife (code,code_name) VALUES (2,'Rochoso')#
INSERT INTO dominios.rede (code,code_name) VALUES (15,'Privada')#
INSERT INTO dominios.rede (code,code_name) VALUES (2,'Estadual')#
INSERT INTO dominios.rede (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.rede (code,code_name) VALUES (3,'Municipal')#
INSERT INTO dominios.rede (code,code_name) VALUES (14,'Nacional')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (26,'Bracatinga')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (96,'Não identificado')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (42,'Videira')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (33,'Cebola')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (13,'Arroz')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (4,'Trigo')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (32,'Juta')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (15,'Cacau')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (6,'Algodão herbáceo')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (18,'Açaí')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (27,'Araucária')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (22,'Algaroba')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (30,'Maçã')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (10,'Batata inglesa')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (25,'Hortaliças')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (12,'Feijão')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (23,'Pinus')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (31,'Pêssego')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (2,'Banana')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (17,'Palmeira')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (24,'Pastagem cultivada')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (20,'Eucalipto')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (3,'Laranja')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (16,'Erva-mate')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (1,'Milho')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (21,'Acácia')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (28,'Carnauba')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (29,'Pera')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (19,'Seringueira')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (7,'Cana-de-Açúcar')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (9,'Soja')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (14,'Café')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (8,'Fumo')#
INSERT INTO dominios.cultivopredominante (code,code_name) VALUES (11,'Mandioca')#
INSERT INTO dominios.tipoassociado (code,code_name) VALUES (4,'Vila')#
INSERT INTO dominios.tipoassociado (code,code_name) VALUES (1,'Cidade')#
INSERT INTO dominios.tipoequipagropec (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoequipagropec (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoequipagropec (code,code_name) VALUES (1,'Pivô central')#
INSERT INTO dominios.tipotunel (code,code_name) VALUES (1,'Túnel')#
INSERT INTO dominios.tipotunel (code,code_name) VALUES (2,'Passagem subterrânea sob via')#
INSERT INTO dominios.classificsigiloso (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.classificsigiloso (code,code_name) VALUES (2,'Ostensivo')#
INSERT INTO dominios.classificsigiloso (code,code_name) VALUES (1,'Sigiloso')#
INSERT INTO dominios.dentrodepoligono (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.dentrodepoligono (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipotrechomassa (code,code_name) VALUES (2,'Canal')#
INSERT INTO dominios.tipotrechomassa (code,code_name) VALUES (1,'Rio')#
INSERT INTO dominios.tipotrechomassa (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipotrechomassa (code,code_name) VALUES (9,'Laguna')#
INSERT INTO dominios.tipotrechomassa (code,code_name) VALUES (10,'Represa/açude')#
INSERT INTO dominios.unidadevolume (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.unidadevolume (code,code_name) VALUES (2,'Metro cúbico')#
INSERT INTO dominios.unidadevolume (code,code_name) VALUES (1,'Litro')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (4,'Mosteiro')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (5,'Convento')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (1,'Igreja')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (6,'Mesquita')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (2,'Templo')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (3,'Centro')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifrelig (code,code_name) VALUES (7,'Sinagoga')#
INSERT INTO dominios.trafego (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.trafego (code,code_name) VALUES (1,'Permanente')#
INSERT INTO dominios.trafego (code,code_name) VALUES (2,'Periódico')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (3,'Zona econômica exclusiva')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (5,'Faixa de fronteira')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (1,'Mar territorial')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (2,'Zona contígua')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (6,'Plataforma continental jurídica')#
INSERT INTO dominios.tipooutlimofic (code,code_name) VALUES (4,'Lateral marítima')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (10,'Represa/açude')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (14,'Eclusa')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (2,'Canal')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (9,'Laguna')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (11,'Vala')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (19,'Barragem')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (15,'Terreno sujeito a inundação')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (1,'Rio')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (97,'Não aplicável')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (12,'Queda d´água')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (13,'Corredeira')#
INSERT INTO dominios.coincidecomdentrode_hid (code,code_name) VALUES (16,'Foz marítima')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (4,'Porto seco')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (5,'Terminal rodoviário')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (3,'Fiscalização')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (1,'Estação')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (2,'Comércio e serviços')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (7,'Terminal multimodal')#
INSERT INTO dominios.tipoestrut (code,code_name) VALUES (6,'Terminal urbano')#
INSERT INTO dominios.destinacaofundeadouro (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.destinacaofundeadouro (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.destinacaofundeadouro (code,code_name) VALUES (12,'Áreas de fundeio com limite definido')#
INSERT INTO dominios.destinacaofundeadouro (code,code_name) VALUES (11,'Fundeadouro com designação alfanumérica')#
INSERT INTO dominios.destinacaofundeadouro (code,code_name) VALUES (13,'Áreas de fundeio proibido')#
INSERT INTO dominios.destinacaofundeadouro (code,code_name) VALUES (10,'Fundeadouro recomendado sem limite definido')#
INSERT INTO dominios.formaextracao (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.formaextracao (code,code_name) VALUES (5,'Céu aberto')#
INSERT INTO dominios.formaextracao (code,code_name) VALUES (6,'Subterrâneo')#
INSERT INTO dominios.tipoquebramolhe (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoquebramolhe (code,code_name) VALUES (2,'Molhe')#
INSERT INTO dominios.tipoquebramolhe (code,code_name) VALUES (1,'Quebramar')#
INSERT INTO dominios.revestimento (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.revestimento (code,code_name) VALUES (4,'Calçado')#
INSERT INTO dominios.revestimento (code,code_name) VALUES (1,'Leito natural')#
INSERT INTO dominios.revestimento (code,code_name) VALUES (2,'Revestimento primário')#
INSERT INTO dominios.revestimento (code,code_name) VALUES (3,'Pavimentado')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (96,'Não Identificado')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (14,'Macega ou chavascal')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (7,'Estepe')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (5,'Brejo ou Pântano')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (13,'Cerrado ou cerradão')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (8,'Pastagem')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (19,'Campinarana')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (6,'Caatinga')#
INSERT INTO dominios.ocorrenciaem (code,code_name) VALUES (15,'Floresta')#
INSERT INTO dominios.denominacaoassociada (code,code_name) VALUES (5,'Cristã')#
INSERT INTO dominios.denominacaoassociada (code,code_name) VALUES (99,'Outras')#
INSERT INTO dominios.denominacaoassociada (code,code_name) VALUES (6,'Israelita')#
INSERT INTO dominios.denominacaoassociada (code,code_name) VALUES (7,'Muçulmana')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (96,'Não Identificado')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (4,'Linha Seca')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (3,'Cumeada')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (6,'Rodovia')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (9,'Massa D`Água')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (5,'Costa Visível da Carta')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (7,'Ferrovia')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (2,'Contorno Massa D`Água')#
INSERT INTO dominios.coincidecomdentrode_lim (code,code_name) VALUES (8,'Trecho de Drenagem')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (1,'Vértice de Triangulação - VT')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (6,'Ponto barométrico - B')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (8,'Ponto de Satélite - SAT')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (7,'Ponto Trigonométrico - RV')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (2,'Referência de Nível - RN')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (5,'Ponto Astronômico - PA')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (4,'Estação de Poligonal - EP')#
INSERT INTO dominios.tipoptorefgeodtopo (code,code_name) VALUES (3,'Estação Gravimétrica - EG')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (13,'Posto de pedágio')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (10,'Parada interestadual')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (9,'Terminal urbano')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (14,'Posto de fiscalização')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (15,'Administrativa')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (8,'Terminal interestadual')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifrod (code,code_name) VALUES (12,'Posto de pesagem')#
INSERT INTO dominios.finalidade_eco (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.finalidade_eco (code,code_name) VALUES (98,'Mista')#
INSERT INTO dominios.finalidade_eco (code,code_name) VALUES (1,'Comercial')#
INSERT INTO dominios.finalidade_eco (code,code_name) VALUES (2,'Serviço')#
INSERT INTO dominios.tipopocomina (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipopocomina (code,code_name) VALUES (3,'Vertical')#
INSERT INTO dominios.tipopocomina (code,code_name) VALUES (97,'Não aplicável')#
INSERT INTO dominios.tipopocomina (code,code_name) VALUES (2,'Horizontal')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (99,'Outras')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (2,'Radiodifusão/som e imagem')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (3,'Telefonia')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (5,'Radiodifusão/som')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (4,'Dados')#
INSERT INTO dominios.modalidade (code,code_name) VALUES (1,'Radiocomunicação')#
INSERT INTO dominios.tipotravessia (code,code_name) VALUES (1,'Vau natural')#
INSERT INTO dominios.tipotravessia (code,code_name) VALUES (2,'Vau construída')#
INSERT INTO dominios.tipotravessia (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.tipotravessia (code,code_name) VALUES (3,'Bote transportador')#
INSERT INTO dominios.tipotravessia (code,code_name) VALUES (4,'Balsa')#
INSERT INTO dominios.tipoedifsaneam (code,code_name) VALUES (5,'Tratamento de esgoto')#
INSERT INTO dominios.tipoedifsaneam (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifsaneam (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifsaneam (code,code_name) VALUES (3,'Recalque')#
INSERT INTO dominios.tipoedifsaneam (code,code_name) VALUES (6,'Usina de reciclagem')#
INSERT INTO dominios.tipoedifsaneam (code,code_name) VALUES (7,'Incinerador')#
INSERT INTO dominios.ovgd (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.ovgd (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.ovgd (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (10,'Edificação Metro Ferroviária')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (8,'Entroncamento')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (3,'Ponte')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (1,'Túnel')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (2,'Passagem elevada ou viaduto')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (7,'Mudança de atributo')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (19,'Barragem')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (17,'Interrupção com a Moldura')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (5,'Edificação rodoviária')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (11,'Localidade')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (6,'Galeria ou bueiro')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (12,'Patio')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (13,'Passagem de nível')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (4,'Travessia')#
INSERT INTO dominios.relacionado_fer (code,code_name) VALUES (9,'Início ou fim de trecho')#
INSERT INTO dominios.qualidagua (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.qualidagua (code,code_name) VALUES (4,'Salobra')#
INSERT INTO dominios.qualidagua (code,code_name) VALUES (2,'Não potável')#
INSERT INTO dominios.qualidagua (code,code_name) VALUES (1,'Potável')#
INSERT INTO dominios.qualidagua (code,code_name) VALUES (3,'Mineral')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (14,'Campo de tiro')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (19,'Posto')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (15,'Base aérea')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (12,'Aquartelamento')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (18,'Delegacia serviço militar')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (16,'Distrito naval')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (13,'Campo de instrução')#
INSERT INTO dominios.tipoedifmil (code,code_name) VALUES (17,'Hotel de trânsito')#
INSERT INTO dominios.cotacomprovada (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.cotacomprovada (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipooperativo (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipooperativo (code,code_name) VALUES (1,'Elevadora')#
INSERT INTO dominios.tipooperativo (code,code_name) VALUES (2,'Abaixadora')#
INSERT INTO dominios.procextracao (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.procextracao (code,code_name) VALUES (2,'Manual')#
INSERT INTO dominios.procextracao (code,code_name) VALUES (1,'Mecanizado')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (1,'Alvenaria')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (26,'Fio Metálico')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (4,'Rocha')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (23,'Terra')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (3,'Metal')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (97,'Não Aplicável')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (7,'Tela ou Alambrado')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (6,'Arame')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (5,'Madeira')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (8,'Cerca viva')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (25,'Fibra ótica')#
INSERT INTO dominios.matconstr (code,code_name) VALUES (2,'Concreto')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (24,'Saibro')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (14,'Lama')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (21,'Concha')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (15,'Argila')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (20,'Coral')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (13,'Areia Fina')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (4,'Rocha')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (50,'Pedra')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (18,'Cascalho')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (16,'Lodo')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (19,'Seixo')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (12,'Areia')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.materialpredominante (code,code_name) VALUES (97,'Não Aplicável')#
INSERT INTO dominios.finalidade_veg (code,code_name) VALUES (2,'Subistência')#
INSERT INTO dominios.finalidade_veg (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.finalidade_veg (code,code_name) VALUES (3,'Conservação ambiental')#
INSERT INTO dominios.finalidade_veg (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.finalidade_veg (code,code_name) VALUES (1,'Exploração econômica')#
INSERT INTO dominios.classificacao (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.classificacao (code,code_name) VALUES (9,'Internacional')#
INSERT INTO dominios.classificacao (code,code_name) VALUES (10,'Doméstico')#
INSERT INTO dominios.tipoterrexp (code,code_name) VALUES (24,'Saibro')#
INSERT INTO dominios.tipoterrexp (code,code_name) VALUES (4,'Pedregoso')#
INSERT INTO dominios.tipoterrexp (code,code_name) VALUES (23,'Terra')#
INSERT INTO dominios.tipoterrexp (code,code_name) VALUES (18,'Cascalho')#
INSERT INTO dominios.tipoterrexp (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoterrexp (code,code_name) VALUES (12,'Areia')#
INSERT INTO dominios.chamine (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.chamine (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.situacaojuridica (code,code_name) VALUES (1,'Delimitada')#
INSERT INTO dominios.situacaojuridica (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.situacaojuridica (code,code_name) VALUES (4,'Regularizada')#
INSERT INTO dominios.situacaojuridica (code,code_name) VALUES (3,'Homologada ou demarcada')#
INSERT INTO dominios.situacaojuridica (code,code_name) VALUES (2,'Declarada')#
INSERT INTO dominios.situamare (code,code_name) VALUES (8,'Sempre fora d´água')#
INSERT INTO dominios.situamare (code,code_name) VALUES (9,'Sempre submerso')#
INSERT INTO dominios.situamare (code,code_name) VALUES (7,'Cobre e descobre')#
INSERT INTO dominios.situamare (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.homologacao (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.homologacao (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.homologacao (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.multimodal (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.multimodal (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.multimodal (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (4,'80.9 - Educação Profissional e Outras Atividades de Ensino')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (3,'80.3 - Ensino Superior')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (10,'85-3 - Serviço Social')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (8,'85.1 Atividades de Atenção à Saúde')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (1,'80.1 - Educação Infantil e Ensino Fundamental')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (9,'85.2 Serviços Veterinários')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (6,'75-2 - Serviços Coletivos Prestados pela Administração Pública')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (5,'75-1 - Administração do Estado e da Política Econômica e Social')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (19,'80.2 - Ensino Médio')#
INSERT INTO dominios.tipogrupocnae (code,code_name) VALUES (7,'75-3 - Seguridade Social')#
INSERT INTO dominios.situacaoagua (code,code_name) VALUES (7,'Não tratada')#
INSERT INTO dominios.situacaoagua (code,code_name) VALUES (6,'Tratada')#
INSERT INTO dominios.situacaoagua (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.emarruamento (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.emarruamento (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.emarruamento (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.relacionado_dut (code,code_name) VALUES (5,'Ponto de ramificação')#
INSERT INTO dominios.relacionado_dut (code,code_name) VALUES (4,'Depósito geral')#
INSERT INTO dominios.relacionado_dut (code,code_name) VALUES (3,'Local crítico')#
INSERT INTO dominios.relacionado_dut (code,code_name) VALUES (1,'Ponto inicial')#
INSERT INTO dominios.relacionado_dut (code,code_name) VALUES (17,'Interrupção com a Moldura')#
INSERT INTO dominios.relacionado_dut (code,code_name) VALUES (2,'Ponto final')#
INSERT INTO dominios.tipobrejopantano (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipobrejopantano (code,code_name) VALUES (1,'Brejo')#
INSERT INTO dominios.tipobrejopantano (code,code_name) VALUES (2,'Pântano')#
INSERT INTO dominios.regime (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.regime (code,code_name) VALUES (1,'Permanente')#
INSERT INTO dominios.regime (code,code_name) VALUES (6,'Sazonal')#
INSERT INTO dominios.regime (code,code_name) VALUES (4,'Temporário com leito permanente')#
INSERT INTO dominios.regime (code,code_name) VALUES (3,'Temporário')#
INSERT INTO dominios.regime (code,code_name) VALUES (2,'Permanente com grande variação')#
INSERT INTO dominios.regime (code,code_name) VALUES (5,'Seco')#
INSERT INTO dominios.tipoexposicao (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoexposicao (code,code_name) VALUES (5,'Céu aberto')#
INSERT INTO dominios.tipoexposicao (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoexposicao (code,code_name) VALUES (4,'Coberto')#
INSERT INTO dominios.tipoexposicao (code,code_name) VALUES (3,'Fechado')#
INSERT INTO dominios.tipocapital (code,code_name) VALUES (2,'Capital Federal')#
INSERT INTO dominios.tipocapital (code,code_name) VALUES (3,'Capital Estadual')#
INSERT INTO dominios.atividade (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.atividade (code,code_name) VALUES (10,'Produção')#
INSERT INTO dominios.atividade (code,code_name) VALUES (9,'Prospecção')#
INSERT INTO dominios.situacaoespacial (code,code_name) VALUES (12,'Adjacentes')#
INSERT INTO dominios.situacaoespacial (code,code_name) VALUES (13,'Superpostos')#
INSERT INTO dominios.situacaoespacial (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipocomplexoaero (code,code_name) VALUES (25,'Heliporto')#
INSERT INTO dominios.tipocomplexoaero (code,code_name) VALUES (24,'Aeroporto')#
INSERT INTO dominios.tipocomplexoaero (code,code_name) VALUES (23,'Aeródromo')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (14,'Eclusa')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (12,'Queda dágua')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (19,'Barragem')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (22,'Complexo portuário')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (24,'Atracadouro')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (21,'Confluência')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (17,'Interrupção com a Moldura')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (13,'Corredeira')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (23,'Entre trechos hidroviários')#
INSERT INTO dominios.relacionado_hdr (code,code_name) VALUES (16,'Foz marítima')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (10,'Edificação Metro Ferroviária')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (8,'Entroncamento')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (3,'Ponte')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (1,'Túnel')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (2,'Passagem elevada ou viaduto')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (7,'Mudança de atributo')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (19,'Barragem')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (17,'Interrupção com a Moldura')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (5,'Edificação rodoviária')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (11,'Localidade')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (6,'Galeria ou bueiro')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (12,'Patio')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (13,'Passagem de nível')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (4,'Travessia')#
INSERT INTO dominios.relacionado_rod (code,code_name) VALUES (9,'Início ou fim de trecho')#
INSERT INTO dominios.tipoobst (code,code_name) VALUES (4,'Natural')#
INSERT INTO dominios.tipoobst (code,code_name) VALUES (5,'Artificial')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (43,'Dolfim')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (41,'Molhe de atracação')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (40,'Trapiche')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (42,'Pier')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (44,'Desembarcadouro')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (39,'Cais flutuante')#
INSERT INTO dominios.tipoatracad (code,code_name) VALUES (38,'Cais')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (6,'Linha média de enchente-ORD')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (5,'Linha preamar média - 1831')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (1,'Setor censitário')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (4,'Costa visível da carta(interpretada)')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (2,'Linha de base normal')#
INSERT INTO dominios.tipolimoper (code,code_name) VALUES (3,'Linha de base reta')#
INSERT INTO dominios.depressao (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.depressao (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipodepabast (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipodepabast (code,code_name) VALUES (3,'Cisterna')#
INSERT INTO dominios.tipodepabast (code,code_name) VALUES (1,'Tanque')#
INSERT INTO dominios.tipodepabast (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipodepabast (code,code_name) VALUES (2,'Caixa d`água')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (92,'Atividades Recreativas Culturais e Desportivas')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (21,'Fabricação de Celulose Papel e Produtos de Papel')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (45,'Construção')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (19,'Preparação de couros e Fabricação de Artefatos de Couro Artigos de Viagem e Calçados')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (30,'Fabricação de Máquinas de Escritório e Equipamentos de Informática')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (32,'Fabricação de Material Eletrônicode Aparelhos e Equipamentos de Comunicações')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (36,'Fabricação de Móveis e Industrias Diversas')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (24,'Fabricação de Produtos Químicos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (33,'Fabricação de Equipamentos de Instrumentação Médico-Hospitalares Instumentos de Precisão e Ópticos Equipamentos para Automação Industrial Cronômetros e Relógios')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (52,'Comércio Varejista e Reparação de Objetos Pessoais e Domésticos.')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (14,'Extração de Minerais Não-Metálicos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (1,'Agricultura Pecuária e Serviços Relacionados')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (26,'Fabricação de Produtos de Minerais Não-Metálicos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (31,'Fabricação de Máquinas Aparelhos e Materiais Elétricos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (28,'Fabricação de Produtos de Metal Exclusive Máquinas e Equipamentos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (22,'Edição Impressão e Reprodução de Gravações')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (27,'Metalurgia Básica')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (55,'Alojamento e Alimentação')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (50,'Comércio e Reparação de Veículos Automotores e Motocicletas e Comércio a Varejo de Combustíveis.')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (16,'Fabricação de Produtos do Fumo')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (23,'Fabricação de Coque Refino de Petróleo Elaboração de Combustíveis Nucleares e Produção de Álcool')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (11,'Extração de Petróleo e Serviços Relacionados')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (20,'Fabricação de produtos de Madeira e Celulose')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (37,'Reciclagem')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (5,'Pesca Aquicultura e Serviços Relacionados')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (35,'Fabricação de Outros Equipamentos de Transporte')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (15,'Fabricação Alimentícia e Bebidas')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (51,'Comércio por Atacado e Representantes Comerciais. E agentes do comércio')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (74,'Serviços Prestados Principalmente às Empresas (organizações).')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (13,'Extração de Minerais Metálicos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (17,'Fabricação de Produtos Têxteis')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (25,'Fabricação de Artigos de Borracha e Material Plástico')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (34,'Fabricação e Montagem de Veículos Automotores Reboques e Carrocerias')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (29,'Fabricação de Máquinas e Equipamentos')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (18,'Confecção de Artigos do Vestuário e Acessórios')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (10,'Extração de Carvão Mineral')#
INSERT INTO dominios.tipodivisaocnae (code,code_name) VALUES (2,'Silvicultura Exploração Florestal e Serviços Relacionados')#
INSERT INTO dominios.sigla (code,code_name) VALUES (16,'PR')#
INSERT INTO dominios.sigla (code,code_name) VALUES (4,'AM')#
INSERT INTO dominios.sigla (code,code_name) VALUES (1,'AC')#
INSERT INTO dominios.sigla (code,code_name) VALUES (24,'SC')#
INSERT INTO dominios.sigla (code,code_name) VALUES (10,'MA')#
INSERT INTO dominios.sigla (code,code_name) VALUES (27,'TO')#
INSERT INTO dominios.sigla (code,code_name) VALUES (23,'RR')#
INSERT INTO dominios.sigla (code,code_name) VALUES (20,'RN')#
INSERT INTO dominios.sigla (code,code_name) VALUES (7,'DF')#
INSERT INTO dominios.sigla (code,code_name) VALUES (22,'RO')#
INSERT INTO dominios.sigla (code,code_name) VALUES (21,'RS')#
INSERT INTO dominios.sigla (code,code_name) VALUES (17,'PE')#
INSERT INTO dominios.sigla (code,code_name) VALUES (8,'ES')#
INSERT INTO dominios.sigla (code,code_name) VALUES (19,'RJ')#
INSERT INTO dominios.sigla (code,code_name) VALUES (26,'SE')#
INSERT INTO dominios.sigla (code,code_name) VALUES (3,'AP')#
INSERT INTO dominios.sigla (code,code_name) VALUES (18,'PI')#
INSERT INTO dominios.sigla (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.sigla (code,code_name) VALUES (15,'PB')#
INSERT INTO dominios.sigla (code,code_name) VALUES (13,'MG')#
INSERT INTO dominios.sigla (code,code_name) VALUES (9,'GO')#
INSERT INTO dominios.sigla (code,code_name) VALUES (5,'BA')#
INSERT INTO dominios.sigla (code,code_name) VALUES (25,'SP')#
INSERT INTO dominios.sigla (code,code_name) VALUES (14,'PA')#
INSERT INTO dominios.sigla (code,code_name) VALUES (6,'CE')#
INSERT INTO dominios.sigla (code,code_name) VALUES (11,'MT')#
INSERT INTO dominios.sigla (code,code_name) VALUES (2,'AL')#
INSERT INTO dominios.sigla (code,code_name) VALUES (12,'MS')#
INSERT INTO dominios.usopista (code,code_name) VALUES (12,'Militar')#
INSERT INTO dominios.usopista (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.usopista (code,code_name) VALUES (11,'Público')#
INSERT INTO dominios.usopista (code,code_name) VALUES (13,'Público/Militar')#
INSERT INTO dominios.usopista (code,code_name) VALUES (6,'Particular')#
INSERT INTO dominios.espessalgas (code,code_name) VALUES (1,'Finas')#
INSERT INTO dominios.espessalgas (code,code_name) VALUES (2,'Médias')#
INSERT INTO dominios.espessalgas (code,code_name) VALUES (3,'Grossas')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (8,'Restaurante')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (6,'Feira')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (5,'Centro de convenções')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (3,'Centro comercial')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (4,'Mercado')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifcomercserv (code,code_name) VALUES (7,'Hotel/motel/pousada')#
INSERT INTO dominios.tiposumvert (code,code_name) VALUES (1,'Sumidouro')#
INSERT INTO dominios.tiposumvert (code,code_name) VALUES (2,'Vertedouro')#
INSERT INTO dominios.tipoareausocomun (code,code_name) VALUES (1,'Quilombo')#
INSERT INTO dominios.tipoareausocomun (code,code_name) VALUES (2,'Assentamento rural')#
INSERT INTO dominios.nivelatencao (code,code_name) VALUES (6,'Secundário')#
INSERT INTO dominios.nivelatencao (code,code_name) VALUES (7,'Terciário')#
INSERT INTO dominios.nivelatencao (code,code_name) VALUES (5,'Primário')#
INSERT INTO dominios.compartilhado (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.compartilhado (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (1,'Atletismo')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (2,'Ciclismo')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (98,'Misto')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (3,'Motociclismo')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (9,'Pista de pouso')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (4,'Automobilismo')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (5,'Corrida de cavalos')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (11,'Heliporto')#
INSERT INTO dominios.tipopista (code,code_name) VALUES (10,'Pista de táxi')#
INSERT INTO dominios.tiporocha (code,code_name) VALUES (21,'Matacão - pedra')#
INSERT INTO dominios.tiporocha (code,code_name) VALUES (23,'Área Rochosa - lajedo')#
INSERT INTO dominios.tiporocha (code,code_name) VALUES (22,'Penedo - isolado')#
INSERT INTO dominios.tipotrechoduto (code,code_name) VALUES (1,'Duto')#
INSERT INTO dominios.tipotrechoduto (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipotrechoduto (code,code_name) VALUES (3,'Correia transportadora')#
INSERT INTO dominios.tipotrechoduto (code,code_name) VALUES (2,'Calha')#
INSERT INTO dominios.tipousoedif (code,code_name) VALUES (1,'Próprio nacional')#
INSERT INTO dominios.tipousoedif (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipousoedif (code,code_name) VALUES (2,'Uso especial da União')#
INSERT INTO dominios.tipocerr (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocerr (code,code_name) VALUES (2,'Cerradão')#
INSERT INTO dominios.tipocerr (code,code_name) VALUES (1,'Cerrado')#
INSERT INTO dominios.sistemageodesico (code,code_name) VALUES (5,'Astro Chuá')#
INSERT INTO dominios.sistemageodesico (code,code_name) VALUES (2,'SIRGAS')#
INSERT INTO dominios.sistemageodesico (code,code_name) VALUES (4,'Córrego Alegre')#
INSERT INTO dominios.sistemageodesico (code,code_name) VALUES (3,'WGS-84')#
INSERT INTO dominios.sistemageodesico (code,code_name) VALUES (1,'SAD-69')#
INSERT INTO dominios.sistemageodesico (code,code_name) VALUES (6,'Outra referência')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (1,'Futebol')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (4,'Pólo')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (7,'Tênis')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (3,'Vôlei')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (6,'Poliesportiva')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (2,'Basquete')#
INSERT INTO dominios.tipocampoquadra (code,code_name) VALUES (5,'Hipismo')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (31,'Estação Ecológica - ESEC')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (5,'Amazônia legal')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (17,'Reserva florestal')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (23,'Floresta Extrativista')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (2,'Terra indígena')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (8,'Área de preservação permanente')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (18,'Reserva ecológica')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (29,'Reserva de Fauna - REFAU')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (22,'Floresta de rendimento sustentável')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (4,'Assentamento rural')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (28,'Reserva Extrativista - RESEX')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (14,'Sítios RAMSAR')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (16,'Reserva da biosfera')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (21,'Estrada parque')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (3,'Quilombo')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (32,'Parque - PAR')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (11,'Distrito florestal')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (7,'Polígono das secas')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (10,'Mosaico')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (24,'Área de proteção ambiental - APA')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (30,'Reserva Particular do Patrimônio Natural - RPPN')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (15,'Sítios do patrimônio')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (36,'Area Militar')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (12,'Corredor ecológico')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (99,'Outros')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (34,'Reserva Biológica - REBIO')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (33,'Monumento Natural - MONA')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (1,'Terra pública')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (6,'Faixa de fronteira')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (35,'Refúgio de Vida Silvestre - RVS')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (13,'Floresta pública')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (9,'Reserva legal')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (20,'Horto florestal')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (19,'Estação biológica')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (27,'Reserva de Desenvolvimento Sustentável - RDS')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (26,'Floresta - FLO')#
INSERT INTO dominios.tipolimareaesp (code,code_name) VALUES (25,'Área de Relevante Interesse Ecológico - ARIE')#
INSERT INTO dominios.ensino (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.ensino (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.ensino (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.combrenovavel (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.combrenovavel (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.eixoprincipal (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.eixoprincipal (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.posicaorelativa (code,code_name) VALUES (5,'Submerso')#
INSERT INTO dominios.posicaorelativa (code,code_name) VALUES (3,'Elevado')#
INSERT INTO dominios.posicaorelativa (code,code_name) VALUES (2,'Superfície')#
INSERT INTO dominios.posicaorelativa (code,code_name) VALUES (0,'Desconhecida')#
INSERT INTO dominios.posicaorelativa (code,code_name) VALUES (4,'Emerso')#
INSERT INTO dominios.posicaorelativa (code,code_name) VALUES (6,'Subterrâneo')#
INSERT INTO dominios.geometriaaproximada (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.geometriaaproximada (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (10,'Edificação Metro Ferroviária')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (8,'Entroncamento')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (3,'Ponte')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (1,'Túnel')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (2,'Passagem elevada ou viaduto')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (7,'Mudança de atributo')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (19,'Barragem')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (17,'Interrupção com a Moldura')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (5,'Edificação rodoviária')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (11,'Localidade')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (6,'Galeria ou bueiro')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (12,'Patio')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (13,'Passagem de nível')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (4,'Travessia')#
INSERT INTO dominios.relacionado (code,code_name) VALUES (9,'Início ou fim de trecho')#
INSERT INTO dominios.tipodelimfis (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipodelimfis (code,code_name) VALUES (2,'Muro')#
INSERT INTO dominios.tipodelimfis (code,code_name) VALUES (1,'Cerca')#
INSERT INTO dominios.isolada (code,code_name) VALUES (1,'Sim')#
INSERT INTO dominios.isolada (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.isolada (code,code_name) VALUES (2,'Não')#
INSERT INTO dominios.tipoedifcomunic (code,code_name) VALUES (1,'Centro de operações')#
INSERT INTO dominios.tipoedifcomunic (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.tipoedifcomunic (code,code_name) VALUES (4,'Estação repetidora')#
INSERT INTO dominios.tipoedifcomunic (code,code_name) VALUES (2,'Central comutação e transmissão')#
INSERT INTO dominios.tipoedifcomunic (code,code_name) VALUES (3,'Estação radio-base')#
INSERT INTO dominios.setor (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.setor (code,code_name) VALUES (1,'Energético')#
INSERT INTO dominios.setor (code,code_name) VALUES (2,'Econômico')#
INSERT INTO dominios.setor (code,code_name) VALUES (4,'Saneamento básico')#
INSERT INTO dominios.setor (code,code_name) VALUES (3,'Abastecimento de água')#
INSERT INTO dominios.tipotrechorod (code,code_name) VALUES (4,'Auto-estrada')#
INSERT INTO dominios.tipotrechorod (code,code_name) VALUES (2,'Rodovia')#
INSERT INTO dominios.tipotrechorod (code,code_name) VALUES (1,'Acesso')#
INSERT INTO dominios.tipotrechorod (code,code_name) VALUES (3,'Caminho carroçável')#
INSERT INTO dominios.causaexposicao (code,code_name) VALUES (0,'Desconhecido')#
INSERT INTO dominios.causaexposicao (code,code_name) VALUES (4,'Natural')#
INSERT INTO dominios.causaexposicao (code,code_name) VALUES (5,'Artificial')#
INSERT INTO dominios.tipopassagviad (code,code_name) VALUES (6,'Viaduto')#
INSERT INTO dominios.tipopassagviad (code,code_name) VALUES (5,'Passagem elevada')#
ALTER TABLE cb.adm_area_pub_civil_a
  ADD CONSTRAINT adm_area_pub_civil_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_area_pub_militar_a
  ADD CONSTRAINT adm_area_pub_militar_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_tipoedifcivil_fk FOREIGN KEY (tipoedifcivil)
   REFERENCES dominios.tipoedifcivil (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_tipousoedif_fk FOREIGN KEY (tipousoedif)
   REFERENCES dominios.tipousoedif (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_tipoedifcivil_fk FOREIGN KEY (tipoedifcivil)
   REFERENCES dominios.tipoedifcivil (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_tipousoedif_fk FOREIGN KEY (tipousoedif)
   REFERENCES dominios.tipousoedif (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_tipoedifmil_fk FOREIGN KEY (tipoedifmil)
   REFERENCES dominios.tipoedifmil (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_tipousoedif_fk FOREIGN KEY (tipousoedif)
   REFERENCES dominios.tipousoedif (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_tipoedifmil_fk FOREIGN KEY (tipoedifmil)
   REFERENCES dominios.tipoedifmil (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_tipousoedif_fk FOREIGN KEY (tipousoedif)
   REFERENCES dominios.tipousoedif (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_instituicao_publica
  ADD CONSTRAINT adm_instituicao_publica_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_comerc_serv
  ADD CONSTRAINT eco_org_comerc_serv_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_eco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_comerc_serv
  ADD CONSTRAINT eco_org_comerc_serv_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_ext_mineral
  ADD CONSTRAINT eco_org_ext_mineral_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_civil
  ADD CONSTRAINT adm_org_pub_civil_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_civil
  ADD CONSTRAINT adm_org_pub_civil_poderpublico_fk FOREIGN KEY (poderpublico)
   REFERENCES dominios.poderpublico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_civil
  ADD CONSTRAINT adm_org_pub_civil_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_militar
  ADD CONSTRAINT adm_org_pub_militar_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_militar
  ADD CONSTRAINT adm_org_pub_militar_classificsigiloso_fk FOREIGN KEY (classificsigiloso)
   REFERENCES dominios.classificsigiloso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_militar
  ADD CONSTRAINT adm_org_pub_militar_instituicao_fk FOREIGN KEY (instituicao)
   REFERENCES dominios.instituicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_militar
  ADD CONSTRAINT adm_org_pub_militar_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal
  ADD CONSTRAINT adm_posto_fiscal_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal
  ADD CONSTRAINT adm_posto_fiscal_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal
  ADD CONSTRAINT adm_posto_fiscal_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal
  ADD CONSTRAINT adm_posto_fiscal_tipopostofisc_fk FOREIGN KEY (tipopostofisc)
   REFERENCES dominios.tipopostofisc (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_a
  ADD CONSTRAINT adm_posto_fiscal_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_a
  ADD CONSTRAINT adm_posto_fiscal_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_a
  ADD CONSTRAINT adm_posto_fiscal_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_a
  ADD CONSTRAINT adm_posto_fiscal_a_tipopostofisc_fk FOREIGN KEY (tipopostofisc)
   REFERENCES dominios.tipopostofisc (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_p
  ADD CONSTRAINT adm_posto_fiscal_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_p
  ADD CONSTRAINT adm_posto_fiscal_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_p
  ADD CONSTRAINT adm_posto_fiscal_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_p
  ADD CONSTRAINT adm_posto_fiscal_p_tipopostofisc_fk FOREIGN KEY (tipopostofisc)
   REFERENCES dominios.tipopostofisc (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod
  ADD CONSTRAINT adm_posto_pol_rod_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod
  ADD CONSTRAINT adm_posto_pol_rod_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod
  ADD CONSTRAINT adm_posto_pol_rod_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod
  ADD CONSTRAINT adm_posto_pol_rod_tipopostopol_fk FOREIGN KEY (tipopostopol)
   REFERENCES dominios.tipopostopol (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_a
  ADD CONSTRAINT adm_posto_pol_rod_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_a
  ADD CONSTRAINT adm_posto_pol_rod_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_a
  ADD CONSTRAINT adm_posto_pol_rod_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_a
  ADD CONSTRAINT adm_posto_pol_rod_a_tipopostopol_fk FOREIGN KEY (tipopostopol)
   REFERENCES dominios.tipopostopol (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_p
  ADD CONSTRAINT adm_posto_pol_rod_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_p
  ADD CONSTRAINT adm_posto_pol_rod_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_p
  ADD CONSTRAINT adm_posto_pol_rod_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_p
  ADD CONSTRAINT adm_posto_pol_rod_p_tipopostopol_fk FOREIGN KEY (tipopostopol)
   REFERENCES dominios.tipopostopol (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_area_abast_agua_a
  ADD CONSTRAINT asb_area_abast_agua_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_area_saneamento_a
  ADD CONSTRAINT asb_area_saneamento_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio
  ADD CONSTRAINT asb_cemiterio_denominacaoassociada_fk FOREIGN KEY (denominacaoassociada)
   REFERENCES dominios.denominacaoassociada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio
  ADD CONSTRAINT asb_cemiterio_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio
  ADD CONSTRAINT asb_cemiterio_tipocemiterio_fk FOREIGN KEY (tipocemiterio)
   REFERENCES dominios.tipocemiterio (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio_a
  ADD CONSTRAINT asb_cemiterio_a_denominacaoassociada_fk FOREIGN KEY (denominacaoassociada)
   REFERENCES dominios.denominacaoassociada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio_a
  ADD CONSTRAINT asb_cemiterio_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio_a
  ADD CONSTRAINT asb_cemiterio_a_tipocemiterio_fk FOREIGN KEY (tipocemiterio)
   REFERENCES dominios.tipocemiterio (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio_p
  ADD CONSTRAINT asb_cemiterio_p_denominacaoassociada_fk FOREIGN KEY (denominacaoassociada)
   REFERENCES dominios.denominacaoassociada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio_p
  ADD CONSTRAINT asb_cemiterio_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_cemiterio_p
  ADD CONSTRAINT asb_cemiterio_p_tipocemiterio_fk FOREIGN KEY (tipocemiterio)
   REFERENCES dominios.tipocemiterio (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.asb_complexo_abast_agua
  ADD CONSTRAINT asb_complexo_abast_agua_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.asb_complexo_saneamento
  ADD CONSTRAINT asb_complexo_saneamento_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.asb_complexo_saneamento
  ADD CONSTRAINT asb_complexo_saneamento_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_construcao_fk FOREIGN KEY (construcao)
   REFERENCES dominios.construcao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_asb (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_situacaoagua_fk FOREIGN KEY (situacaoagua)
   REFERENCES dominios.situacaoagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_tipodepabast_fk FOREIGN KEY (tipodepabast)
   REFERENCES dominios.tipodepabast (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_construcao_fk FOREIGN KEY (construcao)
   REFERENCES dominios.construcao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_asb (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_situacaoagua_fk FOREIGN KEY (situacaoagua)
   REFERENCES dominios.situacaoagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_tipodepabast_fk FOREIGN KEY (tipodepabast)
   REFERENCES dominios.tipodepabast (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_construcao_fk FOREIGN KEY (construcao)
   REFERENCES dominios.construcao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_asb (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_situacaoagua_fk FOREIGN KEY (situacaoagua)
   REFERENCES dominios.situacaoagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_tipodepabast_fk FOREIGN KEY (tipodepabast)
   REFERENCES dominios.tipodepabast (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_construcao_fk FOREIGN KEY (construcao)
   REFERENCES dominios.construcao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_asb (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_residuo_fk FOREIGN KEY (residuo)
   REFERENCES dominios.residuo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_tipodepsaneam_fk FOREIGN KEY (tipodepsaneam)
   REFERENCES dominios.tipodepsaneam (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_tiporesiduo_fk FOREIGN KEY (tiporesiduo)
   REFERENCES dominios.tiporesiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_construcao_fk FOREIGN KEY (construcao)
   REFERENCES dominios.construcao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_asb (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_residuo_fk FOREIGN KEY (residuo)
   REFERENCES dominios.residuo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_tipodepsaneam_fk FOREIGN KEY (tipodepsaneam)
   REFERENCES dominios.tipodepsaneam (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_tiporesiduo_fk FOREIGN KEY (tiporesiduo)
   REFERENCES dominios.tiporesiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_construcao_fk FOREIGN KEY (construcao)
   REFERENCES dominios.construcao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_asb (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_residuo_fk FOREIGN KEY (residuo)
   REFERENCES dominios.residuo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_tipodepsaneam_fk FOREIGN KEY (tipodepsaneam)
   REFERENCES dominios.tipodepsaneam (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_tiporesiduo_fk FOREIGN KEY (tiporesiduo)
   REFERENCES dominios.tiporesiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_a
  ADD CONSTRAINT asb_edif_abast_agua_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_a
  ADD CONSTRAINT asb_edif_abast_agua_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_a
  ADD CONSTRAINT asb_edif_abast_agua_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_a
  ADD CONSTRAINT asb_edif_abast_agua_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_a
  ADD CONSTRAINT asb_edif_abast_agua_a_tipoedifabast_fk FOREIGN KEY (tipoedifabast)
   REFERENCES dominios.tipoedifabast (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_p
  ADD CONSTRAINT asb_edif_abast_agua_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_p
  ADD CONSTRAINT asb_edif_abast_agua_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_p
  ADD CONSTRAINT asb_edif_abast_agua_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_p
  ADD CONSTRAINT asb_edif_abast_agua_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_p
  ADD CONSTRAINT asb_edif_abast_agua_p_tipoedifabast_fk FOREIGN KEY (tipoedifabast)
   REFERENCES dominios.tipoedifabast (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_a
  ADD CONSTRAINT asb_edif_saneamento_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_a
  ADD CONSTRAINT asb_edif_saneamento_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_a
  ADD CONSTRAINT asb_edif_saneamento_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_a
  ADD CONSTRAINT asb_edif_saneamento_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_a
  ADD CONSTRAINT asb_edif_saneamento_a_tipoedifsaneam_fk FOREIGN KEY (tipoedifsaneam)
   REFERENCES dominios.tipoedifsaneam (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_p
  ADD CONSTRAINT asb_edif_saneamento_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_p
  ADD CONSTRAINT asb_edif_saneamento_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_p
  ADD CONSTRAINT asb_edif_saneamento_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_p
  ADD CONSTRAINT asb_edif_saneamento_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_p
  ADD CONSTRAINT asb_edif_saneamento_p_tipoedifsaneam_fk FOREIGN KEY (tipoedifsaneam)
   REFERENCES dominios.tipoedifsaneam (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_area_agrop_ext_veg_pesca_a_destinadoa_fk FOREIGN KEY (destinadoa)
   REFERENCES dominios.destinadoa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_area_agrop_ext_veg_pesca_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_comerc_serv_a
  ADD CONSTRAINT eco_area_comerc_serv_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_ext_mineral_a
  ADD CONSTRAINT eco_area_ext_mineral_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_industrial_a
  ADD CONSTRAINT eco_area_industrial_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_tipoconteudo_fk FOREIGN KEY (tipoconteudo)
   REFERENCES dominios.tipoconteudo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_tipodepgeral_fk FOREIGN KEY (tipodepgeral)
   REFERENCES dominios.tipodepgeral (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_tipoexposicao_fk FOREIGN KEY (tipoexposicao)
   REFERENCES dominios.tipoexposicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_tipoprodutoresiduo_fk FOREIGN KEY (tipoprodutoresiduo)
   REFERENCES dominios.tipoprodutoresiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_tratamento_fk FOREIGN KEY (tratamento)
   REFERENCES dominios.tratamento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_unidadevolume_fk FOREIGN KEY (unidadevolume)
   REFERENCES dominios.unidadevolume (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_tipoconteudo_fk FOREIGN KEY (tipoconteudo)
   REFERENCES dominios.tipoconteudo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_tipodepgeral_fk FOREIGN KEY (tipodepgeral)
   REFERENCES dominios.tipodepgeral (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_tipoexposicao_fk FOREIGN KEY (tipoexposicao)
   REFERENCES dominios.tipoexposicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_tipoprodutoresiduo_fk FOREIGN KEY (tipoprodutoresiduo)
   REFERENCES dominios.tipoprodutoresiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_tratamento_fk FOREIGN KEY (tratamento)
   REFERENCES dominios.tratamento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_unidadevolume_fk FOREIGN KEY (unidadevolume)
   REFERENCES dominios.unidadevolume (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_tipoconteudo_fk FOREIGN KEY (tipoconteudo)
   REFERENCES dominios.tipoconteudo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_tipodepgeral_fk FOREIGN KEY (tipodepgeral)
   REFERENCES dominios.tipodepgeral (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_tipoexposicao_fk FOREIGN KEY (tipoexposicao)
   REFERENCES dominios.tipoexposicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_tipoprodutoresiduo_fk FOREIGN KEY (tipoprodutoresiduo)
   REFERENCES dominios.tipoprodutoresiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_tratamento_fk FOREIGN KEY (tratamento)
   REFERENCES dominios.tratamento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_unidadevolume_fk FOREIGN KEY (unidadevolume)
   REFERENCES dominios.unidadevolume (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_tipoedifagropec_fk FOREIGN KEY (tipoedifagropec)
   REFERENCES dominios.tipoedifagropec (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_tipoedifagropec_fk FOREIGN KEY (tipoedifagropec)
   REFERENCES dominios.tipoedifagropec (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_eco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_tipoedifcomercserv_fk FOREIGN KEY (tipoedifcomercserv)
   REFERENCES dominios.tipoedifcomercserv (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_eco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_tipoedifcomercserv_fk FOREIGN KEY (tipoedifcomercserv)
   REFERENCES dominios.tipoedifcomercserv (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_a
  ADD CONSTRAINT eco_edif_ext_mineral_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_a
  ADD CONSTRAINT eco_edif_ext_mineral_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_a
  ADD CONSTRAINT eco_edif_ext_mineral_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_a
  ADD CONSTRAINT eco_edif_ext_mineral_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_a
  ADD CONSTRAINT eco_edif_ext_mineral_a_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_p
  ADD CONSTRAINT eco_edif_ext_mineral_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_p
  ADD CONSTRAINT eco_edif_ext_mineral_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_p
  ADD CONSTRAINT eco_edif_ext_mineral_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_p
  ADD CONSTRAINT eco_edif_ext_mineral_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_p
  ADD CONSTRAINT eco_edif_ext_mineral_p_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_chamine_fk FOREIGN KEY (chamine)
   REFERENCES dominios.chamine (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_chamine_fk FOREIGN KEY (chamine)
   REFERENCES dominios.chamine (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec
  ADD CONSTRAINT eco_equip_agropec_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec
  ADD CONSTRAINT eco_equip_agropec_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec
  ADD CONSTRAINT eco_equip_agropec_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec
  ADD CONSTRAINT eco_equip_agropec_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec
  ADD CONSTRAINT eco_equip_agropec_tipoequipagropec_fk FOREIGN KEY (tipoequipagropec)
   REFERENCES dominios.tipoequipagropec (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_a
  ADD CONSTRAINT eco_equip_agropec_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_a
  ADD CONSTRAINT eco_equip_agropec_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_a
  ADD CONSTRAINT eco_equip_agropec_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_a
  ADD CONSTRAINT eco_equip_agropec_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_a
  ADD CONSTRAINT eco_equip_agropec_a_tipoequipagropec_fk FOREIGN KEY (tipoequipagropec)
   REFERENCES dominios.tipoequipagropec (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_l
  ADD CONSTRAINT eco_equip_agropec_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_l
  ADD CONSTRAINT eco_equip_agropec_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_l
  ADD CONSTRAINT eco_equip_agropec_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_l
  ADD CONSTRAINT eco_equip_agropec_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_l
  ADD CONSTRAINT eco_equip_agropec_l_tipoequipagropec_fk FOREIGN KEY (tipoequipagropec)
   REFERENCES dominios.tipoequipagropec (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_p
  ADD CONSTRAINT eco_equip_agropec_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_p
  ADD CONSTRAINT eco_equip_agropec_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_p
  ADD CONSTRAINT eco_equip_agropec_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_p
  ADD CONSTRAINT eco_equip_agropec_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_p
  ADD CONSTRAINT eco_equip_agropec_p_tipoequipagropec_fk FOREIGN KEY (tipoequipagropec)
   REFERENCES dominios.tipoequipagropec (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_atividade_fk FOREIGN KEY (atividade)
   REFERENCES dominios.atividade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_formaextracao_fk FOREIGN KEY (formaextracao)
   REFERENCES dominios.formaextracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_procextracao_fk FOREIGN KEY (procextracao)
   REFERENCES dominios.procextracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_tipoextmin_fk FOREIGN KEY (tipoextmin)
   REFERENCES dominios.tipoextmin (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_tipopocomina_fk FOREIGN KEY (tipopocomina)
   REFERENCES dominios.tipopocomina (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_tipoprodutoresiduo_fk FOREIGN KEY (tipoprodutoresiduo)
   REFERENCES dominios.tipoprodutoresiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_atividade_fk FOREIGN KEY (atividade)
   REFERENCES dominios.atividade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_formaextracao_fk FOREIGN KEY (formaextracao)
   REFERENCES dominios.formaextracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_procextracao_fk FOREIGN KEY (procextracao)
   REFERENCES dominios.procextracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_tipoextmin_fk FOREIGN KEY (tipoextmin)
   REFERENCES dominios.tipoextmin (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_tipopocomina_fk FOREIGN KEY (tipopocomina)
   REFERENCES dominios.tipopocomina (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_tipoprodutoresiduo_fk FOREIGN KEY (tipoprodutoresiduo)
   REFERENCES dominios.tipoprodutoresiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_atividade_fk FOREIGN KEY (atividade)
   REFERENCES dominios.atividade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_formaextracao_fk FOREIGN KEY (formaextracao)
   REFERENCES dominios.formaextracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_procextracao_fk FOREIGN KEY (procextracao)
   REFERENCES dominios.procextracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_tipoextmin_fk FOREIGN KEY (tipoextmin)
   REFERENCES dominios.tipoextmin (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_tipopocomina_fk FOREIGN KEY (tipopocomina)
   REFERENCES dominios.tipopocomina (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_tipoprodutoresiduo_fk FOREIGN KEY (tipoprodutoresiduo)
   REFERENCES dominios.tipoprodutoresiduo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_frigorifico_matadouro
  ADD CONSTRAINT eco_frigorifico_matadouro_frigorifico_fk FOREIGN KEY (frigorifico)
   REFERENCES dominios.frigorifico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_frigorifico_matadouro
  ADD CONSTRAINT eco_frigorifico_matadouro_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_madeireira
  ADD CONSTRAINT eco_madeireira_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_agrop_ext_veg_pesca
  ADD CONSTRAINT eco_org_agrop_ext_veg_pesca_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_industrial
  ADD CONSTRAINT eco_org_industrial_tiposecaocnae_fk FOREIGN KEY (tiposecaocnae)
   REFERENCES dominios.tiposecaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_plataforma
  ADD CONSTRAINT eco_plataforma_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_plataforma
  ADD CONSTRAINT eco_plataforma_tipoplataforma_fk FOREIGN KEY (tipoplataforma)
   REFERENCES dominios.tipoplataforma (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_plataforma_a
  ADD CONSTRAINT eco_plataforma_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_plataforma_a
  ADD CONSTRAINT eco_plataforma_a_tipoplataforma_fk FOREIGN KEY (tipoplataforma)
   REFERENCES dominios.tipoplataforma (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_plataforma_p
  ADD CONSTRAINT eco_plataforma_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_plataforma_p
  ADD CONSTRAINT eco_plataforma_p_tipoplataforma_fk FOREIGN KEY (tipoplataforma)
   REFERENCES dominios.tipoplataforma (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_ensino_a
  ADD CONSTRAINT edu_area_ensino_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_lazer_a
  ADD CONSTRAINT edu_area_lazer_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_religiosa_a
  ADD CONSTRAINT edu_area_religiosa_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_ruinas_a
  ADD CONSTRAINT edu_area_ruinas_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada
  ADD CONSTRAINT edu_arquibancada_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada
  ADD CONSTRAINT edu_arquibancada_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada
  ADD CONSTRAINT edu_arquibancada_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_a
  ADD CONSTRAINT edu_arquibancada_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_a
  ADD CONSTRAINT edu_arquibancada_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_a
  ADD CONSTRAINT edu_arquibancada_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_p
  ADD CONSTRAINT edu_arquibancada_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_p
  ADD CONSTRAINT edu_arquibancada_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_p
  ADD CONSTRAINT edu_arquibancada_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra
  ADD CONSTRAINT edu_campo_quadra_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra
  ADD CONSTRAINT edu_campo_quadra_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra
  ADD CONSTRAINT edu_campo_quadra_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra
  ADD CONSTRAINT edu_campo_quadra_tipocampoquadra_fk FOREIGN KEY (tipocampoquadra)
   REFERENCES dominios.tipocampoquadra (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_a
  ADD CONSTRAINT edu_campo_quadra_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_a
  ADD CONSTRAINT edu_campo_quadra_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_a
  ADD CONSTRAINT edu_campo_quadra_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_a
  ADD CONSTRAINT edu_campo_quadra_a_tipocampoquadra_fk FOREIGN KEY (tipocampoquadra)
   REFERENCES dominios.tipocampoquadra (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_p
  ADD CONSTRAINT edu_campo_quadra_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_p
  ADD CONSTRAINT edu_campo_quadra_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_p
  ADD CONSTRAINT edu_campo_quadra_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_p
  ADD CONSTRAINT edu_campo_quadra_p_tipocampoquadra_fk FOREIGN KEY (tipocampoquadra)
   REFERENCES dominios.tipocampoquadra (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_tipocomplexolazer_fk FOREIGN KEY (tipocomplexolazer)
   REFERENCES dominios.tipocomplexolazer (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_tipodivisaocnae_fk FOREIGN KEY (tipodivisaocnae)
   REFERENCES dominios.tipodivisaocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna
  ADD CONSTRAINT edu_coreto_tribuna_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna
  ADD CONSTRAINT edu_coreto_tribuna_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna
  ADD CONSTRAINT edu_coreto_tribuna_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_a
  ADD CONSTRAINT edu_coreto_tribuna_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_a
  ADD CONSTRAINT edu_coreto_tribuna_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_a
  ADD CONSTRAINT edu_coreto_tribuna_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_p
  ADD CONSTRAINT edu_coreto_tribuna_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_p
  ADD CONSTRAINT edu_coreto_tribuna_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_p
  ADD CONSTRAINT edu_coreto_tribuna_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_a
  ADD CONSTRAINT edu_edif_const_lazer_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_a
  ADD CONSTRAINT edu_edif_const_lazer_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_a
  ADD CONSTRAINT edu_edif_const_lazer_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_a
  ADD CONSTRAINT edu_edif_const_lazer_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_a
  ADD CONSTRAINT edu_edif_const_lazer_a_tipoediflazer_fk FOREIGN KEY (tipoediflazer)
   REFERENCES dominios.tipoediflazer (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_p
  ADD CONSTRAINT edu_edif_const_lazer_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_p
  ADD CONSTRAINT edu_edif_const_lazer_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_p
  ADD CONSTRAINT edu_edif_const_lazer_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_p
  ADD CONSTRAINT edu_edif_const_lazer_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_p
  ADD CONSTRAINT edu_edif_const_lazer_p_tipoediflazer_fk FOREIGN KEY (tipoediflazer)
   REFERENCES dominios.tipoediflazer (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_ovgd_fk FOREIGN KEY (ovgd)
   REFERENCES dominios.ovgd (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_tipoedifturist_fk FOREIGN KEY (tipoedifturist)
   REFERENCES dominios.tipoedifturist (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_ovgd_fk FOREIGN KEY (ovgd)
   REFERENCES dominios.ovgd (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_tipoedifturist_fk FOREIGN KEY (tipoedifturist)
   REFERENCES dominios.tipoedifturist (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_a
  ADD CONSTRAINT edu_edif_ensino_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_a
  ADD CONSTRAINT edu_edif_ensino_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_a
  ADD CONSTRAINT edu_edif_ensino_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_a
  ADD CONSTRAINT edu_edif_ensino_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_a
  ADD CONSTRAINT edu_edif_ensino_a_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_p
  ADD CONSTRAINT edu_edif_ensino_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_p
  ADD CONSTRAINT edu_edif_ensino_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_p
  ADD CONSTRAINT edu_edif_ensino_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_p
  ADD CONSTRAINT edu_edif_ensino_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_p
  ADD CONSTRAINT edu_edif_ensino_p_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_ensino_fk FOREIGN KEY (ensino)
   REFERENCES dominios.ensino (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_tipoedifrelig_fk FOREIGN KEY (tipoedifrelig)
   REFERENCES dominios.tipoedifrelig (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_ensino_fk FOREIGN KEY (ensino)
   REFERENCES dominios.ensino (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_tipoedifrelig_fk FOREIGN KEY (tipoedifrelig)
   REFERENCES dominios.tipoedifrelig (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino
  ADD CONSTRAINT edu_org_ensino_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino
  ADD CONSTRAINT edu_org_ensino_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_militar
  ADD CONSTRAINT edu_org_ensino_militar_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_militar
  ADD CONSTRAINT edu_org_ensino_militar_classificsigiloso_fk FOREIGN KEY (classificsigiloso)
   REFERENCES dominios.classificsigiloso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_militar
  ADD CONSTRAINT edu_org_ensino_militar_instituicao_fk FOREIGN KEY (instituicao)
   REFERENCES dominios.instituicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_militar
  ADD CONSTRAINT edu_org_ensino_militar_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_militar
  ADD CONSTRAINT edu_org_ensino_militar_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_pub
  ADD CONSTRAINT edu_org_ensino_pub_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_pub
  ADD CONSTRAINT edu_org_ensino_pub_poderpublico_fk FOREIGN KEY (poderpublico)
   REFERENCES dominios.poderpublico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_pub
  ADD CONSTRAINT edu_org_ensino_pub_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_pub
  ADD CONSTRAINT edu_org_ensino_pub_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_religioso
  ADD CONSTRAINT edu_org_ensino_religioso_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_religioso
  ADD CONSTRAINT edu_org_ensino_religioso_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_religioso
  ADD CONSTRAINT edu_org_ensino_religioso_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_religiosa
  ADD CONSTRAINT edu_org_religiosa_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_piscina_a
  ADD CONSTRAINT edu_piscina_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_piscina_a
  ADD CONSTRAINT edu_piscina_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_piscina_a
  ADD CONSTRAINT edu_piscina_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_pista_competicao_l
  ADD CONSTRAINT edu_pista_competicao_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_pista_competicao_l
  ADD CONSTRAINT edu_pista_competicao_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_pista_competicao_l
  ADD CONSTRAINT edu_pista_competicao_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_pista_competicao_l
  ADD CONSTRAINT edu_pista_competicao_l_tipopista_fk FOREIGN KEY (tipopista)
   REFERENCES dominios.tipopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_ruina
  ADD CONSTRAINT edu_ruina_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_ruina_a
  ADD CONSTRAINT edu_ruina_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_ruina_p
  ADD CONSTRAINT edu_ruina_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_antena_comunic_p
  ADD CONSTRAINT enc_antena_comunic_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_antena_comunic_p
  ADD CONSTRAINT enc_antena_comunic_p_posicaoreledific_fk FOREIGN KEY (posicaoreledific)
   REFERENCES dominios.posicaoreledific (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_area_comunicacao_a
  ADD CONSTRAINT enc_area_comunicacao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_area_energia_eletrica_a
  ADD CONSTRAINT enc_area_energia_eletrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_complexo_comunicacao
  ADD CONSTRAINT enc_complexo_comunicacao_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_complexo_gerad_energ_eletr
  ADD CONSTRAINT enc_complexo_gerad_energ_eletr_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_modalidade_fk FOREIGN KEY (modalidade)
   REFERENCES dominios.modalidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_tipoedifcomunic_fk FOREIGN KEY (tipoedifcomunic)
   REFERENCES dominios.tipoedifcomunic (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_modalidade_fk FOREIGN KEY (modalidade)
   REFERENCES dominios.modalidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_tipoedifcomunic_fk FOREIGN KEY (tipoedifcomunic)
   REFERENCES dominios.tipoedifcomunic (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_tipoedifenergia_fk FOREIGN KEY (tipoedifenergia)
   REFERENCES dominios.tipoedifenergia (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_tipoedifenergia_fk FOREIGN KEY (tipoedifenergia)
   REFERENCES dominios.tipoedifenergia (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  ADD CONSTRAINT enc_est_gerad_energia_eletr_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  ADD CONSTRAINT enc_est_gerad_energia_eletr_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  ADD CONSTRAINT enc_est_gerad_energia_eletr_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  ADD CONSTRAINT enc_est_gerad_energia_eletr_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  ADD CONSTRAINT enc_est_gerad_energia_eletr_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  ADD CONSTRAINT enc_est_gerad_energia_eletr_a_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  ADD CONSTRAINT enc_est_gerad_energia_eletr_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  ADD CONSTRAINT enc_est_gerad_energia_eletr_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  ADD CONSTRAINT enc_est_gerad_energia_eletr_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  ADD CONSTRAINT enc_est_gerad_energia_eletr_a_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  ADD CONSTRAINT enc_est_gerad_energia_eletr_l_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  ADD CONSTRAINT enc_est_gerad_energia_eletr_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  ADD CONSTRAINT enc_est_gerad_energia_eletr_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  ADD CONSTRAINT enc_est_gerad_energia_eletr_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  ADD CONSTRAINT enc_est_gerad_energia_eletr_l_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  ADD CONSTRAINT enc_est_gerad_energia_eletr_p_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  ADD CONSTRAINT enc_est_gerad_energia_eletr_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  ADD CONSTRAINT enc_est_gerad_energia_eletr_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  ADD CONSTRAINT enc_est_gerad_energia_eletr_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  ADD CONSTRAINT enc_est_gerad_energia_eletr_p_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_grupo_transformadores
  ADD CONSTRAINT enc_grupo_transformadores_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_grupo_transformadores_a
  ADD CONSTRAINT enc_grupo_transformadores_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_grupo_transformadores_p
  ADD CONSTRAINT enc_grupo_transformadores_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_a
  ADD CONSTRAINT enc_hidreletrica_a_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_a
  ADD CONSTRAINT enc_hidreletrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_a
  ADD CONSTRAINT enc_hidreletrica_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_a
  ADD CONSTRAINT enc_hidreletrica_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_a
  ADD CONSTRAINT enc_hidreletrica_a_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_l
  ADD CONSTRAINT enc_hidreletrica_l_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_l
  ADD CONSTRAINT enc_hidreletrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_l
  ADD CONSTRAINT enc_hidreletrica_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_l
  ADD CONSTRAINT enc_hidreletrica_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_l
  ADD CONSTRAINT enc_hidreletrica_l_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_p
  ADD CONSTRAINT enc_hidreletrica_p_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_p
  ADD CONSTRAINT enc_hidreletrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_p
  ADD CONSTRAINT enc_hidreletrica_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_p
  ADD CONSTRAINT enc_hidreletrica_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_p
  ADD CONSTRAINT enc_hidreletrica_p_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_ponto_trecho_energia_p
  ADD CONSTRAINT enc_ponto_trecho_energia_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_ponto_trecho_energia_p
  ADD CONSTRAINT enc_ponto_trecho_energia_p_tipoptoenergia_fk FOREIGN KEY (tipoptoenergia)
   REFERENCES dominios.tipoptoenergia (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_subestacao_ener_eletr
  ADD CONSTRAINT enc_subestacao_ener_eletr_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_subestacao_ener_eletr
  ADD CONSTRAINT enc_subestacao_ener_eletr_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_subestacao_ener_eletr
  ADD CONSTRAINT enc_subestacao_ener_eletr_tipooperativo_fk FOREIGN KEY (tipooperativo)
   REFERENCES dominios.tipooperativo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_combrenovavel_fk FOREIGN KEY (combrenovavel)
   REFERENCES dominios.combrenovavel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_geracao_fk FOREIGN KEY (geracao)
   REFERENCES dominios.geracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_tipocombustivel_fk FOREIGN KEY (tipocombustivel)
   REFERENCES dominios.tipocombustivel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_tipomaqtermica_fk FOREIGN KEY (tipomaqtermica)
   REFERENCES dominios.tipomaqtermica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_combrenovavel_fk FOREIGN KEY (combrenovavel)
   REFERENCES dominios.combrenovavel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_destenergelet_fk FOREIGN KEY (destenergelet)
   REFERENCES dominios.destenergelet (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_geracao_fk FOREIGN KEY (geracao)
   REFERENCES dominios.geracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_tipocombustivel_fk FOREIGN KEY (tipocombustivel)
   REFERENCES dominios.tipocombustivel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_tipoestgerad_fk FOREIGN KEY (tipoestgerad)
   REFERENCES dominios.tipoestgerad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_tipomaqtermica_fk FOREIGN KEY (tipomaqtermica)
   REFERENCES dominios.tipomaqtermica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_comunic_p
  ADD CONSTRAINT enc_torre_comunic_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_comunic_p
  ADD CONSTRAINT enc_torre_comunic_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_comunic_p
  ADD CONSTRAINT enc_torre_comunic_p_ovgd_fk FOREIGN KEY (ovgd)
   REFERENCES dominios.ovgd (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_comunic_p
  ADD CONSTRAINT enc_torre_comunic_p_posicaoreledific_fk FOREIGN KEY (posicaoreledific)
   REFERENCES dominios.posicaoreledific (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_comunic_p
  ADD CONSTRAINT enc_torre_comunic_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_energia_p
  ADD CONSTRAINT enc_torre_energia_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_energia_p
  ADD CONSTRAINT enc_torre_energia_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_energia_p
  ADD CONSTRAINT enc_torre_energia_p_ovgd_fk FOREIGN KEY (ovgd)
   REFERENCES dominios.ovgd (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_energia_p
  ADD CONSTRAINT enc_torre_energia_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_energia_p
  ADD CONSTRAINT enc_torre_energia_p_tipotorre_fk FOREIGN KEY (tipotorre)
   REFERENCES dominios.tipotorre (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_emduto_fk FOREIGN KEY (emduto)
   REFERENCES dominios.emduto (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_posicaorelativa_fk FOREIGN KEY (posicaorelativa)
   REFERENCES dominios.posicaorelativa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_tipotrechocomunic_fk FOREIGN KEY (tipotrechocomunic)
   REFERENCES dominios.tipotrechocomunic (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_emduto_fk FOREIGN KEY (emduto)
   REFERENCES dominios.emduto (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_especie_fk FOREIGN KEY (especie)
   REFERENCES dominios.especie (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_posicaorelativa_fk FOREIGN KEY (posicaorelativa)
   REFERENCES dominios.posicaorelativa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_zona_linhas_energia_com_a
  ADD CONSTRAINT enc_zona_linhas_energia_com_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_area_umida_a
  ADD CONSTRAINT hid_area_umida_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_area_umida_a
  ADD CONSTRAINT hid_area_umida_a_tipoareaumida_fk FOREIGN KEY (tipoareaumida)
   REFERENCES dominios.tipoareaumida (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_bacia_hidrografica_a
  ADD CONSTRAINT hid_bacia_hidrografica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia
  ADD CONSTRAINT hid_banco_areia_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia
  ADD CONSTRAINT hid_banco_areia_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia
  ADD CONSTRAINT hid_banco_areia_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia
  ADD CONSTRAINT hid_banco_areia_tipobanco_fk FOREIGN KEY (tipobanco)
   REFERENCES dominios.tipobanco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_a
  ADD CONSTRAINT hid_banco_areia_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_a
  ADD CONSTRAINT hid_banco_areia_a_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_a
  ADD CONSTRAINT hid_banco_areia_a_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_a
  ADD CONSTRAINT hid_banco_areia_a_tipobanco_fk FOREIGN KEY (tipobanco)
   REFERENCES dominios.tipobanco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_l
  ADD CONSTRAINT hid_banco_areia_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_l
  ADD CONSTRAINT hid_banco_areia_l_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_l
  ADD CONSTRAINT hid_banco_areia_l_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_banco_areia_l
  ADD CONSTRAINT hid_banco_areia_l_tipobanco_fk FOREIGN KEY (tipobanco)
   REFERENCES dominios.tipobanco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem
  ADD CONSTRAINT hid_barragem_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem
  ADD CONSTRAINT hid_barragem_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem
  ADD CONSTRAINT hid_barragem_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem
  ADD CONSTRAINT hid_barragem_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem
  ADD CONSTRAINT hid_barragem_usoprincipal_fk FOREIGN KEY (usoprincipal)
   REFERENCES dominios.usoprincipal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_a
  ADD CONSTRAINT hid_barragem_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_a
  ADD CONSTRAINT hid_barragem_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_a
  ADD CONSTRAINT hid_barragem_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_a
  ADD CONSTRAINT hid_barragem_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_a
  ADD CONSTRAINT hid_barragem_a_usoprincipal_fk FOREIGN KEY (usoprincipal)
   REFERENCES dominios.usoprincipal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_l
  ADD CONSTRAINT hid_barragem_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_l
  ADD CONSTRAINT hid_barragem_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_l
  ADD CONSTRAINT hid_barragem_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_l
  ADD CONSTRAINT hid_barragem_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_l
  ADD CONSTRAINT hid_barragem_l_usoprincipal_fk FOREIGN KEY (usoprincipal)
   REFERENCES dominios.usoprincipal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_p
  ADD CONSTRAINT hid_barragem_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_p
  ADD CONSTRAINT hid_barragem_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_p
  ADD CONSTRAINT hid_barragem_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_p
  ADD CONSTRAINT hid_barragem_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_p
  ADD CONSTRAINT hid_barragem_p_usoprincipal_fk FOREIGN KEY (usoprincipal)
   REFERENCES dominios.usoprincipal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta
  ADD CONSTRAINT hid_comporta_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta
  ADD CONSTRAINT hid_comporta_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta
  ADD CONSTRAINT hid_comporta_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta_l
  ADD CONSTRAINT hid_comporta_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta_l
  ADD CONSTRAINT hid_comporta_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta_l
  ADD CONSTRAINT hid_comporta_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta_p
  ADD CONSTRAINT hid_comporta_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta_p
  ADD CONSTRAINT hid_comporta_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_comporta_p
  ADD CONSTRAINT hid_comporta_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_confluencia_p
  ADD CONSTRAINT hid_confluencia_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_confluencia_p
  ADD CONSTRAINT hid_confluencia_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_hid (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_corredeira
  ADD CONSTRAINT hid_corredeira_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_corredeira_a
  ADD CONSTRAINT hid_corredeira_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_corredeira_l
  ADD CONSTRAINT hid_corredeira_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_corredeira_p
  ADD CONSTRAINT hid_corredeira_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_fonte_dagua_p
  ADD CONSTRAINT hid_fonte_dagua_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_fonte_dagua_p
  ADD CONSTRAINT hid_fonte_dagua_p_qualidagua_fk FOREIGN KEY (qualidagua)
   REFERENCES dominios.qualidagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_fonte_dagua_p
  ADD CONSTRAINT hid_fonte_dagua_p_regime_fk FOREIGN KEY (regime)
   REFERENCES dominios.regime (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_fonte_dagua_p
  ADD CONSTRAINT hid_fonte_dagua_p_tipofontedagua_fk FOREIGN KEY (tipofontedagua)
   REFERENCES dominios.tipofontedagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_foz_maritima
  ADD CONSTRAINT hid_foz_maritima_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_foz_maritima_a
  ADD CONSTRAINT hid_foz_maritima_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_foz_maritima_l
  ADD CONSTRAINT hid_foz_maritima_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_foz_maritima_p
  ADD CONSTRAINT hid_foz_maritima_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_a
  ADD CONSTRAINT hid_ilha_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_a
  ADD CONSTRAINT hid_ilha_a_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_a
  ADD CONSTRAINT hid_ilha_a_tipoilha_fk FOREIGN KEY (tipoilha)
   REFERENCES dominios.tipoilha (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_l
  ADD CONSTRAINT hid_ilha_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_l
  ADD CONSTRAINT hid_ilha_l_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_l
  ADD CONSTRAINT hid_ilha_l_tipoilha_fk FOREIGN KEY (tipoilha)
   REFERENCES dominios.tipoilha (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_p
  ADD CONSTRAINT hid_ilha_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_p
  ADD CONSTRAINT hid_ilha_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ilha_p
  ADD CONSTRAINT hid_ilha_p_tipoilha_fk FOREIGN KEY (tipoilha)
   REFERENCES dominios.tipoilha (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_limite_massa_dagua_l
  ADD CONSTRAINT hid_limite_massa_dagua_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_limite_massa_dagua_l
  ADD CONSTRAINT hid_limite_massa_dagua_l_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_limite_massa_dagua_l
  ADD CONSTRAINT hid_limite_massa_dagua_l_tipolimmassa_fk FOREIGN KEY (tipolimmassa)
   REFERENCES dominios.tipolimmassa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_massa_dagua_a
  ADD CONSTRAINT hid_massa_dagua_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_massa_dagua_a
  ADD CONSTRAINT hid_massa_dagua_a_regime_fk FOREIGN KEY (regime)
   REFERENCES dominios.regime (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_massa_dagua_a
  ADD CONSTRAINT hid_massa_dagua_a_salinidade_fk FOREIGN KEY (salinidade)
   REFERENCES dominios.salinidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_massa_dagua_a
  ADD CONSTRAINT hid_massa_dagua_a_tipomassadagua_fk FOREIGN KEY (tipomassadagua)
   REFERENCES dominios.tipomassadagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo
  ADD CONSTRAINT hid_natureza_fundo_espessalgas_fk FOREIGN KEY (espessalgas)
   REFERENCES dominios.espessalgas (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo
  ADD CONSTRAINT hid_natureza_fundo_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo
  ADD CONSTRAINT hid_natureza_fundo_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_a
  ADD CONSTRAINT hid_natureza_fundo_a_espessalgas_fk FOREIGN KEY (espessalgas)
   REFERENCES dominios.espessalgas (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_a
  ADD CONSTRAINT hid_natureza_fundo_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_a
  ADD CONSTRAINT hid_natureza_fundo_a_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_l
  ADD CONSTRAINT hid_natureza_fundo_l_espessalgas_fk FOREIGN KEY (espessalgas)
   REFERENCES dominios.espessalgas (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_l
  ADD CONSTRAINT hid_natureza_fundo_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_l
  ADD CONSTRAINT hid_natureza_fundo_l_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_p
  ADD CONSTRAINT hid_natureza_fundo_p_espessalgas_fk FOREIGN KEY (espessalgas)
   REFERENCES dominios.espessalgas (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_p
  ADD CONSTRAINT hid_natureza_fundo_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_natureza_fundo_p
  ADD CONSTRAINT hid_natureza_fundo_p_materialpredominante_fk FOREIGN KEY (materialpredominante)
   REFERENCES dominios.materialpredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ponto_drenagem_p
  ADD CONSTRAINT hid_ponto_drenagem_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ponto_drenagem_p
  ADD CONSTRAINT hid_ponto_drenagem_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_hid (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ponto_inicio_drenagem_p
  ADD CONSTRAINT hid_ponto_inicio_drenagem_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ponto_inicio_drenagem_p
  ADD CONSTRAINT hid_ponto_inicio_drenagem_p_nascente_fk FOREIGN KEY (nascente)
   REFERENCES dominios.nascente (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_ponto_inicio_drenagem_p
  ADD CONSTRAINT hid_ponto_inicio_drenagem_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_hid (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe
  ADD CONSTRAINT hid_quebramar_molhe_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe
  ADD CONSTRAINT hid_quebramar_molhe_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe
  ADD CONSTRAINT hid_quebramar_molhe_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe
  ADD CONSTRAINT hid_quebramar_molhe_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe
  ADD CONSTRAINT hid_quebramar_molhe_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe
  ADD CONSTRAINT hid_quebramar_molhe_tipoquebramolhe_fk FOREIGN KEY (tipoquebramolhe)
   REFERENCES dominios.tipoquebramolhe (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_a
  ADD CONSTRAINT hid_quebramar_molhe_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_a
  ADD CONSTRAINT hid_quebramar_molhe_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_a
  ADD CONSTRAINT hid_quebramar_molhe_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_a
  ADD CONSTRAINT hid_quebramar_molhe_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_a
  ADD CONSTRAINT hid_quebramar_molhe_a_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_a
  ADD CONSTRAINT hid_quebramar_molhe_a_tipoquebramolhe_fk FOREIGN KEY (tipoquebramolhe)
   REFERENCES dominios.tipoquebramolhe (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_l
  ADD CONSTRAINT hid_quebramar_molhe_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_l
  ADD CONSTRAINT hid_quebramar_molhe_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_l
  ADD CONSTRAINT hid_quebramar_molhe_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_l
  ADD CONSTRAINT hid_quebramar_molhe_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_l
  ADD CONSTRAINT hid_quebramar_molhe_l_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_quebramar_molhe_l
  ADD CONSTRAINT hid_quebramar_molhe_l_tipoquebramolhe_fk FOREIGN KEY (tipoquebramolhe)
   REFERENCES dominios.tipoquebramolhe (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua
  ADD CONSTRAINT hid_queda_dagua_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua
  ADD CONSTRAINT hid_queda_dagua_tipoqueda_fk FOREIGN KEY (tipoqueda)
   REFERENCES dominios.tipoqueda (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua_a
  ADD CONSTRAINT hid_queda_dagua_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua_a
  ADD CONSTRAINT hid_queda_dagua_a_tipoqueda_fk FOREIGN KEY (tipoqueda)
   REFERENCES dominios.tipoqueda (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua_l
  ADD CONSTRAINT hid_queda_dagua_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua_l
  ADD CONSTRAINT hid_queda_dagua_l_tipoqueda_fk FOREIGN KEY (tipoqueda)
   REFERENCES dominios.tipoqueda (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua_p
  ADD CONSTRAINT hid_queda_dagua_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_queda_dagua_p
  ADD CONSTRAINT hid_queda_dagua_p_tipoqueda_fk FOREIGN KEY (tipoqueda)
   REFERENCES dominios.tipoqueda (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife
  ADD CONSTRAINT hid_recife_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife
  ADD CONSTRAINT hid_recife_situacaocosta_fk FOREIGN KEY (situacaocosta)
   REFERENCES dominios.situacaocosta (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife
  ADD CONSTRAINT hid_recife_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife
  ADD CONSTRAINT hid_recife_tiporecife_fk FOREIGN KEY (tiporecife)
   REFERENCES dominios.tiporecife (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_a
  ADD CONSTRAINT hid_recife_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_a
  ADD CONSTRAINT hid_recife_a_situacaocosta_fk FOREIGN KEY (situacaocosta)
   REFERENCES dominios.situacaocosta (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_a
  ADD CONSTRAINT hid_recife_a_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_a
  ADD CONSTRAINT hid_recife_a_tiporecife_fk FOREIGN KEY (tiporecife)
   REFERENCES dominios.tiporecife (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_l
  ADD CONSTRAINT hid_recife_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_l
  ADD CONSTRAINT hid_recife_l_situacaocosta_fk FOREIGN KEY (situacaocosta)
   REFERENCES dominios.situacaocosta (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_l
  ADD CONSTRAINT hid_recife_l_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_l
  ADD CONSTRAINT hid_recife_l_tiporecife_fk FOREIGN KEY (tiporecife)
   REFERENCES dominios.tiporecife (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_p
  ADD CONSTRAINT hid_recife_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_p
  ADD CONSTRAINT hid_recife_p_situacaocosta_fk FOREIGN KEY (situacaocosta)
   REFERENCES dominios.situacaocosta (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_p
  ADD CONSTRAINT hid_recife_p_situamare_fk FOREIGN KEY (situamare)
   REFERENCES dominios.situamare (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_recife_p
  ADD CONSTRAINT hid_recife_p_tiporecife_fk FOREIGN KEY (tiporecife)
   REFERENCES dominios.tiporecife (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_reservatorio_hidrico_a
  ADD CONSTRAINT hid_reservatorio_hidrico_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_reservatorio_hidrico_a
  ADD CONSTRAINT hid_reservatorio_hidrico_a_usoprincipal_fk FOREIGN KEY (usoprincipal)
   REFERENCES dominios.usoprincipal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_rocha_em_agua
  ADD CONSTRAINT hid_rocha_em_agua_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_rocha_em_agua_a
  ADD CONSTRAINT hid_rocha_em_agua_a_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_rocha_em_agua_p
  ADD CONSTRAINT hid_rocha_em_agua_p_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_sumidouro_vertedouro_p
  ADD CONSTRAINT hid_sumidouro_vertedouro_p_causa_fk FOREIGN KEY (causa)
   REFERENCES dominios.causa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_sumidouro_vertedouro_p
  ADD CONSTRAINT hid_sumidouro_vertedouro_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_sumidouro_vertedouro_p
  ADD CONSTRAINT hid_sumidouro_vertedouro_p_tiposumvert_fk FOREIGN KEY (tiposumvert)
   REFERENCES dominios.tiposumvert (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_terreno_suj_inundacao_a
  ADD CONSTRAINT hid_terreno_suj_inundacao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_hid (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_compartilhado_fk FOREIGN KEY (compartilhado)
   REFERENCES dominios.compartilhado (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_dentrodepoligono_fk FOREIGN KEY (dentrodepoligono)
   REFERENCES dominios.dentrodepoligono (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_eixoprincipal_fk FOREIGN KEY (eixoprincipal)
   REFERENCES dominios.eixoprincipal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_navegabilidade_fk FOREIGN KEY (navegabilidade)
   REFERENCES dominios.navegabilidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_regime_fk FOREIGN KEY (regime)
   REFERENCES dominios.regime (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_massa_dagua_a
  ADD CONSTRAINT hid_trecho_massa_dagua_a_regime_fk FOREIGN KEY (regime)
   REFERENCES dominios.regime (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_massa_dagua_a
  ADD CONSTRAINT hid_trecho_massa_dagua_a_salinidade_fk FOREIGN KEY (salinidade)
   REFERENCES dominios.salinidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_massa_dagua_a
  ADD CONSTRAINT hid_trecho_massa_dagua_a_tipotrechomassa_fk FOREIGN KEY (tipotrechomassa)
   REFERENCES dominios.tipotrechomassa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_de_litigio_a
  ADD CONSTRAINT lim_area_de_litigio_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_desenv_controle_a
  ADD CONSTRAINT lim_area_desenv_controle_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_desenv_controle_p
  ADD CONSTRAINT lim_area_desenv_controle_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_especial
  ADD CONSTRAINT lim_area_especial_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_especial_a
  ADD CONSTRAINT lim_area_especial_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_especial_p
  ADD CONSTRAINT lim_area_especial_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_particular_a
  ADD CONSTRAINT lim_area_particular_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_politico_adm_a
  ADD CONSTRAINT lim_area_politico_adm_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_uso_comunitario_a
  ADD CONSTRAINT lim_area_uso_comunitario_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_uso_comunitario_a
  ADD CONSTRAINT lim_area_uso_comunitario_a_tipoareausocomun_fk FOREIGN KEY (tipoareausocomun)
   REFERENCES dominios.tipoareausocomun (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_uso_comunitario_p
  ADD CONSTRAINT lim_area_uso_comunitario_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_area_uso_comunitario_p
  ADD CONSTRAINT lim_area_uso_comunitario_p_tipoareausocomun_fk FOREIGN KEY (tipoareausocomun)
   REFERENCES dominios.tipoareausocomun (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_bairro_a
  ADD CONSTRAINT lim_bairro_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_delimitacao_fisica_l
  ADD CONSTRAINT lim_delimitacao_fisica_l_eletrificada_fk FOREIGN KEY (eletrificada)
   REFERENCES dominios.eletrificada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_delimitacao_fisica_l
  ADD CONSTRAINT lim_delimitacao_fisica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_delimitacao_fisica_l
  ADD CONSTRAINT lim_delimitacao_fisica_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_delimitacao_fisica_l
  ADD CONSTRAINT lim_delimitacao_fisica_l_tipodelimfis_fk FOREIGN KEY (tipodelimfis)
   REFERENCES dominios.tipodelimfis (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_distrito_a
  ADD CONSTRAINT lim_distrito_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_area_especial_l
  ADD CONSTRAINT lim_limite_area_especial_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_area_especial_l
  ADD CONSTRAINT lim_limite_area_especial_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_area_especial_l
  ADD CONSTRAINT lim_limite_area_especial_l_tipolimareaesp_fk FOREIGN KEY (tipolimareaesp)
   REFERENCES dominios.tipolimareaesp (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_intra_munic_adm_l
  ADD CONSTRAINT lim_limite_intra_munic_adm_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_intra_munic_adm_l
  ADD CONSTRAINT lim_limite_intra_munic_adm_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_intra_munic_adm_l
  ADD CONSTRAINT lim_limite_intra_munic_adm_l_tipolimintramun_fk FOREIGN KEY (tipolimintramun)
   REFERENCES dominios.tipolimintramun (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_operacional_l
  ADD CONSTRAINT lim_limite_operacional_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_operacional_l
  ADD CONSTRAINT lim_limite_operacional_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_operacional_l
  ADD CONSTRAINT lim_limite_operacional_l_tipolimoper_fk FOREIGN KEY (tipolimoper)
   REFERENCES dominios.tipolimoper (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_particular_l
  ADD CONSTRAINT lim_limite_particular_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_particular_l
  ADD CONSTRAINT lim_limite_particular_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_politico_adm_l
  ADD CONSTRAINT lim_limite_politico_adm_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_politico_adm_l
  ADD CONSTRAINT lim_limite_politico_adm_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_limite_politico_adm_l
  ADD CONSTRAINT lim_limite_politico_adm_l_tipolimpol_fk FOREIGN KEY (tipolimpol)
   REFERENCES dominios.tipolimpol (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_linha_de_limite_l
  ADD CONSTRAINT lim_linha_de_limite_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_linha_de_limite_l
  ADD CONSTRAINT lim_linha_de_limite_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_marco_de_limite_p
  ADD CONSTRAINT lim_marco_de_limite_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_marco_de_limite_p
  ADD CONSTRAINT lim_marco_de_limite_p_referencialaltim_fk FOREIGN KEY (referencialaltim)
   REFERENCES dominios.referencialaltim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_marco_de_limite_p
  ADD CONSTRAINT lim_marco_de_limite_p_sistemageodesico_fk FOREIGN KEY (sistemageodesico)
   REFERENCES dominios.sistemageodesico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_marco_de_limite_p
  ADD CONSTRAINT lim_marco_de_limite_p_tipomarcolim_fk FOREIGN KEY (tipomarcolim)
   REFERENCES dominios.tipomarcolim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_municipio_a
  ADD CONSTRAINT lim_municipio_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outras_unid_protegidas_a
  ADD CONSTRAINT lim_outras_unid_protegidas_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outras_unid_protegidas_a
  ADD CONSTRAINT lim_outras_unid_protegidas_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outras_unid_protegidas_a
  ADD CONSTRAINT lim_outras_unid_protegidas_a_tipooutunidprot_fk FOREIGN KEY (tipooutunidprot)
   REFERENCES dominios.tipooutunidprot (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outras_unid_protegidas_p
  ADD CONSTRAINT lim_outras_unid_protegidas_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outras_unid_protegidas_p
  ADD CONSTRAINT lim_outras_unid_protegidas_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outras_unid_protegidas_p
  ADD CONSTRAINT lim_outras_unid_protegidas_p_tipooutunidprot_fk FOREIGN KEY (tipooutunidprot)
   REFERENCES dominios.tipooutunidprot (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outros_limites_oficiais_l
  ADD CONSTRAINT lim_outros_limites_oficiais_l_coincidecomdentrode_fk FOREIGN KEY (coincidecomdentrode)
   REFERENCES dominios.coincidecomdentrode_lim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outros_limites_oficiais_l
  ADD CONSTRAINT lim_outros_limites_oficiais_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_outros_limites_oficiais_l
  ADD CONSTRAINT lim_outros_limites_oficiais_l_tipooutlimofic_fk FOREIGN KEY (tipooutlimofic)
   REFERENCES dominios.tipooutlimofic (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_pais_a
  ADD CONSTRAINT lim_pais_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_regiao_administrativa_a
  ADD CONSTRAINT lim_regiao_administrativa_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_sub_distrito_a
  ADD CONSTRAINT lim_sub_distrito_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_indigena
  ADD CONSTRAINT lim_terra_indigena_situacaojuridica_fk FOREIGN KEY (situacaojuridica)
   REFERENCES dominios.situacaojuridica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_indigena
  ADD CONSTRAINT lim_terra_indigena_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_indigena_a
  ADD CONSTRAINT lim_terra_indigena_a_situacaojuridica_fk FOREIGN KEY (situacaojuridica)
   REFERENCES dominios.situacaojuridica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_indigena_a
  ADD CONSTRAINT lim_terra_indigena_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_indigena_p
  ADD CONSTRAINT lim_terra_indigena_p_situacaojuridica_fk FOREIGN KEY (situacaojuridica)
   REFERENCES dominios.situacaojuridica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_indigena_p
  ADD CONSTRAINT lim_terra_indigena_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_publica_a
  ADD CONSTRAINT lim_terra_publica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_terra_publica_p
  ADD CONSTRAINT lim_terra_publica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_a
  ADD CONSTRAINT lim_unidade_conserv_nao_snuc_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_a
  ADD CONSTRAINT lim_unidade_conserv_nao_snuc_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_p
  ADD CONSTRAINT lim_unidade_conserv_nao_snuc_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_p
  ADD CONSTRAINT lim_unidade_conserv_nao_snuc_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_federacao_a
  ADD CONSTRAINT lim_unidade_federacao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_federacao_a
  ADD CONSTRAINT lim_unidade_federacao_a_sigla_fk FOREIGN KEY (sigla)
   REFERENCES dominios.sigla (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_protecao_integral_a
  ADD CONSTRAINT lim_unidade_protecao_integral_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_protecao_integral_a
  ADD CONSTRAINT lim_unidade_protecao_integral_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_protecao_integral_a
  ADD CONSTRAINT lim_unidade_protecao_integral_a_tipounidprotinteg_fk FOREIGN KEY (tipounidprotinteg)
   REFERENCES dominios.tipounidprotinteg (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_protecao_integral_p
  ADD CONSTRAINT lim_unidade_protecao_integral_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_protecao_integral_p
  ADD CONSTRAINT lim_unidade_protecao_integral_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_protecao_integral_p
  ADD CONSTRAINT lim_unidade_protecao_integral_p_tipounidprotinteg_fk FOREIGN KEY (tipounidprotinteg)
   REFERENCES dominios.tipounidprotinteg (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_uso_sustentavel_a
  ADD CONSTRAINT lim_unidade_uso_sustentavel_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_uso_sustentavel_a
  ADD CONSTRAINT lim_unidade_uso_sustentavel_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_uso_sustentavel_a
  ADD CONSTRAINT lim_unidade_uso_sustentavel_a_tipounidusosust_fk FOREIGN KEY (tipounidusosust)
   REFERENCES dominios.tipounidusosust (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_uso_sustentavel_p
  ADD CONSTRAINT lim_unidade_uso_sustentavel_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_uso_sustentavel_p
  ADD CONSTRAINT lim_unidade_uso_sustentavel_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_unidade_uso_sustentavel_p
  ADD CONSTRAINT lim_unidade_uso_sustentavel_p_tipounidusosust_fk FOREIGN KEY (tipounidusosust)
   REFERENCES dominios.tipounidusosust (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_aglom_rural_de_ext_urbana_p
  ADD CONSTRAINT loc_aglom_rural_de_ext_urbana_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_aglomerado_rural_isolado_p
  ADD CONSTRAINT loc_aglomerado_rural_isolado_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_aglomerado_rural_isolado_p
  ADD CONSTRAINT loc_aglomerado_rural_isolado_p_tipoaglomrurisol_fk FOREIGN KEY (tipoaglomrurisol)
   REFERENCES dominios.tipoaglomrurisol (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_aglomerado_rural_p
  ADD CONSTRAINT loc_aglomerado_rural_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_area_urbana_isolada_a
  ADD CONSTRAINT loc_area_urbana_isolada_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_area_urbana_isolada_a
  ADD CONSTRAINT loc_area_urbana_isolada_a_tipoassociado_fk FOREIGN KEY (tipoassociado)
   REFERENCES dominios.tipoassociado (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_area_edificada_a
  ADD CONSTRAINT loc_area_edificada_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_area_habitacional_a
  ADD CONSTRAINT loc_area_habitacional_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_capital_p
  ADD CONSTRAINT loc_capital_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_capital_p
  ADD CONSTRAINT loc_capital_p_tipocapital_fk FOREIGN KEY (tipocapital)
   REFERENCES dominios.tipocapital (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_cidade_p
  ADD CONSTRAINT loc_cidade_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_a
  ADD CONSTRAINT loc_edif_habitacional_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_a
  ADD CONSTRAINT loc_edif_habitacional_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_a
  ADD CONSTRAINT loc_edif_habitacional_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_a
  ADD CONSTRAINT loc_edif_habitacional_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_p
  ADD CONSTRAINT loc_edif_habitacional_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_p
  ADD CONSTRAINT loc_edif_habitacional_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_p
  ADD CONSTRAINT loc_edif_habitacional_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_p
  ADD CONSTRAINT loc_edif_habitacional_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao
  ADD CONSTRAINT loc_edificacao_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao
  ADD CONSTRAINT loc_edificacao_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao
  ADD CONSTRAINT loc_edificacao_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao
  ADD CONSTRAINT loc_edificacao_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_a
  ADD CONSTRAINT loc_edificacao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_a
  ADD CONSTRAINT loc_edificacao_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_a
  ADD CONSTRAINT loc_edificacao_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_a
  ADD CONSTRAINT loc_edificacao_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_p
  ADD CONSTRAINT loc_edificacao_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_p
  ADD CONSTRAINT loc_edificacao_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_p
  ADD CONSTRAINT loc_edificacao_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edificacao_p
  ADD CONSTRAINT loc_edificacao_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena
  ADD CONSTRAINT loc_hab_indigena_coletiva_fk FOREIGN KEY (coletiva)
   REFERENCES dominios.coletiva (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena
  ADD CONSTRAINT loc_hab_indigena_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena
  ADD CONSTRAINT loc_hab_indigena_isolada_fk FOREIGN KEY (isolada)
   REFERENCES dominios.isolada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_a
  ADD CONSTRAINT loc_hab_indigena_a_coletiva_fk FOREIGN KEY (coletiva)
   REFERENCES dominios.coletiva (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_a
  ADD CONSTRAINT loc_hab_indigena_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_a
  ADD CONSTRAINT loc_hab_indigena_a_isolada_fk FOREIGN KEY (isolada)
   REFERENCES dominios.isolada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_p
  ADD CONSTRAINT loc_hab_indigena_p_coletiva_fk FOREIGN KEY (coletiva)
   REFERENCES dominios.coletiva (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_p
  ADD CONSTRAINT loc_hab_indigena_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_p
  ADD CONSTRAINT loc_hab_indigena_p_isolada_fk FOREIGN KEY (isolada)
   REFERENCES dominios.isolada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_localidade_p
  ADD CONSTRAINT loc_localidade_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_nome_local_p
  ADD CONSTRAINT loc_nome_local_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_vila_p
  ADD CONSTRAINT loc_vila_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_area_est_med_fenom_a
  ADD CONSTRAINT pto_area_est_med_fenom_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_a
  ADD CONSTRAINT pto_edif_constr_est_med_fen_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_a
  ADD CONSTRAINT pto_edif_constr_est_med_fen_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_a
  ADD CONSTRAINT pto_edif_constr_est_med_fen_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_a
  ADD CONSTRAINT pto_edif_constr_est_med_fen_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_p
  ADD CONSTRAINT pto_edif_constr_est_med_fen_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_p
  ADD CONSTRAINT pto_edif_constr_est_med_fen_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_p
  ADD CONSTRAINT pto_edif_constr_est_med_fen_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_edif_constr_est_med_fen_p
  ADD CONSTRAINT pto_edif_constr_est_med_fen_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.pto_est_med_fenomenos
  ADD CONSTRAINT pto_est_med_fenomenos_tipoestmed_fk FOREIGN KEY (tipoestmed)
   REFERENCES dominios.tipoestmed (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_controle_p
  ADD CONSTRAINT pto_pto_controle_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_controle_p
  ADD CONSTRAINT pto_pto_controle_p_materializado_fk FOREIGN KEY (materializado)
   REFERENCES dominios.materializado (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_controle_p
  ADD CONSTRAINT pto_pto_controle_p_referencialaltim_fk FOREIGN KEY (referencialaltim)
   REFERENCES dominios.referencialaltim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_controle_p
  ADD CONSTRAINT pto_pto_controle_p_sistemageodesico_fk FOREIGN KEY (sistemageodesico)
   REFERENCES dominios.sistemageodesico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_controle_p
  ADD CONSTRAINT pto_pto_controle_p_tipoptocontrole_fk FOREIGN KEY (tipoptocontrole)
   REFERENCES dominios.tipoptocontrole (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_controle_p
  ADD CONSTRAINT pto_pto_controle_p_tiporef_fk FOREIGN KEY (tiporef)
   REFERENCES dominios.tiporef (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_est_med_fenomenos_p
  ADD CONSTRAINT pto_pto_est_med_fenomenos_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_est_med_fenomenos_p
  ADD CONSTRAINT pto_pto_est_med_fenomenos_p_tipoptoestmed_fk FOREIGN KEY (tipoptoestmed)
   REFERENCES dominios.tipoptoestmed (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_geod_topo_controle_p
  ADD CONSTRAINT pto_pto_geod_topo_controle_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_geod_topo_controle_p
  ADD CONSTRAINT pto_pto_geod_topo_controle_p_referencialaltim_fk FOREIGN KEY (referencialaltim)
   REFERENCES dominios.referencialaltim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_geod_topo_controle_p
  ADD CONSTRAINT pto_pto_geod_topo_controle_p_sistemageodesico_fk FOREIGN KEY (sistemageodesico)
   REFERENCES dominios.sistemageodesico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_geod_topo_controle_p
  ADD CONSTRAINT pto_pto_geod_topo_controle_p_tiporef_fk FOREIGN KEY (tiporef)
   REFERENCES dominios.tiporef (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_proximidade_fk FOREIGN KEY (proximidade)
   REFERENCES dominios.proximidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_rede_fk FOREIGN KEY (rede)
   REFERENCES dominios.rede (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_referencialaltim_fk FOREIGN KEY (referencialaltim)
   REFERENCES dominios.referencialaltim (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_referencialgrav_fk FOREIGN KEY (referencialgrav)
   REFERENCES dominios.referencialgrav (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_sistemageodesico_fk FOREIGN KEY (sistemageodesico)
   REFERENCES dominios.sistemageodesico (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_situacaomarco_fk FOREIGN KEY (situacaomarco)
   REFERENCES dominios.situacaomarco (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_tipoptorefgeodtopo_fk FOREIGN KEY (tipoptorefgeodtopo)
   REFERENCES dominios.tipoptorefgeodtopo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_ref_geod_topo_p
  ADD CONSTRAINT pto_pto_ref_geod_topo_p_tiporef_fk FOREIGN KEY (tiporef)
   REFERENCES dominios.tiporef (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_alter_fisiog_antropica
  ADD CONSTRAINT rel_alter_fisiog_antropica_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_alter_fisiog_antropica
  ADD CONSTRAINT rel_alter_fisiog_antropica_tipoalterantrop_fk FOREIGN KEY (tipoalterantrop)
   REFERENCES dominios.tipoalterantrop (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_alter_fisiog_antropica_a
  ADD CONSTRAINT rel_alter_fisiog_antropica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_alter_fisiog_antropica_a
  ADD CONSTRAINT rel_alter_fisiog_antropica_a_tipoalterantrop_fk FOREIGN KEY (tipoalterantrop)
   REFERENCES dominios.tipoalterantrop (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_alter_fisiog_antropica_l
  ADD CONSTRAINT rel_alter_fisiog_antropica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_alter_fisiog_antropica_l
  ADD CONSTRAINT rel_alter_fisiog_antropica_l_tipoalterantrop_fk FOREIGN KEY (tipoalterantrop)
   REFERENCES dominios.tipoalterantrop (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_curva_nivel_l
  ADD CONSTRAINT rel_curva_nivel_l_depressao_fk FOREIGN KEY (depressao)
   REFERENCES dominios.depressao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_curva_nivel_l
  ADD CONSTRAINT rel_curva_nivel_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_curva_nivel_l
  ADD CONSTRAINT rel_curva_nivel_l_indice_fk FOREIGN KEY (indice)
   REFERENCES dominios.indice (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_dolina_a
  ADD CONSTRAINT rel_dolina_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_dolina_a
  ADD CONSTRAINT rel_dolina_a_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_dolina_p
  ADD CONSTRAINT rel_dolina_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_dolina_p
  ADD CONSTRAINT rel_dolina_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_duna_a
  ADD CONSTRAINT rel_duna_a_fixa_fk FOREIGN KEY (fixa)
   REFERENCES dominios.fixa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_duna_a
  ADD CONSTRAINT rel_duna_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_duna_a
  ADD CONSTRAINT rel_duna_a_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_duna_p
  ADD CONSTRAINT rel_duna_p_fixa_fk FOREIGN KEY (fixa)
   REFERENCES dominios.fixa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_duna_p
  ADD CONSTRAINT rel_duna_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_duna_p
  ADD CONSTRAINT rel_duna_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural
  ADD CONSTRAINT rel_elemento_fisiog_natural_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural
  ADD CONSTRAINT rel_elemento_fisiog_natural_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural_a
  ADD CONSTRAINT rel_elemento_fisiog_natural_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural_a
  ADD CONSTRAINT rel_elemento_fisiog_natural_a_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural_l
  ADD CONSTRAINT rel_elemento_fisiog_natural_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural_l
  ADD CONSTRAINT rel_elemento_fisiog_natural_l_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural_p
  ADD CONSTRAINT rel_elemento_fisiog_natural_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiog_natural_p
  ADD CONSTRAINT rel_elemento_fisiog_natural_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_elemento_fisiografico
  ADD CONSTRAINT rel_elemento_fisiografico_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_gruta_caverna_p
  ADD CONSTRAINT rel_gruta_caverna_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_gruta_caverna_p
  ADD CONSTRAINT rel_gruta_caverna_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_gruta_caverna_p
  ADD CONSTRAINT rel_gruta_caverna_p_tipogrutacaverna_fk FOREIGN KEY (tipogrutacaverna)
   REFERENCES dominios.tipogrutacaverna (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_pico_p
  ADD CONSTRAINT rel_pico_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_pico_p
  ADD CONSTRAINT rel_pico_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_ponto_cotado_altimetrico_p
  ADD CONSTRAINT rel_ponto_cotado_altimetrico_p_cotacomprovada_fk FOREIGN KEY (cotacomprovada)
   REFERENCES dominios.cotacomprovada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_ponto_cotado_altimetrico_p
  ADD CONSTRAINT rel_ponto_cotado_altimetrico_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_rocha_a
  ADD CONSTRAINT rel_rocha_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_rocha_a
  ADD CONSTRAINT rel_rocha_a_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_rocha_a
  ADD CONSTRAINT rel_rocha_a_tiporocha_fk FOREIGN KEY (tiporocha)
   REFERENCES dominios.tiporocha (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_rocha_p
  ADD CONSTRAINT rel_rocha_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_rocha_p
  ADD CONSTRAINT rel_rocha_p_tipoelemnat_fk FOREIGN KEY (tipoelemnat)
   REFERENCES dominios.tipoelemnat (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_rocha_p
  ADD CONSTRAINT rel_rocha_p_tiporocha_fk FOREIGN KEY (tiporocha)
   REFERENCES dominios.tiporocha (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_terreno_exposto_a
  ADD CONSTRAINT rel_terreno_exposto_a_causaexposicao_fk FOREIGN KEY (causaexposicao)
   REFERENCES dominios.causaexposicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_terreno_exposto_a
  ADD CONSTRAINT rel_terreno_exposto_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_terreno_exposto_a
  ADD CONSTRAINT rel_terreno_exposto_a_tipoterrexp_fk FOREIGN KEY (tipoterrexp)
   REFERENCES dominios.tipoterrexp (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_area_saude_a
  ADD CONSTRAINT sau_area_saude_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_area_servico_social_a
  ADD CONSTRAINT sau_area_servico_social_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_nivelatencao_fk FOREIGN KEY (nivelatencao)
   REFERENCES dominios.nivelatencao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_nivelatencao_fk FOREIGN KEY (nivelatencao)
   REFERENCES dominios.nivelatencao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_a
  ADD CONSTRAINT sau_edif_servico_social_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_a
  ADD CONSTRAINT sau_edif_servico_social_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_a
  ADD CONSTRAINT sau_edif_servico_social_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_a
  ADD CONSTRAINT sau_edif_servico_social_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_a
  ADD CONSTRAINT sau_edif_servico_social_a_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_p
  ADD CONSTRAINT sau_edif_servico_social_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_p
  ADD CONSTRAINT sau_edif_servico_social_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_p
  ADD CONSTRAINT sau_edif_servico_social_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_p
  ADD CONSTRAINT sau_edif_servico_social_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_p
  ADD CONSTRAINT sau_edif_servico_social_p_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude
  ADD CONSTRAINT sau_org_saude_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude
  ADD CONSTRAINT sau_org_saude_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_militar
  ADD CONSTRAINT sau_org_saude_militar_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_militar
  ADD CONSTRAINT sau_org_saude_militar_classificsigiloso_fk FOREIGN KEY (classificsigiloso)
   REFERENCES dominios.classificsigiloso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_militar
  ADD CONSTRAINT sau_org_saude_militar_instituicao_fk FOREIGN KEY (instituicao)
   REFERENCES dominios.instituicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_militar
  ADD CONSTRAINT sau_org_saude_militar_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_militar
  ADD CONSTRAINT sau_org_saude_militar_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_pub
  ADD CONSTRAINT sau_org_saude_pub_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_pub
  ADD CONSTRAINT sau_org_saude_pub_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_pub
  ADD CONSTRAINT sau_org_saude_pub_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_servico_social
  ADD CONSTRAINT sau_org_servico_social_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_servico_social
  ADD CONSTRAINT sau_org_servico_social_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_servico_social_pub
  ADD CONSTRAINT sau_org_servico_social_pub_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_servico_social_pub
  ADD CONSTRAINT sau_org_servico_social_pub_tipoclassecnae_fk FOREIGN KEY (tipoclassecnae)
   REFERENCES dominios.tipoclassecnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_servico_social_pub
  ADD CONSTRAINT sau_org_servico_social_pub_tipogrupocnae_fk FOREIGN KEY (tipogrupocnae)
   REFERENCES dominios.tipogrupocnae (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_area_duto_a
  ADD CONSTRAINT tra_area_duto_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_area_estrut_transporte_a
  ADD CONSTRAINT tra_area_estrut_transporte_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_arruamento_l
  ADD CONSTRAINT tra_arruamento_l_canteirodivisorio_fk FOREIGN KEY (canteirodivisorio)
   REFERENCES dominios.canteirodivisorio (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_arruamento_l
  ADD CONSTRAINT tra_arruamento_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_arruamento_l
  ADD CONSTRAINT tra_arruamento_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_arruamento_l
  ADD CONSTRAINT tra_arruamento_l_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_arruamento_l
  ADD CONSTRAINT tra_arruamento_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_arruamento_l
  ADD CONSTRAINT tra_arruamento_l_trafego_fk FOREIGN KEY (trafego)
   REFERENCES dominios.trafego (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_tipoatracad_fk FOREIGN KEY (tipoatracad)
   REFERENCES dominios.tipoatracad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_tipoatracad_fk FOREIGN KEY (tipoatracad)
   REFERENCES dominios.tipoatracad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_tipoatracad_fk FOREIGN KEY (tipoatracad)
   REFERENCES dominios.tipoatracad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_tipoatracad_fk FOREIGN KEY (tipoatracad)
   REFERENCES dominios.tipoatracad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_tipocaminhoaereo_fk FOREIGN KEY (tipocaminhoaereo)
   REFERENCES dominios.tipocaminhoaereo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_tipousocaminhoaer_fk FOREIGN KEY (tipousocaminhoaer)
   REFERENCES dominios.tipousocaminhoaer (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ciclovia_l
  ADD CONSTRAINT tra_ciclovia_l_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ciclovia_l
  ADD CONSTRAINT tra_ciclovia_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ciclovia_l
  ADD CONSTRAINT tra_ciclovia_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ciclovia_l
  ADD CONSTRAINT tra_ciclovia_l_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ciclovia_l
  ADD CONSTRAINT tra_ciclovia_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ciclovia_l
  ADD CONSTRAINT tra_ciclovia_l_trafego_fk FOREIGN KEY (trafego)
   REFERENCES dominios.trafego (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.tra_complexo_aeroportuario
  ADD CONSTRAINT tra_complexo_aeroportuario_classificacao_fk FOREIGN KEY (classificacao)
   REFERENCES dominios.classificacao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.tra_complexo_aeroportuario
  ADD CONSTRAINT tra_complexo_aeroportuario_tipocomplexoaero_fk FOREIGN KEY (tipocomplexoaero)
   REFERENCES dominios.tipocomplexoaero (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.tra_complexo_portuario
  ADD CONSTRAINT tra_complexo_portuario_tipocomplexoportuario_fk FOREIGN KEY (tipocomplexoportuario)
   REFERENCES dominios.tipocomplexoportuario (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.tra_complexo_portuario
  ADD CONSTRAINT tra_complexo_portuario_tipotransporte_fk FOREIGN KEY (tipotransporte)
   REFERENCES dominios.tipotransporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_mattransp_fk FOREIGN KEY (mattransp)
   REFERENCES dominios.mattransp (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_posicaorelativa_fk FOREIGN KEY (posicaorelativa)
   REFERENCES dominios.posicaorelativa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_setor_fk FOREIGN KEY (setor)
   REFERENCES dominios.setor (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_situacaoespacial_fk FOREIGN KEY (situacaoespacial)
   REFERENCES dominios.situacaoespacial (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_tipocondutor_fk FOREIGN KEY (tipocondutor)
   REFERENCES dominios.tipocondutor (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_tipotrechoduto_fk FOREIGN KEY (tipotrechoduto)
   REFERENCES dominios.tipotrechoduto (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira
  ADD CONSTRAINT tra_cremalheira_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira
  ADD CONSTRAINT tra_cremalheira_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira
  ADD CONSTRAINT tra_cremalheira_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira_l
  ADD CONSTRAINT tra_cremalheira_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira_l
  ADD CONSTRAINT tra_cremalheira_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira_l
  ADD CONSTRAINT tra_cremalheira_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira_p
  ADD CONSTRAINT tra_cremalheira_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira_p
  ADD CONSTRAINT tra_cremalheira_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_cremalheira_p
  ADD CONSTRAINT tra_cremalheira_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa
  ADD CONSTRAINT tra_eclusa_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa
  ADD CONSTRAINT tra_eclusa_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa
  ADD CONSTRAINT tra_eclusa_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa
  ADD CONSTRAINT tra_eclusa_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_a
  ADD CONSTRAINT tra_eclusa_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_a
  ADD CONSTRAINT tra_eclusa_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_a
  ADD CONSTRAINT tra_eclusa_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_a
  ADD CONSTRAINT tra_eclusa_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_l
  ADD CONSTRAINT tra_eclusa_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_l
  ADD CONSTRAINT tra_eclusa_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_l
  ADD CONSTRAINT tra_eclusa_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_l
  ADD CONSTRAINT tra_eclusa_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_p
  ADD CONSTRAINT tra_eclusa_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_p
  ADD CONSTRAINT tra_eclusa_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_p
  ADD CONSTRAINT tra_eclusa_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_eclusa_p
  ADD CONSTRAINT tra_eclusa_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_tipoedifaero_fk FOREIGN KEY (tipoedifaero)
   REFERENCES dominios.tipoedifaero (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_tipoedifaero_fk FOREIGN KEY (tipoedifaero)
   REFERENCES dominios.tipoedifaero (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_tipoedifport_fk FOREIGN KEY (tipoedifport)
   REFERENCES dominios.tipoedifport (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_tipoedifport_fk FOREIGN KEY (tipoedifport)
   REFERENCES dominios.tipoedifport (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_funcaoedifmetroferrov_fk FOREIGN KEY (funcaoedifmetroferrov)
   REFERENCES dominios.funcaoedifmetroferrov (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_multimodal_fk FOREIGN KEY (multimodal)
   REFERENCES dominios.multimodal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_funcaoedifmetroferrov_fk FOREIGN KEY (funcaoedifmetroferrov)
   REFERENCES dominios.funcaoedifmetroferrov (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_multimodal_fk FOREIGN KEY (multimodal)
   REFERENCES dominios.multimodal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_tipoedifrod_fk FOREIGN KEY (tipoedifrod)
   REFERENCES dominios.tipoedifrod (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_tipoedifrod_fk FOREIGN KEY (tipoedifrod)
   REFERENCES dominios.tipoedifrod (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_entroncamento_p
  ADD CONSTRAINT tra_entroncamento_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_entroncamento_p
  ADD CONSTRAINT tra_entroncamento_p_tipoentroncamento_fk FOREIGN KEY (tipoentroncamento)
   REFERENCES dominios.tipoentroncamento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.tra_estrut_apoio
  ADD CONSTRAINT tra_estrut_apoio_tipoestrut_fk FOREIGN KEY (tipoestrut)
   REFERENCES dominios.tipoestrut (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_faixa_seguranca_a
  ADD CONSTRAINT tra_faixa_seguranca_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro
  ADD CONSTRAINT tra_fundeadouro_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro
  ADD CONSTRAINT tra_fundeadouro_destinacaofundeadouro_fk FOREIGN KEY (destinacaofundeadouro)
   REFERENCES dominios.destinacaofundeadouro (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro
  ADD CONSTRAINT tra_fundeadouro_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_a
  ADD CONSTRAINT tra_fundeadouro_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_a
  ADD CONSTRAINT tra_fundeadouro_a_destinacaofundeadouro_fk FOREIGN KEY (destinacaofundeadouro)
   REFERENCES dominios.destinacaofundeadouro (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_a
  ADD CONSTRAINT tra_fundeadouro_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_l
  ADD CONSTRAINT tra_fundeadouro_l_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_l
  ADD CONSTRAINT tra_fundeadouro_l_destinacaofundeadouro_fk FOREIGN KEY (destinacaofundeadouro)
   REFERENCES dominios.destinacaofundeadouro (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_l
  ADD CONSTRAINT tra_fundeadouro_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_p
  ADD CONSTRAINT tra_fundeadouro_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_p
  ADD CONSTRAINT tra_fundeadouro_p_destinacaofundeadouro_fk FOREIGN KEY (destinacaofundeadouro)
   REFERENCES dominios.destinacaofundeadouro (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_p
  ADD CONSTRAINT tra_fundeadouro_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular
  ADD CONSTRAINT tra_funicular_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular
  ADD CONSTRAINT tra_funicular_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular
  ADD CONSTRAINT tra_funicular_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_l
  ADD CONSTRAINT tra_funicular_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_l
  ADD CONSTRAINT tra_funicular_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_l
  ADD CONSTRAINT tra_funicular_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_p
  ADD CONSTRAINT tra_funicular_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_p
  ADD CONSTRAINT tra_funicular_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_p
  ADD CONSTRAINT tra_funicular_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro
  ADD CONSTRAINT tra_galeria_bueiro_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro
  ADD CONSTRAINT tra_galeria_bueiro_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro
  ADD CONSTRAINT tra_galeria_bueiro_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro_l
  ADD CONSTRAINT tra_galeria_bueiro_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro_l
  ADD CONSTRAINT tra_galeria_bueiro_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro_l
  ADD CONSTRAINT tra_galeria_bueiro_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro_p
  ADD CONSTRAINT tra_galeria_bueiro_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro_p
  ADD CONSTRAINT tra_galeria_bueiro_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_galeria_bueiro_p
  ADD CONSTRAINT tra_galeria_bueiro_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_girador_ferroviario_p
  ADD CONSTRAINT tra_girador_ferroviario_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_girador_ferroviario_p
  ADD CONSTRAINT tra_girador_ferroviario_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_girador_ferroviario_p
  ADD CONSTRAINT tra_girador_ferroviario_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_girador_ferroviario_p
  ADD CONSTRAINT tra_girador_ferroviario_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.tra_hidrovia
  ADD CONSTRAINT tra_hidrovia_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico
  ADD CONSTRAINT tra_local_critico_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico
  ADD CONSTRAINT tra_local_critico_tipolocalcrit_fk FOREIGN KEY (tipolocalcrit)
   REFERENCES dominios.tipolocalcrit (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico_a
  ADD CONSTRAINT tra_local_critico_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico_a
  ADD CONSTRAINT tra_local_critico_a_tipolocalcrit_fk FOREIGN KEY (tipolocalcrit)
   REFERENCES dominios.tipolocalcrit (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico_l
  ADD CONSTRAINT tra_local_critico_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico_l
  ADD CONSTRAINT tra_local_critico_l_tipolocalcrit_fk FOREIGN KEY (tipolocalcrit)
   REFERENCES dominios.tipolocalcrit (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico_p
  ADD CONSTRAINT tra_local_critico_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_local_critico_p
  ADD CONSTRAINT tra_local_critico_p_tipolocalcrit_fk FOREIGN KEY (tipolocalcrit)
   REFERENCES dominios.tipolocalcrit (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao
  ADD CONSTRAINT tra_obstaculo_navegacao_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao
  ADD CONSTRAINT tra_obstaculo_navegacao_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao
  ADD CONSTRAINT tra_obstaculo_navegacao_tipoobst_fk FOREIGN KEY (tipoobst)
   REFERENCES dominios.tipoobst (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_a
  ADD CONSTRAINT tra_obstaculo_navegacao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_a
  ADD CONSTRAINT tra_obstaculo_navegacao_a_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_a
  ADD CONSTRAINT tra_obstaculo_navegacao_a_tipoobst_fk FOREIGN KEY (tipoobst)
   REFERENCES dominios.tipoobst (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_l
  ADD CONSTRAINT tra_obstaculo_navegacao_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_l
  ADD CONSTRAINT tra_obstaculo_navegacao_l_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_l
  ADD CONSTRAINT tra_obstaculo_navegacao_l_tipoobst_fk FOREIGN KEY (tipoobst)
   REFERENCES dominios.tipoobst (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_p
  ADD CONSTRAINT tra_obstaculo_navegacao_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_p
  ADD CONSTRAINT tra_obstaculo_navegacao_p_situacaoemagua_fk FOREIGN KEY (situacaoemagua)
   REFERENCES dominios.situacaoemagua (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_obstaculo_navegacao_p
  ADD CONSTRAINT tra_obstaculo_navegacao_p_tipoobst_fk FOREIGN KEY (tipoobst)
   REFERENCES dominios.tipoobst (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto
  ADD CONSTRAINT tra_passag_elevada_viaduto_tipopassagviad_fk FOREIGN KEY (tipopassagviad)
   REFERENCES dominios.tipopassagviad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_l
  ADD CONSTRAINT tra_passag_elevada_viaduto_l_tipopassagviad_fk FOREIGN KEY (tipopassagviad)
   REFERENCES dominios.tipopassagviad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passag_elevada_viaduto_p
  ADD CONSTRAINT tra_passag_elevada_viaduto_p_tipopassagviad_fk FOREIGN KEY (tipopassagviad)
   REFERENCES dominios.tipopassagviad (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_passagem_nivel_p
  ADD CONSTRAINT tra_passagem_nivel_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_homologacao_fk FOREIGN KEY (homologacao)
   REFERENCES dominios.homologacao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_tipopista_fk FOREIGN KEY (tipopista)
   REFERENCES dominios.tipopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_usopista_fk FOREIGN KEY (usopista)
   REFERENCES dominios.usopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_homologacao_fk FOREIGN KEY (homologacao)
   REFERENCES dominios.homologacao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_tipopista_fk FOREIGN KEY (tipopista)
   REFERENCES dominios.tipopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_usopista_fk FOREIGN KEY (usopista)
   REFERENCES dominios.usopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_homologacao_fk FOREIGN KEY (homologacao)
   REFERENCES dominios.homologacao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_tipopista_fk FOREIGN KEY (tipopista)
   REFERENCES dominios.tipopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_usopista_fk FOREIGN KEY (usopista)
   REFERENCES dominios.usopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_homologacao_fk FOREIGN KEY (homologacao)
   REFERENCES dominios.homologacao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_tipopista_fk FOREIGN KEY (tipopista)
   REFERENCES dominios.tipopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_usopista_fk FOREIGN KEY (usopista)
   REFERENCES dominios.usopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte
  ADD CONSTRAINT tra_ponte_tipoponte_fk FOREIGN KEY (tipoponte)
   REFERENCES dominios.tipoponte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_l
  ADD CONSTRAINT tra_ponte_l_tipoponte_fk FOREIGN KEY (tipoponte)
   REFERENCES dominios.tipoponte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponte_p
  ADD CONSTRAINT tra_ponte_p_tipoponte_fk FOREIGN KEY (tipoponte)
   REFERENCES dominios.tipoponte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_duto_p
  ADD CONSTRAINT tra_ponto_duto_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_duto_p
  ADD CONSTRAINT tra_ponto_duto_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_dut (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_ferroviario_p
  ADD CONSTRAINT tra_ponto_ferroviario_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_ferroviario_p
  ADD CONSTRAINT tra_ponto_ferroviario_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_fer (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_hidroviario_p
  ADD CONSTRAINT tra_ponto_hidroviario_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_hidroviario_p
  ADD CONSTRAINT tra_ponto_hidroviario_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_hdr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_rodoviario_ferrov
  ADD CONSTRAINT tra_ponto_rodoviario_ferrov_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_rodoviario_ferrov
  ADD CONSTRAINT tra_ponto_rodoviario_ferrov_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_rodoviario_p
  ADD CONSTRAINT tra_ponto_rodoviario_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_ponto_rodoviario_p
  ADD CONSTRAINT tra_ponto_rodoviario_p_relacionado_fk FOREIGN KEY (relacionado)
   REFERENCES dominios.relacionado_rod (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel
  ADD CONSTRAINT tra_posto_combustivel_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel
  ADD CONSTRAINT tra_posto_combustivel_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel
  ADD CONSTRAINT tra_posto_combustivel_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel
  ADD CONSTRAINT tra_posto_combustivel_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel
  ADD CONSTRAINT tra_posto_combustivel_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_a
  ADD CONSTRAINT tra_posto_combustivel_a_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_a
  ADD CONSTRAINT tra_posto_combustivel_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_a
  ADD CONSTRAINT tra_posto_combustivel_a_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_a
  ADD CONSTRAINT tra_posto_combustivel_a_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_a
  ADD CONSTRAINT tra_posto_combustivel_a_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_p
  ADD CONSTRAINT tra_posto_combustivel_p_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_p
  ADD CONSTRAINT tra_posto_combustivel_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_p
  ADD CONSTRAINT tra_posto_combustivel_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_p
  ADD CONSTRAINT tra_posto_combustivel_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_p
  ADD CONSTRAINT tra_posto_combustivel_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_sinalizacao_p
  ADD CONSTRAINT tra_sinalizacao_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_sinalizacao_p
  ADD CONSTRAINT tra_sinalizacao_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_sinalizacao_p
  ADD CONSTRAINT tra_sinalizacao_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_sinalizacao_p
  ADD CONSTRAINT tra_sinalizacao_p_tiposinal_fk FOREIGN KEY (tiposinal)
   REFERENCES dominios.tiposinal (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia
  ADD CONSTRAINT tra_travessia_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia
  ADD CONSTRAINT tra_travessia_tipotravessia_fk FOREIGN KEY (tipotravessia)
   REFERENCES dominios.tipotravessia (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_l
  ADD CONSTRAINT tra_travessia_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_l
  ADD CONSTRAINT tra_travessia_l_tipotravessia_fk FOREIGN KEY (tipotravessia)
   REFERENCES dominios.tipotravessia (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_p
  ADD CONSTRAINT tra_travessia_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_p
  ADD CONSTRAINT tra_travessia_p_tipotravessia_fk FOREIGN KEY (tipotravessia)
   REFERENCES dominios.tipotravessia (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre
  ADD CONSTRAINT tra_travessia_pedestre_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre
  ADD CONSTRAINT tra_travessia_pedestre_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre
  ADD CONSTRAINT tra_travessia_pedestre_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre
  ADD CONSTRAINT tra_travessia_pedestre_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre
  ADD CONSTRAINT tra_travessia_pedestre_tipotravessiaped_fk FOREIGN KEY (tipotravessiaped)
   REFERENCES dominios.tipotravessiaped (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_l
  ADD CONSTRAINT tra_travessia_pedestre_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_l
  ADD CONSTRAINT tra_travessia_pedestre_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_l
  ADD CONSTRAINT tra_travessia_pedestre_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_l
  ADD CONSTRAINT tra_travessia_pedestre_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_l
  ADD CONSTRAINT tra_travessia_pedestre_l_tipotravessiaped_fk FOREIGN KEY (tipotravessiaped)
   REFERENCES dominios.tipotravessiaped (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_p
  ADD CONSTRAINT tra_travessia_pedestre_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_p
  ADD CONSTRAINT tra_travessia_pedestre_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_p
  ADD CONSTRAINT tra_travessia_pedestre_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_p
  ADD CONSTRAINT tra_travessia_pedestre_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_travessia_pedestre_p
  ADD CONSTRAINT tra_travessia_pedestre_p_tipotravessiaped_fk FOREIGN KEY (tipotravessiaped)
   REFERENCES dominios.tipotravessiaped (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_mattransp_fk FOREIGN KEY (mattransp)
   REFERENCES dominios.mattransp (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_posicaorelativa_fk FOREIGN KEY (posicaorelativa)
   REFERENCES dominios.posicaorelativa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_setor_fk FOREIGN KEY (setor)
   REFERENCES dominios.setor (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_situacaoespacial_fk FOREIGN KEY (situacaoespacial)
   REFERENCES dominios.situacaoespacial (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_tipotrechoduto_fk FOREIGN KEY (tipotrechoduto)
   REFERENCES dominios.tipotrechoduto (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_bitola_fk FOREIGN KEY (bitola)
   REFERENCES dominios.bitola (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_eletrificada_fk FOREIGN KEY (eletrificada)
   REFERENCES dominios.eletrificada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_emarruamento_fk FOREIGN KEY (emarruamento)
   REFERENCES dominios.emarruamento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_jurisdicao_fk FOREIGN KEY (jurisdicao)
   REFERENCES dominios.jurisdicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_nrlinhas_fk FOREIGN KEY (nrlinhas)
   REFERENCES dominios.nrlinhas (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_posicaorelativa_fk FOREIGN KEY (posicaorelativa)
   REFERENCES dominios.posicaorelativa (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_tipotrechoferrov_fk FOREIGN KEY (tipotrechoferrov)
   REFERENCES dominios.tipotrechoferrov (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_hidroviario_l
  ADD CONSTRAINT tra_trecho_hidroviario_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_hidroviario_l
  ADD CONSTRAINT tra_trecho_hidroviario_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_hidroviario_l
  ADD CONSTRAINT tra_trecho_hidroviario_l_regime_fk FOREIGN KEY (regime)
   REFERENCES dominios.regime (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_hidroviario_l
  ADD CONSTRAINT tra_trecho_hidroviario_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_administracao_fk FOREIGN KEY (administracao)
   REFERENCES dominios.administracao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_canteirodivisorio_fk FOREIGN KEY (canteirodivisorio)
   REFERENCES dominios.canteirodivisorio (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_jurisdicao_fk FOREIGN KEY (jurisdicao)
   REFERENCES dominios.jurisdicao (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_revestimento_fk FOREIGN KEY (revestimento)
   REFERENCES dominios.revestimento (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_tipotrechorod_fk FOREIGN KEY (tipotrechorod)
   REFERENCES dominios.tipotrechorod (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_trafego_fk FOREIGN KEY (trafego)
   REFERENCES dominios.trafego (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trilha_picada_l
  ADD CONSTRAINT tra_trilha_picada_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel
  ADD CONSTRAINT tra_tunel_tipotunel_fk FOREIGN KEY (tipotunel)
   REFERENCES dominios.tipotunel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_l
  ADD CONSTRAINT tra_tunel_l_tipotunel_fk FOREIGN KEY (tipotunel)
   REFERENCES dominios.tipotunel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_matconstr_fk FOREIGN KEY (matconstr)
   REFERENCES dominios.matconstr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_modaluso_fk FOREIGN KEY (modaluso)
   REFERENCES dominios.modaluso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_operacional_fk FOREIGN KEY (operacional)
   REFERENCES dominios.operacional (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_posicaopista_fk FOREIGN KEY (posicaopista)
   REFERENCES dominios.posicaopista (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_situacaofisica_fk FOREIGN KEY (situacaofisica)
   REFERENCES dominios.situacaofisica (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_tunel_p
  ADD CONSTRAINT tra_tunel_p_tipotunel_fk FOREIGN KEY (tipotunel)
   REFERENCES dominios.tipotunel (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_brejo_pantano_a
  ADD CONSTRAINT veg_brejo_pantano_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_brejo_pantano_a
  ADD CONSTRAINT veg_brejo_pantano_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_brejo_pantano_a
  ADD CONSTRAINT veg_brejo_pantano_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_brejo_pantano_a
  ADD CONSTRAINT veg_brejo_pantano_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_brejo_pantano_a
  ADD CONSTRAINT veg_brejo_pantano_a_tipobrejopantano_fk FOREIGN KEY (tipobrejopantano)
   REFERENCES dominios.tipobrejopantano (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_caatinga_a
  ADD CONSTRAINT veg_caatinga_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_caatinga_a
  ADD CONSTRAINT veg_caatinga_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_caatinga_a
  ADD CONSTRAINT veg_caatinga_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_caatinga_a
  ADD CONSTRAINT veg_caatinga_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campinarana_a
  ADD CONSTRAINT veg_campinarana_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campinarana_a
  ADD CONSTRAINT veg_campinarana_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campinarana_a
  ADD CONSTRAINT veg_campinarana_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campinarana_a
  ADD CONSTRAINT veg_campinarana_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campo_a
  ADD CONSTRAINT veg_campo_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campo_a
  ADD CONSTRAINT veg_campo_a_ocorrenciaem_fk FOREIGN KEY (ocorrenciaem)
   REFERENCES dominios.ocorrenciaem (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_campo_a
  ADD CONSTRAINT veg_campo_a_tipocampo_fk FOREIGN KEY (tipocampo)
   REFERENCES dominios.tipocampo (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_cerrado_cerradao_a
  ADD CONSTRAINT veg_cerrado_cerradao_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_cerrado_cerradao_a
  ADD CONSTRAINT veg_cerrado_cerradao_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_cerrado_cerradao_a
  ADD CONSTRAINT veg_cerrado_cerradao_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_cerrado_cerradao_a
  ADD CONSTRAINT veg_cerrado_cerradao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_cerrado_cerradao_a
  ADD CONSTRAINT veg_cerrado_cerradao_a_tipocerr_fk FOREIGN KEY (tipocerr)
   REFERENCES dominios.tipocerr (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_estepe_a
  ADD CONSTRAINT veg_estepe_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_estepe_a
  ADD CONSTRAINT veg_estepe_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_estepe_a
  ADD CONSTRAINT veg_estepe_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_floresta_a
  ADD CONSTRAINT veg_floresta_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_floresta_a
  ADD CONSTRAINT veg_floresta_a_caracteristicafloresta_fk FOREIGN KEY (caracteristicafloresta)
   REFERENCES dominios.caracteristicafloresta (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_floresta_a
  ADD CONSTRAINT veg_floresta_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_floresta_a
  ADD CONSTRAINT veg_floresta_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_floresta_a
  ADD CONSTRAINT veg_floresta_a_especiepredominante_fk FOREIGN KEY (especiepredominante)
   REFERENCES dominios.especiepredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_floresta_a
  ADD CONSTRAINT veg_floresta_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_macega_chavascal_a
  ADD CONSTRAINT veg_macega_chavascal_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_macega_chavascal_a
  ADD CONSTRAINT veg_macega_chavascal_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_macega_chavascal_a
  ADD CONSTRAINT veg_macega_chavascal_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_macega_chavascal_a
  ADD CONSTRAINT veg_macega_chavascal_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_macega_chavascal_a
  ADD CONSTRAINT veg_macega_chavascal_a_tipomacchav_fk FOREIGN KEY (tipomacchav)
   REFERENCES dominios.tipomacchav (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_mangue_a
  ADD CONSTRAINT veg_mangue_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_mangue_a
  ADD CONSTRAINT veg_mangue_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_mangue_a
  ADD CONSTRAINT veg_mangue_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_mangue_a
  ADD CONSTRAINT veg_mangue_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_area_contato_a
  ADD CONSTRAINT veg_veg_area_contato_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_area_contato_a
  ADD CONSTRAINT veg_veg_area_contato_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_area_contato_a
  ADD CONSTRAINT veg_veg_area_contato_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_area_contato_a
  ADD CONSTRAINT veg_veg_area_contato_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_cultivopredominante_fk FOREIGN KEY (cultivopredominante)
   REFERENCES dominios.cultivopredominante (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_finalidade_fk FOREIGN KEY (finalidade)
   REFERENCES dominios.finalidade_veg (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_terreno_fk FOREIGN KEY (terreno)
   REFERENCES dominios.terreno (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_cultivada_a
  ADD CONSTRAINT veg_veg_cultivada_a_tipolavoura_fk FOREIGN KEY (tipolavoura)
   REFERENCES dominios.tipolavoura (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_restinga_a
  ADD CONSTRAINT veg_veg_restinga_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_restinga_a
  ADD CONSTRAINT veg_veg_restinga_a_classificacaoporte_fk FOREIGN KEY (classificacaoporte)
   REFERENCES dominios.classificacaoporte (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_restinga_a
  ADD CONSTRAINT veg_veg_restinga_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_veg_restinga_a
  ADD CONSTRAINT veg_veg_restinga_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_vegetacao_a
  ADD CONSTRAINT veg_vegetacao_a_antropizada_fk FOREIGN KEY (antropizada)
   REFERENCES dominios.antropizada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_vegetacao_a
  ADD CONSTRAINT veg_vegetacao_a_denso_fk FOREIGN KEY (denso)
   REFERENCES dominios.denso (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_vegetacao_a
  ADD CONSTRAINT veg_vegetacao_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica
  ADD CONSTRAINT aux_descontinuidade_geometrica_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica
  ADD CONSTRAINT aux_descontinuidade_geometrica_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica_p
  ADD CONSTRAINT aux_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica_p
  ADD CONSTRAINT aux_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_descontinuidade_geometrica_p
  ADD CONSTRAINT hid_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_descontinuidade_geometrica_p
  ADD CONSTRAINT hid_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica_l
  ADD CONSTRAINT aux_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica_l
  ADD CONSTRAINT aux_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_descontinuidade_geometrica_l
  ADD CONSTRAINT hid_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_descontinuidade_geometrica_l
  ADD CONSTRAINT hid_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_descontinuidade_geometrica_p
  ADD CONSTRAINT rel_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_descontinuidade_geometrica_p
  ADD CONSTRAINT rel_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_descontinuidade_geometrica_l
  ADD CONSTRAINT rel_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_descontinuidade_geometrica_l
  ADD CONSTRAINT rel_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica_a
  ADD CONSTRAINT aux_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.aux_descontinuidade_geometrica_a
  ADD CONSTRAINT aux_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_descontinuidade_geometrica_a
  ADD CONSTRAINT rel_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.rel_descontinuidade_geometrica_a
  ADD CONSTRAINT rel_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_descontinuidade_geometrica_p
  ADD CONSTRAINT veg_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_descontinuidade_geometrica_p
  ADD CONSTRAINT veg_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_descontinuidade_geometrica_l
  ADD CONSTRAINT veg_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.veg_descontinuidade_geometrica_l
  ADD CONSTRAINT veg_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_descontinuidade_geometrica_p
  ADD CONSTRAINT tra_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_descontinuidade_geometrica_p
  ADD CONSTRAINT tra_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_descontinuidade_geometrica_l
  ADD CONSTRAINT tra_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_descontinuidade_geometrica_l
  ADD CONSTRAINT tra_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_descontinuidade_geometrica_a
  ADD CONSTRAINT tra_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_descontinuidade_geometrica_a
  ADD CONSTRAINT tra_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_descontinuidade_geometrica_a
  ADD CONSTRAINT enc_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_descontinuidade_geometrica_a
  ADD CONSTRAINT enc_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_descontinuidade_geometrica_p
  ADD CONSTRAINT enc_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_descontinuidade_geometrica_p
  ADD CONSTRAINT enc_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_descontinuidade_geometrica_p
  ADD CONSTRAINT asb_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_descontinuidade_geometrica_p
  ADD CONSTRAINT asb_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_descontinuidade_geometrica_l
  ADD CONSTRAINT asb_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_descontinuidade_geometrica_l
  ADD CONSTRAINT asb_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_descontinuidade_geometrica_a
  ADD CONSTRAINT asb_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_descontinuidade_geometrica_a
  ADD CONSTRAINT asb_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_descontinuidade_geometrica_a
  ADD CONSTRAINT edu_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_descontinuidade_geometrica_a
  ADD CONSTRAINT edu_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_descontinuidade_geometrica_l
  ADD CONSTRAINT edu_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_descontinuidade_geometrica_l
  ADD CONSTRAINT edu_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_descontinuidade_geometrica_p
  ADD CONSTRAINT edu_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_descontinuidade_geometrica_p
  ADD CONSTRAINT edu_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_descontinuidade_geometrica_p
  ADD CONSTRAINT eco_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_descontinuidade_geometrica_p
  ADD CONSTRAINT eco_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_descontinuidade_geometrica_l
  ADD CONSTRAINT eco_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_descontinuidade_geometrica_l
  ADD CONSTRAINT eco_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_descontinuidade_geometrica_a
  ADD CONSTRAINT eco_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_descontinuidade_geometrica_a
  ADD CONSTRAINT eco_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_descontinuidade_geometrica_a
  ADD CONSTRAINT loc_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_descontinuidade_geometrica_a
  ADD CONSTRAINT loc_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_descontinuidade_geometrica_l
  ADD CONSTRAINT loc_descontinuidade_geometrica_l_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_descontinuidade_geometrica_l
  ADD CONSTRAINT loc_descontinuidade_geometrica_l_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_descontinuidade_geometrica_p
  ADD CONSTRAINT loc_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_descontinuidade_geometrica_p
  ADD CONSTRAINT loc_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_descontinuidade_geometrica_p
  ADD CONSTRAINT pto_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_descontinuidade_geometrica_p
  ADD CONSTRAINT pto_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_descontinuidade_geometrica_a
  ADD CONSTRAINT pto_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_descontinuidade_geometrica_a
  ADD CONSTRAINT pto_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_descontinuidade_geometrica_p
  ADD CONSTRAINT lim_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_descontinuidade_geometrica_p
  ADD CONSTRAINT lim_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_descontinuidade_geometrica_a
  ADD CONSTRAINT lim_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.lim_descontinuidade_geometrica_a
  ADD CONSTRAINT lim_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_descontinuidade_geometrica_p
  ADD CONSTRAINT adm_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_descontinuidade_geometrica_p
  ADD CONSTRAINT adm_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_descontinuidade_geometrica_a
  ADD CONSTRAINT adm_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_descontinuidade_geometrica_a
  ADD CONSTRAINT adm_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_descontinuidade_geometrica_a
  ADD CONSTRAINT sau_descontinuidade_geometrica_a_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_descontinuidade_geometrica_a
  ADD CONSTRAINT sau_descontinuidade_geometrica_a_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_descontinuidade_geometrica_p
  ADD CONSTRAINT sau_descontinuidade_geometrica_p_geometriaaproximada_fk FOREIGN KEY (geometriaaproximada)
   REFERENCES dominios.geometriaaproximada (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_descontinuidade_geometrica_p
  ADD CONSTRAINT sau_descontinuidade_geometrica_p_motivodescontinuidade_fk FOREIGN KEY (motivodescontinuidade)
   REFERENCES dominios.motivodescontinuidade (code) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE ONLY cb.adm_area_pub_civil_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_area_pub_militar_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_edif_pub_civil_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_edif_pub_civil_a ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_civil_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_civil_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_edif_pub_civil_a ALTER COLUMN tipoedifcivil SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_civil_a ALTER COLUMN tipousoedif SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_civil_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_edif_pub_civil_p ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_civil_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_civil_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_edif_pub_civil_p ALTER COLUMN tipoedifcivil SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_civil_p ALTER COLUMN tipousoedif SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_militar_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_edif_pub_militar_a ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_militar_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_militar_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_edif_pub_militar_a ALTER COLUMN tipoedifmil SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_militar_a ALTER COLUMN tipousoedif SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_militar_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_edif_pub_militar_p ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_militar_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_edif_pub_militar_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_edif_pub_militar_p ALTER COLUMN tipoedifmil SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_edif_pub_militar_p ALTER COLUMN tipousoedif SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_instituicao_publica ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.eco_org_comerc_serv ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY complexos.eco_org_comerc_serv ALTER COLUMN tipodivisaocnae SET DEFAULT 55#
ALTER TABLE ONLY complexos.eco_org_ext_mineral ALTER COLUMN tiposecaocnae SET DEFAULT 1#
ALTER TABLE ONLY complexos.adm_org_pub_civil ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_org_pub_civil ALTER COLUMN poderpublico SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_org_pub_civil ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_org_pub_militar ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_org_pub_militar ALTER COLUMN classificsigiloso SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_org_pub_militar ALTER COLUMN instituicao SET DEFAULT 0#
ALTER TABLE ONLY complexos.adm_org_pub_militar ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_fiscal ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_posto_fiscal ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_fiscal ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_fiscal ALTER COLUMN tipopostofisc SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_fiscal_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_posto_fiscal_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_posto_fiscal_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_posto_fiscal_a ALTER COLUMN tipopostofisc SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_fiscal_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_posto_fiscal_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_posto_fiscal_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_posto_fiscal_p ALTER COLUMN tipopostofisc SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_pol_rod ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_posto_pol_rod ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_pol_rod ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_pol_rod ALTER COLUMN tipopostopol SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_pol_rod_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_posto_pol_rod_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_posto_pol_rod_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_posto_pol_rod_a ALTER COLUMN tipopostopol SET DEFAULT 0#
ALTER TABLE ONLY cb.adm_posto_pol_rod_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.adm_posto_pol_rod_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_posto_pol_rod_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.adm_posto_pol_rod_p ALTER COLUMN tipopostopol SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_area_abast_agua_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_area_saneamento_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_cemiterio ALTER COLUMN denominacaoassociada SET DEFAULT 99#
ALTER TABLE ONLY cb.asb_cemiterio ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_cemiterio ALTER COLUMN tipocemiterio SET DEFAULT 4#
ALTER TABLE ONLY cb.asb_cemiterio_a ALTER COLUMN denominacaoassociada SET DEFAULT 99#
ALTER TABLE ONLY cb.asb_cemiterio_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_cemiterio_a ALTER COLUMN tipocemiterio SET DEFAULT 4#
ALTER TABLE ONLY cb.asb_cemiterio_p ALTER COLUMN denominacaoassociada SET DEFAULT 99#
ALTER TABLE ONLY cb.asb_cemiterio_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_cemiterio_p ALTER COLUMN tipocemiterio SET DEFAULT 4#
ALTER TABLE ONLY complexos.asb_complexo_abast_agua ALTER COLUMN tipoclassecnae SET DEFAULT 4#
ALTER TABLE ONLY complexos.asb_complexo_saneamento ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.asb_complexo_saneamento ALTER COLUMN tipoclassecnae SET DEFAULT 34#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN construcao SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN situacaoagua SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_dep_abast_agua ALTER COLUMN tipodepabast SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN construcao SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN finalidade SET DEFAULT 4#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN situacaoagua SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_dep_abast_agua_a ALTER COLUMN tipodepabast SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN construcao SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN finalidade SET DEFAULT 4#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN situacaoagua SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_dep_abast_agua_p ALTER COLUMN tipodepabast SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN construcao SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN residuo SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN tipodepsaneam SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento ALTER COLUMN tiporesiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN construcao SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN residuo SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN tipodepsaneam SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_a ALTER COLUMN tiporesiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN construcao SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN residuo SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN tipodepsaneam SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_dep_saneamento_p ALTER COLUMN tiporesiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_abast_agua_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_edif_abast_agua_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_abast_agua_a ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_abast_agua_a ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_abast_agua_a ALTER COLUMN tipoedifabast SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_abast_agua_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_edif_abast_agua_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_abast_agua_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_edif_abast_agua_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_edif_abast_agua_p ALTER COLUMN tipoedifabast SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_saneamento_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_edif_saneamento_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_saneamento_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_edif_saneamento_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_edif_saneamento_a ALTER COLUMN tipoedifsaneam SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_saneamento_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.asb_edif_saneamento_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.asb_edif_saneamento_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_edif_saneamento_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.asb_edif_saneamento_p ALTER COLUMN tipoedifsaneam SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_area_agrop_ext_veg_pesca_a ALTER COLUMN destinadoa SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_area_agrop_ext_veg_pesca_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_area_comerc_serv_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_area_ext_mineral_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_area_industrial_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN tipoconteudo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN tipodepgeral SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN tipoexposicao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN tipoprodutoresiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN tratamento SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral ALTER COLUMN unidadevolume SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN tipoconteudo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN tipodepgeral SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN tipoexposicao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN tipoprodutoresiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN tratamento SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_a ALTER COLUMN unidadevolume SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN tipoconteudo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN tipodepgeral SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN tipoexposicao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN tipoprodutoresiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN tratamento SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_deposito_geral_p ALTER COLUMN unidadevolume SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_a ALTER COLUMN tipoedifagropec SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_agrop_ext_veg_pesca_p ALTER COLUMN tipoedifagropec SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_a ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_a ALTER COLUMN tipoedifcomercserv SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_p ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_comerc_serv_p ALTER COLUMN tipoedifcomercserv SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_a ALTER COLUMN tipodivisaocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_ext_mineral_p ALTER COLUMN tipodivisaocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_industrial_a ALTER COLUMN chamine SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_industrial_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_industrial_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_industrial_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_industrial_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_industrial_a ALTER COLUMN tipodivisaocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_industrial_p ALTER COLUMN chamine SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_industrial_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_edif_industrial_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_edif_industrial_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_edif_industrial_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_edif_industrial_p ALTER COLUMN tipodivisaocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_equip_agropec ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_equip_agropec ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec ALTER COLUMN tipoequipagropec SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_equip_agropec_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_equip_agropec_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_equip_agropec_a ALTER COLUMN tipoequipagropec SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_equip_agropec_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_equip_agropec_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_equip_agropec_l ALTER COLUMN tipoequipagropec SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_equip_agropec_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_equip_agropec_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_equip_agropec_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_equip_agropec_p ALTER COLUMN tipoequipagropec SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN atividade SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN formaextracao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN procextracao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN tipoextmin SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN tipopocomina SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN tipoprodutoresiduo SET DEFAULT 33#
ALTER TABLE ONLY cb.eco_ext_mineral ALTER COLUMN tiposecaocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN atividade SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN formaextracao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN procextracao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN tipoextmin SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN tipopocomina SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN tipoprodutoresiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_a ALTER COLUMN tiposecaocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN atividade SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN formaextracao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN procextracao SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN tipoextmin SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN tipopocomina SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN tipoprodutoresiduo SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_ext_mineral_p ALTER COLUMN tiposecaocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.eco_frigorifico_matadouro ALTER COLUMN frigorifico SET DEFAULT 0#
ALTER TABLE ONLY complexos.eco_frigorifico_matadouro ALTER COLUMN tiposecaocnae SET DEFAULT 2#
ALTER TABLE ONLY complexos.eco_madeireira ALTER COLUMN tiposecaocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.eco_org_agrop_ext_veg_pesca ALTER COLUMN tipodivisaocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.eco_org_industrial ALTER COLUMN tiposecaocnae SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_plataforma ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_plataforma ALTER COLUMN tipoplataforma SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_plataforma_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_plataforma_a ALTER COLUMN tipoplataforma SET DEFAULT 0#
ALTER TABLE ONLY cb.eco_plataforma_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.eco_plataforma_p ALTER COLUMN tipoplataforma SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_area_ensino_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_area_lazer_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_area_religiosa_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_area_ruinas_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_arquibancada ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_arquibancada ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_arquibancada ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_arquibancada_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_arquibancada_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_arquibancada_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_arquibancada_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_arquibancada_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_arquibancada_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_campo_quadra ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_campo_quadra ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_campo_quadra ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_campo_quadra ALTER COLUMN tipocampoquadra SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_campo_quadra_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_campo_quadra_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_campo_quadra_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_campo_quadra_a ALTER COLUMN tipocampoquadra SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_campo_quadra_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_campo_quadra_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_campo_quadra_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_campo_quadra_p ALTER COLUMN tipocampoquadra SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_complexo_lazer ALTER COLUMN administracao SET DEFAULT 15#
ALTER TABLE ONLY complexos.edu_complexo_lazer ALTER COLUMN tipocomplexolazer SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_complexo_lazer ALTER COLUMN tipodivisaocnae SET DEFAULT 92#
ALTER TABLE ONLY cb.edu_coreto_tribuna ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_coreto_tribuna ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_coreto_tribuna ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_coreto_tribuna_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_coreto_tribuna_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_coreto_tribuna_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_coreto_tribuna_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_coreto_tribuna_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_coreto_tribuna_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_const_lazer_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_const_lazer_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_lazer_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_const_lazer_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_const_lazer_a ALTER COLUMN tipoediflazer SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_lazer_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_const_lazer_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_lazer_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_const_lazer_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_const_lazer_p ALTER COLUMN tipoediflazer SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_turistica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_const_turistica_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_turistica_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_const_turistica_a ALTER COLUMN ovgd SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_turistica_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_const_turistica_a ALTER COLUMN tipoedifturist SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_turistica_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_const_turistica_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_turistica_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_const_turistica_p ALTER COLUMN ovgd SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_const_turistica_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_const_turistica_p ALTER COLUMN tipoedifturist SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_ensino_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_ensino_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_ensino_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_ensino_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_ensino_a ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_ensino_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_ensino_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_ensino_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_ensino_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_ensino_p ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_religiosa_a ALTER COLUMN ensino SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_religiosa_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_religiosa_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_religiosa_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_religiosa_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_religiosa_a ALTER COLUMN tipoedifrelig SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_religiosa_p ALTER COLUMN ensino SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_religiosa_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_edif_religiosa_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_edif_religiosa_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_edif_religiosa_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_edif_religiosa_p ALTER COLUMN tipoedifrelig SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino ALTER COLUMN tipogrupocnae SET DEFAULT 1#
ALTER TABLE ONLY complexos.edu_org_ensino_militar ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_militar ALTER COLUMN classificsigiloso SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_militar ALTER COLUMN instituicao SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_militar ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_militar ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_pub ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_pub ALTER COLUMN poderpublico SET DEFAULT 1#
ALTER TABLE ONLY complexos.edu_org_ensino_pub ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_pub ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_religioso ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_religioso ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_ensino_religioso ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.edu_org_religiosa ALTER COLUMN tipoclassecnae SET DEFAULT 35#
ALTER TABLE ONLY cb.edu_piscina_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_piscina_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_piscina_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_pista_competicao_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_pista_competicao_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_pista_competicao_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.edu_pista_competicao_l ALTER COLUMN tipopista SET DEFAULT 0#
ALTER TABLE ONLY cb.edu_ruina ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_ruina_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.edu_ruina_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_antena_comunic_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_antena_comunic_p ALTER COLUMN posicaoreledific SET DEFAULT 14#
ALTER TABLE ONLY cb.enc_area_comunicacao_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_area_energia_eletrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY complexos.enc_complexo_comunicacao ALTER COLUMN tipoclassecnae SET DEFAULT 5#
ALTER TABLE ONLY complexos.enc_complexo_gerad_energ_eletr ALTER COLUMN tipoclassecnae SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_edif_comunic_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_edif_comunic_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_comunic_a ALTER COLUMN modalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_comunic_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_edif_comunic_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_edif_comunic_a ALTER COLUMN tipoedifcomunic SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_comunic_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_edif_comunic_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_comunic_p ALTER COLUMN modalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_comunic_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_edif_comunic_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_edif_comunic_p ALTER COLUMN tipoedifcomunic SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_energia_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_edif_energia_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_energia_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_edif_energia_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_edif_energia_a ALTER COLUMN tipoedifenergia SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_energia_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_edif_energia_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_edif_energia_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_edif_energia_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_edif_energia_p ALTER COLUMN tipoedifenergia SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_a ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_a ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_l ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_l ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_p ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_est_gerad_energia_eletr_p ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_grupo_transformadores ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_grupo_transformadores_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_grupo_transformadores_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_hidreletrica_a ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_hidreletrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_hidreletrica_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_hidreletrica_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_hidreletrica_a ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_hidreletrica_l ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_hidreletrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_hidreletrica_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_hidreletrica_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_hidreletrica_l ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_hidreletrica_p ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_hidreletrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_hidreletrica_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_hidreletrica_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_hidreletrica_p ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_ponto_trecho_energia_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_ponto_trecho_energia_p ALTER COLUMN tipoptoenergia SET DEFAULT 1#
ALTER TABLE ONLY complexos.enc_subestacao_ener_eletr ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY complexos.enc_subestacao_ener_eletr ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.enc_subestacao_ener_eletr ALTER COLUMN tipooperativo SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN combrenovavel SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN geracao SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN tipocombustivel SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_a ALTER COLUMN tipomaqtermica SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN combrenovavel SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN destenergelet SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN geracao SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN tipocombustivel SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN tipoestgerad SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_termeletrica_p ALTER COLUMN tipomaqtermica SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_torre_comunic_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_torre_comunic_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_torre_comunic_p ALTER COLUMN ovgd SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_torre_comunic_p ALTER COLUMN posicaoreledific SET DEFAULT 14#
ALTER TABLE ONLY cb.enc_torre_comunic_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_torre_energia_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_torre_energia_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_torre_energia_p ALTER COLUMN ovgd SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_torre_energia_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_torre_energia_p ALTER COLUMN tipotorre SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN emduto SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN posicaorelativa SET DEFAULT 3#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_trecho_comunic_l ALTER COLUMN tipotrechocomunic SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_trecho_energia_l ALTER COLUMN emduto SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_trecho_energia_l ALTER COLUMN especie SET DEFAULT 0#
ALTER TABLE ONLY cb.enc_trecho_energia_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.enc_trecho_energia_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_trecho_energia_l ALTER COLUMN posicaorelativa SET DEFAULT 3#
ALTER TABLE ONLY cb.enc_trecho_energia_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.enc_zona_linhas_energia_com_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_area_umida_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_area_umida_a ALTER COLUMN tipoareaumida SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_bacia_hidrografica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_banco_areia ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_banco_areia ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia ALTER COLUMN tipobanco SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_banco_areia_a ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia_a ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia_a ALTER COLUMN tipobanco SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_banco_areia_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_banco_areia_l ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia_l ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_banco_areia_l ALTER COLUMN tipobanco SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_barragem ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_barragem ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_barragem ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_barragem ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_barragem ALTER COLUMN usoprincipal SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_barragem_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_barragem_a ALTER COLUMN matconstr SET DEFAULT 23#
ALTER TABLE ONLY cb.hid_barragem_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_barragem_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_barragem_a ALTER COLUMN usoprincipal SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_barragem_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_barragem_l ALTER COLUMN matconstr SET DEFAULT 23#
ALTER TABLE ONLY cb.hid_barragem_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_barragem_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_barragem_l ALTER COLUMN usoprincipal SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_barragem_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_barragem_p ALTER COLUMN matconstr SET DEFAULT 23#
ALTER TABLE ONLY cb.hid_barragem_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_barragem_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_barragem_p ALTER COLUMN usoprincipal SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_comporta ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_comporta ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_comporta ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_comporta_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_comporta_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_comporta_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_comporta_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_comporta_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_comporta_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_confluencia_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_confluencia_p ALTER COLUMN relacionado SET DEFAULT 15#
ALTER TABLE ONLY cb.hid_corredeira ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_corredeira_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_corredeira_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_corredeira_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_fonte_dagua_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_fonte_dagua_p ALTER COLUMN qualidagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_fonte_dagua_p ALTER COLUMN regime SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_fonte_dagua_p ALTER COLUMN tipofontedagua SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_foz_maritima ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_foz_maritima_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_foz_maritima_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_foz_maritima_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ilha_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ilha_a ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.hid_ilha_a ALTER COLUMN tipoilha SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_ilha_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ilha_l ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.hid_ilha_l ALTER COLUMN tipoilha SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_ilha_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ilha_p ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.hid_ilha_p ALTER COLUMN tipoilha SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_limite_massa_dagua_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_limite_massa_dagua_l ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_limite_massa_dagua_l ALTER COLUMN tipolimmassa SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_massa_dagua_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_massa_dagua_a ALTER COLUMN regime SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_massa_dagua_a ALTER COLUMN salinidade SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_massa_dagua_a ALTER COLUMN tipomassadagua SET DEFAULT 7#
ALTER TABLE ONLY cb.hid_natureza_fundo ALTER COLUMN espessalgas SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_natureza_fundo ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_natureza_fundo ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_natureza_fundo_a ALTER COLUMN espessalgas SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_natureza_fundo_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_natureza_fundo_a ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_natureza_fundo_l ALTER COLUMN espessalgas SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_natureza_fundo_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_natureza_fundo_l ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_natureza_fundo_p ALTER COLUMN espessalgas SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_natureza_fundo_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_natureza_fundo_p ALTER COLUMN materialpredominante SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_ponto_drenagem_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ponto_drenagem_p ALTER COLUMN relacionado SET DEFAULT 13#
ALTER TABLE ONLY cb.hid_ponto_inicio_drenagem_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ponto_inicio_drenagem_p ALTER COLUMN nascente SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_ponto_inicio_drenagem_p ALTER COLUMN relacionado SET DEFAULT 14#
ALTER TABLE ONLY cb.hid_quebramar_molhe ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_quebramar_molhe ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe ALTER COLUMN situamare SET DEFAULT 7#
ALTER TABLE ONLY cb.hid_quebramar_molhe ALTER COLUMN tipoquebramolhe SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_quebramar_molhe_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_quebramar_molhe_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_quebramar_molhe_a ALTER COLUMN situamare SET DEFAULT 7#
ALTER TABLE ONLY cb.hid_quebramar_molhe_a ALTER COLUMN tipoquebramolhe SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_quebramar_molhe_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_quebramar_molhe_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_quebramar_molhe_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.hid_quebramar_molhe_l ALTER COLUMN situamare SET DEFAULT 7#
ALTER TABLE ONLY cb.hid_quebramar_molhe_l ALTER COLUMN tipoquebramolhe SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_queda_dagua ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_queda_dagua ALTER COLUMN tipoqueda SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_queda_dagua_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_queda_dagua_a ALTER COLUMN tipoqueda SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_queda_dagua_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_queda_dagua_l ALTER COLUMN tipoqueda SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_queda_dagua_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_queda_dagua_p ALTER COLUMN tipoqueda SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_recife ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_recife ALTER COLUMN situacaocosta SET DEFAULT 11#
ALTER TABLE ONLY cb.hid_recife ALTER COLUMN situamare SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife ALTER COLUMN tiporecife SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_recife_a ALTER COLUMN situacaocosta SET DEFAULT 11#
ALTER TABLE ONLY cb.hid_recife_a ALTER COLUMN situamare SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife_a ALTER COLUMN tiporecife SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_recife_l ALTER COLUMN situacaocosta SET DEFAULT 11#
ALTER TABLE ONLY cb.hid_recife_l ALTER COLUMN situamare SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife_l ALTER COLUMN tiporecife SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_recife_p ALTER COLUMN situacaocosta SET DEFAULT 11#
ALTER TABLE ONLY cb.hid_recife_p ALTER COLUMN situamare SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_recife_p ALTER COLUMN tiporecife SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_reservatorio_hidrico_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_reservatorio_hidrico_a ALTER COLUMN usoprincipal SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_rocha_em_agua ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_rocha_em_agua_a ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_rocha_em_agua_p ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_sumidouro_vertedouro_p ALTER COLUMN causa SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_sumidouro_vertedouro_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_sumidouro_vertedouro_p ALTER COLUMN tiposumvert SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_terreno_suj_inundacao_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN coincidecomdentrode SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN compartilhado SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN dentrodepoligono SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN eixoprincipal SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN navegabilidade SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_trecho_drenagem_l ALTER COLUMN regime SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_trecho_massa_dagua_a ALTER COLUMN regime SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_trecho_massa_dagua_a ALTER COLUMN salinidade SET DEFAULT 0#
ALTER TABLE ONLY cb.hid_trecho_massa_dagua_a ALTER COLUMN tipotrechomassa SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_area_de_litigio_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_desenv_controle_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_desenv_controle_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_especial ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_especial_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_especial_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_particular_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_politico_adm_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_uso_comunitario_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_uso_comunitario_a ALTER COLUMN tipoareausocomun SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_area_uso_comunitario_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_area_uso_comunitario_p ALTER COLUMN tipoareausocomun SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_bairro_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_delimitacao_fisica_l ALTER COLUMN eletrificada SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_delimitacao_fisica_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_delimitacao_fisica_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_delimitacao_fisica_l ALTER COLUMN tipodelimfis SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_distrito_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_limite_area_especial_l ALTER COLUMN coincidecomdentrode SET DEFAULT 96#
ALTER TABLE ONLY cb.lim_limite_area_especial_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_limite_area_especial_l ALTER COLUMN tipolimareaesp SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_limite_intra_munic_adm_l ALTER COLUMN coincidecomdentrode SET DEFAULT 96#
ALTER TABLE ONLY cb.lim_limite_intra_munic_adm_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_limite_intra_munic_adm_l ALTER COLUMN tipolimintramun SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_limite_operacional_l ALTER COLUMN coincidecomdentrode SET DEFAULT 96#
ALTER TABLE ONLY cb.lim_limite_operacional_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_limite_operacional_l ALTER COLUMN tipolimoper SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_limite_particular_l ALTER COLUMN coincidecomdentrode SET DEFAULT 96#
ALTER TABLE ONLY cb.lim_limite_particular_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_limite_politico_adm_l ALTER COLUMN coincidecomdentrode SET DEFAULT 96#
ALTER TABLE ONLY cb.lim_limite_politico_adm_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_limite_politico_adm_l ALTER COLUMN tipolimpol SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_linha_de_limite_l ALTER COLUMN coincidecomdentrode SET DEFAULT 6#
ALTER TABLE ONLY cb.lim_linha_de_limite_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_marco_de_limite_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_marco_de_limite_p ALTER COLUMN referencialaltim SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_marco_de_limite_p ALTER COLUMN sistemageodesico SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_marco_de_limite_p ALTER COLUMN tipomarcolim SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_municipio_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_outras_unid_protegidas_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_outras_unid_protegidas_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_outras_unid_protegidas_a ALTER COLUMN tipooutunidprot SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_outras_unid_protegidas_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_outras_unid_protegidas_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_outras_unid_protegidas_p ALTER COLUMN tipooutunidprot SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_outros_limites_oficiais_l ALTER COLUMN coincidecomdentrode SET DEFAULT 96#
ALTER TABLE ONLY cb.lim_outros_limites_oficiais_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_outros_limites_oficiais_l ALTER COLUMN tipooutlimofic SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_pais_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_regiao_administrativa_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_sub_distrito_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_terra_indigena ALTER COLUMN situacaojuridica SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_terra_indigena ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_terra_indigena_a ALTER COLUMN situacaojuridica SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_terra_indigena_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_terra_indigena_p ALTER COLUMN situacaojuridica SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_terra_indigena_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_terra_publica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_terra_publica_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_conserv_nao_snuc_a ALTER COLUMN administracao SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_unidade_conserv_nao_snuc_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_conserv_nao_snuc_p ALTER COLUMN administracao SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_unidade_conserv_nao_snuc_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_federacao_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_federacao_a ALTER COLUMN sigla SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_unidade_protecao_integral_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_unidade_protecao_integral_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_protecao_integral_a ALTER COLUMN tipounidprotinteg SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_unidade_protecao_integral_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_unidade_protecao_integral_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_protecao_integral_p ALTER COLUMN tipounidprotinteg SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_unidade_uso_sustentavel_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_unidade_uso_sustentavel_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_uso_sustentavel_a ALTER COLUMN tipounidusosust SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_unidade_uso_sustentavel_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.lim_unidade_uso_sustentavel_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.lim_unidade_uso_sustentavel_p ALTER COLUMN tipounidusosust SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_aglom_rural_de_ext_urbana_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_aglomerado_rural_isolado_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_aglomerado_rural_isolado_p ALTER COLUMN tipoaglomrurisol SET DEFAULT 6#
ALTER TABLE ONLY cb.loc_aglomerado_rural_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_area_urbana_isolada_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_area_urbana_isolada_a ALTER COLUMN tipoassociado SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_area_edificada_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_area_habitacional_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_capital_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_capital_p ALTER COLUMN tipocapital SET DEFAULT 3#
ALTER TABLE ONLY cb.loc_cidade_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edif_habitacional_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edif_habitacional_a ALTER COLUMN matconstr SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edif_habitacional_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_edif_habitacional_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.loc_edif_habitacional_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edif_habitacional_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_edif_habitacional_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_edif_habitacional_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.loc_edificacao ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edificacao ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_edificacao ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_edificacao ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_edificacao_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edificacao_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_edificacao_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_edificacao_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.loc_edificacao_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_edificacao_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_edificacao_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_edificacao_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.loc_hab_indigena ALTER COLUMN coletiva SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_hab_indigena ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_hab_indigena ALTER COLUMN isolada SET DEFAULT 0#
ALTER TABLE ONLY cb.loc_hab_indigena_a ALTER COLUMN coletiva SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_hab_indigena_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_hab_indigena_a ALTER COLUMN isolada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_hab_indigena_p ALTER COLUMN coletiva SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_hab_indigena_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_hab_indigena_p ALTER COLUMN isolada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_localidade_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_nome_local_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.loc_vila_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_area_est_med_fenom_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_a ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_a ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_edif_constr_est_med_fen_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY complexos.pto_est_med_fenomenos ALTER COLUMN tipoestmed SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_pto_controle_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_controle_p ALTER COLUMN materializado SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_controle_p ALTER COLUMN referencialaltim SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_controle_p ALTER COLUMN sistemageodesico SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_controle_p ALTER COLUMN tipoptocontrole SET DEFAULT 9#
ALTER TABLE ONLY cb.pto_pto_controle_p ALTER COLUMN tiporef SET DEFAULT 1#
ALTER TABLE ONLY cb.pto_pto_est_med_fenomenos_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_est_med_fenomenos_p ALTER COLUMN tipoptoestmed SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_pto_geod_topo_controle_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_geod_topo_controle_p ALTER COLUMN referencialaltim SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_geod_topo_controle_p ALTER COLUMN sistemageodesico SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_geod_topo_controle_p ALTER COLUMN tiporef SET DEFAULT 1#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN proximidade SET DEFAULT 14#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN rede SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN referencialaltim SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN referencialgrav SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN sistemageodesico SET DEFAULT 2#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN situacaomarco SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN tipoptorefgeodtopo SET DEFAULT 0#
ALTER TABLE ONLY cb.pto_pto_ref_geod_topo_p ALTER COLUMN tiporef SET DEFAULT 3#
ALTER TABLE ONLY cb.rel_alter_fisiog_antropica ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_alter_fisiog_antropica ALTER COLUMN tipoalterantrop SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_alter_fisiog_antropica_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_alter_fisiog_antropica_a ALTER COLUMN tipoalterantrop SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_alter_fisiog_antropica_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_alter_fisiog_antropica_l ALTER COLUMN tipoalterantrop SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_curva_nivel_l ALTER COLUMN depressao SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_curva_nivel_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_curva_nivel_l ALTER COLUMN indice SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_dolina_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_dolina_a ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_dolina_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_dolina_p ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_duna_a ALTER COLUMN fixa SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_duna_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_duna_a ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_duna_p ALTER COLUMN fixa SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_duna_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_duna_p ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural_a ALTER COLUMN tipoelemnat SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural_l ALTER COLUMN tipoelemnat SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_elemento_fisiog_natural_p ALTER COLUMN tipoelemnat SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_elemento_fisiografico ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_gruta_caverna_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_gruta_caverna_p ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_gruta_caverna_p ALTER COLUMN tipogrutacaverna SET DEFAULT 19#
ALTER TABLE ONLY cb.rel_pico_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_pico_p ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_ponto_cotado_altimetrico_p ALTER COLUMN cotacomprovada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_ponto_cotado_altimetrico_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_rocha_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_rocha_a ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_rocha_a ALTER COLUMN tiporocha SET DEFAULT 21#
ALTER TABLE ONLY cb.rel_rocha_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_rocha_p ALTER COLUMN tipoelemnat SET DEFAULT 99#
ALTER TABLE ONLY cb.rel_rocha_p ALTER COLUMN tiporocha SET DEFAULT 21#
ALTER TABLE ONLY cb.rel_terreno_exposto_a ALTER COLUMN causaexposicao SET DEFAULT 0#
ALTER TABLE ONLY cb.rel_terreno_exposto_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.rel_terreno_exposto_a ALTER COLUMN tipoterrexp SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_area_saude_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.sau_area_servico_social_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.sau_edif_saude_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.sau_edif_saude_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_saude_a ALTER COLUMN nivelatencao SET DEFAULT 5#
ALTER TABLE ONLY cb.sau_edif_saude_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_edif_saude_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.sau_edif_saude_a ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_saude_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.sau_edif_saude_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_saude_p ALTER COLUMN nivelatencao SET DEFAULT 5#
ALTER TABLE ONLY cb.sau_edif_saude_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_edif_saude_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.sau_edif_saude_p ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_servico_social_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.sau_edif_servico_social_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_servico_social_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_edif_servico_social_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.sau_edif_servico_social_a ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_servico_social_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.sau_edif_servico_social_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.sau_edif_servico_social_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_edif_servico_social_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.sau_edif_servico_social_p ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_militar ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_militar ALTER COLUMN classificsigiloso SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_militar ALTER COLUMN instituicao SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_militar ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_militar ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_pub ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_pub ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_saude_pub ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_servico_social ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_servico_social ALTER COLUMN tipogrupocnae SET DEFAULT 10#
ALTER TABLE ONLY complexos.sau_org_servico_social_pub ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_servico_social_pub ALTER COLUMN tipoclassecnae SET DEFAULT 0#
ALTER TABLE ONLY complexos.sau_org_servico_social_pub ALTER COLUMN tipogrupocnae SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_area_duto_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_area_estrut_transporte_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_arruamento_l ALTER COLUMN canteirodivisorio SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_arruamento_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_arruamento_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_arruamento_l ALTER COLUMN revestimento SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_arruamento_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_arruamento_l ALTER COLUMN trafego SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_atracadouro ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_atracadouro ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro ALTER COLUMN tipoatracad SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_atracadouro_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_atracadouro_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_atracadouro_a ALTER COLUMN tipoatracad SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_l ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_atracadouro_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_atracadouro_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_atracadouro_l ALTER COLUMN tipoatracad SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_atracadouro_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_atracadouro_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_atracadouro_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_atracadouro_p ALTER COLUMN tipoatracad SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_caminho_aereo_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_caminho_aereo_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_caminho_aereo_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_caminho_aereo_l ALTER COLUMN tipocaminhoaereo SET DEFAULT 12#
ALTER TABLE ONLY cb.tra_caminho_aereo_l ALTER COLUMN tipousocaminhoaer SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ciclovia_l ALTER COLUMN administracao SET DEFAULT 3#
ALTER TABLE ONLY cb.tra_ciclovia_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ciclovia_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_ciclovia_l ALTER COLUMN revestimento SET DEFAULT 3#
ALTER TABLE ONLY cb.tra_ciclovia_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_ciclovia_l ALTER COLUMN trafego SET DEFAULT 1#
ALTER TABLE ONLY complexos.tra_complexo_aeroportuario ALTER COLUMN classificacao SET DEFAULT 10#
ALTER TABLE ONLY complexos.tra_complexo_aeroportuario ALTER COLUMN tipocomplexoaero SET DEFAULT 24#
ALTER TABLE ONLY complexos.tra_complexo_portuario ALTER COLUMN tipocomplexoportuario SET DEFAULT 0#
ALTER TABLE ONLY complexos.tra_complexo_portuario ALTER COLUMN tipotransporte SET DEFAULT 98#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN mattransp SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN posicaorelativa SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN setor SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN situacaoespacial SET DEFAULT 12#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN tipocondutor SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_condutor_hidrico_l ALTER COLUMN tipotrechoduto SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_cremalheira ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_cremalheira ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_cremalheira ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_cremalheira_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_cremalheira_l ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_cremalheira_l ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_cremalheira_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_cremalheira_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_cremalheira_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_eclusa ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_eclusa_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_eclusa_a ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_eclusa_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_eclusa_l ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_eclusa_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_eclusa_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_eclusa_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_a ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_a ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_a ALTER COLUMN tipoedifaero SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_aeroportuaria_p ALTER COLUMN tipoedifaero SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_a ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_a ALTER COLUMN tipoedifport SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_p ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_edif_constr_portuaria_p ALTER COLUMN tipoedifport SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN funcaoedifmetroferrov SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN matconstr SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN multimodal SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN funcaoedifmetroferrov SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN multimodal SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_metro_ferroviaria_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_a ALTER COLUMN tipoedifrod SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_edif_rodoviaria_p ALTER COLUMN tipoedifrod SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_entroncamento_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_entroncamento_p ALTER COLUMN tipoentroncamento SET DEFAULT 1#
ALTER TABLE ONLY complexos.tra_estrut_apoio ALTER COLUMN tipoestrut SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_faixa_seguranca_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_fundeadouro ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_fundeadouro ALTER COLUMN destinacaofundeadouro SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_fundeadouro ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_fundeadouro_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_fundeadouro_a ALTER COLUMN destinacaofundeadouro SET DEFAULT 99#
ALTER TABLE ONLY cb.tra_fundeadouro_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_fundeadouro_l ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_fundeadouro_l ALTER COLUMN destinacaofundeadouro SET DEFAULT 99#
ALTER TABLE ONLY cb.tra_fundeadouro_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_fundeadouro_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_fundeadouro_p ALTER COLUMN destinacaofundeadouro SET DEFAULT 99#
ALTER TABLE ONLY cb.tra_fundeadouro_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_funicular ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_funicular ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_funicular ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_funicular_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_funicular_l ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_funicular_l ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_funicular_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_funicular_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_funicular_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_galeria_bueiro ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_galeria_bueiro ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_galeria_bueiro ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_galeria_bueiro_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_galeria_bueiro_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_galeria_bueiro_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_galeria_bueiro_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_galeria_bueiro_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_galeria_bueiro_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_girador_ferroviario_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_girador_ferroviario_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_girador_ferroviario_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_girador_ferroviario_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY complexos.tra_hidrovia ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_local_critico ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_local_critico ALTER COLUMN tipolocalcrit SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_local_critico_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_local_critico_a ALTER COLUMN tipolocalcrit SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_local_critico_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_local_critico_l ALTER COLUMN tipolocalcrit SET DEFAULT 7#
ALTER TABLE ONLY cb.tra_local_critico_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_local_critico_p ALTER COLUMN tipolocalcrit SET DEFAULT 7#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao ALTER COLUMN tipoobst SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_a ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_a ALTER COLUMN tipoobst SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_l ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_l ALTER COLUMN tipoobst SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_p ALTER COLUMN situacaoemagua SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_obstaculo_navegacao_p ALTER COLUMN tipoobst SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN posicaopista SET DEFAULT 13#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto ALTER COLUMN tipopassagviad SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN matconstr SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN posicaopista SET DEFAULT 13#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_l ALTER COLUMN tipopassagviad SET DEFAULT 6#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN matconstr SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN posicaopista SET DEFAULT 13#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_passag_elevada_viaduto_p ALTER COLUMN tipopassagviad SET DEFAULT 6#
ALTER TABLE ONLY cb.tra_passagem_nivel_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_patio ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_patio ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_patio ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_patio ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_patio ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_patio_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_patio_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_patio_a ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_patio_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_patio_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_patio_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_patio_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_patio_p ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_patio_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_patio_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN homologacao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN revestimento SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN tipopista SET DEFAULT 9#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso ALTER COLUMN usopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN homologacao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN revestimento SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN tipopista SET DEFAULT 9#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_a ALTER COLUMN usopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN homologacao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN revestimento SET DEFAULT 3#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN tipopista SET DEFAULT 9#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_l ALTER COLUMN usopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN homologacao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN revestimento SET DEFAULT 3#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN tipopista SET DEFAULT 9#
ALTER TABLE ONLY cb.tra_pista_ponto_pouso_p ALTER COLUMN usopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN posicaopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte ALTER COLUMN tipoponte SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN posicaopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_ponte_l ALTER COLUMN tipoponte SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN posicaopista SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_ponte_p ALTER COLUMN tipoponte SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_ponto_duto_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_ponto_duto_p ALTER COLUMN relacionado SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_ponto_ferroviario_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponto_ferroviario_p ALTER COLUMN relacionado SET DEFAULT 8#
ALTER TABLE ONLY cb.tra_ponto_hidroviario_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponto_hidroviario_p ALTER COLUMN relacionado SET DEFAULT 12#
ALTER TABLE ONLY cb.tra_ponto_rodoviario_ferrov ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponto_rodoviario_ferrov ALTER COLUMN relacionado SET DEFAULT 8#
ALTER TABLE ONLY cb.tra_ponto_rodoviario_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_ponto_rodoviario_p ALTER COLUMN relacionado SET DEFAULT 8#
ALTER TABLE ONLY cb.tra_posto_combustivel ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_posto_combustivel ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel_a ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_posto_combustivel_a ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel_a ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_posto_combustivel_a ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel_p ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_posto_combustivel_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_posto_combustivel_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_posto_combustivel_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_sinalizacao_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_sinalizacao_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_sinalizacao_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_sinalizacao_p ALTER COLUMN tiposinal SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_travessia ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_travessia ALTER COLUMN tipotravessia SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_travessia_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_travessia_l ALTER COLUMN tipotravessia SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_travessia_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_travessia_p ALTER COLUMN tipotravessia SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_travessia_pedestre ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_travessia_pedestre ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_travessia_pedestre ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_travessia_pedestre ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_travessia_pedestre ALTER COLUMN tipotravessiaped SET DEFAULT 8#
ALTER TABLE ONLY cb.tra_travessia_pedestre_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_travessia_pedestre_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_travessia_pedestre_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_travessia_pedestre_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_travessia_pedestre_l ALTER COLUMN tipotravessiaped SET DEFAULT 8#
ALTER TABLE ONLY cb.tra_travessia_pedestre_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_travessia_pedestre_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_travessia_pedestre_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_travessia_pedestre_p ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_travessia_pedestre_p ALTER COLUMN tipotravessiaped SET DEFAULT 8#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN matconstr SET DEFAULT 3#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN mattransp SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN posicaorelativa SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN setor SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN situacaoespacial SET DEFAULT 12#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_trecho_duto_l ALTER COLUMN tipotrechoduto SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN bitola SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN eletrificada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN emarruamento SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN jurisdicao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN nrlinhas SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN posicaorelativa SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_trecho_ferroviario_l ALTER COLUMN tipotrechoferrov SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_hidroviario_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_hidroviario_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_hidroviario_l ALTER COLUMN regime SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_hidroviario_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN administracao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN canteirodivisorio SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN jurisdicao SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN revestimento SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN tipotrechorod SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trecho_rodoviario_l ALTER COLUMN trafego SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_trilha_picada_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN modaluso SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN operacional SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN posicaopista SET DEFAULT 13#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN situacaofisica SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_tunel ALTER COLUMN tipotunel SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN posicaopista SET DEFAULT 13#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_tunel_l ALTER COLUMN tipotunel SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN matconstr SET DEFAULT 0#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN modaluso SET DEFAULT 4#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN operacional SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN posicaopista SET DEFAULT 13#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN situacaofisica SET DEFAULT 5#
ALTER TABLE ONLY cb.tra_tunel_p ALTER COLUMN tipotunel SET DEFAULT 1#
ALTER TABLE ONLY cb.veg_brejo_pantano_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_brejo_pantano_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_brejo_pantano_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_brejo_pantano_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_brejo_pantano_a ALTER COLUMN tipobrejopantano SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_caatinga_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_caatinga_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_caatinga_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_caatinga_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_campinarana_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_campinarana_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_campinarana_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_campinarana_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_campo_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_campo_a ALTER COLUMN ocorrenciaem SET DEFAULT 96#
ALTER TABLE ONLY cb.veg_campo_a ALTER COLUMN tipocampo SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_cerrado_cerradao_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_cerrado_cerradao_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_cerrado_cerradao_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_cerrado_cerradao_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_cerrado_cerradao_a ALTER COLUMN tipocerr SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_estepe_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_estepe_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_estepe_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_floresta_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_floresta_a ALTER COLUMN caracteristicafloresta SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_floresta_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_floresta_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_floresta_a ALTER COLUMN especiepredominante SET DEFAULT 96#
ALTER TABLE ONLY cb.veg_floresta_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_macega_chavascal_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_macega_chavascal_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_macega_chavascal_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_macega_chavascal_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_macega_chavascal_a ALTER COLUMN tipomacchav SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_mangue_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_mangue_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_mangue_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_mangue_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_veg_area_contato_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_area_contato_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_veg_area_contato_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_area_contato_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN cultivopredominante SET DEFAULT 96#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN finalidade SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN terreno SET DEFAULT 1#
ALTER TABLE ONLY cb.veg_veg_cultivada_a ALTER COLUMN tipolavoura SET DEFAULT 3#
ALTER TABLE ONLY cb.veg_veg_restinga_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_restinga_a ALTER COLUMN classificacaoporte SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_restinga_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_veg_restinga_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.veg_vegetacao_a ALTER COLUMN antropizada SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_vegetacao_a ALTER COLUMN denso SET DEFAULT 0#
ALTER TABLE ONLY cb.veg_vegetacao_a ALTER COLUMN geometriaaproximada SET DEFAULT 2#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.hid_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.rel_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.rel_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.rel_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.rel_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.aux_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.rel_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.rel_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.veg_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.veg_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.veg_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.veg_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.tra_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.enc_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.asb_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.edu_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.eco_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_descontinuidade_geometrica_l ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_descontinuidade_geometrica_l ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.loc_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.pto_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.pto_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.pto_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.pto_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.lim_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.adm_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_descontinuidade_geometrica_a ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_descontinuidade_geometrica_a ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_descontinuidade_geometrica_p ALTER COLUMN geometriaaproximada SET DEFAULT 1#
ALTER TABLE ONLY cb.sau_descontinuidade_geometrica_p ALTER COLUMN motivodescontinuidade SET DEFAULT 1#
ALTER TABLE cb.adm_edif_pub_civil_a ADD CONSTRAINT adm_edif_pub_civil_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.adm_edif_pub_civil_a ADD CONSTRAINT adm_edif_pub_civil_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_edif_pub_civil_p ADD CONSTRAINT adm_edif_pub_civil_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.adm_edif_pub_civil_p ADD CONSTRAINT adm_edif_pub_civil_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_edif_pub_militar_a ADD CONSTRAINT adm_edif_pub_militar_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.adm_edif_pub_militar_a ADD CONSTRAINT adm_edif_pub_militar_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_edif_pub_militar_p ADD CONSTRAINT adm_edif_pub_militar_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.adm_edif_pub_militar_p ADD CONSTRAINT adm_edif_pub_militar_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE complexos.adm_instituicao_publica ADD CONSTRAINT adm_instituicao_publica_tipogrupocnae_ks
 CHECK (tipogrupocnae = 5 OR tipogrupocnae = 6
 OR tipogrupocnae = 7
 OR tipogrupocnae = 99
 OR tipogrupocnae = 0
)#
ALTER TABLE complexos.eco_org_comerc_serv ADD CONSTRAINT eco_org_comerc_serv_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 50 OR tipodivisaocnae = 51
 OR tipodivisaocnae = 52
 OR tipodivisaocnae = 55
 OR tipodivisaocnae = 74
 OR tipodivisaocnae = 99
 OR tipodivisaocnae = 0
)#
ALTER TABLE complexos.eco_org_ext_mineral ADD CONSTRAINT eco_org_ext_mineral_tiposecaocnae_ks
 CHECK (tiposecaocnae = 1 OR tiposecaocnae = 99
 OR tiposecaocnae = 0
)#
ALTER TABLE complexos.adm_org_pub_civil ADD CONSTRAINT adm_org_pub_civil_administracao_ks
 CHECK (administracao = 1 OR administracao = 2
 OR administracao = 3
 OR administracao = 0
)#
ALTER TABLE complexos.adm_org_pub_civil ADD CONSTRAINT adm_org_pub_civil_tipoclassecnae_ks
 CHECK (tipoclassecnae = 0 OR tipoclassecnae = 6
 OR tipoclassecnae = 7
 OR tipoclassecnae = 8
 OR tipoclassecnae = 9
 OR tipoclassecnae = 10
 OR tipoclassecnae = 12
 OR tipoclassecnae = 13
 OR tipoclassecnae = 14
 OR tipoclassecnae = 15
 OR tipoclassecnae = 99
)#
ALTER TABLE complexos.adm_org_pub_militar ADD CONSTRAINT adm_org_pub_militar_administracao_ks
 CHECK (administracao = 1 OR administracao = 2
 OR administracao = 3
 OR administracao = 0
)#
ALTER TABLE complexos.adm_org_pub_militar ADD CONSTRAINT adm_org_pub_militar_tipoclassecnae_ks
 CHECK (tipoclassecnae = 11 OR tipoclassecnae = 13
 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.adm_posto_fiscal ADD CONSTRAINT adm_posto_fiscal_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_posto_fiscal_a ADD CONSTRAINT adm_posto_fiscal_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_posto_fiscal_p ADD CONSTRAINT adm_posto_fiscal_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_posto_pol_rod ADD CONSTRAINT adm_posto_pol_rod_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_posto_pol_rod_a ADD CONSTRAINT adm_posto_pol_rod_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.adm_posto_pol_rod_p ADD CONSTRAINT adm_posto_pol_rod_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE complexos.asb_complexo_abast_agua ADD CONSTRAINT asb_complexo_abast_agua_tipoclassecnae_ks
 CHECK (tipoclassecnae = 4 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.asb_complexo_saneamento ADD CONSTRAINT asb_complexo_saneamento_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
)#
ALTER TABLE complexos.asb_complexo_saneamento ADD CONSTRAINT asb_complexo_saneamento_tipoclassecnae_ks
 CHECK (tipoclassecnae = 34 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.asb_dep_abast_agua ADD CONSTRAINT asb_dep_abast_agua_construcao_ks
 CHECK (construcao = 1 OR construcao = 2
)#
ALTER TABLE cb.asb_dep_abast_agua ADD CONSTRAINT asb_dep_abast_agua_finalidade_ks
 CHECK (finalidade = 2 OR finalidade = 3
 OR finalidade = 4
)#
ALTER TABLE cb.asb_dep_abast_agua ADD CONSTRAINT asb_dep_abast_agua_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.asb_dep_abast_agua ADD CONSTRAINT asb_dep_abast_agua_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.asb_dep_abast_agua_a ADD CONSTRAINT asb_dep_abast_agua_a_construcao_ks
 CHECK (construcao = 1 OR construcao = 2
)#
ALTER TABLE cb.asb_dep_abast_agua_a ADD CONSTRAINT asb_dep_abast_agua_a_finalidade_ks
 CHECK (finalidade = 2 OR finalidade = 3
 OR finalidade = 4
)#
ALTER TABLE cb.asb_dep_abast_agua_a ADD CONSTRAINT asb_dep_abast_agua_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.asb_dep_abast_agua_a ADD CONSTRAINT asb_dep_abast_agua_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.asb_dep_abast_agua_p ADD CONSTRAINT asb_dep_abast_agua_p_construcao_ks
 CHECK (construcao = 1 OR construcao = 2
)#
ALTER TABLE cb.asb_dep_abast_agua_p ADD CONSTRAINT asb_dep_abast_agua_p_finalidade_ks
 CHECK (finalidade = 2 OR finalidade = 3
 OR finalidade = 4
)#
ALTER TABLE cb.asb_dep_abast_agua_p ADD CONSTRAINT asb_dep_abast_agua_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.asb_dep_abast_agua_p ADD CONSTRAINT asb_dep_abast_agua_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.asb_dep_saneamento ADD CONSTRAINT asb_dep_saneamento_finalidade_ks
 CHECK (finalidade = 0 OR finalidade = 2
 OR finalidade = 8
)#
ALTER TABLE cb.asb_dep_saneamento ADD CONSTRAINT asb_dep_saneamento_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.asb_dep_saneamento ADD CONSTRAINT asb_dep_saneamento_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.asb_dep_saneamento_a ADD CONSTRAINT asb_dep_saneamento_a_finalidade_ks
 CHECK (finalidade = 0 OR finalidade = 2
 OR finalidade = 8
)#
ALTER TABLE cb.asb_dep_saneamento_a ADD CONSTRAINT asb_dep_saneamento_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.asb_dep_saneamento_a ADD CONSTRAINT asb_dep_saneamento_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.asb_dep_saneamento_p ADD CONSTRAINT asb_dep_saneamento_p_finalidade_ks
 CHECK (finalidade = 0 OR finalidade = 2
 OR finalidade = 8
)#
ALTER TABLE cb.asb_dep_saneamento_p ADD CONSTRAINT asb_dep_saneamento_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.asb_dep_saneamento_p ADD CONSTRAINT asb_dep_saneamento_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.asb_edif_abast_agua_a ADD CONSTRAINT asb_edif_abast_agua_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.asb_edif_abast_agua_p ADD CONSTRAINT asb_edif_abast_agua_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.asb_edif_saneamento_a ADD CONSTRAINT asb_edif_saneamento_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.asb_edif_saneamento_p ADD CONSTRAINT asb_edif_saneamento_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.eco_deposito_geral ADD CONSTRAINT eco_deposito_geral_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_deposito_geral ADD CONSTRAINT eco_deposito_geral_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_deposito_geral ADD CONSTRAINT eco_deposito_geral_tipoprodutoresiduo_ks
 CHECK (tipoprodutoresiduo = 0 OR tipoprodutoresiduo = 3
 OR tipoprodutoresiduo = 5
 OR tipoprodutoresiduo = 6
 OR tipoprodutoresiduo = 16
 OR tipoprodutoresiduo = 17
 OR tipoprodutoresiduo = 18
 OR tipoprodutoresiduo = 19
 OR tipoprodutoresiduo = 20
 OR tipoprodutoresiduo = 21
 OR tipoprodutoresiduo = 22
 OR tipoprodutoresiduo = 23
 OR tipoprodutoresiduo = 24
 OR tipoprodutoresiduo = 25
 OR tipoprodutoresiduo = 26
 OR tipoprodutoresiduo = 27
 OR tipoprodutoresiduo = 28
 OR tipoprodutoresiduo = 29
 OR tipoprodutoresiduo = 30
 OR tipoprodutoresiduo = 31
 OR tipoprodutoresiduo = 32
 OR tipoprodutoresiduo = 33
 OR tipoprodutoresiduo = 34
 OR tipoprodutoresiduo = 35
 OR tipoprodutoresiduo = 36
 OR tipoprodutoresiduo = 41
 OR tipoprodutoresiduo = 98
 OR tipoprodutoresiduo = 99
)#
ALTER TABLE cb.eco_deposito_geral_a ADD CONSTRAINT eco_deposito_geral_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_deposito_geral_a ADD CONSTRAINT eco_deposito_geral_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_deposito_geral_a ADD CONSTRAINT eco_deposito_geral_a_tipoprodutoresiduo_ks
 CHECK (tipoprodutoresiduo = 0 OR tipoprodutoresiduo = 3
 OR tipoprodutoresiduo = 5
 OR tipoprodutoresiduo = 6
 OR tipoprodutoresiduo = 16
 OR tipoprodutoresiduo = 17
 OR tipoprodutoresiduo = 18
 OR tipoprodutoresiduo = 19
 OR tipoprodutoresiduo = 20
 OR tipoprodutoresiduo = 21
 OR tipoprodutoresiduo = 22
 OR tipoprodutoresiduo = 23
 OR tipoprodutoresiduo = 24
 OR tipoprodutoresiduo = 25
 OR tipoprodutoresiduo = 26
 OR tipoprodutoresiduo = 27
 OR tipoprodutoresiduo = 28
 OR tipoprodutoresiduo = 29
 OR tipoprodutoresiduo = 30
 OR tipoprodutoresiduo = 31
 OR tipoprodutoresiduo = 32
 OR tipoprodutoresiduo = 33
 OR tipoprodutoresiduo = 34
 OR tipoprodutoresiduo = 35
 OR tipoprodutoresiduo = 36
 OR tipoprodutoresiduo = 41
 OR tipoprodutoresiduo = 98
 OR tipoprodutoresiduo = 99
)#
ALTER TABLE cb.eco_deposito_geral_p ADD CONSTRAINT eco_deposito_geral_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_deposito_geral_p ADD CONSTRAINT eco_deposito_geral_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_deposito_geral_p ADD CONSTRAINT eco_deposito_geral_p_tipoprodutoresiduo_ks
 CHECK (tipoprodutoresiduo = 0 OR tipoprodutoresiduo = 3
 OR tipoprodutoresiduo = 5
 OR tipoprodutoresiduo = 6
 OR tipoprodutoresiduo = 16
 OR tipoprodutoresiduo = 17
 OR tipoprodutoresiduo = 18
 OR tipoprodutoresiduo = 19
 OR tipoprodutoresiduo = 20
 OR tipoprodutoresiduo = 21
 OR tipoprodutoresiduo = 22
 OR tipoprodutoresiduo = 23
 OR tipoprodutoresiduo = 24
 OR tipoprodutoresiduo = 25
 OR tipoprodutoresiduo = 26
 OR tipoprodutoresiduo = 27
 OR tipoprodutoresiduo = 28
 OR tipoprodutoresiduo = 29
 OR tipoprodutoresiduo = 30
 OR tipoprodutoresiduo = 31
 OR tipoprodutoresiduo = 32
 OR tipoprodutoresiduo = 33
 OR tipoprodutoresiduo = 34
 OR tipoprodutoresiduo = 35
 OR tipoprodutoresiduo = 36
 OR tipoprodutoresiduo = 41
 OR tipoprodutoresiduo = 98
 OR tipoprodutoresiduo = 99
)#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 1
 OR matconstr = 4
)#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 1
 OR matconstr = 4
)#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_comerc_serv_a ADD CONSTRAINT eco_edif_comerc_serv_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_edif_comerc_serv_a ADD CONSTRAINT eco_edif_comerc_serv_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_comerc_serv_p ADD CONSTRAINT eco_edif_comerc_serv_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_edif_comerc_serv_p ADD CONSTRAINT eco_edif_comerc_serv_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_ext_mineral_a ADD CONSTRAINT eco_edif_ext_mineral_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_edif_ext_mineral_a ADD CONSTRAINT eco_edif_ext_mineral_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_ext_mineral_a ADD CONSTRAINT eco_edif_ext_mineral_a_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 0 OR tipodivisaocnae = 10
 OR tipodivisaocnae = 11
 OR tipodivisaocnae = 14
 OR tipodivisaocnae = 13
 OR tipodivisaocnae = 99
)#
ALTER TABLE cb.eco_edif_ext_mineral_p ADD CONSTRAINT eco_edif_ext_mineral_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_edif_ext_mineral_p ADD CONSTRAINT eco_edif_ext_mineral_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_ext_mineral_p ADD CONSTRAINT eco_edif_ext_mineral_p_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 0 OR tipodivisaocnae = 10
 OR tipodivisaocnae = 11
 OR tipodivisaocnae = 99
 OR tipodivisaocnae = 13
 OR tipodivisaocnae = 14
)#
ALTER TABLE cb.eco_edif_industrial_a ADD CONSTRAINT eco_edif_industrial_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_edif_industrial_a ADD CONSTRAINT eco_edif_industrial_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_industrial_a ADD CONSTRAINT eco_edif_industrial_a_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 15 OR tipodivisaocnae = 16
 OR tipodivisaocnae = 17
 OR tipodivisaocnae = 18
 OR tipodivisaocnae = 19
 OR tipodivisaocnae = 20
 OR tipodivisaocnae = 21
 OR tipodivisaocnae = 22
 OR tipodivisaocnae = 23
 OR tipodivisaocnae = 24
 OR tipodivisaocnae = 25
 OR tipodivisaocnae = 26
 OR tipodivisaocnae = 27
 OR tipodivisaocnae = 28
 OR tipodivisaocnae = 29
 OR tipodivisaocnae = 30
 OR tipodivisaocnae = 31
 OR tipodivisaocnae = 32
 OR tipodivisaocnae = 33
 OR tipodivisaocnae = 34
 OR tipodivisaocnae = 35
 OR tipodivisaocnae = 36
 OR tipodivisaocnae = 37
 OR tipodivisaocnae = 45
 OR tipodivisaocnae = 99
 OR tipodivisaocnae = 0
)#
ALTER TABLE cb.eco_edif_industrial_p ADD CONSTRAINT eco_edif_industrial_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
 OR matconstr = 97
)#
ALTER TABLE cb.eco_edif_industrial_p ADD CONSTRAINT eco_edif_industrial_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_edif_industrial_p ADD CONSTRAINT eco_edif_industrial_p_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 15 OR tipodivisaocnae = 16
 OR tipodivisaocnae = 17
 OR tipodivisaocnae = 18
 OR tipodivisaocnae = 19
 OR tipodivisaocnae = 20
 OR tipodivisaocnae = 21
 OR tipodivisaocnae = 22
 OR tipodivisaocnae = 23
 OR tipodivisaocnae = 24
 OR tipodivisaocnae = 25
 OR tipodivisaocnae = 26
 OR tipodivisaocnae = 27
 OR tipodivisaocnae = 28
 OR tipodivisaocnae = 29
 OR tipodivisaocnae = 30
 OR tipodivisaocnae = 31
 OR tipodivisaocnae = 32
 OR tipodivisaocnae = 33
 OR tipodivisaocnae = 34
 OR tipodivisaocnae = 35
 OR tipodivisaocnae = 36
 OR tipodivisaocnae = 37
 OR tipodivisaocnae = 45
 OR tipodivisaocnae = 99
 OR tipodivisaocnae = 0
)#
ALTER TABLE cb.eco_equip_agropec ADD CONSTRAINT eco_equip_agropec_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.eco_equip_agropec ADD CONSTRAINT eco_equip_agropec_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_equip_agropec_a ADD CONSTRAINT eco_equip_agropec_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.eco_equip_agropec_a ADD CONSTRAINT eco_equip_agropec_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_equip_agropec_l ADD CONSTRAINT eco_equip_agropec_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.eco_equip_agropec_l ADD CONSTRAINT eco_equip_agropec_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_equip_agropec_p ADD CONSTRAINT eco_equip_agropec_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.eco_equip_agropec_p ADD CONSTRAINT eco_equip_agropec_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_ext_mineral ADD CONSTRAINT eco_ext_mineral_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_ext_mineral ADD CONSTRAINT eco_ext_mineral_tipoprodutoresiduo_ks
 CHECK (tipoprodutoresiduo = 0 OR tipoprodutoresiduo = 3
 OR tipoprodutoresiduo = 5
 OR tipoprodutoresiduo = 18
 OR tipoprodutoresiduo = 22
 OR tipoprodutoresiduo = 23
 OR tipoprodutoresiduo = 24
 OR tipoprodutoresiduo = 25
 OR tipoprodutoresiduo = 26
 OR tipoprodutoresiduo = 27
 OR tipoprodutoresiduo = 32
 OR tipoprodutoresiduo = 33
 OR tipoprodutoresiduo = 34
 OR tipoprodutoresiduo = 35
 OR tipoprodutoresiduo = 37
 OR tipoprodutoresiduo = 38
 OR tipoprodutoresiduo = 39
 OR tipoprodutoresiduo = 40
 OR tipoprodutoresiduo = 98
 OR tipoprodutoresiduo = 99
 OR tipoprodutoresiduo = 42
 OR tipoprodutoresiduo = 43
 OR tipoprodutoresiduo = 44
)#
ALTER TABLE cb.eco_ext_mineral ADD CONSTRAINT eco_ext_mineral_tiposecaocnae_ks
 CHECK (tiposecaocnae = 0 OR tiposecaocnae = 1
 OR tiposecaocnae = 99
)#
ALTER TABLE cb.eco_ext_mineral_a ADD CONSTRAINT eco_ext_mineral_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_ext_mineral_a ADD CONSTRAINT eco_ext_mineral_a_tipoprodutoresiduo_ks
 CHECK (tipoprodutoresiduo = 0 OR tipoprodutoresiduo = 3
 OR tipoprodutoresiduo = 5
 OR tipoprodutoresiduo = 18
 OR tipoprodutoresiduo = 22
 OR tipoprodutoresiduo = 23
 OR tipoprodutoresiduo = 24
 OR tipoprodutoresiduo = 25
 OR tipoprodutoresiduo = 26
 OR tipoprodutoresiduo = 27
 OR tipoprodutoresiduo = 32
 OR tipoprodutoresiduo = 33
 OR tipoprodutoresiduo = 34
 OR tipoprodutoresiduo = 35
 OR tipoprodutoresiduo = 37
 OR tipoprodutoresiduo = 38
 OR tipoprodutoresiduo = 39
 OR tipoprodutoresiduo = 40
 OR tipoprodutoresiduo = 98
 OR tipoprodutoresiduo = 99
 OR tipoprodutoresiduo = 42
 OR tipoprodutoresiduo = 43
 OR tipoprodutoresiduo = 44
)#
ALTER TABLE cb.eco_ext_mineral_a ADD CONSTRAINT eco_ext_mineral_a_tiposecaocnae_ks
 CHECK (tiposecaocnae = 1 OR tiposecaocnae = 99
 OR tiposecaocnae = 0
)#
ALTER TABLE cb.eco_ext_mineral_p ADD CONSTRAINT eco_ext_mineral_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.eco_ext_mineral_p ADD CONSTRAINT eco_ext_mineral_p_tipoprodutoresiduo_ks
 CHECK (tipoprodutoresiduo = 0 OR tipoprodutoresiduo = 3
 OR tipoprodutoresiduo = 5
 OR tipoprodutoresiduo = 18
 OR tipoprodutoresiduo = 22
 OR tipoprodutoresiduo = 23
 OR tipoprodutoresiduo = 24
 OR tipoprodutoresiduo = 25
 OR tipoprodutoresiduo = 26
 OR tipoprodutoresiduo = 27
 OR tipoprodutoresiduo = 32
 OR tipoprodutoresiduo = 33
 OR tipoprodutoresiduo = 34
 OR tipoprodutoresiduo = 35
 OR tipoprodutoresiduo = 37
 OR tipoprodutoresiduo = 38
 OR tipoprodutoresiduo = 39
 OR tipoprodutoresiduo = 40
 OR tipoprodutoresiduo = 98
 OR tipoprodutoresiduo = 99
 OR tipoprodutoresiduo = 42
 OR tipoprodutoresiduo = 43
 OR tipoprodutoresiduo = 44
)#
ALTER TABLE cb.eco_ext_mineral_p ADD CONSTRAINT eco_ext_mineral_p_tiposecaocnae_ks
 CHECK (tiposecaocnae = 0 OR tiposecaocnae = 1
 OR tiposecaocnae = 99
)#
ALTER TABLE complexos.eco_frigorifico_matadouro ADD CONSTRAINT eco_frigorifico_matadouro_tiposecaocnae_ks
 CHECK (tiposecaocnae = 2 OR tiposecaocnae = 99
 OR tiposecaocnae = 0
)#
ALTER TABLE complexos.eco_madeireira ADD CONSTRAINT eco_madeireira_tiposecaocnae_ks
 CHECK (tiposecaocnae = 2 OR tiposecaocnae = 99
 OR tiposecaocnae = 0
)#
ALTER TABLE complexos.eco_org_agrop_ext_veg_pesca ADD CONSTRAINT eco_org_agrop_ext_veg_pesca_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 1 OR tipodivisaocnae = 2
 OR tipodivisaocnae = 5
 OR tipodivisaocnae = 99
 OR tipodivisaocnae = 0
)#
ALTER TABLE complexos.eco_org_industrial ADD CONSTRAINT eco_org_industrial_tiposecaocnae_ks
 CHECK (tiposecaocnae = 2 OR tiposecaocnae = 3
 OR tiposecaocnae = 99
 OR tiposecaocnae = 0
)#
ALTER TABLE cb.edu_arquibancada ADD CONSTRAINT edu_arquibancada_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_arquibancada_a ADD CONSTRAINT edu_arquibancada_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_arquibancada_p ADD CONSTRAINT edu_arquibancada_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_campo_quadra ADD CONSTRAINT edu_campo_quadra_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_campo_quadra_a ADD CONSTRAINT edu_campo_quadra_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_campo_quadra_p ADD CONSTRAINT edu_campo_quadra_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE complexos.edu_complexo_lazer ADD CONSTRAINT edu_complexo_lazer_administracao_ks
 CHECK (administracao = 1 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
 OR administracao = 98
 OR administracao = 0
)#
ALTER TABLE complexos.edu_complexo_lazer ADD CONSTRAINT edu_complexo_lazer_tipodivisaocnae_ks
 CHECK (tipodivisaocnae = 92 OR tipodivisaocnae = 99
 OR tipodivisaocnae = 0
)#
ALTER TABLE cb.edu_coreto_tribuna ADD CONSTRAINT edu_coreto_tribuna_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_coreto_tribuna_a ADD CONSTRAINT edu_coreto_tribuna_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_coreto_tribuna_p ADD CONSTRAINT edu_coreto_tribuna_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_const_lazer_a ADD CONSTRAINT edu_edif_const_lazer_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_const_lazer_a ADD CONSTRAINT edu_edif_const_lazer_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_const_lazer_p ADD CONSTRAINT edu_edif_const_lazer_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_const_lazer_p ADD CONSTRAINT edu_edif_const_lazer_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_const_turistica_a ADD CONSTRAINT edu_edif_const_turistica_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_const_turistica_a ADD CONSTRAINT edu_edif_const_turistica_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_const_turistica_p ADD CONSTRAINT edu_edif_const_turistica_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_const_turistica_p ADD CONSTRAINT edu_edif_const_turistica_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_ensino_a ADD CONSTRAINT edu_edif_ensino_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_ensino_a ADD CONSTRAINT edu_edif_ensino_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_ensino_a ADD CONSTRAINT edu_edif_ensino_a_tipoclassecnae_ks
 CHECK (tipoclassecnae = 0 OR tipoclassecnae = 16
 OR tipoclassecnae = 17
 OR tipoclassecnae = 18
 OR tipoclassecnae = 19
 OR tipoclassecnae = 20
 OR tipoclassecnae = 21
 OR tipoclassecnae = 22
 OR tipoclassecnae = 23
 OR tipoclassecnae = 24
 OR tipoclassecnae = 25
 OR tipoclassecnae = 98
)#
ALTER TABLE cb.edu_edif_ensino_p ADD CONSTRAINT edu_edif_ensino_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_ensino_p ADD CONSTRAINT edu_edif_ensino_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_ensino_p ADD CONSTRAINT edu_edif_ensino_p_tipoclassecnae_ks
 CHECK (tipoclassecnae = 0 OR tipoclassecnae = 16
 OR tipoclassecnae = 17
 OR tipoclassecnae = 18
 OR tipoclassecnae = 19
 OR tipoclassecnae = 20
 OR tipoclassecnae = 21
 OR tipoclassecnae = 22
 OR tipoclassecnae = 23
 OR tipoclassecnae = 24
 OR tipoclassecnae = 25
 OR tipoclassecnae = 98
)#
ALTER TABLE cb.edu_edif_religiosa_a ADD CONSTRAINT edu_edif_religiosa_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_religiosa_a ADD CONSTRAINT edu_edif_religiosa_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_edif_religiosa_p ADD CONSTRAINT edu_edif_religiosa_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.edu_edif_religiosa_p ADD CONSTRAINT edu_edif_religiosa_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE complexos.edu_org_ensino ADD CONSTRAINT edu_org_ensino_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.edu_org_ensino ADD CONSTRAINT edu_org_ensino_tipogrupocnae_ks
 CHECK (tipogrupocnae = 1 OR tipogrupocnae = 19
 OR tipogrupocnae = 3
 OR tipogrupocnae = 4
 OR tipogrupocnae = 98
 OR tipogrupocnae = 0
 OR tipogrupocnae = 99
)#
ALTER TABLE complexos.edu_org_ensino_militar ADD CONSTRAINT edu_org_ensino_militar_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.edu_org_ensino_militar ADD CONSTRAINT edu_org_ensino_militar_tipoclassecnae_ks
 CHECK (tipoclassecnae = 11 OR tipoclassecnae = 13
 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.edu_org_ensino_militar ADD CONSTRAINT edu_org_ensino_militar_tipogrupocnae_ks
 CHECK (tipogrupocnae = 1 OR tipogrupocnae = 19
 OR tipogrupocnae = 3
 OR tipogrupocnae = 4
 OR tipogrupocnae = 98
 OR tipogrupocnae = 0
 OR tipogrupocnae = 99
)#
ALTER TABLE complexos.edu_org_ensino_pub ADD CONSTRAINT edu_org_ensino_pub_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.edu_org_ensino_pub ADD CONSTRAINT edu_org_ensino_pub_poderpublico_ks
 CHECK (poderpublico = 1)#
ALTER TABLE complexos.edu_org_ensino_pub ADD CONSTRAINT edu_org_ensino_pub_tipoclassecnae_ks
 CHECK (tipoclassecnae = 7 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.edu_org_ensino_pub ADD CONSTRAINT edu_org_ensino_pub_tipogrupocnae_ks
 CHECK (tipogrupocnae = 1 OR tipogrupocnae = 19
 OR tipogrupocnae = 3
 OR tipogrupocnae = 4
 OR tipogrupocnae = 98
 OR tipogrupocnae = 0
 OR tipogrupocnae = 99
)#
ALTER TABLE complexos.edu_org_ensino_religioso ADD CONSTRAINT edu_org_ensino_religioso_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.edu_org_ensino_religioso ADD CONSTRAINT edu_org_ensino_religioso_tipoclassecnae_ks
 CHECK (tipoclassecnae = 35 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.edu_org_ensino_religioso ADD CONSTRAINT edu_org_ensino_religioso_tipogrupocnae_ks
 CHECK (tipogrupocnae = 1 OR tipogrupocnae = 19
 OR tipogrupocnae = 3
 OR tipogrupocnae = 4
 OR tipogrupocnae = 98
 OR tipogrupocnae = 0
 OR tipogrupocnae = 99
)#
ALTER TABLE complexos.edu_org_religiosa ADD CONSTRAINT edu_org_religiosa_tipoclassecnae_ks
 CHECK (tipoclassecnae = 35 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.edu_piscina_a ADD CONSTRAINT edu_piscina_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_pista_competicao_l ADD CONSTRAINT edu_pista_competicao_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.edu_pista_competicao_l ADD CONSTRAINT edu_pista_competicao_l_tipopista_ks
 CHECK (tipopista = 0 OR tipopista = 1
 OR tipopista = 2
 OR tipopista = 3
 OR tipopista = 4
 OR tipopista = 5
 OR tipopista = 98
 OR tipopista = 99
)#
ALTER TABLE complexos.enc_complexo_comunicacao ADD CONSTRAINT enc_complexo_comunicacao_tipoclassecnae_ks
 CHECK (tipoclassecnae = 5 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.enc_complexo_gerad_energ_eletr ADD CONSTRAINT enc_complexo_gerad_energ_eletr_tipoclassecnae_ks
 CHECK (tipoclassecnae = 1 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.enc_edif_comunic_a ADD CONSTRAINT enc_edif_comunic_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 99
 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
)#
ALTER TABLE cb.enc_edif_comunic_a ADD CONSTRAINT enc_edif_comunic_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_edif_comunic_p ADD CONSTRAINT enc_edif_comunic_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 99
 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
)#
ALTER TABLE cb.enc_edif_comunic_p ADD CONSTRAINT enc_edif_comunic_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_edif_energia_a ADD CONSTRAINT enc_edif_energia_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 99
 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
)#
ALTER TABLE cb.enc_edif_energia_a ADD CONSTRAINT enc_edif_energia_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_edif_energia_p ADD CONSTRAINT enc_edif_energia_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 99
 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
)#
ALTER TABLE cb.enc_edif_energia_p ADD CONSTRAINT enc_edif_energia_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_est_gerad_energia_eletr ADD CONSTRAINT enc_est_gerad_energia_eletr_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a ADD CONSTRAINT enc_est_gerad_energia_eletr_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l ADD CONSTRAINT enc_est_gerad_energia_eletr_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p ADD CONSTRAINT enc_est_gerad_energia_eletr_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_hidreletrica_a ADD CONSTRAINT enc_hidreletrica_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_hidreletrica_l ADD CONSTRAINT enc_hidreletrica_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_hidreletrica_p ADD CONSTRAINT enc_hidreletrica_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE complexos.enc_subestacao_ener_eletr ADD CONSTRAINT enc_subestacao_ener_eletr_tipoclassecnae_ks
 CHECK (tipoclassecnae = 0 OR tipoclassecnae = 2
 OR tipoclassecnae = 3
 OR tipoclassecnae = 99
)#
ALTER TABLE cb.enc_termeletrica_a ADD CONSTRAINT enc_termeletrica_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_termeletrica_p ADD CONSTRAINT enc_termeletrica_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_torre_comunic_p ADD CONSTRAINT enc_torre_comunic_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_torre_energia_p ADD CONSTRAINT enc_torre_energia_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_trecho_comunic_l ADD CONSTRAINT enc_trecho_comunic_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 25
 OR matconstr = 26
 OR matconstr = 99
)#
ALTER TABLE cb.enc_trecho_comunic_l ADD CONSTRAINT enc_trecho_comunic_l_posicaorelativa_ks
 CHECK (posicaorelativa = 2 OR posicaorelativa = 3
 OR posicaorelativa = 4
 OR posicaorelativa = 5
 OR posicaorelativa = 6
)#
ALTER TABLE cb.enc_trecho_comunic_l ADD CONSTRAINT enc_trecho_comunic_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.enc_trecho_energia_l ADD CONSTRAINT enc_trecho_energia_l_posicaorelativa_ks
 CHECK (posicaorelativa = 2 OR posicaorelativa = 3
 OR posicaorelativa = 4
 OR posicaorelativa = 5
 OR posicaorelativa = 6
)#
ALTER TABLE cb.enc_trecho_energia_l ADD CONSTRAINT enc_trecho_energia_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_banco_areia ADD CONSTRAINT hid_banco_areia_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 24
 OR materialpredominante = 12
)#
ALTER TABLE cb.hid_banco_areia_a ADD CONSTRAINT hid_banco_areia_a_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 24
 OR materialpredominante = 12
)#
ALTER TABLE cb.hid_banco_areia_l ADD CONSTRAINT hid_banco_areia_l_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 24
 OR materialpredominante = 12
)#
ALTER TABLE cb.hid_barragem ADD CONSTRAINT hid_barragem_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 23
 OR matconstr = 99
)#
ALTER TABLE cb.hid_barragem ADD CONSTRAINT hid_barragem_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_barragem_a ADD CONSTRAINT hid_barragem_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 23
 OR matconstr = 99
)#
ALTER TABLE cb.hid_barragem_a ADD CONSTRAINT hid_barragem_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_barragem_l ADD CONSTRAINT hid_barragem_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 23
 OR matconstr = 99
)#
ALTER TABLE cb.hid_barragem_l ADD CONSTRAINT hid_barragem_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_barragem_p ADD CONSTRAINT hid_barragem_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 23
 OR matconstr = 99
)#
ALTER TABLE cb.hid_barragem_p ADD CONSTRAINT hid_barragem_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_comporta ADD CONSTRAINT hid_comporta_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_comporta_l ADD CONSTRAINT hid_comporta_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_comporta_p ADD CONSTRAINT hid_comporta_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_confluencia_p ADD CONSTRAINT hid_confluencia_p_relacionado_ks
 CHECK (relacionado = 15)#
ALTER TABLE cb.hid_fonte_dagua_p ADD CONSTRAINT hid_fonte_dagua_p_regime_ks
 CHECK (regime = 1 OR regime = 3
 OR regime = 0
)#
ALTER TABLE cb.hid_ilha_a ADD CONSTRAINT hid_ilha_a_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.hid_ilha_l ADD CONSTRAINT hid_ilha_l_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.hid_ilha_p ADD CONSTRAINT hid_ilha_p_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.hid_limite_massa_dagua_l ADD CONSTRAINT hid_limite_massa_dagua_l_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 12
 OR materialpredominante = 13
 OR materialpredominante = 14
 OR materialpredominante = 15
 OR materialpredominante = 16
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 20
 OR materialpredominante = 21
 OR materialpredominante = 4
 OR materialpredominante = 50
 OR materialpredominante = 97
)#
ALTER TABLE cb.hid_massa_dagua_a ADD CONSTRAINT hid_massa_dagua_a_regime_ks
 CHECK (regime = 1 OR regime = 2
 OR regime = 3
 OR regime = 4
 OR regime = 5
)#
ALTER TABLE cb.hid_natureza_fundo ADD CONSTRAINT hid_natureza_fundo_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 12
 OR materialpredominante = 13
 OR materialpredominante = 14
 OR materialpredominante = 15
 OR materialpredominante = 16
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 20
 OR materialpredominante = 21
 OR materialpredominante = 4
 OR materialpredominante = 50
 OR materialpredominante = 97
)#
ALTER TABLE cb.hid_natureza_fundo_a ADD CONSTRAINT hid_natureza_fundo_a_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 12
 OR materialpredominante = 13
 OR materialpredominante = 14
 OR materialpredominante = 15
 OR materialpredominante = 16
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 20
 OR materialpredominante = 21
 OR materialpredominante = 4
 OR materialpredominante = 50
 OR materialpredominante = 97
)#
ALTER TABLE cb.hid_natureza_fundo_l ADD CONSTRAINT hid_natureza_fundo_l_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 12
 OR materialpredominante = 13
 OR materialpredominante = 14
 OR materialpredominante = 15
 OR materialpredominante = 16
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 20
 OR materialpredominante = 21
 OR materialpredominante = 4
 OR materialpredominante = 50
 OR materialpredominante = 97
)#
ALTER TABLE cb.hid_natureza_fundo_p ADD CONSTRAINT hid_natureza_fundo_p_materialpredominante_ks
 CHECK (materialpredominante = 0 OR materialpredominante = 98
 OR materialpredominante = 12
 OR materialpredominante = 13
 OR materialpredominante = 14
 OR materialpredominante = 15
 OR materialpredominante = 16
 OR materialpredominante = 18
 OR materialpredominante = 19
 OR materialpredominante = 20
 OR materialpredominante = 21
 OR materialpredominante = 4
 OR materialpredominante = 50
 OR materialpredominante = 97
)#
ALTER TABLE cb.hid_ponto_inicio_drenagem_p ADD CONSTRAINT hid_ponto_inicio_drenagem_p_relacionado_ks
 CHECK (relacionado = 14)#
ALTER TABLE cb.hid_quebramar_molhe ADD CONSTRAINT hid_quebramar_molhe_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.hid_quebramar_molhe ADD CONSTRAINT hid_quebramar_molhe_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_quebramar_molhe ADD CONSTRAINT hid_quebramar_molhe_situamare_ks
 CHECK (situamare = 7 OR situamare = 8
 OR situamare = 9
)#
ALTER TABLE cb.hid_quebramar_molhe_a ADD CONSTRAINT hid_quebramar_molhe_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.hid_quebramar_molhe_a ADD CONSTRAINT hid_quebramar_molhe_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_quebramar_molhe_a ADD CONSTRAINT hid_quebramar_molhe_a_situamare_ks
 CHECK (situamare = 7 OR situamare = 8
 OR situamare = 9
)#
ALTER TABLE cb.hid_quebramar_molhe_l ADD CONSTRAINT hid_quebramar_molhe_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.hid_quebramar_molhe_l ADD CONSTRAINT hid_quebramar_molhe_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.hid_quebramar_molhe_l ADD CONSTRAINT hid_quebramar_molhe_l_situamare_ks
 CHECK (situamare = 7 OR situamare = 8
 OR situamare = 9
)#
ALTER TABLE cb.hid_trecho_drenagem_l ADD CONSTRAINT hid_trecho_drenagem_l_regime_ks
 CHECK (regime = 1 OR regime = 2
 OR regime = 3
 OR regime = 4
 OR regime = 5
)#
ALTER TABLE cb.hid_trecho_massa_dagua_a ADD CONSTRAINT hid_trecho_massa_dagua_a_regime_ks
 CHECK (regime = 1 OR regime = 2
 OR regime = 3
 OR regime = 4
 OR regime = 5
)#
ALTER TABLE cb.lim_delimitacao_fisica_l ADD CONSTRAINT lim_delimitacao_fisica_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 6
 OR matconstr = 5
 OR matconstr = 7
 OR matconstr = 8
)#
ALTER TABLE cb.lim_outras_unid_protegidas_a ADD CONSTRAINT lim_outras_unid_protegidas_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_outras_unid_protegidas_p ADD CONSTRAINT lim_outras_unid_protegidas_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_a ADD CONSTRAINT lim_unidade_conserv_nao_snuc_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_unidade_conserv_nao_snuc_p ADD CONSTRAINT lim_unidade_conserv_nao_snuc_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_unidade_protecao_integral_a ADD CONSTRAINT lim_unidade_protecao_integral_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_unidade_protecao_integral_p ADD CONSTRAINT lim_unidade_protecao_integral_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_unidade_uso_sustentavel_a ADD CONSTRAINT lim_unidade_uso_sustentavel_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.lim_unidade_uso_sustentavel_p ADD CONSTRAINT lim_unidade_uso_sustentavel_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 5
)#
ALTER TABLE cb.loc_edif_habitacional_a ADD CONSTRAINT loc_edif_habitacional_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 5
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
 OR matconstr = 7
 OR matconstr = 8
)#
ALTER TABLE cb.loc_edif_habitacional_a ADD CONSTRAINT loc_edif_habitacional_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.loc_edif_habitacional_p ADD CONSTRAINT loc_edif_habitacional_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 5
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
 OR matconstr = 7
 OR matconstr = 8
)#
ALTER TABLE cb.loc_edif_habitacional_p ADD CONSTRAINT loc_edif_habitacional_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.loc_edificacao ADD CONSTRAINT loc_edificacao_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 5
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
 OR matconstr = 7
 OR matconstr = 8
)#
ALTER TABLE cb.loc_edificacao_a ADD CONSTRAINT loc_edificacao_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 5
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
 OR matconstr = 7
 OR matconstr = 8
)#
ALTER TABLE cb.loc_edificacao_p ADD CONSTRAINT loc_edificacao_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 5
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
 OR matconstr = 97
 OR matconstr = 7
 OR matconstr = 8
)#
ALTER TABLE cb.pto_edif_constr_est_med_fen_a ADD CONSTRAINT pto_edif_constr_est_med_fen_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.pto_edif_constr_est_med_fen_a ADD CONSTRAINT pto_edif_constr_est_med_fen_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.pto_edif_constr_est_med_fen_p ADD CONSTRAINT pto_edif_constr_est_med_fen_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.pto_edif_constr_est_med_fen_p ADD CONSTRAINT pto_edif_constr_est_med_fen_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.pto_pto_controle_p ADD CONSTRAINT pto_pto_controle_p_tiporef_ks
 CHECK (tiporef = 1 OR tiporef = 2
 OR tiporef = 3
)#
ALTER TABLE cb.rel_dolina_a ADD CONSTRAINT rel_dolina_a_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_dolina_p ADD CONSTRAINT rel_dolina_p_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_duna_a ADD CONSTRAINT rel_duna_a_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_duna_p ADD CONSTRAINT rel_duna_p_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_gruta_caverna_p ADD CONSTRAINT rel_gruta_caverna_p_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_pico_p ADD CONSTRAINT rel_pico_p_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_rocha_a ADD CONSTRAINT rel_rocha_a_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.rel_rocha_p ADD CONSTRAINT rel_rocha_p_tipoelemnat_ks
 CHECK (tipoelemnat = 99)#
ALTER TABLE cb.sau_edif_saude_a ADD CONSTRAINT sau_edif_saude_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.sau_edif_saude_a ADD CONSTRAINT sau_edif_saude_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.sau_edif_saude_a ADD CONSTRAINT sau_edif_saude_a_tipoclassecnae_ks
 CHECK (tipoclassecnae = 26 OR tipoclassecnae = 27
 OR tipoclassecnae = 28
 OR tipoclassecnae = 29
 OR tipoclassecnae = 31
 OR tipoclassecnae = 98
 OR tipoclassecnae = 30
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.sau_edif_saude_p ADD CONSTRAINT sau_edif_saude_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.sau_edif_saude_p ADD CONSTRAINT sau_edif_saude_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.sau_edif_saude_p ADD CONSTRAINT sau_edif_saude_p_tipoclassecnae_ks
 CHECK (tipoclassecnae = 26 OR tipoclassecnae = 27
 OR tipoclassecnae = 28
 OR tipoclassecnae = 29
 OR tipoclassecnae = 31
 OR tipoclassecnae = 98
 OR tipoclassecnae = 30
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.sau_edif_servico_social_a ADD CONSTRAINT sau_edif_servico_social_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.sau_edif_servico_social_a ADD CONSTRAINT sau_edif_servico_social_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.sau_edif_servico_social_a ADD CONSTRAINT sau_edif_servico_social_a_tipoclassecnae_ks
 CHECK (tipoclassecnae = 32 OR tipoclassecnae = 33
 OR tipoclassecnae = 98
 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE cb.sau_edif_servico_social_p ADD CONSTRAINT sau_edif_servico_social_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 97
 OR matconstr = 99
)#
ALTER TABLE cb.sau_edif_servico_social_p ADD CONSTRAINT sau_edif_servico_social_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 3
 OR situacaofisica = 5
)#
ALTER TABLE cb.sau_edif_servico_social_p ADD CONSTRAINT sau_edif_servico_social_p_tipoclassecnae_ks
 CHECK (tipoclassecnae = 32 OR tipoclassecnae = 33
 OR tipoclassecnae = 98
 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.sau_org_saude ADD CONSTRAINT sau_org_saude_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.sau_org_saude ADD CONSTRAINT sau_org_saude_tipogrupocnae_ks
 CHECK (tipogrupocnae = 8 OR tipogrupocnae = 9
 OR tipogrupocnae = 99
 OR tipogrupocnae = 0
)#
ALTER TABLE complexos.sau_org_saude_militar ADD CONSTRAINT sau_org_saude_militar_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.sau_org_saude_militar ADD CONSTRAINT sau_org_saude_militar_tipoclassecnae_ks
 CHECK (tipoclassecnae = 11 OR tipoclassecnae = 13
 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.sau_org_saude_militar ADD CONSTRAINT sau_org_saude_militar_tipogrupocnae_ks
 CHECK (tipogrupocnae = 8 OR tipogrupocnae = 9
 OR tipogrupocnae = 99
 OR tipogrupocnae = 0
)#
ALTER TABLE complexos.sau_org_saude_pub ADD CONSTRAINT sau_org_saude_pub_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.sau_org_saude_pub ADD CONSTRAINT sau_org_saude_pub_tipoclassecnae_ks
 CHECK (tipoclassecnae = 97 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.sau_org_saude_pub ADD CONSTRAINT sau_org_saude_pub_tipogrupocnae_ks
 CHECK (tipogrupocnae = 8 OR tipogrupocnae = 9
 OR tipogrupocnae = 99
 OR tipogrupocnae = 0
)#
ALTER TABLE complexos.sau_org_servico_social ADD CONSTRAINT sau_org_servico_social_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.sau_org_servico_social ADD CONSTRAINT sau_org_servico_social_tipogrupocnae_ks
 CHECK (tipogrupocnae = 10 OR tipogrupocnae = 99
 OR tipogrupocnae = 0
)#
ALTER TABLE complexos.sau_org_servico_social_pub ADD CONSTRAINT sau_org_servico_social_pub_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 15
)#
ALTER TABLE complexos.sau_org_servico_social_pub ADD CONSTRAINT sau_org_servico_social_pub_tipoclassecnae_ks
 CHECK (tipoclassecnae = 7 OR tipoclassecnae = 99
 OR tipoclassecnae = 0
)#
ALTER TABLE complexos.sau_org_servico_social_pub ADD CONSTRAINT sau_org_servico_social_pub_tipogrupocnae_ks
 CHECK (tipogrupocnae = 10 OR tipogrupocnae = 99
 OR tipogrupocnae = 0
)#
ALTER TABLE cb.tra_atracadouro ADD CONSTRAINT tra_atracadouro_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_atracadouro ADD CONSTRAINT tra_atracadouro_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_atracadouro_a ADD CONSTRAINT tra_atracadouro_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_atracadouro_a ADD CONSTRAINT tra_atracadouro_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_atracadouro_l ADD CONSTRAINT tra_atracadouro_l_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_atracadouro_l ADD CONSTRAINT tra_atracadouro_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_atracadouro_p ADD CONSTRAINT tra_atracadouro_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_atracadouro_p ADD CONSTRAINT tra_atracadouro_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_caminho_aereo_l ADD CONSTRAINT tra_caminho_aereo_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_ciclovia_l ADD CONSTRAINT tra_ciclovia_l_administracao_ks
 CHECK (administracao = 0 OR administracao = 2
 OR administracao = 3
 OR administracao = 4
 OR administracao = 6
)#
ALTER TABLE cb.tra_condutor_hidrico_l ADD CONSTRAINT tra_condutor_hidrico_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.tra_eclusa ADD CONSTRAINT tra_eclusa_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_eclusa ADD CONSTRAINT tra_eclusa_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_eclusa_a ADD CONSTRAINT tra_eclusa_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_eclusa_a ADD CONSTRAINT tra_eclusa_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_eclusa_l ADD CONSTRAINT tra_eclusa_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_eclusa_l ADD CONSTRAINT tra_eclusa_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_eclusa_p ADD CONSTRAINT tra_eclusa_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_eclusa_p ADD CONSTRAINT tra_eclusa_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
)#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
)#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_constr_portuaria_a ADD CONSTRAINT tra_edif_constr_portuaria_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_edif_constr_portuaria_a ADD CONSTRAINT tra_edif_constr_portuaria_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_constr_portuaria_p ADD CONSTRAINT tra_edif_constr_portuaria_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_edif_constr_portuaria_p ADD CONSTRAINT tra_edif_constr_portuaria_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a ADD CONSTRAINT tra_edif_metro_ferroviaria_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a ADD CONSTRAINT tra_edif_metro_ferroviaria_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p ADD CONSTRAINT tra_edif_metro_ferroviaria_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p ADD CONSTRAINT tra_edif_metro_ferroviaria_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_rodoviaria_a ADD CONSTRAINT tra_edif_rodoviaria_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_edif_rodoviaria_a ADD CONSTRAINT tra_edif_rodoviaria_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_rodoviaria_a ADD CONSTRAINT tra_edif_rodoviaria_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_edif_rodoviaria_p ADD CONSTRAINT tra_edif_rodoviaria_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_edif_rodoviaria_p ADD CONSTRAINT tra_edif_rodoviaria_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_edif_rodoviaria_p ADD CONSTRAINT tra_edif_rodoviaria_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_fundeadouro ADD CONSTRAINT tra_fundeadouro_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_fundeadouro_a ADD CONSTRAINT tra_fundeadouro_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_fundeadouro_l ADD CONSTRAINT tra_fundeadouro_l_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_fundeadouro_p ADD CONSTRAINT tra_fundeadouro_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_galeria_bueiro ADD CONSTRAINT tra_galeria_bueiro_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.tra_galeria_bueiro_l ADD CONSTRAINT tra_galeria_bueiro_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.tra_galeria_bueiro_p ADD CONSTRAINT tra_galeria_bueiro_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.tra_girador_ferroviario_p ADD CONSTRAINT tra_girador_ferroviario_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE complexos.tra_hidrovia ADD CONSTRAINT tra_hidrovia_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_passag_elevada_viaduto ADD CONSTRAINT tra_passag_elevada_viaduto_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_passag_elevada_viaduto ADD CONSTRAINT tra_passag_elevada_viaduto_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 8
 OR modaluso = 9
)#
ALTER TABLE cb.tra_passag_elevada_viaduto_l ADD CONSTRAINT tra_passag_elevada_viaduto_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_passag_elevada_viaduto_l ADD CONSTRAINT tra_passag_elevada_viaduto_l_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 8
 OR modaluso = 9
)#
ALTER TABLE cb.tra_passag_elevada_viaduto_p ADD CONSTRAINT tra_passag_elevada_viaduto_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_passag_elevada_viaduto_p ADD CONSTRAINT tra_passag_elevada_viaduto_p_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 8
 OR modaluso = 9
)#
ALTER TABLE cb.tra_patio ADD CONSTRAINT tra_patio_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_patio ADD CONSTRAINT tra_patio_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 6
 OR modaluso = 9
 OR modaluso = 14
 OR modaluso = 98
)#
ALTER TABLE cb.tra_patio_a ADD CONSTRAINT tra_patio_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_patio_a ADD CONSTRAINT tra_patio_a_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 6
 OR modaluso = 9
 OR modaluso = 14
 OR modaluso = 98
)#
ALTER TABLE cb.tra_patio_p ADD CONSTRAINT tra_patio_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_patio_p ADD CONSTRAINT tra_patio_p_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 6
 OR modaluso = 9
 OR modaluso = 14
 OR modaluso = 98
)#
ALTER TABLE cb.tra_pista_ponto_pouso ADD CONSTRAINT tra_pista_ponto_pouso_tipopista_ks
 CHECK (tipopista = 9 OR tipopista = 10
 OR tipopista = 11
)#
ALTER TABLE cb.tra_pista_ponto_pouso_a ADD CONSTRAINT tra_pista_ponto_pouso_a_tipopista_ks
 CHECK (tipopista = 9 OR tipopista = 10
 OR tipopista = 11
)#
ALTER TABLE cb.tra_pista_ponto_pouso_l ADD CONSTRAINT tra_pista_ponto_pouso_l_tipopista_ks
 CHECK (tipopista = 9 OR tipopista = 10
 OR tipopista = 11
)#
ALTER TABLE cb.tra_pista_ponto_pouso_p ADD CONSTRAINT tra_pista_ponto_pouso_p_tipopista_ks
 CHECK (tipopista = 9 OR tipopista = 10
 OR tipopista = 11
)#
ALTER TABLE cb.tra_ponte ADD CONSTRAINT tra_ponte_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_ponte ADD CONSTRAINT tra_ponte_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 8
 OR modaluso = 9
)#
ALTER TABLE cb.tra_ponte_l ADD CONSTRAINT tra_ponte_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_ponte_l ADD CONSTRAINT tra_ponte_l_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 8
 OR modaluso = 9
)#
ALTER TABLE cb.tra_ponte_p ADD CONSTRAINT tra_ponte_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_ponte_p ADD CONSTRAINT tra_ponte_p_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 8
 OR modaluso = 9
)#
ALTER TABLE cb.tra_posto_combustivel ADD CONSTRAINT tra_posto_combustivel_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_posto_combustivel ADD CONSTRAINT tra_posto_combustivel_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_posto_combustivel ADD CONSTRAINT tra_posto_combustivel_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_posto_combustivel_a ADD CONSTRAINT tra_posto_combustivel_a_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_posto_combustivel_a ADD CONSTRAINT tra_posto_combustivel_a_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_posto_combustivel_a ADD CONSTRAINT tra_posto_combustivel_a_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_posto_combustivel_p ADD CONSTRAINT tra_posto_combustivel_p_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_posto_combustivel_p ADD CONSTRAINT tra_posto_combustivel_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_posto_combustivel_p ADD CONSTRAINT tra_posto_combustivel_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_travessia_pedestre ADD CONSTRAINT tra_travessia_pedestre_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_travessia_pedestre ADD CONSTRAINT tra_travessia_pedestre_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_travessia_pedestre_l ADD CONSTRAINT tra_travessia_pedestre_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_travessia_pedestre_l ADD CONSTRAINT tra_travessia_pedestre_l_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_travessia_pedestre_p ADD CONSTRAINT tra_travessia_pedestre_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_travessia_pedestre_p ADD CONSTRAINT tra_travessia_pedestre_p_situacaofisica_ks
 CHECK (situacaofisica = 0 OR situacaofisica = 1
 OR situacaofisica = 2
 OR situacaofisica = 5
 OR situacaofisica = 3
)#
ALTER TABLE cb.tra_trecho_duto_l ADD CONSTRAINT tra_trecho_duto_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 4
 OR matconstr = 99
)#
ALTER TABLE cb.tra_trecho_ferroviario_l ADD CONSTRAINT tra_trecho_ferroviario_l_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 7
 OR administracao = 6
 OR administracao = 97
)#
ALTER TABLE cb.tra_trecho_ferroviario_l ADD CONSTRAINT tra_trecho_ferroviario_l_jurisdicao_ks
 CHECK (jurisdicao = 0 OR jurisdicao = 1
 OR jurisdicao = 2
 OR jurisdicao = 3
 OR jurisdicao = 6
)#
ALTER TABLE cb.tra_trecho_ferroviario_l ADD CONSTRAINT tra_trecho_ferroviario_l_posicaorelativa_ks
 CHECK (posicaorelativa = 0 OR posicaorelativa = 6
 OR posicaorelativa = 3
 OR posicaorelativa = 2
)#
ALTER TABLE cb.tra_trecho_hidroviario_l ADD CONSTRAINT tra_trecho_hidroviario_l_regime_ks
 CHECK (regime = 0 OR regime = 1
 OR regime = 6
)#
ALTER TABLE cb.tra_trecho_rodoviario_l ADD CONSTRAINT tra_trecho_rodoviario_l_administracao_ks
 CHECK (administracao = 0 OR administracao = 1
 OR administracao = 2
 OR administracao = 3
 OR administracao = 6
 OR administracao = 7
 OR administracao = 9
 OR administracao = 10
 OR administracao = 11
 OR administracao = 12
)#
ALTER TABLE cb.tra_trecho_rodoviario_l ADD CONSTRAINT tra_trecho_rodoviario_l_jurisdicao_ks
 CHECK (jurisdicao = 0 OR jurisdicao = 1
 OR jurisdicao = 2
 OR jurisdicao = 3
 OR jurisdicao = 8
 OR jurisdicao = 9
 OR jurisdicao = 10
 OR jurisdicao = 11
 OR jurisdicao = 12
)#
ALTER TABLE cb.tra_tunel ADD CONSTRAINT tra_tunel_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_tunel ADD CONSTRAINT tra_tunel_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 6
 OR modaluso = 7
 OR modaluso = 8
)#
ALTER TABLE cb.tra_tunel_l ADD CONSTRAINT tra_tunel_l_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_tunel_l ADD CONSTRAINT tra_tunel_l_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 6
 OR modaluso = 7
 OR modaluso = 8
)#
ALTER TABLE cb.tra_tunel_p ADD CONSTRAINT tra_tunel_p_matconstr_ks
 CHECK (matconstr = 0 OR matconstr = 1
 OR matconstr = 2
 OR matconstr = 3
 OR matconstr = 5
 OR matconstr = 99
)#
ALTER TABLE cb.tra_tunel_p ADD CONSTRAINT tra_tunel_p_modaluso_ks
 CHECK (modaluso = 4 OR modaluso = 5
 OR modaluso = 6
 OR modaluso = 7
 OR modaluso = 8
)#
ALTER TABLE cb.veg_brejo_pantano_a ADD CONSTRAINT veg_brejo_pantano_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_caatinga_a ADD CONSTRAINT veg_caatinga_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_campinarana_a ADD CONSTRAINT veg_campinarana_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_cerrado_cerradao_a ADD CONSTRAINT veg_cerrado_cerradao_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_floresta_a ADD CONSTRAINT veg_floresta_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_macega_chavascal_a ADD CONSTRAINT veg_macega_chavascal_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_mangue_a ADD CONSTRAINT veg_mangue_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_veg_area_contato_a ADD CONSTRAINT veg_veg_area_contato_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.veg_veg_cultivada_a ADD CONSTRAINT veg_veg_cultivada_a_classificacaoporte_ks
 CHECK (classificacaoporte = 0 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 3
)#
ALTER TABLE cb.veg_veg_restinga_a ADD CONSTRAINT veg_veg_restinga_a_classificacaoporte_ks
 CHECK (classificacaoporte = 1 OR classificacaoporte = 2
 OR classificacaoporte = 98
 OR classificacaoporte = 0
)#
ALTER TABLE cb.aux_descontinuidade_geometrica ADD CONSTRAINT aux_descontinuidade_geometrica_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.aux_descontinuidade_geometrica_p ADD CONSTRAINT aux_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.hid_descontinuidade_geometrica_p ADD CONSTRAINT hid_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.aux_descontinuidade_geometrica_l ADD CONSTRAINT aux_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.hid_descontinuidade_geometrica_l ADD CONSTRAINT hid_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.rel_descontinuidade_geometrica_p ADD CONSTRAINT rel_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.rel_descontinuidade_geometrica_l ADD CONSTRAINT rel_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.aux_descontinuidade_geometrica_a ADD CONSTRAINT aux_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.rel_descontinuidade_geometrica_a ADD CONSTRAINT rel_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.veg_descontinuidade_geometrica_p ADD CONSTRAINT veg_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.veg_descontinuidade_geometrica_l ADD CONSTRAINT veg_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.tra_descontinuidade_geometrica_p ADD CONSTRAINT tra_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.tra_descontinuidade_geometrica_l ADD CONSTRAINT tra_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.tra_descontinuidade_geometrica_a ADD CONSTRAINT tra_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.enc_descontinuidade_geometrica_a ADD CONSTRAINT enc_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.enc_descontinuidade_geometrica_p ADD CONSTRAINT enc_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.asb_descontinuidade_geometrica_p ADD CONSTRAINT asb_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.asb_descontinuidade_geometrica_l ADD CONSTRAINT asb_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.asb_descontinuidade_geometrica_a ADD CONSTRAINT asb_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.edu_descontinuidade_geometrica_a ADD CONSTRAINT edu_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.edu_descontinuidade_geometrica_l ADD CONSTRAINT edu_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.edu_descontinuidade_geometrica_p ADD CONSTRAINT edu_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.eco_descontinuidade_geometrica_p ADD CONSTRAINT eco_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.eco_descontinuidade_geometrica_l ADD CONSTRAINT eco_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.eco_descontinuidade_geometrica_a ADD CONSTRAINT eco_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.loc_descontinuidade_geometrica_a ADD CONSTRAINT loc_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.loc_descontinuidade_geometrica_l ADD CONSTRAINT loc_descontinuidade_geometrica_l_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.loc_descontinuidade_geometrica_p ADD CONSTRAINT loc_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.pto_descontinuidade_geometrica_p ADD CONSTRAINT pto_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.pto_descontinuidade_geometrica_a ADD CONSTRAINT pto_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.lim_descontinuidade_geometrica_p ADD CONSTRAINT lim_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.lim_descontinuidade_geometrica_a ADD CONSTRAINT lim_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.adm_descontinuidade_geometrica_p ADD CONSTRAINT adm_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.adm_descontinuidade_geometrica_a ADD CONSTRAINT adm_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.sau_descontinuidade_geometrica_a ADD CONSTRAINT sau_descontinuidade_geometrica_a_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.sau_descontinuidade_geometrica_p ADD CONSTRAINT sau_descontinuidade_geometrica_p_geometriaaproximada_ks
 CHECK (geometriaaproximada = 1)#
ALTER TABLE cb.adm_area_pub_civil_a
  ADD CONSTRAINT adm_area_pub_civil_a_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_area_pub_militar_a
  ADD CONSTRAINT adm_area_pub_militar_a_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_a
  ADD CONSTRAINT adm_edif_pub_civil_a_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_civil_p
  ADD CONSTRAINT adm_edif_pub_civil_p_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_a
  ADD CONSTRAINT adm_edif_pub_militar_a_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_edif_pub_militar_p
  ADD CONSTRAINT adm_edif_pub_militar_p_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_instituicao_publica
  ADD CONSTRAINT adm_instituicao_publica_id_instituicao_publica_fk FOREIGN KEY (id_instituicao_publica)
   REFERENCES complexos.adm_instituicao_publica (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_civil
  ADD CONSTRAINT adm_org_pub_civil_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_civil
  ADD CONSTRAINT adm_org_pub_civil_id_instituicao_publica_fk FOREIGN KEY (id_instituicao_publica)
   REFERENCES complexos.adm_instituicao_publica (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_militar
  ADD CONSTRAINT adm_org_pub_militar_id_instituicao_publica_fk FOREIGN KEY (id_instituicao_publica)
   REFERENCES complexos.adm_instituicao_publica (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.adm_org_pub_militar
  ADD CONSTRAINT adm_org_pub_militar_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal
  ADD CONSTRAINT adm_posto_fiscal_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_a
  ADD CONSTRAINT adm_posto_fiscal_a_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_fiscal_p
  ADD CONSTRAINT adm_posto_fiscal_p_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod
  ADD CONSTRAINT adm_posto_pol_rod_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod
  ADD CONSTRAINT adm_posto_pol_rod_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_a
  ADD CONSTRAINT adm_posto_pol_rod_a_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_a
  ADD CONSTRAINT adm_posto_pol_rod_a_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_p
  ADD CONSTRAINT adm_posto_pol_rod_p_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.adm_posto_pol_rod_p
  ADD CONSTRAINT adm_posto_pol_rod_p_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_area_abast_agua_a
  ADD CONSTRAINT asb_area_abast_agua_a_id_complexo_abast_agua_fk FOREIGN KEY (id_complexo_abast_agua)
   REFERENCES complexos.asb_complexo_abast_agua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_area_saneamento_a
  ADD CONSTRAINT asb_area_saneamento_a_id_complexo_saneamento_fk FOREIGN KEY (id_complexo_saneamento)
   REFERENCES complexos.asb_complexo_saneamento (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.asb_complexo_abast_agua
  ADD CONSTRAINT asb_complexo_abast_agua_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.asb_complexo_saneamento
  ADD CONSTRAINT asb_complexo_saneamento_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_id_complexo_abast_agua_fk FOREIGN KEY (id_complexo_abast_agua)
   REFERENCES complexos.asb_complexo_abast_agua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua
  ADD CONSTRAINT asb_dep_abast_agua_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_id_complexo_abast_agua_fk FOREIGN KEY (id_complexo_abast_agua)
   REFERENCES complexos.asb_complexo_abast_agua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_a
  ADD CONSTRAINT asb_dep_abast_agua_a_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_abast_agua_p
  ADD CONSTRAINT asb_dep_abast_agua_p_id_complexo_abast_agua_fk FOREIGN KEY (id_complexo_abast_agua)
   REFERENCES complexos.asb_complexo_abast_agua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento
  ADD CONSTRAINT asb_dep_saneamento_id_complexo_saneamento_fk FOREIGN KEY (id_complexo_saneamento)
   REFERENCES complexos.asb_complexo_saneamento (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_a
  ADD CONSTRAINT asb_dep_saneamento_a_id_complexo_saneamento_fk FOREIGN KEY (id_complexo_saneamento)
   REFERENCES complexos.asb_complexo_saneamento (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_dep_saneamento_p
  ADD CONSTRAINT asb_dep_saneamento_p_id_complexo_saneamento_fk FOREIGN KEY (id_complexo_saneamento)
   REFERENCES complexos.asb_complexo_saneamento (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_a
  ADD CONSTRAINT asb_edif_abast_agua_a_id_complexo_abast_agua_fk FOREIGN KEY (id_complexo_abast_agua)
   REFERENCES complexos.asb_complexo_abast_agua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_abast_agua_p
  ADD CONSTRAINT asb_edif_abast_agua_p_id_complexo_abast_agua_fk FOREIGN KEY (id_complexo_abast_agua)
   REFERENCES complexos.asb_complexo_abast_agua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_a
  ADD CONSTRAINT asb_edif_saneamento_a_id_complexo_saneamento_fk FOREIGN KEY (id_complexo_saneamento)
   REFERENCES complexos.asb_complexo_saneamento (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.asb_edif_saneamento_p
  ADD CONSTRAINT asb_edif_saneamento_p_id_complexo_saneamento_fk FOREIGN KEY (id_complexo_saneamento)
   REFERENCES complexos.asb_complexo_saneamento (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_area_agrop_ext_veg_pesca_a_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_comerc_serv_a
  ADD CONSTRAINT eco_area_comerc_serv_a_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_ext_mineral_a
  ADD CONSTRAINT eco_area_ext_mineral_a_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_area_industrial_a
  ADD CONSTRAINT eco_area_industrial_a_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral
  ADD CONSTRAINT eco_deposito_geral_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_a
  ADD CONSTRAINT eco_deposito_geral_a_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_deposito_geral_p
  ADD CONSTRAINT eco_deposito_geral_p_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  ADD CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_a
  ADD CONSTRAINT eco_edif_comerc_serv_a_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_comerc_serv_p
  ADD CONSTRAINT eco_edif_comerc_serv_p_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_a
  ADD CONSTRAINT eco_edif_ext_mineral_a_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_ext_mineral_p
  ADD CONSTRAINT eco_edif_ext_mineral_p_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_a
  ADD CONSTRAINT eco_edif_industrial_a_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_edif_industrial_p
  ADD CONSTRAINT eco_edif_industrial_p_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec
  ADD CONSTRAINT eco_equip_agropec_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_a
  ADD CONSTRAINT eco_equip_agropec_a_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_l
  ADD CONSTRAINT eco_equip_agropec_l_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_equip_agropec_p
  ADD CONSTRAINT eco_equip_agropec_p_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral
  ADD CONSTRAINT eco_ext_mineral_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_a
  ADD CONSTRAINT eco_ext_mineral_a_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.eco_ext_mineral_p
  ADD CONSTRAINT eco_ext_mineral_p_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_frigorifico_matadouro
  ADD CONSTRAINT eco_frigorifico_matadouro_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_frigorifico_matadouro
  ADD CONSTRAINT eco_frigorifico_matadouro_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_frigorifico_matadouro
  ADD CONSTRAINT eco_frigorifico_matadouro_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_madeireira
  ADD CONSTRAINT eco_madeireira_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_madeireira
  ADD CONSTRAINT eco_madeireira_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_madeireira
  ADD CONSTRAINT eco_madeireira_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_industrial
  ADD CONSTRAINT eco_org_industrial_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.eco_org_industrial
  ADD CONSTRAINT eco_org_industrial_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_ensino_a
  ADD CONSTRAINT edu_area_ensino_a_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_lazer_a
  ADD CONSTRAINT edu_area_lazer_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_religiosa_a
  ADD CONSTRAINT edu_area_religiosa_a_id_org_religiosa_fk FOREIGN KEY (id_org_religiosa)
   REFERENCES complexos.edu_org_religiosa (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_area_ruinas_a
  ADD CONSTRAINT edu_area_ruinas_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada
  ADD CONSTRAINT edu_arquibancada_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_a
  ADD CONSTRAINT edu_arquibancada_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_arquibancada_p
  ADD CONSTRAINT edu_arquibancada_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra
  ADD CONSTRAINT edu_campo_quadra_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_a
  ADD CONSTRAINT edu_campo_quadra_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_campo_quadra_p
  ADD CONSTRAINT edu_campo_quadra_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_id_org_religiosa_fk FOREIGN KEY (id_org_religiosa)
   REFERENCES complexos.edu_org_religiosa (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_complexo_lazer
  ADD CONSTRAINT edu_complexo_lazer_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna
  ADD CONSTRAINT edu_coreto_tribuna_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_a
  ADD CONSTRAINT edu_coreto_tribuna_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_coreto_tribuna_p
  ADD CONSTRAINT edu_coreto_tribuna_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_a
  ADD CONSTRAINT edu_edif_const_lazer_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_lazer_p
  ADD CONSTRAINT edu_edif_const_lazer_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_a
  ADD CONSTRAINT edu_edif_const_turistica_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_const_turistica_p
  ADD CONSTRAINT edu_edif_const_turistica_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_a
  ADD CONSTRAINT edu_edif_ensino_a_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_ensino_p
  ADD CONSTRAINT edu_edif_ensino_p_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_a
  ADD CONSTRAINT edu_edif_religiosa_a_id_org_religiosa_fk FOREIGN KEY (id_org_religiosa)
   REFERENCES complexos.edu_org_religiosa (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_edif_religiosa_p
  ADD CONSTRAINT edu_edif_religiosa_p_id_org_religiosa_fk FOREIGN KEY (id_org_religiosa)
   REFERENCES complexos.edu_org_religiosa (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_militar
  ADD CONSTRAINT edu_org_ensino_militar_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_pub
  ADD CONSTRAINT edu_org_ensino_pub_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.edu_org_ensino_religioso
  ADD CONSTRAINT edu_org_ensino_religioso_id_org_religiosa_fk FOREIGN KEY (id_org_religiosa)
   REFERENCES complexos.edu_org_religiosa (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_piscina_a
  ADD CONSTRAINT edu_piscina_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_pista_competicao_l
  ADD CONSTRAINT edu_pista_competicao_l_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_ruina
  ADD CONSTRAINT edu_ruina_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_ruina_a
  ADD CONSTRAINT edu_ruina_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.edu_ruina_p
  ADD CONSTRAINT edu_ruina_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_antena_comunic_p
  ADD CONSTRAINT enc_antena_comunic_p_id_complexo_comunicacao_fk FOREIGN KEY (id_complexo_comunicacao)
   REFERENCES complexos.enc_complexo_comunicacao (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_area_comunicacao_a
  ADD CONSTRAINT enc_area_comunicacao_a_id_complexo_comunicacao_fk FOREIGN KEY (id_complexo_comunicacao)
   REFERENCES complexos.enc_complexo_comunicacao (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_area_energia_eletrica_a
  ADD CONSTRAINT enc_area_energia_eletrica_a_id_subestacao_ener_eletr_fk FOREIGN KEY (id_subestacao_ener_eletr)
   REFERENCES complexos.enc_subestacao_ener_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_area_energia_eletrica_a
  ADD CONSTRAINT enc_area_energia_eletrica_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_complexo_comunicacao
  ADD CONSTRAINT enc_complexo_comunicacao_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_complexo_comunicacao
  ADD CONSTRAINT enc_complexo_comunicacao_id_complexo_comunicacao_fk FOREIGN KEY (id_complexo_comunicacao)
   REFERENCES complexos.enc_complexo_comunicacao (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_complexo_gerad_energ_eletr
  ADD CONSTRAINT enc_complexo_gerad_energ_eletr_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_a
  ADD CONSTRAINT enc_edif_comunic_a_id_complexo_comunicacao_fk FOREIGN KEY (id_complexo_comunicacao)
   REFERENCES complexos.enc_complexo_comunicacao (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_comunic_p
  ADD CONSTRAINT enc_edif_comunic_p_id_complexo_comunicacao_fk FOREIGN KEY (id_complexo_comunicacao)
   REFERENCES complexos.enc_complexo_comunicacao (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_a
  ADD CONSTRAINT enc_edif_energia_a_id_subestacao_ener_eletr_fk FOREIGN KEY (id_subestacao_ener_eletr)
   REFERENCES complexos.enc_subestacao_ener_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_edif_energia_p
  ADD CONSTRAINT enc_edif_energia_p_id_subestacao_ener_eletr_fk FOREIGN KEY (id_subestacao_ener_eletr)
   REFERENCES complexos.enc_subestacao_ener_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  ADD CONSTRAINT enc_est_gerad_energia_eletr_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  ADD CONSTRAINT enc_est_gerad_energia_eletr_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  ADD CONSTRAINT enc_est_gerad_energia_eletr_l_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  ADD CONSTRAINT enc_est_gerad_energia_eletr_p_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_grupo_transformadores
  ADD CONSTRAINT enc_grupo_transformadores_id_subestacao_ener_eletr_fk FOREIGN KEY (id_subestacao_ener_eletr)
   REFERENCES complexos.enc_subestacao_ener_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_grupo_transformadores_a
  ADD CONSTRAINT enc_grupo_transformadores_a_id_subestacao_ener_eletr_fk FOREIGN KEY (id_subestacao_ener_eletr)
   REFERENCES complexos.enc_subestacao_ener_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_grupo_transformadores_p
  ADD CONSTRAINT enc_grupo_transformadores_p_id_subestacao_ener_eletr_fk FOREIGN KEY (id_subestacao_ener_eletr)
   REFERENCES complexos.enc_subestacao_ener_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_a
  ADD CONSTRAINT enc_hidreletrica_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_l
  ADD CONSTRAINT enc_hidreletrica_l_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_hidreletrica_p
  ADD CONSTRAINT enc_hidreletrica_p_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.enc_subestacao_ener_eletr
  ADD CONSTRAINT enc_subestacao_ener_eletr_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_a
  ADD CONSTRAINT enc_termeletrica_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_termeletrica_p
  ADD CONSTRAINT enc_termeletrica_p_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_torre_comunic_p
  ADD CONSTRAINT enc_torre_comunic_p_id_complexo_comunicacao_fk FOREIGN KEY (id_complexo_comunicacao)
   REFERENCES complexos.enc_complexo_comunicacao (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_comunic_l
  ADD CONSTRAINT enc_trecho_comunic_l_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.enc_trecho_energia_l
  ADD CONSTRAINT enc_trecho_energia_l_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem
  ADD CONSTRAINT hid_barragem_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_a
  ADD CONSTRAINT hid_barragem_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_l
  ADD CONSTRAINT hid_barragem_l_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_barragem_p
  ADD CONSTRAINT hid_barragem_p_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_reservatorio_hidrico_a
  ADD CONSTRAINT hid_reservatorio_hidrico_a_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.hid_trecho_curso_dagua
  ADD CONSTRAINT hid_trecho_curso_dagua_id_curso_dagua_fk FOREIGN KEY (id_curso_dagua)
   REFERENCES complexos.hid_curso_dagua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_drenagem_l
  ADD CONSTRAINT hid_trecho_drenagem_l_id_trecho_curso_dagua_fk FOREIGN KEY (id_trecho_curso_dagua)
   REFERENCES complexos.hid_trecho_curso_dagua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.hid_trecho_massa_dagua_a
  ADD CONSTRAINT hid_trecho_massa_dagua_a_id_trecho_curso_dagua_fk FOREIGN KEY (id_trecho_curso_dagua)
   REFERENCES complexos.hid_trecho_curso_dagua (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_area_habitacional_a
  ADD CONSTRAINT loc_area_habitacional_a_id_complexo_habitacional_fk FOREIGN KEY (id_complexo_habitacional)
   REFERENCES complexos.loc_complexo_habitacional (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_a
  ADD CONSTRAINT loc_edif_habitacional_a_id_complexo_habitacional_fk FOREIGN KEY (id_complexo_habitacional)
   REFERENCES complexos.loc_complexo_habitacional (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_edif_habitacional_p
  ADD CONSTRAINT loc_edif_habitacional_p_id_complexo_habitacional_fk FOREIGN KEY (id_complexo_habitacional)
   REFERENCES complexos.loc_complexo_habitacional (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena
  ADD CONSTRAINT loc_hab_indigena_id_aldeia_indigena_fk FOREIGN KEY (id_aldeia_indigena)
   REFERENCES complexos.loc_aldeia_indigena (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_a
  ADD CONSTRAINT loc_hab_indigena_a_id_aldeia_indigena_fk FOREIGN KEY (id_aldeia_indigena)
   REFERENCES complexos.loc_aldeia_indigena (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.loc_hab_indigena_p
  ADD CONSTRAINT loc_hab_indigena_p_id_aldeia_indigena_fk FOREIGN KEY (id_aldeia_indigena)
   REFERENCES complexos.loc_aldeia_indigena (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_area_est_med_fenom_a
  ADD CONSTRAINT pto_area_est_med_fenom_a_id_est_med_fenomenos_fk FOREIGN KEY (id_est_med_fenomenos)
   REFERENCES complexos.pto_est_med_fenomenos (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.pto_est_med_fenomenos
  ADD CONSTRAINT pto_est_med_fenomenos_id_est_med_fenomenos_fk FOREIGN KEY (id_est_med_fenomenos)
   REFERENCES complexos.pto_est_med_fenomenos (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.pto_pto_est_med_fenomenos_p
  ADD CONSTRAINT pto_pto_est_med_fenomenos_p_id_est_med_fenomenos_fk FOREIGN KEY (id_est_med_fenomenos)
   REFERENCES complexos.pto_est_med_fenomenos (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_area_saude_a
  ADD CONSTRAINT sau_area_saude_a_id_org_saude_fk FOREIGN KEY (id_org_saude)
   REFERENCES complexos.sau_org_saude (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_area_servico_social_a
  ADD CONSTRAINT sau_area_servico_social_a_id_org_servico_social_fk FOREIGN KEY (id_org_servico_social)
   REFERENCES complexos.sau_org_servico_social (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_a
  ADD CONSTRAINT sau_edif_saude_a_id_org_saude_fk FOREIGN KEY (id_org_saude)
   REFERENCES complexos.sau_org_saude (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_saude_p
  ADD CONSTRAINT sau_edif_saude_p_id_org_saude_fk FOREIGN KEY (id_org_saude)
   REFERENCES complexos.sau_org_saude (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_a
  ADD CONSTRAINT sau_edif_servico_social_a_id_org_servico_social_fk FOREIGN KEY (id_org_servico_social)
   REFERENCES complexos.sau_org_servico_social (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.sau_edif_servico_social_p
  ADD CONSTRAINT sau_edif_servico_social_p_id_org_servico_social_fk FOREIGN KEY (id_org_servico_social)
   REFERENCES complexos.sau_org_servico_social (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_militar
  ADD CONSTRAINT sau_org_saude_militar_id_org_pub_militar_fk FOREIGN KEY (id_org_pub_militar)
   REFERENCES complexos.adm_org_pub_militar (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_saude_pub
  ADD CONSTRAINT sau_org_saude_pub_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE complexos.sau_org_servico_social_pub
  ADD CONSTRAINT sau_org_servico_social_pub_id_org_pub_civil_fk FOREIGN KEY (id_org_pub_civil)
   REFERENCES complexos.adm_org_pub_civil (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_area_estrut_transporte_a
  ADD CONSTRAINT tra_area_estrut_transporte_a_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro
  ADD CONSTRAINT tra_atracadouro_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_a
  ADD CONSTRAINT tra_atracadouro_a_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_l
  ADD CONSTRAINT tra_atracadouro_l_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_atracadouro_p
  ADD CONSTRAINT tra_atracadouro_p_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_caminho_aereo_l
  ADD CONSTRAINT tra_caminho_aereo_l_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_id_complexo_gerad_energ_eletr_fk FOREIGN KEY (id_complexo_gerad_energ_eletr)
   REFERENCES complexos.enc_complexo_gerad_energ_eletr (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_condutor_hidrico_l
  ADD CONSTRAINT tra_condutor_hidrico_l_id_duto_fk FOREIGN KEY (id_duto)
   REFERENCES complexos.tra_duto (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_a_id_complexo_aeroportuario_fk FOREIGN KEY (id_complexo_aeroportuario)
   REFERENCES complexos.tra_complexo_aeroportuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  ADD CONSTRAINT tra_edif_constr_aeroportuaria_p_id_complexo_aeroportuario_fk FOREIGN KEY (id_complexo_aeroportuario)
   REFERENCES complexos.tra_complexo_aeroportuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  ADD CONSTRAINT tra_edif_constr_portuaria_a_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  ADD CONSTRAINT tra_edif_constr_portuaria_p_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  ADD CONSTRAINT tra_edif_metro_ferroviaria_a_id_estrut_apoio_fk FOREIGN KEY (id_estrut_apoio)
   REFERENCES complexos.tra_estrut_apoio (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  ADD CONSTRAINT tra_edif_metro_ferroviaria_p_id_estrut_apoio_fk FOREIGN KEY (id_estrut_apoio)
   REFERENCES complexos.tra_estrut_apoio (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_a
  ADD CONSTRAINT tra_edif_rodoviaria_a_id_estrut_apoio_fk FOREIGN KEY (id_estrut_apoio)
   REFERENCES complexos.tra_estrut_apoio (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_edif_rodoviaria_p
  ADD CONSTRAINT tra_edif_rodoviaria_p_id_estrut_apoio_fk FOREIGN KEY (id_estrut_apoio)
   REFERENCES complexos.tra_estrut_apoio (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro
  ADD CONSTRAINT tra_fundeadouro_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_a
  ADD CONSTRAINT tra_fundeadouro_a_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_l
  ADD CONSTRAINT tra_fundeadouro_l_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_fundeadouro_p
  ADD CONSTRAINT tra_fundeadouro_p_id_complexo_portuario_fk FOREIGN KEY (id_complexo_portuario)
   REFERENCES complexos.tra_complexo_portuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular
  ADD CONSTRAINT tra_funicular_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular
  ADD CONSTRAINT tra_funicular_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_l
  ADD CONSTRAINT tra_funicular_l_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_l
  ADD CONSTRAINT tra_funicular_l_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_p
  ADD CONSTRAINT tra_funicular_p_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_funicular_p
  ADD CONSTRAINT tra_funicular_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_girador_ferroviario_p
  ADD CONSTRAINT tra_girador_ferroviario_p_id_estrut_apoio_fk FOREIGN KEY (id_estrut_apoio)
   REFERENCES complexos.tra_estrut_apoio (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_identific_trecho_rod_p
  ADD CONSTRAINT tra_identific_trecho_rod_p_id_via_rodoviaria_fk FOREIGN KEY (id_via_rodoviaria)
   REFERENCES complexos.tra_via_rodoviaria (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio
  ADD CONSTRAINT tra_patio_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_a
  ADD CONSTRAINT tra_patio_a_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_complexo_lazer_fk FOREIGN KEY (id_complexo_lazer)
   REFERENCES complexos.edu_complexo_lazer (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_org_ext_mineral_fk FOREIGN KEY (id_org_ext_mineral)
   REFERENCES complexos.eco_org_ext_mineral (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_org_agropec_ext_veg_pesca_fk FOREIGN KEY (id_org_agropec_ext_veg_pesca)
   REFERENCES complexos.eco_org_agrop_ext_veg_pesca (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_org_industrial_fk FOREIGN KEY (id_org_industrial)
   REFERENCES complexos.eco_org_industrial (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_org_ensino_fk FOREIGN KEY (id_org_ensino)
   REFERENCES complexos.edu_org_ensino_religioso (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_patio_p
  ADD CONSTRAINT tra_patio_p_id_org_comerc_serv_fk FOREIGN KEY (id_org_comerc_serv)
   REFERENCES complexos.eco_org_comerc_serv (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso
  ADD CONSTRAINT tra_pista_ponto_pouso_id_complexo_aeroportuario_fk FOREIGN KEY (id_complexo_aeroportuario)
   REFERENCES complexos.tra_complexo_aeroportuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  ADD CONSTRAINT tra_pista_ponto_pouso_a_id_complexo_aeroportuario_fk FOREIGN KEY (id_complexo_aeroportuario)
   REFERENCES complexos.tra_complexo_aeroportuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  ADD CONSTRAINT tra_pista_ponto_pouso_l_id_complexo_aeroportuario_fk FOREIGN KEY (id_complexo_aeroportuario)
   REFERENCES complexos.tra_complexo_aeroportuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  ADD CONSTRAINT tra_pista_ponto_pouso_p_id_complexo_aeroportuario_fk FOREIGN KEY (id_complexo_aeroportuario)
   REFERENCES complexos.tra_complexo_aeroportuario (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel
  ADD CONSTRAINT tra_posto_combustivel_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_a
  ADD CONSTRAINT tra_posto_combustivel_a_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_posto_combustivel_p
  ADD CONSTRAINT tra_posto_combustivel_p_id_estrut_transporte_fk FOREIGN KEY (id_estrut_transporte)
   REFERENCES complexos.tra_estrut_transporte (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_duto_l
  ADD CONSTRAINT tra_trecho_duto_l_id_duto_fk FOREIGN KEY (id_duto)
   REFERENCES complexos.tra_duto (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_ferroviario_l
  ADD CONSTRAINT tra_trecho_ferroviario_l_id_via_ferrea_fk FOREIGN KEY (id_via_ferrea)
   REFERENCES complexos.tra_via_ferrea (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_hidroviario_l
  ADD CONSTRAINT tra_trecho_hidroviario_l_id_hidrovia_fk FOREIGN KEY (id_hidrovia)
   REFERENCES complexos.tra_hidrovia (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
ALTER TABLE cb.tra_trecho_rodoviario_l
  ADD CONSTRAINT tra_trecho_rodoviario_l_id_via_rodoviaria_fk FOREIGN KEY (id_via_rodoviaria)
   REFERENCES complexos.tra_via_rodoviaria (id) MATCH FULL
   ON UPDATE NO ACTION ON DELETE NO ACTION#
CREATE TABLE public.complex_schema as
select distinct * from (select nsp.nspname as complex_schema, t2.relname as complex, npsagreg.nspname as aggregated_schema, t.relname as aggregated_class, at1.attname as column_name
from pg_constraint c
        left join pg_class t on c.conrelid = t.oid left join pg_class t2 on c.confrelid = t2.oid
        left join pg_namespace nsp on t2.relnamespace = nsp.oid
        left join pg_attribute as at1 on (at1.attnum=c.conkey[1]) and (at1.attrelid=c.conrelid)
        left join pg_namespace npsagreg on t.relnamespace = npsagreg.oid
        where contype = 'f' and (nsp.nspname = 'complexos')
        UNION
select nsp.nspname as complex_schema, COALESCE(inheritancetree.child,t2.relname) as complex, npsagreg.nspname as aggregated_schema, t.relname as aggregated_class, at1.attname as column_name
from pg_constraint c
        left join pg_class t on c.conrelid = t.oid left join pg_class t2 on c.confrelid = t2.oid
        left join pg_namespace nsp on t2.relnamespace = nsp.oid
        join
                (SELECT tier1.*,c.relname AS child, c.oid as childoid, p.relname AS parent, tier2p.relname as grandpa, tier3p.relname as grandgrandpa, tier4p.relname as gggpa, COALESCE(tier4p.relname,tier3p.relname,tier2p.relname,p.relname) as ancestral,COALESCE(tier4p.oid,tier3p.oid,tier2p.oid,p.oid) as ancestralOid
                FROM
                    pg_inherits as tier1
                    left JOIN pg_class AS c ON (inhrelid=c.oid)
                    left JOIN pg_class as p ON (inhparent=p.oid)
                    left join pg_inherits as tier2 on tier2.inhrelid=tier1.inhparent
                    left JOIN pg_class as tier2p ON (tier2.inhparent=tier2p.oid)
                    left join pg_inherits as tier3 on tier3.inhrelid=tier2.inhparent
                    left JOIN pg_class as tier3p ON (tier3.inhparent=tier3p.oid)
                    left join pg_inherits as tier4 on tier4.inhrelid=tier3.inhparent
                    left JOIN pg_class as tier4p ON (tier4.inhparent=tier4p.oid)
                    ) as inheritancetree
                on t2.oid=ancestralOid
        left join pg_attribute as at1 on (at1.attnum=c.conkey[1]) and (at1.attrelid=c.conrelid)
        left join pg_namespace npsagreg on t.relnamespace = npsagreg.oid
        where contype = 'f' and (nsp.nspname = 'complexos')
        order by complex asc) as foo#
ALTER TABLE cb.loc_localidade_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.loc_vila_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.loc_cidade_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.loc_capital_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.edu_complexo_lazer ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.loc_aglomerado_rural_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.sau_org_saude ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.sau_org_saude_pub ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.sau_org_servico_social ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.sau_org_saude_militar ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.sau_org_servico_social_pub ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.adm_instituicao_publica ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.loc_aglomerado_rural_isolado_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.loc_aglom_rural_de_ext_urbana_p ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.hid_curso_dagua ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.hid_trecho_curso_dagua ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.tra_via_rodoviaria ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.tra_via_ferrea ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.tra_hidrovia ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.loc_complexo_habitacional ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE complexos.loc_aldeia_indigena ALTER COLUMN id set default uuid_generate_v4()#
ALTER TABLE cb.adm_area_pub_civil_a
  DROP CONSTRAINT adm_area_pub_civil_a_id_org_pub_civil_fk#
ALTER TABLE cb.adm_area_pub_militar_a
  DROP CONSTRAINT adm_area_pub_militar_a_id_org_pub_militar_fk#
ALTER TABLE cb.adm_edif_pub_civil_a
  DROP CONSTRAINT adm_edif_pub_civil_a_id_org_pub_civil_fk#
ALTER TABLE cb.adm_edif_pub_civil_p
  DROP CONSTRAINT adm_edif_pub_civil_p_id_org_pub_civil_fk#
ALTER TABLE cb.adm_edif_pub_militar_a
  DROP CONSTRAINT adm_edif_pub_militar_a_id_org_pub_militar_fk#
ALTER TABLE cb.adm_edif_pub_militar_p
  DROP CONSTRAINT adm_edif_pub_militar_p_id_org_pub_militar_fk#
ALTER TABLE complexos.adm_instituicao_publica
  DROP CONSTRAINT adm_instituicao_publica_id_instituicao_publica_fk#
ALTER TABLE complexos.adm_org_pub_civil
  DROP CONSTRAINT adm_org_pub_civil_id_org_pub_civil_fk#
ALTER TABLE complexos.adm_org_pub_civil
  DROP CONSTRAINT adm_org_pub_civil_id_instituicao_publica_fk#
ALTER TABLE complexos.adm_org_pub_militar
  DROP CONSTRAINT adm_org_pub_militar_id_instituicao_publica_fk#
ALTER TABLE complexos.adm_org_pub_militar
  DROP CONSTRAINT adm_org_pub_militar_id_org_pub_militar_fk#
ALTER TABLE cb.adm_posto_fiscal
  DROP CONSTRAINT adm_posto_fiscal_id_org_pub_civil_fk#
ALTER TABLE cb.adm_posto_fiscal_a
  DROP CONSTRAINT adm_posto_fiscal_a_id_org_pub_civil_fk#
ALTER TABLE cb.adm_posto_fiscal_p
  DROP CONSTRAINT adm_posto_fiscal_p_id_org_pub_civil_fk#
ALTER TABLE cb.adm_posto_pol_rod
  DROP CONSTRAINT adm_posto_pol_rod_id_org_pub_civil_fk#
ALTER TABLE cb.adm_posto_pol_rod
  DROP CONSTRAINT adm_posto_pol_rod_id_org_pub_militar_fk#
ALTER TABLE cb.adm_posto_pol_rod_a
  DROP CONSTRAINT adm_posto_pol_rod_a_id_org_pub_militar_fk#
ALTER TABLE cb.adm_posto_pol_rod_a
  DROP CONSTRAINT adm_posto_pol_rod_a_id_org_pub_civil_fk#
ALTER TABLE cb.adm_posto_pol_rod_p
  DROP CONSTRAINT adm_posto_pol_rod_p_id_org_pub_militar_fk#
ALTER TABLE cb.adm_posto_pol_rod_p
  DROP CONSTRAINT adm_posto_pol_rod_p_id_org_pub_civil_fk#
ALTER TABLE cb.asb_area_abast_agua_a
  DROP CONSTRAINT asb_area_abast_agua_a_id_complexo_abast_agua_fk#
ALTER TABLE cb.asb_area_saneamento_a
  DROP CONSTRAINT asb_area_saneamento_a_id_complexo_saneamento_fk#
ALTER TABLE complexos.asb_complexo_abast_agua
  DROP CONSTRAINT asb_complexo_abast_agua_id_org_comerc_serv_fk#
ALTER TABLE complexos.asb_complexo_saneamento
  DROP CONSTRAINT asb_complexo_saneamento_id_org_comerc_serv_fk#
ALTER TABLE cb.asb_dep_abast_agua
  DROP CONSTRAINT asb_dep_abast_agua_id_complexo_abast_agua_fk#
ALTER TABLE cb.asb_dep_abast_agua
  DROP CONSTRAINT asb_dep_abast_agua_id_org_industrial_fk#
ALTER TABLE cb.asb_dep_abast_agua
  DROP CONSTRAINT asb_dep_abast_agua_id_org_comerc_serv_fk#
ALTER TABLE cb.asb_dep_abast_agua
  DROP CONSTRAINT asb_dep_abast_agua_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.asb_dep_abast_agua
  DROP CONSTRAINT asb_dep_abast_agua_id_org_ext_mineral_fk#
ALTER TABLE cb.asb_dep_abast_agua_a
  DROP CONSTRAINT asb_dep_abast_agua_a_id_org_comerc_serv_fk#
ALTER TABLE cb.asb_dep_abast_agua_a
  DROP CONSTRAINT asb_dep_abast_agua_a_id_complexo_abast_agua_fk#
ALTER TABLE cb.asb_dep_abast_agua_a
  DROP CONSTRAINT asb_dep_abast_agua_a_id_org_ext_mineral_fk#
ALTER TABLE cb.asb_dep_abast_agua_a
  DROP CONSTRAINT asb_dep_abast_agua_a_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.asb_dep_abast_agua_a
  DROP CONSTRAINT asb_dep_abast_agua_a_id_org_industrial_fk#
ALTER TABLE cb.asb_dep_abast_agua_p
  DROP CONSTRAINT asb_dep_abast_agua_p_id_org_industrial_fk#
ALTER TABLE cb.asb_dep_abast_agua_p
  DROP CONSTRAINT asb_dep_abast_agua_p_id_org_comerc_serv_fk#
ALTER TABLE cb.asb_dep_abast_agua_p
  DROP CONSTRAINT asb_dep_abast_agua_p_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.asb_dep_abast_agua_p
  DROP CONSTRAINT asb_dep_abast_agua_p_id_org_ext_mineral_fk#
ALTER TABLE cb.asb_dep_abast_agua_p
  DROP CONSTRAINT asb_dep_abast_agua_p_id_complexo_abast_agua_fk#
ALTER TABLE cb.asb_dep_saneamento
  DROP CONSTRAINT asb_dep_saneamento_id_complexo_saneamento_fk#
ALTER TABLE cb.asb_dep_saneamento_a
  DROP CONSTRAINT asb_dep_saneamento_a_id_complexo_saneamento_fk#
ALTER TABLE cb.asb_dep_saneamento_p
  DROP CONSTRAINT asb_dep_saneamento_p_id_complexo_saneamento_fk#
ALTER TABLE cb.asb_edif_abast_agua_a
  DROP CONSTRAINT asb_edif_abast_agua_a_id_complexo_abast_agua_fk#
ALTER TABLE cb.asb_edif_abast_agua_p
  DROP CONSTRAINT asb_edif_abast_agua_p_id_complexo_abast_agua_fk#
ALTER TABLE cb.asb_edif_saneamento_a
  DROP CONSTRAINT asb_edif_saneamento_a_id_complexo_saneamento_fk#
ALTER TABLE cb.asb_edif_saneamento_p
  DROP CONSTRAINT asb_edif_saneamento_p_id_complexo_saneamento_fk#
ALTER TABLE cb.eco_area_agrop_ext_veg_pesca_a
  DROP CONSTRAINT eco_area_agrop_ext_veg_pesca_a_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_area_comerc_serv_a
  DROP CONSTRAINT eco_area_comerc_serv_a_id_org_comerc_serv_fk#
ALTER TABLE cb.eco_area_ext_mineral_a
  DROP CONSTRAINT eco_area_ext_mineral_a_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_area_industrial_a
  DROP CONSTRAINT eco_area_industrial_a_id_org_industrial_fk#
ALTER TABLE cb.eco_deposito_geral
  DROP CONSTRAINT eco_deposito_geral_id_estrut_transporte_fk#
ALTER TABLE cb.eco_deposito_geral
  DROP CONSTRAINT eco_deposito_geral_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.eco_deposito_geral
  DROP CONSTRAINT eco_deposito_geral_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_deposito_geral
  DROP CONSTRAINT eco_deposito_geral_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_deposito_geral
  DROP CONSTRAINT eco_deposito_geral_id_org_comerc_serv_fk#
ALTER TABLE cb.eco_deposito_geral
  DROP CONSTRAINT eco_deposito_geral_id_org_industrial_fk#
ALTER TABLE cb.eco_deposito_geral_a
  DROP CONSTRAINT eco_deposito_geral_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.eco_deposito_geral_a
  DROP CONSTRAINT eco_deposito_geral_a_id_org_industrial_fk#
ALTER TABLE cb.eco_deposito_geral_a
  DROP CONSTRAINT eco_deposito_geral_a_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_deposito_geral_a
  DROP CONSTRAINT eco_deposito_geral_a_id_org_comerc_serv_fk#
ALTER TABLE cb.eco_deposito_geral_a
  DROP CONSTRAINT eco_deposito_geral_a_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_deposito_geral_a
  DROP CONSTRAINT eco_deposito_geral_a_id_estrut_transporte_fk#
ALTER TABLE cb.eco_deposito_geral_p
  DROP CONSTRAINT eco_deposito_geral_p_id_org_comerc_serv_fk#
ALTER TABLE cb.eco_deposito_geral_p
  DROP CONSTRAINT eco_deposito_geral_p_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_deposito_geral_p
  DROP CONSTRAINT eco_deposito_geral_p_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_deposito_geral_p
  DROP CONSTRAINT eco_deposito_geral_p_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.eco_deposito_geral_p
  DROP CONSTRAINT eco_deposito_geral_p_id_estrut_transporte_fk#
ALTER TABLE cb.eco_deposito_geral_p
  DROP CONSTRAINT eco_deposito_geral_p_id_org_industrial_fk#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_a
  DROP CONSTRAINT eco_edif_agrop_ext_veg_pesca_a_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_edif_agrop_ext_veg_pesca_p
  DROP CONSTRAINT eco_edif_agrop_ext_veg_pesca_p_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_edif_comerc_serv_a
  DROP CONSTRAINT eco_edif_comerc_serv_a_id_org_comerc_serv_fk#
ALTER TABLE cb.eco_edif_comerc_serv_p
  DROP CONSTRAINT eco_edif_comerc_serv_p_id_org_comerc_serv_fk#
ALTER TABLE cb.eco_edif_ext_mineral_a
  DROP CONSTRAINT eco_edif_ext_mineral_a_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_edif_ext_mineral_p
  DROP CONSTRAINT eco_edif_ext_mineral_p_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_edif_industrial_a
  DROP CONSTRAINT eco_edif_industrial_a_id_org_industrial_fk#
ALTER TABLE cb.eco_edif_industrial_p
  DROP CONSTRAINT eco_edif_industrial_p_id_org_industrial_fk#
ALTER TABLE cb.eco_equip_agropec
  DROP CONSTRAINT eco_equip_agropec_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_equip_agropec_a
  DROP CONSTRAINT eco_equip_agropec_a_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_equip_agropec_l
  DROP CONSTRAINT eco_equip_agropec_l_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_equip_agropec_p
  DROP CONSTRAINT eco_equip_agropec_p_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.eco_ext_mineral
  DROP CONSTRAINT eco_ext_mineral_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_ext_mineral_a
  DROP CONSTRAINT eco_ext_mineral_a_id_org_ext_mineral_fk#
ALTER TABLE cb.eco_ext_mineral_p
  DROP CONSTRAINT eco_ext_mineral_p_id_org_ext_mineral_fk#
ALTER TABLE complexos.eco_frigorifico_matadouro
  DROP CONSTRAINT eco_frigorifico_matadouro_id_org_pub_militar_fk#
ALTER TABLE complexos.eco_frigorifico_matadouro
  DROP CONSTRAINT eco_frigorifico_matadouro_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE complexos.eco_frigorifico_matadouro
  DROP CONSTRAINT eco_frigorifico_matadouro_id_org_pub_civil_fk#
ALTER TABLE complexos.eco_madeireira
  DROP CONSTRAINT eco_madeireira_id_org_pub_civil_fk#
ALTER TABLE complexos.eco_madeireira
  DROP CONSTRAINT eco_madeireira_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE complexos.eco_madeireira
  DROP CONSTRAINT eco_madeireira_id_org_pub_militar_fk#
ALTER TABLE complexos.eco_org_industrial
  DROP CONSTRAINT eco_org_industrial_id_org_pub_militar_fk#
ALTER TABLE complexos.eco_org_industrial
  DROP CONSTRAINT eco_org_industrial_id_org_pub_civil_fk#
ALTER TABLE cb.edu_area_ensino_a
  DROP CONSTRAINT edu_area_ensino_a_id_org_ensino_fk#
ALTER TABLE cb.edu_area_lazer_a
  DROP CONSTRAINT edu_area_lazer_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_area_religiosa_a
  DROP CONSTRAINT edu_area_religiosa_a_id_org_religiosa_fk#
ALTER TABLE cb.edu_area_ruinas_a
  DROP CONSTRAINT edu_area_ruinas_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_arquibancada
  DROP CONSTRAINT edu_arquibancada_id_complexo_lazer_fk#
ALTER TABLE cb.edu_arquibancada_a
  DROP CONSTRAINT edu_arquibancada_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_arquibancada_p
  DROP CONSTRAINT edu_arquibancada_p_id_complexo_lazer_fk#
ALTER TABLE cb.edu_campo_quadra
  DROP CONSTRAINT edu_campo_quadra_id_complexo_lazer_fk#
ALTER TABLE cb.edu_campo_quadra_a
  DROP CONSTRAINT edu_campo_quadra_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_campo_quadra_p
  DROP CONSTRAINT edu_campo_quadra_p_id_complexo_lazer_fk#
ALTER TABLE complexos.edu_complexo_lazer
  DROP CONSTRAINT edu_complexo_lazer_id_org_ensino_fk#
ALTER TABLE complexos.edu_complexo_lazer
  DROP CONSTRAINT edu_complexo_lazer_id_org_pub_militar_fk#
ALTER TABLE complexos.edu_complexo_lazer
  DROP CONSTRAINT edu_complexo_lazer_id_org_religiosa_fk#
ALTER TABLE complexos.edu_complexo_lazer
  DROP CONSTRAINT edu_complexo_lazer_id_org_pub_civil_fk#
ALTER TABLE cb.edu_coreto_tribuna
  DROP CONSTRAINT edu_coreto_tribuna_id_complexo_lazer_fk#
ALTER TABLE cb.edu_coreto_tribuna_a
  DROP CONSTRAINT edu_coreto_tribuna_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_coreto_tribuna_p
  DROP CONSTRAINT edu_coreto_tribuna_p_id_complexo_lazer_fk#
ALTER TABLE cb.edu_edif_const_lazer_a
  DROP CONSTRAINT edu_edif_const_lazer_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_edif_const_lazer_p
  DROP CONSTRAINT edu_edif_const_lazer_p_id_complexo_lazer_fk#
ALTER TABLE cb.edu_edif_const_turistica_a
  DROP CONSTRAINT edu_edif_const_turistica_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_edif_const_turistica_p
  DROP CONSTRAINT edu_edif_const_turistica_p_id_complexo_lazer_fk#
ALTER TABLE cb.edu_edif_ensino_a
  DROP CONSTRAINT edu_edif_ensino_a_id_org_ensino_fk#
ALTER TABLE cb.edu_edif_ensino_p
  DROP CONSTRAINT edu_edif_ensino_p_id_org_ensino_fk#
ALTER TABLE cb.edu_edif_religiosa_a
  DROP CONSTRAINT edu_edif_religiosa_a_id_org_religiosa_fk#
ALTER TABLE cb.edu_edif_religiosa_p
  DROP CONSTRAINT edu_edif_religiosa_p_id_org_religiosa_fk#
ALTER TABLE complexos.edu_org_ensino_militar
  DROP CONSTRAINT edu_org_ensino_militar_id_org_pub_militar_fk#
ALTER TABLE complexos.edu_org_ensino_pub
  DROP CONSTRAINT edu_org_ensino_pub_id_org_pub_civil_fk#
ALTER TABLE complexos.edu_org_ensino_religioso
  DROP CONSTRAINT edu_org_ensino_religioso_id_org_religiosa_fk#
ALTER TABLE cb.edu_piscina_a
  DROP CONSTRAINT edu_piscina_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_pista_competicao_l
  DROP CONSTRAINT edu_pista_competicao_l_id_complexo_lazer_fk#
ALTER TABLE cb.edu_ruina
  DROP CONSTRAINT edu_ruina_id_complexo_lazer_fk#
ALTER TABLE cb.edu_ruina_a
  DROP CONSTRAINT edu_ruina_a_id_complexo_lazer_fk#
ALTER TABLE cb.edu_ruina_p
  DROP CONSTRAINT edu_ruina_p_id_complexo_lazer_fk#
ALTER TABLE cb.enc_antena_comunic_p
  DROP CONSTRAINT enc_antena_comunic_p_id_complexo_comunicacao_fk#
ALTER TABLE cb.enc_area_comunicacao_a
  DROP CONSTRAINT enc_area_comunicacao_a_id_complexo_comunicacao_fk#
ALTER TABLE cb.enc_area_energia_eletrica_a
  DROP CONSTRAINT enc_area_energia_eletrica_a_id_subestacao_ener_eletr_fk#
ALTER TABLE cb.enc_area_energia_eletrica_a
  DROP CONSTRAINT enc_area_energia_eletrica_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE complexos.enc_complexo_comunicacao
  DROP CONSTRAINT enc_complexo_comunicacao_id_org_comerc_serv_fk#
ALTER TABLE complexos.enc_complexo_comunicacao
  DROP CONSTRAINT enc_complexo_comunicacao_id_complexo_comunicacao_fk#
ALTER TABLE complexos.enc_complexo_gerad_energ_eletr
  DROP CONSTRAINT enc_complexo_gerad_energ_eletr_id_org_comerc_serv_fk#
ALTER TABLE cb.enc_edif_comunic_a
  DROP CONSTRAINT enc_edif_comunic_a_id_complexo_comunicacao_fk#
ALTER TABLE cb.enc_edif_comunic_p
  DROP CONSTRAINT enc_edif_comunic_p_id_complexo_comunicacao_fk#
ALTER TABLE cb.enc_edif_energia_a
  DROP CONSTRAINT enc_edif_energia_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_edif_energia_a
  DROP CONSTRAINT enc_edif_energia_a_id_subestacao_ener_eletr_fk#
ALTER TABLE cb.enc_edif_energia_p
  DROP CONSTRAINT enc_edif_energia_p_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_edif_energia_p
  DROP CONSTRAINT enc_edif_energia_p_id_subestacao_ener_eletr_fk#
ALTER TABLE cb.enc_est_gerad_energia_eletr
  DROP CONSTRAINT enc_est_gerad_energia_eletr_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_est_gerad_energia_eletr_a
  DROP CONSTRAINT enc_est_gerad_energia_eletr_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_est_gerad_energia_eletr_l
  DROP CONSTRAINT enc_est_gerad_energia_eletr_l_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_est_gerad_energia_eletr_p
  DROP CONSTRAINT enc_est_gerad_energia_eletr_p_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_grupo_transformadores
  DROP CONSTRAINT enc_grupo_transformadores_id_subestacao_ener_eletr_fk#
ALTER TABLE cb.enc_grupo_transformadores_a
  DROP CONSTRAINT enc_grupo_transformadores_a_id_subestacao_ener_eletr_fk#
ALTER TABLE cb.enc_grupo_transformadores_p
  DROP CONSTRAINT enc_grupo_transformadores_p_id_subestacao_ener_eletr_fk#
ALTER TABLE cb.enc_hidreletrica_a
  DROP CONSTRAINT enc_hidreletrica_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_hidreletrica_l
  DROP CONSTRAINT enc_hidreletrica_l_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_hidreletrica_p
  DROP CONSTRAINT enc_hidreletrica_p_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE complexos.enc_subestacao_ener_eletr
  DROP CONSTRAINT enc_subestacao_ener_eletr_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_termeletrica_a
  DROP CONSTRAINT enc_termeletrica_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_termeletrica_p
  DROP CONSTRAINT enc_termeletrica_p_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.enc_torre_comunic_p
  DROP CONSTRAINT enc_torre_comunic_p_id_complexo_comunicacao_fk#
ALTER TABLE cb.enc_trecho_comunic_l
  DROP CONSTRAINT enc_trecho_comunic_l_id_org_comerc_serv_fk#
ALTER TABLE cb.enc_trecho_energia_l
  DROP CONSTRAINT enc_trecho_energia_l_id_org_comerc_serv_fk#
ALTER TABLE cb.hid_barragem
  DROP CONSTRAINT hid_barragem_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.hid_barragem_a
  DROP CONSTRAINT hid_barragem_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.hid_barragem_l
  DROP CONSTRAINT hid_barragem_l_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.hid_barragem_p
  DROP CONSTRAINT hid_barragem_p_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.hid_reservatorio_hidrico_a
  DROP CONSTRAINT hid_reservatorio_hidrico_a_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE complexos.hid_trecho_curso_dagua
  DROP CONSTRAINT hid_trecho_curso_dagua_id_curso_dagua_fk#
ALTER TABLE cb.hid_trecho_drenagem_l
  DROP CONSTRAINT hid_trecho_drenagem_l_id_trecho_curso_dagua_fk#
ALTER TABLE cb.hid_trecho_massa_dagua_a
  DROP CONSTRAINT hid_trecho_massa_dagua_a_id_trecho_curso_dagua_fk#
ALTER TABLE cb.loc_area_habitacional_a
  DROP CONSTRAINT loc_area_habitacional_a_id_complexo_habitacional_fk#
ALTER TABLE cb.loc_edif_habitacional_a
  DROP CONSTRAINT loc_edif_habitacional_a_id_complexo_habitacional_fk#
ALTER TABLE cb.loc_edif_habitacional_p
  DROP CONSTRAINT loc_edif_habitacional_p_id_complexo_habitacional_fk#
ALTER TABLE cb.loc_hab_indigena
  DROP CONSTRAINT loc_hab_indigena_id_aldeia_indigena_fk#
ALTER TABLE cb.loc_hab_indigena_a
  DROP CONSTRAINT loc_hab_indigena_a_id_aldeia_indigena_fk#
ALTER TABLE cb.loc_hab_indigena_p
  DROP CONSTRAINT loc_hab_indigena_p_id_aldeia_indigena_fk#
ALTER TABLE cb.pto_area_est_med_fenom_a
  DROP CONSTRAINT pto_area_est_med_fenom_a_id_est_med_fenomenos_fk#
ALTER TABLE complexos.pto_est_med_fenomenos
  DROP CONSTRAINT pto_est_med_fenomenos_id_est_med_fenomenos_fk#
ALTER TABLE cb.pto_pto_est_med_fenomenos_p
  DROP CONSTRAINT pto_pto_est_med_fenomenos_p_id_est_med_fenomenos_fk#
ALTER TABLE cb.sau_area_saude_a
  DROP CONSTRAINT sau_area_saude_a_id_org_saude_fk#
ALTER TABLE cb.sau_area_servico_social_a
  DROP CONSTRAINT sau_area_servico_social_a_id_org_servico_social_fk#
ALTER TABLE cb.sau_edif_saude_a
  DROP CONSTRAINT sau_edif_saude_a_id_org_saude_fk#
ALTER TABLE cb.sau_edif_saude_p
  DROP CONSTRAINT sau_edif_saude_p_id_org_saude_fk#
ALTER TABLE cb.sau_edif_servico_social_a
  DROP CONSTRAINT sau_edif_servico_social_a_id_org_servico_social_fk#
ALTER TABLE cb.sau_edif_servico_social_p
  DROP CONSTRAINT sau_edif_servico_social_p_id_org_servico_social_fk#
ALTER TABLE complexos.sau_org_saude_militar
  DROP CONSTRAINT sau_org_saude_militar_id_org_pub_militar_fk#
ALTER TABLE complexos.sau_org_saude_pub
  DROP CONSTRAINT sau_org_saude_pub_id_org_pub_civil_fk#
ALTER TABLE complexos.sau_org_servico_social_pub
  DROP CONSTRAINT sau_org_servico_social_pub_id_org_pub_civil_fk#
ALTER TABLE cb.tra_area_estrut_transporte_a
  DROP CONSTRAINT tra_area_estrut_transporte_a_id_estrut_transporte_fk#
ALTER TABLE cb.tra_atracadouro
  DROP CONSTRAINT tra_atracadouro_id_complexo_portuario_fk#
ALTER TABLE cb.tra_atracadouro_a
  DROP CONSTRAINT tra_atracadouro_a_id_complexo_portuario_fk#
ALTER TABLE cb.tra_atracadouro_l
  DROP CONSTRAINT tra_atracadouro_l_id_complexo_portuario_fk#
ALTER TABLE cb.tra_atracadouro_p
  DROP CONSTRAINT tra_atracadouro_p_id_complexo_portuario_fk#
ALTER TABLE cb.tra_caminho_aereo_l
  DROP CONSTRAINT tra_caminho_aereo_l_id_complexo_lazer_fk#
ALTER TABLE cb.tra_caminho_aereo_l
  DROP CONSTRAINT tra_caminho_aereo_l_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_condutor_hidrico_l
  DROP CONSTRAINT tra_condutor_hidrico_l_id_complexo_gerad_energ_eletr_fk#
ALTER TABLE cb.tra_condutor_hidrico_l
  DROP CONSTRAINT tra_condutor_hidrico_l_id_duto_fk#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_a
  DROP CONSTRAINT tra_edif_constr_aeroportuaria_a_id_complexo_aeroportuario_fk#
ALTER TABLE cb.tra_edif_constr_aeroportuaria_p
  DROP CONSTRAINT tra_edif_constr_aeroportuaria_p_id_complexo_aeroportuario_fk#
ALTER TABLE cb.tra_edif_constr_portuaria_a
  DROP CONSTRAINT tra_edif_constr_portuaria_a_id_complexo_portuario_fk#
ALTER TABLE cb.tra_edif_constr_portuaria_p
  DROP CONSTRAINT tra_edif_constr_portuaria_p_id_complexo_portuario_fk#
ALTER TABLE cb.tra_edif_metro_ferroviaria_a
  DROP CONSTRAINT tra_edif_metro_ferroviaria_a_id_estrut_apoio_fk#
ALTER TABLE cb.tra_edif_metro_ferroviaria_p
  DROP CONSTRAINT tra_edif_metro_ferroviaria_p_id_estrut_apoio_fk#
ALTER TABLE cb.tra_edif_rodoviaria_a
  DROP CONSTRAINT tra_edif_rodoviaria_a_id_estrut_apoio_fk#
ALTER TABLE cb.tra_edif_rodoviaria_p
  DROP CONSTRAINT tra_edif_rodoviaria_p_id_estrut_apoio_fk#
ALTER TABLE cb.tra_fundeadouro
  DROP CONSTRAINT tra_fundeadouro_id_complexo_portuario_fk#
ALTER TABLE cb.tra_fundeadouro_a
  DROP CONSTRAINT tra_fundeadouro_a_id_complexo_portuario_fk#
ALTER TABLE cb.tra_fundeadouro_l
  DROP CONSTRAINT tra_fundeadouro_l_id_complexo_portuario_fk#
ALTER TABLE cb.tra_fundeadouro_p
  DROP CONSTRAINT tra_fundeadouro_p_id_complexo_portuario_fk#
ALTER TABLE cb.tra_funicular
  DROP CONSTRAINT tra_funicular_id_complexo_lazer_fk#
ALTER TABLE cb.tra_funicular
  DROP CONSTRAINT tra_funicular_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_funicular_l
  DROP CONSTRAINT tra_funicular_l_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_funicular_l
  DROP CONSTRAINT tra_funicular_l_id_complexo_lazer_fk#
ALTER TABLE cb.tra_funicular_p
  DROP CONSTRAINT tra_funicular_p_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_funicular_p
  DROP CONSTRAINT tra_funicular_p_id_complexo_lazer_fk#
ALTER TABLE cb.tra_girador_ferroviario_p
  DROP CONSTRAINT tra_girador_ferroviario_p_id_estrut_apoio_fk#
ALTER TABLE cb.tra_identific_trecho_rod_p
  DROP CONSTRAINT tra_identific_trecho_rod_p_id_via_rodoviaria_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_org_comerc_serv_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_estrut_transporte_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_complexo_lazer_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_org_ensino_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_org_industrial_fk#
ALTER TABLE cb.tra_patio
  DROP CONSTRAINT tra_patio_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_org_ensino_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_complexo_lazer_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_estrut_transporte_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_org_industrial_fk#
ALTER TABLE cb.tra_patio_a
  DROP CONSTRAINT tra_patio_a_id_org_comerc_serv_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_complexo_lazer_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_org_ext_mineral_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_estrut_transporte_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_org_agropec_ext_veg_pesca_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_org_industrial_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_org_ensino_fk#
ALTER TABLE cb.tra_patio_p
  DROP CONSTRAINT tra_patio_p_id_org_comerc_serv_fk#
ALTER TABLE cb.tra_pista_ponto_pouso
  DROP CONSTRAINT tra_pista_ponto_pouso_id_complexo_aeroportuario_fk#
ALTER TABLE cb.tra_pista_ponto_pouso_a
  DROP CONSTRAINT tra_pista_ponto_pouso_a_id_complexo_aeroportuario_fk#
ALTER TABLE cb.tra_pista_ponto_pouso_l
  DROP CONSTRAINT tra_pista_ponto_pouso_l_id_complexo_aeroportuario_fk#
ALTER TABLE cb.tra_pista_ponto_pouso_p
  DROP CONSTRAINT tra_pista_ponto_pouso_p_id_complexo_aeroportuario_fk#
ALTER TABLE cb.tra_posto_combustivel
  DROP CONSTRAINT tra_posto_combustivel_id_estrut_transporte_fk#
ALTER TABLE cb.tra_posto_combustivel_a
  DROP CONSTRAINT tra_posto_combustivel_a_id_estrut_transporte_fk#
ALTER TABLE cb.tra_posto_combustivel_p
  DROP CONSTRAINT tra_posto_combustivel_p_id_estrut_transporte_fk#
ALTER TABLE cb.tra_trecho_duto_l
  DROP CONSTRAINT tra_trecho_duto_l_id_duto_fk#
ALTER TABLE cb.tra_trecho_ferroviario_l
  DROP CONSTRAINT tra_trecho_ferroviario_l_id_via_ferrea_fk#
ALTER TABLE cb.tra_trecho_hidroviario_l
  DROP CONSTRAINT tra_trecho_hidroviario_l_id_hidrovia_fk#
ALTER TABLE cb.tra_trecho_rodoviario_l
  DROP CONSTRAINT tra_trecho_rodoviario_l_id_via_rodoviaria_fk