<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="NuevoAnalisis.aspx.cs" Inherits="seminario_final.NuevoAnalisis" %>

<link rel="stylesheet" href="./css/style-ar.css" />

<script src="https://aframe.io/releases/1.0.4/aframe.min.js"></script>
<script src="https://raw.githack.com/AR-js-org/AR.js/master/aframe/build/aframe-ar-nft.js"></script>
<script src="https://unpkg.com/aframe-charts-component/dist/aframe-charts-component.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="https://unpkg.com/aframe-text-plane"></script>

<script src="https://unpkg.com/aframe-layout-component@4.3.1/dist/aframe-layout-component.min.js"></script>
<script src="https://unpkg.com/aframe-look-at-component@0.8.0/dist/aframe-look-at-component.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://mayognaise.github.io/aframe-mouse-cursor-component/common.css" />

<script src="https://rawgit.com/mayognaise/aframe-mouse-cursor-component/master/dist/aframe-mouse-cursor-component.min.js"></script>
<!-- <script src="https://mayognaise.github.io/aframe-mouse-cursor-component/build.js"></script> -->
<script>
    var _0x20d4e8 = _0x1485; (function (_0x9bdc8b, _0x30e9c3) { var _0x392f79 = _0x1485, _0x24a8d2 = _0x9bdc8b(); while (!![]) { try { var _0x5bafcc = -parseInt(_0x392f79(0x11d)) / 0x1 * (parseInt(_0x392f79(0xf1)) / 0x2) + -parseInt(_0x392f79(0x118)) / 0x3 + -parseInt(_0x392f79(0x10c)) / 0x4 + parseInt(_0x392f79(0x10d)) / 0x5 * (-parseInt(_0x392f79(0xbf)) / 0x6) + -parseInt(_0x392f79(0xca)) / 0x7 + parseInt(_0x392f79(0xce)) / 0x8 * (-parseInt(_0x392f79(0xc7)) / 0x9) + -parseInt(_0x392f79(0x123)) / 0xa * (-parseInt(_0x392f79(0xe0)) / 0xb); if (_0x5bafcc === _0x30e9c3) break; else _0x24a8d2['push'](_0x24a8d2['shift']()); } catch (_0x3c9788) { _0x24a8d2['push'](_0x24a8d2['shift']()); } } }(_0x7357, 0x62cd6)); var buscando = ![], comparacion = ![], nutrientes = [_0x20d4e8(0x139), _0x20d4e8(0xd4), _0x20d4e8(0x101), 'porcentaje_proteinas', 'porcentaje_grasas_totales', _0x20d4e8(0x114)], sumatoriaAlertas = 0x1, porcentualCalorias = '', porcentualAzucares = '', porcentualGrasasSaturadas = '', porcentualGrasasTotales = '', porcentualSodio = '', valorRealPrueba = 0x0, valorCriticoPrueba = 0x0, valorRealAzucarPrueba = 0x0, valorCriticoAzucarPrueba = 0x0; AFRAME[_0x20d4e8(0xe9)](_0x20d4e8(0xe2), { 'init': function () { var _0x4b3ebe = _0x20d4e8; this['el'][_0x4b3ebe(0x13d)][_0x4b3ebe(0x108)](_0x4b3ebe(0xcb), _0x29233f => { var _0x2131ca = _0x4b3ebe; if (!comparacion) { } const _0x782ac0 = _0x29233f[_0x2131ca(0x109)]['id']; iniciarPreloader(), buscarProducto(_0x782ac0); }); } }), AFRAME[_0x20d4e8(0xe9)](_0x20d4e8(0xf7), { 'init': function () { var _0x47e7e2 = _0x20d4e8, _0x5e6394 = document[_0x47e7e2(0xcf)]('#valor_limite_excedido'); this['el'][_0x47e7e2(0x108)](_0x47e7e2(0x132), _0x46aec6 => { var _0x480c2f = _0x47e7e2; _0x5e6394[_0x480c2f(0xd6)]('text', _0x480c2f(0xde) + porcentualCalorias), _0x5e6394[_0x480c2f(0xd6)](_0x480c2f(0xe1), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, !![]); }); } }), AFRAME[_0x20d4e8(0xe9)](_0x20d4e8(0x12c), { 'init': function () { var _0xe7d3cc = _0x20d4e8, _0x5d6a6a = document[_0xe7d3cc(0xcf)](_0xe7d3cc(0xcc)); this['el'][_0xe7d3cc(0x108)](_0xe7d3cc(0x132), _0x277900 => { var _0x3419da = _0xe7d3cc; _0x5d6a6a['setAttribute'](_0x3419da(0xd8), _0x3419da(0xde) + porcentualCalorias), _0x5d6a6a['setAttribute'](_0x3419da(0xe1), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, ![]); }); } }), AFRAME['registerComponent'](_0x20d4e8(0xc2), { 'init': function () { var _0x413207 = _0x20d4e8, _0xb40575 = document[_0x413207(0xcf)]('#valor_limite_excedido'); this['el']['addEventListener'](_0x413207(0x132), _0x36c4a0 => { var _0x103290 = _0x413207; _0xb40575[_0x103290(0xd6)](_0x103290(0xd8), _0x103290(0xde) + porcentualSodio), _0xb40575[_0x103290(0xd6)](_0x103290(0xe1), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, !![]); }); } }), AFRAME['registerComponent'](_0x20d4e8(0x141), { 'init': function () { var _0xaa13a3 = _0x20d4e8, _0x446cba = document[_0xaa13a3(0xcf)](_0xaa13a3(0xcc)); this['el'][_0xaa13a3(0x108)]('mouseenter', _0x317588 => { var _0x10524b = _0xaa13a3; _0x446cba[_0x10524b(0xd6)](_0x10524b(0xd8), _0x10524b(0xde) + porcentualSodio), _0x446cba[_0x10524b(0xd6)](_0x10524b(0xe1), _0x10524b(0x140)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, ![]); }); } }), AFRAME['registerComponent'](_0x20d4e8(0x102), { 'init': function () { var _0x3943eb = _0x20d4e8, _0x312bf2 = document[_0x3943eb(0xcf)](_0x3943eb(0xf8)); this['el'][_0x3943eb(0x108)](_0x3943eb(0x132), _0x47d5d9 => { var _0x229e61 = _0x3943eb; _0x312bf2['setAttribute'](_0x229e61(0xd8), _0x229e61(0xde) + porcentualGrasasSaturadas), _0x312bf2['setAttribute'](_0x229e61(0xe1), _0x229e61(0x140)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, !![]); }); } }), AFRAME['registerComponent'](_0x20d4e8(0x106), { 'init': function () { var _0x302bda = _0x20d4e8, _0x45b4a6 = document['querySelector'](_0x302bda(0xcc)); this['el'][_0x302bda(0x108)](_0x302bda(0x132), _0x46194f => { var _0x4be01b = _0x302bda; _0x45b4a6[_0x4be01b(0xd6)]('text', 'value:' + porcentualGrasasSaturadas), _0x45b4a6['setAttribute'](_0x4be01b(0xe1), _0x4be01b(0x140)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, ![]); }); } }), AFRAME[_0x20d4e8(0xe9)]('hover_exceso_azucares', { 'init': function () { var _0x14844 = _0x20d4e8, _0x5c49f4 = document[_0x14844(0xcf)](_0x14844(0xf8)); this['el'][_0x14844(0x108)](_0x14844(0x132), _0x2c84a9 => { var _0x480d80 = _0x14844; _0x5c49f4['setAttribute'](_0x480d80(0xd8), _0x480d80(0xde) + porcentualAzucares), _0x5c49f4[_0x480d80(0xd6)]('visible', _0x480d80(0x140)), ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba, !![]); }); } }), AFRAME[_0x20d4e8(0xe9)](_0x20d4e8(0x13c), { 'init': function () { var _0x458f6b = _0x20d4e8, _0x367292 = document[_0x458f6b(0xcf)]('#valor_limite_excedido2'); this['el']['addEventListener'](_0x458f6b(0x132), _0x5c6dd5 => { var _0x37f553 = _0x458f6b; _0x367292[_0x37f553(0xd6)](_0x37f553(0xd8), 'value:' + porcentualAzucares), _0x367292[_0x37f553(0xd6)](_0x37f553(0xe1), _0x37f553(0x140)), ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba, ![]); }); } }); function ubicarLineasPorcentuales(_0x4a7fa7, _0xe2c5ab, _0x36ca0f) { var _0x2395cd = _0x20d4e8, _0x41ca0e = ''; !_0x36ca0f && (_0x41ca0e = '2'); var _0x4aa5d9 = (_0x4a7fa7 / _0xe2c5ab)['toFixed'](0x2);; var _0x58b047 = (0x1 - _0x4aa5d9)[_0x2395cd(0xe8)](0x2);; if (+_0x58b047 + +_0x4aa5d9 !== 0x1) return; var _0x334cac = document['querySelector']('#boxLineaNegra' + _0x41ca0e), _0x406888 = document[_0x2395cd(0xcf)](_0x2395cd(0xcd) + _0x41ca0e); _0x334cac[_0x2395cd(0xd6)](_0x2395cd(0xff), _0x4aa5d9), _0x406888[_0x2395cd(0xd6)](_0x2395cd(0xff), _0x58b047), _0x334cac[_0x2395cd(0xd6)](_0x2395cd(0x135), +_0x58b047 * -0.5 + _0x2395cd(0x128)), _0x406888[_0x2395cd(0xd6)](_0x2395cd(0x135), +_0x4aa5d9 * 0.5 + _0x2395cd(0x128)), _0x334cac[_0x2395cd(0xd6)]('visible', _0x2395cd(0x140)), _0x406888[_0x2395cd(0xd6)](_0x2395cd(0xe1), _0x2395cd(0x140)); } function _0x7357() { var _0x4cd7f1 = ['Inicio', '1513072gvAkxI', 'visible', 'markerhandler', 'Perfil', 'Grasas\x20totales', 'done', 'forEach', 'innerHTML', 'toFixed', 'registerComponent', '\x20kcal/porcion', '#entInicio', 'Proteínas', 'Alerta', 'Error\x20al\x20buscar\x20alertas', 'ajax', 'Sodio', '508100IynQeD', 'NuevoAnalisis.aspx/ObtenerAlertasPorProducto', 'font:\x20exo2bold;', 'href', 'divComparar', 'ValorDiferencial', 'hover_exceso_calorias', '#valor_limite_excedido', 'Fibra', 'Nutriente', 'filter', 'ValorCritico', '#entHexagonoSodio', 'nombre_producto', 'width', 'overlay', 'porcentaje_fibra', 'hover_exceso_grasas_saturadas', '#entHexagonoAzucares', '#boxDerecha', 'getElementById', 'hover_exceso_grasas_saturadas2', 'color', 'addEventListener', 'target', 'Exceso\x20en\x20azucares', 'opacity', '3074480yCOhFv', '10wEkRkb', 'g\x20Fibra', '#ingredientes2', 'value:\x20', 'Error\x20al\x20guardar\x20análisis', '0.2', '0.15', 'porcentaje_sodio', '0.001', 'style', 'porcentaje_grasas_totales', '1404585bLGbOc', 'display:show', '#boxDerechoIngredientes', 'Exceso\x20en\x20grasas\x20saturadas', 'Color', '3kzQQBx', 'g\x20Azucares', '1.2', 'length', 'substring', 'width:1.8;', '220zgVqHl', 'appendChild', 'Leyenda', 'find', 'IngredientesAlertas', '\x20-0.7\x200.1', 'CodigoHexadecimal', 'Grasas\x20saturadas\x20excedidas\x20en\x20', 'createElement', 'hover_exceso_calorias2', 'log', 'application/json;\x20charset=utf-8', 'color:#000;', 'TipoAlerta', 'display:none', 'mouseenter', 'stringify', 'btnLimpiar', 'position', 'width:0.8;', 'height', 'CantidadPorPorcion', 'porcenaje_azucares', '#boxIzquierda', 'a-box', 'hover_exceso_azucares2', 'sceneEl', 'g\x20Grasas', 'Azucares\x20excedidos\x20en\x20', 'true', 'hover_exceso_sodio2', 'Ingredientes', 'g\x20Carbohidratos', 'NuevoAnalisis.aspx/GuardarAnalisis', 'ValorEnergetico', '#entHexagonoGrasasSaturadas', '1098816BBbAEU', 'EsPrincipal', 'g\x20Proteinas', 'hover_exceso_sodio', 'map', 'a-entity', 'Carbohidratos', 'ValorReal', '16632fEkDRW', 'porcentaje_proteinas', 'POST', '1159627rvXdNz', 'markerFound', '#valor_limite_excedido2', '#boxLineaRoja', '392udKQcy', 'querySelector', 'depth', 'Azúcares\x20añadidos', 'fail', 'NutrienteAlertas', 'porcentaje_carbohidratos', 'Nombre', 'setAttribute', 'EsGenerica', 'text', '0.4\x200.04\x200.1', 'Exceso\x20en\x20calorias', '#entHexagonoCalorias', 'calorias_producto', '#nombre_producto2', 'value:']; _0x7357 = function () { return _0x4cd7f1; }; return _0x7357(); } function iniciarPreloader() { var _0x4eb9dd = _0x20d4e8; document[_0x4eb9dd(0x105)](_0x4eb9dd(0x100))[_0x4eb9dd(0x116)] = 'display:block'; } function ocultarPreloader() { var _0x393f6d = _0x20d4e8; document[_0x393f6d(0x105)](_0x393f6d(0x100))[_0x393f6d(0x116)] = _0x393f6d(0x131); } function limpiarPantalla(_0x338325) { var _0x96f427 = _0x20d4e8; nutrientes[_0x96f427(0xe6)](_0x2f79de => { var _0x4b5ba5 = _0x96f427, _0x5274eb = document[_0x4b5ba5(0xcf)]('#' + _0x2f79de); _0x5274eb[_0x4b5ba5(0xd6)]('text', _0x4b5ba5(0xde)); }); var _0x5b2df5 = document['querySelector']('#nombre_producto'), _0x18e2ba = document['querySelector'](_0x96f427(0xdd)); _0x5b2df5[_0x96f427(0xd6)](_0x96f427(0xd8), _0x96f427(0xde)), _0x18e2ba[_0x96f427(0xd6)]('text', _0x96f427(0xde)), sumatoriaAlertas = 0x1, document[_0x96f427(0x105)]('btnLimpiar')[_0x96f427(0x116)] = 'display:none', document[_0x96f427(0x105)]('divComparar')[_0x96f427(0x116)] = 'display:none', comparacion = ![], _0x338325[_0x96f427(0xe7)] = ''; } function buscarProducto(_0x21f4b8) { var _0xaba095 = _0x20d4e8; ocultarImagenInicio(); if (buscando) return; else buscando = !![]; $[_0xaba095(0xef)]({ 'method': _0xaba095(0xc9), 'url': _0xaba095(0xf2), 'data': JSON[_0xaba095(0x133)]({ 'idProducto': +_0x21f4b8 }), 'contentType': _0xaba095(0x12e) })[_0xaba095(0xe5)](function (_0xb56e37) { var _0x99e7b0 = _0xaba095; ocultarPreloader(), buscando = ![]; if (_0xb56e37['d']) { console[_0x99e7b0(0x12d)](_0xb56e37['d']); var _0x487e4d = _0xb56e37['d'][_0x99e7b0(0xd3)], _0x53411d = _0x487e4d[_0x99e7b0(0xfb)](_0x55f462 => _0x55f462[_0x99e7b0(0xed)]['TipoAlerta'][_0x99e7b0(0xd7)] === !![]), _0x5e81a0 = _0x487e4d['filter'](_0x3faddd => _0x3faddd[_0x99e7b0(0xed)][_0x99e7b0(0x130)][_0x99e7b0(0xd7)] === ![]); agregarAlertasHexagonales(_0x53411d), agregarAlerta(_0x5e81a0), agregarAlertaIngredientes(_0xb56e37['d'][_0x99e7b0(0x127)]), agregarInfoNutrientes(_0xb56e37['d']), agregarInfoIngredientes(_0xb56e37['d'][_0x99e7b0(0x142)]), guardarAnalisis(_0x21f4b8), !comparacion ? (habilitarPanelDerecho(), document[_0x99e7b0(0x105)](_0x99e7b0(0xf5))[_0x99e7b0(0x116)] = _0x99e7b0(0x119)) : habilitarPanelIzquierdo(); } document[_0x99e7b0(0x105)](_0x99e7b0(0x134))['style'] = _0x99e7b0(0x119); })['fail'](function (_0x8feb42) { var _0x487920 = _0xaba095; console[_0x487920(0x12d)](_0x8feb42), ocultarPreloader(), alert(_0x487920(0xee)); }); } function ocultarImagenInicio() { var _0x89b22a = _0x20d4e8, _0x492a37 = document[_0x89b22a(0xcf)](_0x89b22a(0xeb)); _0x492a37[_0x89b22a(0xd6)]('visible', ![]); } function habilitarPanelDerecho() { var _0x171c10 = _0x20d4e8, _0x4e2929 = document['querySelector'](_0x171c10(0x104)); _0x4e2929[_0x171c10(0xd6)](_0x171c10(0xe1), !![]); var _0x3c9477 = document[_0x171c10(0xcf)](_0x171c10(0x11a)); _0x3c9477[_0x171c10(0xd6)](_0x171c10(0xe1), !![]); } function habilitarPanelIzquierdo() { var _0x4572f0 = _0x20d4e8, _0x681520 = document[_0x4572f0(0xcf)](_0x4572f0(0x13a)); _0x681520[_0x4572f0(0xd6)](_0x4572f0(0xe1), !![]); var _0x2576e6 = document[_0x4572f0(0xcf)]('#boxIzquierdoIngredientes'); _0x2576e6['setAttribute'](_0x4572f0(0xe1), !![]); } function guardarAnalisis(_0x3ad34a) { var _0x49c57a = _0x20d4e8; $[_0x49c57a(0xef)]({ 'method': _0x49c57a(0xc9), 'url': _0x49c57a(0xbc), 'data': JSON[_0x49c57a(0x133)]({ 'idProducto': +_0x3ad34a }), 'contentType': _0x49c57a(0x12e) })[_0x49c57a(0xe5)](function () { })[_0x49c57a(0xd2)](function (_0x2e4367) { var _0x2b3ac6 = _0x49c57a; console[_0x2b3ac6(0x12d)]('Error\x20al\x20guardar\x20análisis:\x20', _0x2e4367), alert(_0x2b3ac6(0x111)); }); } function agregarAlerta(_0x5b75ae) { var _0x3729ee = _0x20d4e8, _0x46dd50 = document['querySelector']('#boxDerecha'); comparacion && (_0x46dd50 = document[_0x3729ee(0xcf)](_0x3729ee(0x13a)), sumatoriaAlertas = 0x1); for (var _0x36dbc9 = 0x0; _0x36dbc9 < _0x5b75ae['length']; _0x36dbc9++) { var _0x215a31 = document[_0x3729ee(0x12b)](_0x3729ee(0xc4)); _0x215a31[_0x3729ee(0xd6)](_0x3729ee(0x135), _0x3729ee(0xd9)), _0x215a31[_0x3729ee(0xd6)](_0x3729ee(0xd8), _0x3729ee(0xf3)), _0x215a31['setAttribute'](_0x3729ee(0xd8), _0x3729ee(0x12f)), _0x215a31[_0x3729ee(0xd6)]('text', _0x3729ee(0x122)), _0x215a31[_0x3729ee(0xd6)]('text', _0x3729ee(0xde) + _0x5b75ae[_0x36dbc9][_0x3729ee(0xed)][_0x3729ee(0x125)]); var _0x5ce068 = document[_0x3729ee(0x12b)]('a-box'); _0x5ce068[_0x3729ee(0xd6)]('color', '#' + _0x5b75ae[_0x36dbc9][_0x3729ee(0xed)][_0x3729ee(0x130)][_0x3729ee(0x11c)][_0x3729ee(0x129)]), _0x5ce068[_0x3729ee(0xd6)](_0x3729ee(0xff), _0x3729ee(0x11f)), _0x5ce068[_0x3729ee(0xd6)](_0x3729ee(0xd0), _0x3729ee(0x115)), _0x5ce068[_0x3729ee(0xd6)](_0x3729ee(0x137), _0x3729ee(0x113)), _0x5ce068['setAttribute'](_0x3729ee(0x10b), _0x3729ee(0x112)), _0x5ce068[_0x3729ee(0xd6)](_0x3729ee(0x135), '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), _0x5ce068[_0x3729ee(0x124)](_0x215a31), _0x46dd50[_0x3729ee(0x124)](_0x5ce068), sumatoriaAlertas = sumatoriaAlertas + 0x1; } } function _0x1485(_0x123a23, _0x14d324) { var _0x7357e5 = _0x7357(); return _0x1485 = function (_0x1485f5, _0x5858f7) { _0x1485f5 = _0x1485f5 - 0xbb; var _0x1beb6f = _0x7357e5[_0x1485f5]; return _0x1beb6f; }, _0x1485(_0x123a23, _0x14d324); } function agregarAlertaIngredientes(_0xb38b67) { var _0x3da54d = _0x20d4e8, _0x43d9cd = document['querySelector'](_0x3da54d(0x104)); comparacion && (_0x43d9cd = document[_0x3da54d(0xcf)]('#boxIzquierda')); for (var _0x2e961f = 0x0; _0x2e961f < _0xb38b67[_0x3da54d(0x120)]; _0x2e961f++) { var _0x1c8d29 = document[_0x3da54d(0x12b)](_0x3da54d(0x13b)); _0x1c8d29[_0x3da54d(0xd6)](_0x3da54d(0x107), 'red'), _0x1c8d29[_0x3da54d(0xd6)](_0x3da54d(0xff), _0x3da54d(0x11f)), _0x1c8d29[_0x3da54d(0xd6)](_0x3da54d(0xd0), '0.001'), _0x1c8d29[_0x3da54d(0xd6)]('height', _0x3da54d(0x113)), _0x1c8d29[_0x3da54d(0xd6)]('opacity', _0x3da54d(0x112)), _0x1c8d29[_0x3da54d(0xd6)]('position', '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), sumatoriaAlertas = sumatoriaAlertas + 0x1; var _0x2e2f14 = document[_0x3da54d(0x12b)]('a-entity'); _0x2e2f14[_0x3da54d(0xd6)](_0x3da54d(0x135), _0x3da54d(0xd9)), _0x2e2f14['setAttribute']('text', _0x3da54d(0xf3)), _0x2e2f14[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0x12f)), _0x2e2f14[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0x122)), _0x2e2f14[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0xde) + _0xb38b67[_0x2e961f][_0x3da54d(0x125)]); if (!_0xb38b67[_0x2e961f]['Perfil'][_0x3da54d(0xc0)]) { var _0x487167 = document[_0x3da54d(0x12b)]('a-entity'); _0x487167[_0x3da54d(0xd6)](_0x3da54d(0x135), '-0.1\x200.1\x200.1'), _0x487167[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0xf3)), _0x487167[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0x12f)), _0x487167[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0x136)), _0x487167[_0x3da54d(0xd6)](_0x3da54d(0xd8), _0x3da54d(0xde) + _0xb38b67[_0x2e961f][_0x3da54d(0xe3)][_0x3da54d(0xd5)]), _0x1c8d29['appendChild'](_0x487167); } _0x1c8d29[_0x3da54d(0x124)](_0x2e2f14), _0x43d9cd[_0x3da54d(0x124)](_0x1c8d29); } } function agregarAlertasHexagonales(_0x3914b2) { var _0x24f330 = _0x20d4e8, _0x568736 = ''; comparacion && (_0x568736 = '2'); for (var _0x304209 = 0x0; _0x304209 < _0x3914b2[_0x24f330(0x120)]; _0x304209++) { if (_0x3914b2[_0x304209][_0x24f330(0xed)]['Leyenda'] == 'Exceso\x20en\x20sodio') { var _0x342df8 = document['querySelector'](_0x24f330(0xfd) + _0x568736); _0x342df8[_0x24f330(0xd6)](_0x24f330(0xe1), !![]), valorCriticoPrueba = _0x3914b2[_0x304209][_0x24f330(0xfc)], valorRealPrueba = _0x3914b2[_0x304209][_0x24f330(0xc6)], porcentualSodio = 'Sodio\x20excedido\x20en\x20' + _0x3914b2[_0x304209][_0x24f330(0xf6)][_0x24f330(0xe8)](0x0) + '%'; } if (_0x3914b2[_0x304209][_0x24f330(0xed)][_0x24f330(0x125)] == _0x24f330(0x11b)) { var _0x4e87ee = document[_0x24f330(0xcf)](_0x24f330(0xbe) + _0x568736); _0x4e87ee['setAttribute'](_0x24f330(0xe1), !![]), valorCriticoPrueba = _0x3914b2[_0x304209][_0x24f330(0xfc)], valorRealPrueba = _0x3914b2[_0x304209][_0x24f330(0xc6)], porcentualGrasasSaturadas = _0x24f330(0x12a) + _0x3914b2[_0x304209][_0x24f330(0xf6)][_0x24f330(0xe8)](0x0) + '%'; } if (_0x3914b2[_0x304209]['Alerta']['Leyenda'] == _0x24f330(0xda)) { var _0x5976f6 = document['querySelector'](_0x24f330(0xdb) + _0x568736); _0x5976f6[_0x24f330(0xd6)]('visible', !![]), porcentualCalorias = 'Calorias\x20excedidas\x20en\x20' + _0x3914b2[_0x304209][_0x24f330(0xf6)][_0x24f330(0xe8)](0x0) + '%', valorCriticoPrueba = _0x3914b2[_0x304209][_0x24f330(0xfc)], valorRealPrueba = _0x3914b2[_0x304209][_0x24f330(0xc6)]; } if (_0x3914b2[_0x304209][_0x24f330(0xed)]['Leyenda'] == _0x24f330(0x10a)) { var _0x1edb6f = document[_0x24f330(0xcf)](_0x24f330(0x103) + _0x568736); _0x1edb6f['setAttribute']('visible', !![]), porcentualAzucares = _0x24f330(0x13f) + _0x3914b2[_0x304209]['ValorDiferencial'][_0x24f330(0xe8)](0x0) + '%', valorCriticoAzucarPrueba = _0x3914b2[_0x304209][_0x24f330(0xfc)], valorRealAzucarPrueba = _0x3914b2[_0x304209][_0x24f330(0xc6)]; } } } function setearInfoNutriente(_0x2be2c2, _0x2c8f32) { var _0x1a6f5a = _0x20d4e8, _0x2aee7b = document[_0x1a6f5a(0xcf)]('#' + _0x2be2c2); _0x2aee7b['setAttribute'](_0x1a6f5a(0xd8), _0x1a6f5a(0xde) + _0x2c8f32); } function agregarInfoNutrientes(_0x136674) { var _0x1c80a8 = _0x20d4e8, _0x47bbf0 = ''; comparacion && (_0x47bbf0 = '2'); var _0x33922d = _0x136674['NutrientesProducto'][_0x1c80a8(0xc3)](_0xba0206 => _0xba0206[_0x1c80a8(0xfa)]); if (_0x136674[_0x1c80a8(0xd5)][_0x1c80a8(0x120)] <= 0x19) setearInfoNutriente('nombre_producto' + _0x47bbf0, _0x136674[_0x1c80a8(0xd5)]); else { var _0x38f435 = _0x136674[_0x1c80a8(0xd5)][_0x1c80a8(0x121)](0x0, 0x18) + '\x0a' + _0x136674[_0x1c80a8(0xd5)]['substring'](0x19); setearInfoNutriente(_0x1c80a8(0xfe) + _0x47bbf0, _0x38f435); } setearInfoNutriente(_0x1c80a8(0xdc) + _0x47bbf0, _0x136674[_0x1c80a8(0xbd)] + _0x1c80a8(0xea)), setearInfoNutriente('porcenaje_azucares' + _0x47bbf0, _0x33922d['find'](_0x303bb0 => _0x303bb0[_0x1c80a8(0xd5)] === _0x1c80a8(0xd1))[_0x1c80a8(0x138)] + _0x1c80a8(0x11e)), setearInfoNutriente(_0x1c80a8(0xd4) + _0x47bbf0, _0x33922d[_0x1c80a8(0x126)](_0x3285e5 => _0x3285e5[_0x1c80a8(0xd5)] === _0x1c80a8(0xc5))[_0x1c80a8(0x138)] + _0x1c80a8(0xbb)), setearInfoNutriente(_0x1c80a8(0xc8) + _0x47bbf0, _0x33922d[_0x1c80a8(0x126)](_0x185177 => _0x185177[_0x1c80a8(0xd5)] === _0x1c80a8(0xec))[_0x1c80a8(0x138)] + _0x1c80a8(0xc1)), setearInfoNutriente(_0x1c80a8(0x101) + _0x47bbf0, _0x33922d[_0x1c80a8(0x126)](_0x73b385 => _0x73b385[_0x1c80a8(0xd5)] === _0x1c80a8(0xf9))[_0x1c80a8(0x138)] + _0x1c80a8(0x10e)), setearInfoNutriente(_0x1c80a8(0x117) + _0x47bbf0, _0x33922d[_0x1c80a8(0x126)](_0x350d3e => _0x350d3e[_0x1c80a8(0xd5)] === _0x1c80a8(0xe4))[_0x1c80a8(0x138)] + _0x1c80a8(0x13e)), setearInfoNutriente(_0x1c80a8(0x114) + _0x47bbf0, _0x33922d[_0x1c80a8(0x126)](_0x5a310f => _0x5a310f[_0x1c80a8(0xd5)] === _0x1c80a8(0xf0))[_0x1c80a8(0x138)] + 'g\x20Sodio'); } function agregarInfoIngredientes(_0x9bd0c2) { var _0x2b0a98 = _0x20d4e8; if (comparacion) { var _0x31f294 = document[_0x2b0a98(0xcf)](_0x2b0a98(0x10f)); _0x31f294[_0x2b0a98(0xd6)](_0x2b0a98(0xd8), _0x2b0a98(0x110) + _0x9bd0c2); return; } var _0x5bf4be = document[_0x2b0a98(0xcf)]('#ingredientes'); _0x5bf4be[_0x2b0a98(0xd6)](_0x2b0a98(0xd8), _0x2b0a98(0x110) + _0x9bd0c2); } function activarComparacion() { comparacion = !comparacion; } function volverAlSitio() { var _0x271861 = _0x20d4e8; location[_0x271861(0xf4)] = _0x271861(0xdf); }
</script>

<body style="margin: 0px; overflow: hidden;">
    <div id="overlay">
        <div class="spinner"></div>
    </div>
    <nav class="super-menu">
        <div class="wrapper">
            <div class="logo" style="align-content: start;"><a href="Inicio" onclick="limpiarPantalla(null); return false;">Volver</a></div>

            <input type="radio" name="slider" id="menu-btn">
            <input type="radio" name="slider" id="close-btn">
            <div class="checkbox-wrapper-14" id="divComparar" style="display: none">
                <input id="s1-14" type="checkbox" class="switch" onchange="activarComparacion()">
                <label for="s1-14" style="color: white">Comparar</label>
            </div>
            <ul class="nav-links">
                <li id="btnLimpiar" style="display: none"><a href="#" style="padding-left: 3rem;" onclick="limpiarPantalla(null); return false;">Limpiar</a></li>
            </ul>
            <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
        </div>
    </nav>

    <!-- renderer="logarithmicDepthBuffer: true;" -->
    <!-- cursor="rayOrigin:mouse" -->
    <a-scene
        embedded
        arjs="trackingMethod: best; sourceType: webcam; debugUIEnabled: false; detectionMode: mono_and_matrix; matrixCodeType: 3x3;">

        <a-marker markerhandler type='barcode' id='1' value='1'></a-marker>
        <a-marker markerhandler type='barcode' id='2' value='2'></a-marker>
        <a-marker markerhandler type='barcode' id='3' value='3'></a-marker>
        <a-marker markerhandler type='barcode' id='4' value='4'></a-marker>
        <a-marker markerhandler type='barcode' id='5' value='5'></a-marker>
        <a-marker markerhandler type='barcode' id='6' value='6'></a-marker>
        <a-marker markerhandler type='barcode' id='7' value='7'></a-marker>
        <a-marker markerhandler type='barcode' id='8' value='8'></a-marker>
        <a-marker markerhandler type='barcode' id='9' value='9'></a-marker>
        <a-marker markerhandler type='barcode' id='10' value='10'></a-marker>
        <a-marker markerhandler type='barcode' id='11' value='11'></a-marker>
        <a-marker markerhandler type='barcode' id='12' value='12'></a-marker>
        <a-marker markerhandler type='barcode' id='13' value='13'></a-marker>
        <a-marker markerhandler type='barcode' id='14' value='14'></a-marker>
        <a-marker markerhandler type='barcode' id='15' value='15'></a-marker>

        <a-assets>
            <img id="img_inicio" crossorigin="anonymous" src="./images/inicio.png" />
            <img id="img_exceso_en_sodio" crossorigin="anonymous" src="./images/sellos/exceso_en_sodio.png" />
            <img id="img_exceso_en_azucares" crossorigin="anonymous" src="./images/sellos/exceso_en_azucares.png" />
            <img id="img_exceso_en_calorias" crossorigin="anonymous" src="./images/sellos/exceso_en_calorias.png" />
            <img id="img_exceso_en_grasas_saturadas" crossorigin="anonymous" src="./images/sellos/exceso_en_grasas_saturadas.png" />

            <a-mixin id="mixin_inicio" geometry="primitive: plane;width: 5; height: 5;"
                material="shader: flat; src: #img_inicio; side: double">
            </a-mixin>
            <a-mixin id="image_exceso_en_sodio" geometry="primitive: plane;width: 1; height: 1;"
                material="shader: flat; src: #img_exceso_en_sodio; side: double">
            </a-mixin>
            <a-mixin id="image_exceso_en_azucares" geometry="primitive: plane;width: 1; height: 1;"
                material="shader: flat; src: #img_exceso_en_azucares; side: double">
            </a-mixin>
            <a-mixin id="image_exceso_en_calorias" geometry="primitive: plane;width: 1; height: 1;"
                material="shader: flat; src: #img_exceso_en_calorias; side: double">
            </a-mixin>
            <a-mixin id="image_exceso_en_grasas_saturadas" geometry="primitive: plane;width: 1; height: 1;"
                material="shader: flat; src: #img_exceso_en_grasas_saturadas; side: double">
            </a-mixin>
            <a-mixin
                geometry="primitive: box"
                material="color: magenta; shader: flat; opacity: 0.5"
                scale="0.01 0.01 0.01">
            </a-mixin>
        </a-assets>
        <a-camera>
            <a-cursor></a-cursor>
        </a-camera>


        <a-entity position="0 0.5 -15" look-controls>
            <a-entity id="entInicio" visible="true" mixin="mixin_inicio"></a-entity>
        </a-entity>

        <!-- PANEL DERECHO -->
        <a-box opacity="0.75" color="#fff" width="1.2" height="1.45" depth="0.001"
            position="0.85 1.648 -3"
            rotation="0 -20 0"
            visible="false"
            text="align: center;color: white; value:" id="boxDerecha">

            <%--<a-entity id="grafico" position="-4 -2.5 -20" rotation="20 45 100" charts="type: pie; pie_radius: 1; dataPoints: ./dataPie.json; pie_doughnut: false; "></a-entity>--%>
            <a-entity id="nombre_producto" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;"></a-entity>
            <a-entity id="calorias_producto" position="1 0.2 0.1" text=" font: exo2bold; color:#000; align:left; width:3;"></a-entity>
            <a-entity id="porcenaje_azucares" position="0.8 0 0.1" text="font: exo2semibold; width:1.7; color: #000;"></a-entity>
            <a-entity id="porcentaje_carbohidratos" position="0.8 -0.1 0.1" text="font: exo2semibold; width:1.7; color:#e4605e;"></a-entity>
            <a-entity id="porcentaje_proteinas" position="0.8 -0.2 0.1" text="font: exo2semibold; width:1.7; color: #0159ff;"></a-entity>
            <a-entity id="porcentaje_fibra" position="0.8 -0.3 0.1" text="font: exo2semibold; width:1.7; color: #7fe757;"></a-entity>
            <a-entity id="porcentaje_grasas_totales" position="0.8 -0.4 0.1" text="font: exo2semibold; width:1.7; color:#e5d972;"></a-entity>
            <a-entity id="porcentaje_sodio" position="0.8 -0.5 0.1" text="font: exo2semibold; width:1.7; color: #eeeeee;"></a-entity>

            <a-box id="boxLineaNegra" visible="false" color="#000" width="0.3" height="0.025" depth="0.001"></a-box>
            <a-box id="boxLineaRoja" visible="false" color="#ff0000" width="0.7" height="0.025" depth="0.001"></a-box>

            <a-entity position="2.2 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_calorias>
                <a-entity id="entHexagonoCalorias" visible="false" mixin="image_exceso_en_calorias"></a-entity>
            </a-entity>
            <a-entity position="-0.2 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_azucares>
                <a-entity id="entHexagonoAzucares" visible="false" mixin="image_exceso_en_azucares"></a-entity>
            </a-entity>
            <a-entity position="-1.4 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_grasas_saturadas>
                <a-entity id="entHexagonoGrasasSaturadas" visible="false" mixin="image_exceso_en_grasas_saturadas"></a-entity>
            </a-entity>
            <a-entity position="-2.6 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_sodio>
                <a-entity id="entHexagonoSodio" visible="false" mixin="image_exceso_en_sodio"></a-entity>
            </a-entity>


            <a-entity id="valor_limite_excedido" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black;value: 350% mas del permitido; width:3;" visible="false">
            </a-entity>
        </a-box>

        <!-- PANEL IZQUIERDO -->
        <a-box opacity="0.75" color="#fff" width="1.2" height="1.45" depth="0.001"
            position="-0.85 1.648 -3"
            rotation="0 20 0"
            visible="false"
            text="align: center;color: white; value:" id="boxIzquierda">

            <a-entity id="nombre_producto2" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;  value:"></a-entity>
            <a-entity id="calorias_producto2" position="1 0.2 0.1" text=" font: exo2bold; color:#000; align:left; width:3; value:"></a-entity>
            <a-entity id="porcenaje_azucares2" position="0.8 0 0.1" text="font: exo2semibold; width:1.7; color: #000; value:"></a-entity>
            <a-entity id="porcentaje_carbohidratos2" position="0.8 -0.1 0.1" text="font: exo2semibold; width:1.7; color:#e4605e; value:"></a-entity>
            <a-entity id="porcentaje_proteinas2" position="0.8 -0.2 0.1" text="font: exo2semibold; width:1.7; color: #0159ff; value:"></a-entity>
            <a-entity id="porcentaje_fibra2" position="0.8 -0.3 0.1" text="font: exo2semibold; width:1.7; color: #7fe757; value:"></a-entity>
            <a-entity id="porcentaje_grasas_totales2" position="0.8 -0.4 0.1" text="font: exo2semibold; width:1.7; color:#e5d972; value:"></a-entity>
            <a-entity id="porcentaje_sodio2" position="0.8 -0.5 0.1" text="font: exo2semibold; width:1.7; color: #eeeeee; value:"></a-entity>

            <a-box id="boxLineaNegra2" visible="false" color="#000" width="0.3" height="0.025" depth="0.001"></a-box>
            <a-box id="boxLineaRoja2" visible="false" color="#ff0000" width="0.7" height="0.025" depth="0.001"></a-box>

            <a-entity position="4.6 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_calorias2>
                <a-entity id="entHexagonoCalorias2" visible="false" mixin="image_exceso_en_calorias"></a-entity>
            </a-entity>
            <a-entity position="2.2 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_azucares2>
                <a-entity id="entHexagonoAzucares2" visible="false" mixin="image_exceso_en_azucares"></a-entity>
            </a-entity>
            <a-entity position="1 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_grasas_saturadas2>
                <a-entity id="entHexagonoGrasasSaturadas2" visible="false" mixin="image_exceso_en_grasas_saturadas"></a-entity>
            </a-entity>
            <a-entity position="-1.4 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_sodio2>
                <a-entity id="entHexagonoSodio2" visible="false" mixin="image_exceso_en_sodio"></a-entity>
            </a-entity>


            <a-entity id="valor_limite_excedido2" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black; width:3;" visible="false">
            </a-entity>
        </a-box>
        <a-box opacity="0.15" color="#000" width="3.7" height="2.8" depth="0.00000001"
            id="boxDerechoIngredientes"
            visible="false"
            position="3.6 1.4 -3"
            rotation="0 -40 0"
            text="align: center;color: white;">
            <a-entity id="ingredientes" position="0 0.5 0" text="font: exo2semibold; width:3; color: #000;"></a-entity>
            <a-entity id="titulo_ingredientes" position="0.5 1.2 0" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
        <a-box opacity="0.15" color="#000" width="3.7" height="2.8" depth="0.00000001"
            id="boxIzquierdoIngredientes"
            visible="false"
            position="-3.6 1.4 -3"
            rotation="0 40 0"
            text="align: center;color: white; value:">
            <a-entity id="ingredientes2" position="0 0.5 0" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes2" position="0.5 1.2 0" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
    </a-scene>
</body>
