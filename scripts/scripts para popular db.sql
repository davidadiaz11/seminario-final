INSERT INTO ROLES(ROL_NOMBRE)
VALUES ('Administrador');

INSERT INTO ROLES(ROL_NOMBRE)
VALUES ('Usuario consumidor');


INSERT INTO usuarios (USU_NOMBRE, USU_EMAIL, USU_CONTRASENA, USU_ROL_ID,
USU_ID_ALTA, USU_ID_MODIFICACION)
VALUES ('Admin', 'admin@alimentateconciencia.com.ar', 'Demo123', (select rol_id from roles where rol_nombre='Administrador'), 1, 1);

INSERT INTO tipos_porcion(TPO_NOMBRE, 
TPO_USU_ID_ALTA,
TPO_USU_ID_MODIFICACION)
VALUES ('gramos',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Carbohidratos', 3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Proteínas', 2,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Grasas totales', 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Grasas saturadas', 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Grasas trans', 1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Fibra', 3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes(NUT_NOMBRE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Sodio',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes(NUT_NOMBRE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Calorías',
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes(NUT_NOMBRE, NUT_TIPO_NUTRIENTE,
NUT_USU_ID_ALTA,
NUT_USU_ID_MODIFICACION)
VALUES
('Azúcares añadidos', 3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
--------------------------
--------------------------
-- PRODUCTOS

INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Queso untable Finlandia Jamón y parmesano', 30, 'Queso (leche, proteínas lácteas, cloruro de calcio, regulador de acidez (ácido cítrico)); jamón cocido; sal; saborizantes; emulsionante (citrato de sodio); conservador (sorbato de potasio, nisina, natamicina); espesantes (goma xántica, garrofín y guar)', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
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
VALUES ('Queso untable Finlandia light', 30, 'Queso (leche, proteínas lácteas, cloruro de calcio, regulador de acidez (ácido cítrico)); jamón cocido; sal; emulsionante (citrato de sodio); conservador (sorbato de potasio, nisina, natamicina); aromatizantes; espesantes (goma xántica, garrofín y guar)', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
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


INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Mayonesa Hellmanns Liviana', 12, 'agua; aceite vegetal; almidón modificado; huevo líquido; azúcar; vinagre de alcohol; sal; jugo concentrado de limón; estabilizante: goma xántica; acidulante: ácido fosfórico; conservador: ácido sórbico; aromatizantes: idénticos al natural y naturales; secuestrante: EDTA disódico cálcico; antioxidantes: BHA, BHT; colorante: betacaroteno', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
1.2,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
1.9,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
89,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
22,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mayonesa Hellmanns Liviana'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
---------------------


INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Mostaza dijon', 12, 'agua; granos de mostaza marrón; vinagre de vino blanco; vino fino blanco Chardonnay; sal marina; azúcar', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
0.6,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
0.24,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
0.6,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
90,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
7,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Mostaza dijon'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
---------------------



INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Alfajor Ceral', 45, 'harina de trigo 000 enriquecida según Ley 25630 (*); azúcar; aceite vegetal interesterificado; glucosa; maltodextrina; almidón de maíz; fibra de avena; leudante químico: Bicarbonato de amonio; cacao amargo en polvo; emulsionante: mono y diglicéridos de ácidos grasos; leudante químico: bicarbonato de sodio; sal; emulsionante: lecitina de soja fluida; conservantes: propionato de calcio y sorbato de potasio; aromatizantes: esencia artificial de vainilla; esencia artificial de chocolate; esencia artificial de limón; esencia artificial de manteca; stevia; leche fluida; jarabe de maíz; sorbitol; polidextrosa; aromatizante: esencia de vainilla; conservante: sorbato de potasio; neutralizante: bicarbonato de sodio; edulcorante: sucralosa); Baño de repostería semiamargo. CONTIENE GLUTEN, LÁCTEOS Y DERIVADOS DE SOJA', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
17.3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
2.4,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
2.3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
0.8,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
2.1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
68,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
100,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Ceral'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
0,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);
---------------------


INSERT INTO productos(PRO_NOMBRE, PRO_PORCION, PRO_INGREDIENTES, PRO_TPO_ID,
PRO_USU_ID_ALTA,
PRO_USU_ID_MODIFICACION
)
VALUES ('Alfajor Milka Mousse', 42, 'azúcar; harina de trigo enriquecida; aceite vegetal; grasa vacuna refinada; leche entera en polvo; manteca de cacao; permeado de suero en polvo; cacao en polvo; pasta de cacao; jarabe de maíz de alta fructosa; leudantes químicos: bicarbonato de amoni bicarbonato de sodio; emulsionantes: mono y diglicéridos de ácidos grasos; lecitina de soja; polirricinoleato de poliglicerol; aromatizantes artificiales: vainilla, avellana; aromatizante idéntico al natural: vainillina', (select TPO_ID from TIPOS_PORCION where TPO_NOMBRE='gramos'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Carbohidratos'),
26,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Proteínas'),
2.6,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas totales'),
12,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas saturadas'),
6.2,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);

INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Grasas trans'),
0.3,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Fibra'),
1,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Sodio'),
26,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Calorías'),
219,
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin'),
(SELECT USU_ID FROM USUARIOS WHERE USU_NOMBRE='Admin')
);


INSERT INTO nutrientes_x_productos(NPR_PRO_ID, NPR_NUT_ID, NPR_CANTIDAD_POR_PORCION,
NPR_USU_ID_ALTA,
NPR_USU_ID_MODIFICACION)
VALUES(
(select PRO_ID from productos where PRO_NOMBRE='Alfajor Milka Mousse'),
(select NUT_ID from nutrientes where NUT_NOMBRE='Azúcares añadidos'),
16,
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

INSERT INTO usuarios (USU_NOMBRE, USU_EMAIL, USU_CONTRASENA, USU_ROL_ID,
USU_ID_ALTA, USU_ID_MODIFICACION)
VALUES ('Demo', 'demo@alimentateconciencia.com.ar', 'Admin123', (select rol_id from roles where rol_nombre='Usuario consumidor'), 2, 2);

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
