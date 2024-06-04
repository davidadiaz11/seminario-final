INSERT INTO ROLES(ROL_NOMBRE)
VALUES ('Administrador');

INSERT INTO ROLES(ROL_NOMBRE)
VALUES ('Usuario consumidor');


INSERT INTO usuarios (USU_NOMBRE, USU_USUARIOS, USU_CONTRASENA, USU_ROL_ID,
USU_ID_ALTA, USU_ID_MODIFICACION)
VALUES ('Admin', 'Admin', 'Demo123', (select rol_id from roles where rol_nombre='Administrador'), 1, 1);

INSERT INTO tipos_porcion(TPO_NOMBRE, 
TPO_USU_ID_ALTA,
TPO_USU_ID_MODIFICACION)
VALUES ('gramos',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Carbohidratos', 0, 1, 3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Proteínas', 0, 1, 2,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Grasas totales', 0, 1, 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Grasas saturadas', 0, 1, 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Grasas trans', 0, 1, 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Fibra', 0, 1, 3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Sodio', 0, 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Calorías', 0, 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes(NUT_NOMBRE, NUT_ES_OPCIONAL, NUT_ES_CRITICO, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Azúcares añadidos', 0, 1, 3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Dulce de leche repostero Los quebrachitos', 20, 'Leche entera pasteurizada, Azucar, Glucosa', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
12,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
1.2,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
0.8,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
21,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
63,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Dulce de leche repostero Los quebrachitos'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
11.3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

---------------------


INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Queso untable Finlandia Jamón y parmesano', 30, 'Queso (leche, proteínas lácteas, cloruro de calcio, regulador de acidez (ácido cítrico)); jamón cocido; sal; saborizantes; emulsionante (citrato de sodio); conservador (sorbato de potasio, nisina, natamicina); espesantes (goma xántica, garrofín y guar).', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
1.1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
2.8,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
4.7,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
2.9,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
126,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
58,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia Jamón y parmesano'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
1.1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
---------------------


INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Queso untable Finlandia light', 30, 'Queso (leche, proteínas lácteas, cloruro de calcio, regulador de acidez (ácido cítrico)); jamón cocido; sal; emulsionante (citrato de sodio); conservador (sorbato de potasio, nisina, natamicina); aromatizantes; espesantes (goma xántica, garrofín y guar).', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
1.6,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
2.7,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
4.4,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
2.9,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
67,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
57,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Queso untable Finlandia light'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
1.6,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
---------------------
---------------------


INSERT INTO tipos_alerta(tal_nombre, tal_color, tal_forma, tal_es_generica,
tal_USU_ID_ALTA,
tal_USU_ID_MODIFICACION
)
values ('Sello de advertencia', '000000', 1, 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

---------------------
---------------------

INSERT INTO tipos_calculo(TCA_NOMBRE, TCA_NOMBRE_ENUM,
TCA_USU_ID_ALTA,
TCA_USU_ID_MODIFICACION)
VALUES ('Cálculo porcentual', 'CALCULO_PORCENTUAL',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO tipos_calculo(TCA_NOMBRE, TCA_NOMBRE_ENUM,
TCA_USU_ID_ALTA,
TCA_USU_ID_MODIFICACION)
VALUES ('Cálculo cuantitativo 100g', 'CALCULO_CUANTITATIVO_100G',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO tipos_calculo(TCA_NOMBRE, TCA_NOMBRE_ENUM,
TCA_USU_ID_ALTA,
TCA_USU_ID_MODIFICACION)
VALUES ('Cálculo sobre calorías', 'CALCULO_SOBRE_CALORIAS',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);




---------------------
---------------------
---------------------
---------------------


INSERT INTO alertas(ale_nombre, ale_leyenda, ale_tal_id,
ale_USU_ID_ALTA,
ale_USU_ID_MODIFICACION
)
values ('Exceso en sodio', 'Exceso en sodio', (select tal_id from tipos_alerta where tal_nombre='Sello de advertencia'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Exceso en sodio'), (select nut_id from nutrientes where nut_nombre='Sodio'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_CUANTITATIVO_100G'), '>', 300,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Exceso en sodio'), (select nut_id from nutrientes where nut_nombre='Sodio'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_SOBRE_CALORIAS'), '>', 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

-------

INSERT INTO alertas(ale_nombre, ale_leyenda, ale_tal_id,
ale_USU_ID_ALTA,
ale_USU_ID_MODIFICACION
)
values ('Exceso en grasas saturadas', 'Exceso en grasas saturadas', (select tal_id from tipos_alerta where tal_nombre='Sello de advertencia'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Exceso en grasas saturadas'), (select nut_id from nutrientes where nut_nombre='Grasas saturadas'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_PORCENTUAL'), '>', 10,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

-------

INSERT INTO alertas(ale_nombre, ale_leyenda, ale_tal_id,
ale_USU_ID_ALTA,
ale_USU_ID_MODIFICACION
)
values ('Exceso en grasas totales', 'Exceso en grasas totales', (select tal_id from tipos_alerta where tal_nombre='Sello de advertencia'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Exceso en grasas totales'), (select nut_id from nutrientes where nut_nombre='Grasas totales'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_PORCENTUAL'), '>', 30,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


-------

INSERT INTO alertas(ale_nombre, ale_leyenda, ale_tal_id,
ale_USU_ID_ALTA,
ale_USU_ID_MODIFICACION
)
values ('Exceso en calorías', 'Exceso en calorias', (select tal_id from tipos_alerta where tal_nombre='Sello de advertencia'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Exceso en calorías'), (select nut_id from nutrientes where nut_nombre='Calorías'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_CUANTITATIVO_100G'), '>', 275,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

-------

INSERT INTO alertas(ale_nombre, ale_leyenda, ale_tal_id,
ale_USU_ID_ALTA,
ale_USU_ID_MODIFICACION
)
values ('Exceso en azúcares', 'Exceso en azucares', (select tal_id from tipos_alerta where tal_nombre='Sello de advertencia'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Exceso en azúcares'), (select nut_id from nutrientes where nut_nombre='Azúcares añadidos'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_PORCENTUAL'), '>', 10,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

-------







---------------------
-- ESTOS SCRIPTS SON EXCLUSIVAMENTE PARA SIMULAR EL USO DEL SISTEMA

INSERT INTO usuarios (USU_NOMBRE, USU_USUARIOS, USU_CONTRASENA, USU_ROL_ID,
USU_ID_ALTA, USU_ID_MODIFICACION)
VALUES ('Demo', 'Demo', 'Admin123', (select rol_id from roles where rol_nombre='Usuario consumidor'), 2, 2);

INSERT INTO PERFILES(PRF_NOMBRE, PRF_USU_ID, PRF_INGREDIENTES_PROHIBIDOS, PRF_FECHA_NACIMIENTO, PRF_ES_PRINCIPAL, 
PRF_USU_ID_ALTA,
PRF_USU_ID_MODIFICACION
)
values ('Demo', (SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Demo'), 'maní', '2000-01-01', 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO PERFILES(PRF_NOMBRE, PRF_USU_ID, PRF_INGREDIENTES_PROHIBIDOS, PRF_FECHA_NACIMIENTO,
PRF_USU_ID_ALTA,
PRF_USU_ID_MODIFICACION
)
values ('Hijo menor', (SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Demo'), 'lactosa;leche', '2024-01-01',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO tipos_alerta(tal_nombre, tal_color, tal_forma,
tal_USU_ID_ALTA,
tal_USU_ID_MODIFICACION
)
values ('Rectángulo verde saludable', '7fe757', 2,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

-- ALERTA PERSONALIZADA

INSERT INTO alertas(ale_nombre, ale_leyenda, ale_tal_id,
ale_USU_ID_ALTA,
ale_USU_ID_MODIFICACION
)
values ('Mitad de sodio', 'Mitad de sodio recomendado', (select tal_id from tipos_alerta where tal_nombre='Rectángulo verde saludable'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO alertas_x_nutriente(anu_ale_id, anu_nut_id, anu_tca_id, anu_operador, anu_valor_critico,
anu_USU_ID_ALTA,
anu_USU_ID_MODIFICACION
)
values ((select ale_id from alertas where ale_nombre='Mitad de sodio'), (select nut_id from nutrientes where nut_nombre='Sodio'), (select tca_id from tipos_calculo where tca_nombre_enum='CALCULO_CUANTITATIVO_100G'), '<', 150,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
