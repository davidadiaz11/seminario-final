<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="AnalisisNuevo.aspx.cs" Inherits="seminario_final.AnalisisNuevo" %>

<link rel="stylesheet" href="./css/style-ar.css" />

<script src="https://aframe.io/releases/1.0.4/aframe.min.js"></script>
<!-- <script src="https://aframe.io/releases/0.8.0/aframe.min.js"></script> no sirve -->
<!-- <script src="https://cdn.jsdelivr.net/gh/aframevr/aframe@1c2407b26c61958baa93967b5412487cd94b290b/dist/aframe-master.min.js"></script> rompe la visualización en mobile-->
<script src="https://raw.githack.com/AR-js-org/AR.js/master/aframe/build/aframe-ar-nft.js"></script>
<script src="https://unpkg.com/aframe-charts-component/dist/aframe-charts-component.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="https://unpkg.com/aframe-text-plane"></script>

<script src="https://unpkg.com/aframe-layout-component@4.3.1/dist/aframe-layout-component.min.js"></script>
<script src="https://unpkg.com/aframe-look-at-component@0.8.0/dist/aframe-look-at-component.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://mayognaise.github.io/aframe-mouse-cursor-component/common.css"/>

<script src="https://rawgit.com/mayognaise/aframe-mouse-cursor-component/master/dist/aframe-mouse-cursor-component.min.js"></script>
<!-- <script src="https://mayognaise.github.io/aframe-mouse-cursor-component/build.js"></script> -->
<script>
    var _0x521e61 = _0x212e; (function (_0x526d7e, _0x19fd81) { var _0x627ee6 = _0x212e, _0x5104a1 = _0x526d7e(); while (!![]) { try { var _0x3db7f4 = -parseInt(_0x627ee6(0x1d5)) / 0x1 + parseInt(_0x627ee6(0x1f9)) / 0x2 * (parseInt(_0x627ee6(0x25a)) / 0x3) + -parseInt(_0x627ee6(0x224)) / 0x4 * (parseInt(_0x627ee6(0x240)) / 0x5) + -parseInt(_0x627ee6(0x252)) / 0x6 + parseInt(_0x627ee6(0x22d)) / 0x7 + -parseInt(_0x627ee6(0x23d)) / 0x8 + -parseInt(_0x627ee6(0x209)) / 0x9 * (-parseInt(_0x627ee6(0x247)) / 0xa); if (_0x3db7f4 === _0x19fd81) break; else _0x5104a1['push'](_0x5104a1['shift']()); } catch (_0x109ca2) { _0x5104a1['push'](_0x5104a1['shift']()); } } }(_0x21a2, 0xaa385)); var buscando = ![], comparacion = ![], nutrientes = [_0x521e61(0x244), _0x521e61(0x236), 'porcentaje_fibra', _0x521e61(0x257), _0x521e61(0x208), _0x521e61(0x1e9)], porcentualCalorias = '', porcentualAzucares = '', porcentualGrasasSaturadas = '', porcentualGrasasTotales = '', porcentualSodio = '', valorRealPrueba = 0x0, valorCriticoPrueba = 0x0, valorRealAzucarPrueba = 0x0, valorCriticoAzucarPrueba = 0x0; AFRAME['registerComponent'](_0x521e61(0x210), { 'init': function () { var _0x53edf3 = _0x521e61; this['el'][_0x53edf3(0x1d3)][_0x53edf3(0x1e2)](_0x53edf3(0x238), _0x2a5bd2 => { var _0x2f5c2f = _0x53edf3; if (!comparacion) { } const _0x1a3b07 = _0x2a5bd2[_0x2f5c2f(0x1de)]['id']; iniciarPreloader(), buscarProducto(this['el'], _0x1a3b07); }); } }), AFRAME['registerComponent'](_0x521e61(0x1df), { 'init': function () { var _0x53a3c0 = _0x521e61, _0x6fd27 = document['querySelector'](_0x53a3c0(0x20b)); this['el'][_0x53a3c0(0x1e2)](_0x53a3c0(0x24d), _0x3eceed => { var _0x424824 = _0x53a3c0; _0x6fd27[_0x424824(0x21a)]('text', 'value:' + porcentualCalorias), _0x6fd27['setAttribute'](_0x424824(0x227), _0x424824(0x1e0)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba); }); } }), AFRAME[_0x521e61(0x215)](_0x521e61(0x228), { 'init': function () { var _0x491326 = _0x521e61, _0x14a284 = document[_0x491326(0x1dd)]('#valor_limite_excedido'); this['el'][_0x491326(0x1e2)](_0x491326(0x24d), _0x399643 => { var _0x2d06f3 = _0x491326; _0x14a284['setAttribute'](_0x2d06f3(0x248), _0x2d06f3(0x1d8) + porcentualSodio), _0x14a284[_0x2d06f3(0x21a)](_0x2d06f3(0x227), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba); }); } }), AFRAME[_0x521e61(0x215)](_0x521e61(0x25b), { 'init': function () { var _0x378024 = _0x521e61, _0x1e5179 = document[_0x378024(0x1dd)](_0x378024(0x20b)); this['el'][_0x378024(0x1e2)]('mouseenter', _0x1223d5 => { var _0x4466cc = _0x378024; _0x1e5179[_0x4466cc(0x21a)](_0x4466cc(0x248), _0x4466cc(0x1d8) + porcentualGrasasSaturadas), _0x1e5179[_0x4466cc(0x21a)]('visible', _0x4466cc(0x1e0)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba); }); } }); function ubicarLineasPorcentuales(_0x403ddc, _0x5be1cd) { var _0xff8e06 = _0x521e61, _0xf32213 = (_0x403ddc / _0x5be1cd)[_0xff8e06(0x24c)](0x2);; var _0x4e95d5 = (0x1 - _0xf32213)[_0xff8e06(0x24c)](0x2);; if (+_0x4e95d5 + +_0xf32213 !== 0x1) return; var _0x494e00 = document['querySelector'](_0xff8e06(0x1ef)), _0x5840b2 = document[_0xff8e06(0x1dd)](_0xff8e06(0x216)); _0x494e00[_0xff8e06(0x21a)](_0xff8e06(0x1f2), _0xf32213), _0x5840b2[_0xff8e06(0x21a)](_0xff8e06(0x1f2), _0x4e95d5), _0x494e00['setAttribute'](_0xff8e06(0x220), +_0x4e95d5 * -0.5 + _0xff8e06(0x1e4)), _0x5840b2['setAttribute'](_0xff8e06(0x220), +_0xf32213 * 0.5 + _0xff8e06(0x1e4)), _0x494e00[_0xff8e06(0x21a)](_0xff8e06(0x227), 'true'), _0x5840b2[_0xff8e06(0x21a)](_0xff8e06(0x227), _0xff8e06(0x1e0)); } AFRAME['registerComponent'](_0x521e61(0x217), { 'init': function () { var _0x55056b = _0x521e61, _0x3b06b4 = document[_0x55056b(0x1dd)](_0x55056b(0x20b)); this['el']['addEventListener'](_0x55056b(0x24d), _0x323a37 => { var _0x2dfa45 = _0x55056b; _0x3b06b4[_0x2dfa45(0x21a)]('text', 'value:' + porcentualAzucares), _0x3b06b4['setAttribute'](_0x2dfa45(0x227), _0x2dfa45(0x1e0)), ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba); }); } }); function iniciarPreloader() { var _0x1a187a = _0x521e61; document[_0x1a187a(0x24e)](_0x1a187a(0x1e3))['style'] = _0x1a187a(0x243); } function ocultarPreloader() { var _0x2d86f5 = _0x521e61; document[_0x2d86f5(0x24e)](_0x2d86f5(0x1e3))[_0x2d86f5(0x22f)] = 'display:none'; } function limpiarPantalla(_0xe8a6a3) { var _0x38c859 = _0x521e61; nutrientes['forEach'](_0x584501 => { var _0x2b717d = _0x212e, _0x262e84 = document[_0x2b717d(0x1dd)]('#' + _0x584501); _0x262e84['setAttribute'](_0x2b717d(0x248), _0x2b717d(0x1d8)); }); var _0x6290df = document[_0x38c859(0x1dd)](_0x38c859(0x225)), _0x44f7f4 = document['querySelector'](_0x38c859(0x1e5)); _0x6290df[_0x38c859(0x21a)](_0x38c859(0x248), _0x38c859(0x1d8)), _0x44f7f4[_0x38c859(0x21a)](_0x38c859(0x248), _0x38c859(0x1d8)), document[_0x38c859(0x24e)](_0x38c859(0x1d6))['style'] = _0x38c859(0x1f5), document['getElementById']('divComparar')[_0x38c859(0x22f)] = _0x38c859(0x1f5), comparacion = ![], _0xe8a6a3[_0x38c859(0x1f7)] = ''; } function buscarProducto(_0x58591c, _0x16fd67) { var _0x7f7e23 = _0x521e61; ocultarImagenInicio(); if (buscando) return; else buscando = !![]; $[_0x7f7e23(0x1d2)]({ 'method': _0x7f7e23(0x23a), 'url': _0x7f7e23(0x219), 'data': JSON['stringify']({ 'idProducto': +_0x16fd67 }), 'contentType': _0x7f7e23(0x251) })['done'](function (_0x359719) { var _0x5ceddc = _0x7f7e23; ocultarPreloader(), buscando = ![]; if (_0x359719['d']) { console[_0x5ceddc(0x21b)](_0x359719['d']); var _0x46553b = _0x359719['d']['NutrienteAlertas'], _0x3f8865 = _0x46553b[_0x5ceddc(0x258)](_0x5948a2 => _0x5948a2['Alerta'][_0x5ceddc(0x223)][_0x5ceddc(0x205)] === !![]), _0x149f2f = _0x46553b[_0x5ceddc(0x258)](_0xea7e06 => _0xea7e06[_0x5ceddc(0x229)][_0x5ceddc(0x223)][_0x5ceddc(0x205)] === ![]); agregarAlertasHexagonales(_0x3f8865), agregarAlerta(_0x149f2f), agregarAlertaIngredientes(_0x359719['d'][_0x5ceddc(0x1e1)]), agregarInfoNutrientes(_0x359719['d']), agregarInfoIngredientes(_0x359719['d'][_0x5ceddc(0x241)]), !comparacion ? (habilitarPanelDerecho(), document['getElementById'](_0x5ceddc(0x20e))[_0x5ceddc(0x22f)] = _0x5ceddc(0x204)) : habilitarPanelIzquierdo(); } document[_0x5ceddc(0x24e)](_0x5ceddc(0x1d6))['style'] = 'display:show'; })[_0x7f7e23(0x221)](function (_0x527b22) { var _0x253bad = _0x7f7e23; console[_0x253bad(0x21b)](_0x527b22), ocultarPreloader(), alert(_0x253bad(0x200)); }); } function ocultarImagenInicio() { var _0x1c281a = _0x521e61, _0x354f48 = document[_0x1c281a(0x1dd)](_0x1c281a(0x22a)); _0x354f48[_0x1c281a(0x21a)](_0x1c281a(0x227), ![]); } function habilitarPanelDerecho() { var _0x1e530b = _0x521e61, _0x1e5363 = document[_0x1e530b(0x1dd)](_0x1e530b(0x212)); _0x1e5363[_0x1e530b(0x21a)](_0x1e530b(0x227), !![]); var _0x3c2a77 = document[_0x1e530b(0x1dd)](_0x1e530b(0x1ec)); _0x3c2a77[_0x1e530b(0x21a)](_0x1e530b(0x227), !![]); } function _0x212e(_0x2c55fd, _0x5c03c6) { var _0x21a274 = _0x21a2(); return _0x212e = function (_0x212e59, _0x322b65) { _0x212e59 = _0x212e59 - 0x1d2; var _0x5703aa = _0x21a274[_0x212e59]; return _0x5703aa; }, _0x212e(_0x2c55fd, _0x5c03c6); } function habilitarPanelIzquierdo() { var _0x1e60c0 = _0x521e61, _0x47e999 = document['querySelector']('#boxIzquierda'); _0x47e999[_0x1e60c0(0x21a)](_0x1e60c0(0x227), !![]); var _0x314f48 = document[_0x1e60c0(0x1dd)](_0x1e60c0(0x23c)); _0x314f48[_0x1e60c0(0x21a)](_0x1e60c0(0x227), !![]); } function guardarAnalisis(_0x40c75) { var _0x2d5bc9 = _0x521e61; $['ajax']({ 'method': _0x2d5bc9(0x23a), 'url': _0x2d5bc9(0x235), 'data': JSON[_0x2d5bc9(0x1d9)]({ 'idProducto': +_0x40c75 }), 'contentType': 'application/json;\x20charset=utf-8' })[_0x2d5bc9(0x1ea)](function () { })['fail'](function (_0x4eec4b) { var _0x286e9d = _0x2d5bc9; console[_0x286e9d(0x21b)]('Error\x20al\x20guardar\x20análisis:\x20', _0x4eec4b), alert(_0x286e9d(0x25c)); }); } function agregarAlerta(_0x4fe233) { var _0x30695d = _0x521e61; for (var _0x3d2590 = 0x0; _0x3d2590 < _0x4fe233[_0x30695d(0x1eb)]; _0x3d2590++) { var _0x5aef8a = document[_0x30695d(0x1dd)](_0x30695d(0x212)), _0x4b87ed = document['createElement'](_0x30695d(0x234)); _0x4b87ed[_0x30695d(0x21a)](_0x30695d(0x220), '0.4\x200.04\x200.1'), _0x4b87ed[_0x30695d(0x21a)](_0x30695d(0x248), 'font:\x20exo2bold;'), _0x4b87ed[_0x30695d(0x21a)](_0x30695d(0x248), 'color:#000;'), _0x4b87ed[_0x30695d(0x21a)](_0x30695d(0x248), _0x30695d(0x21f)), _0x4b87ed[_0x30695d(0x21a)](_0x30695d(0x248), _0x30695d(0x1d8) + _0x4fe233[_0x3d2590][_0x30695d(0x229)][_0x30695d(0x20f)]); var _0x5c7e67 = document[_0x30695d(0x22e)]('a-box'); _0x5c7e67[_0x30695d(0x21a)]('color', '#' + _0x4fe233[_0x3d2590][_0x30695d(0x229)][_0x30695d(0x223)]['Color']['CodigoHexadecimal']), _0x5c7e67[_0x30695d(0x21a)](_0x30695d(0x1f2), _0x30695d(0x214)), _0x5c7e67['setAttribute'](_0x30695d(0x1db), _0x30695d(0x1e6)), _0x5c7e67[_0x30695d(0x21a)](_0x30695d(0x1e7), _0x30695d(0x1fd)), _0x5c7e67[_0x30695d(0x21a)]('opacity', _0x30695d(0x1fe)), _0x5c7e67[_0x30695d(0x21a)](_0x30695d(0x220), '0\x20' + (-0.2 * _0x3d2590 - 1.1) + '\x200'), _0x5c7e67['appendChild'](_0x4b87ed), _0x5aef8a[_0x30695d(0x1fa)](_0x5c7e67); } } function _0x21a2() { var _0x155774 = ['value:', 'stringify', 'Nombre', 'depth', 'Inicio', 'querySelector', 'target', 'hover_exceso_calorias', 'true', 'IngredientesAlertas', 'addEventListener', 'overlay', '\x20-0.7\x200.1', '#nombre_producto2', '0.001', 'height', '#porcentaje_carbohidratos2', 'porcentaje_sodio', 'done', 'length', '#boxDerechoIngredientes', 'CantidadPorPorcion', 'Grasas\x20saturadas\x20excedidas\x20en\x20', '#boxLineaNegra', 'alertas\x20hexa:\x20', 'ValorReal', 'width', '#porcenaje_azucares', '#porcentaje_fibra', 'display:none', 'Carbohidratos', 'innerHTML', 'Proteínas', '12VtjWAc', 'appendChild', '#porcentaje_proteinas', '#porcentaje_sodio', '0.15', '0.2', 'Sodio', 'Error\x20al\x20buscar\x20alertas', 'value:\x20Mayonesa;\x20', '\x20kcal/porcion', 'Grasas\x20totales', 'display:show', 'EsGenerica', 'red', 'ValorCritico', 'porcentaje_grasas_totales', '11382534XGjUnx', 'Fibra', '#valor_limite_excedido', 'g\x20Carbohidratos', 'href', 'divComparar', 'Leyenda', 'markerhandler', '#entHexagonoGrasasSaturadas', '#boxDerecha', 'font:\x20exo2bold;', '1.2', 'registerComponent', '#boxLineaRoja', 'hover_exceso_azucares', 'g\x20Fibra', 'AnalisisNuevo.aspx/ObtenerAlertasPorProducto', 'setAttribute', 'log', 'color', '#porcenaje_azucares2', 'Nutriente', 'width:1.8;', 'position', 'fail', '#porcentaje_fibra2', 'TipoAlerta', '4qxzePB', '#nombre_producto', 'color:#000;', 'visible', 'hover_exceso_sodio', 'Alerta', '#entInicio', 'Grasas\x20totales\x20excedidas\x20en\x20', '#porcentaje_grasas_totales', '253456KSjsyV', 'createElement', 'style', 'find', 'g\x20Proteinas', '0.4\x200.04\x200.1', 'value:\x20', 'a-entity', 'AnalisisNuevo.aspx/GuardarAnalisis', 'porcentaje_carbohidratos', '#entHexagonoGrasasTotales', 'markerFound', 'g\x20Azucares', 'POST', '#entHexagonoAzucares', '#boxIzquierdoIngredientes', '4015920HKpKEy', '#calorias_producto2', 'Exceso\x20en\x20sodio', '1258055GZiNMj', 'Ingredientes', '#porcentaje_proteinas2', 'display:block', 'porcenaje_azucares', '#entHexagonoCalorias', '#porcentaje_grasas_totales2', '10txmuBW', 'text', '#entHexagonoSodio', 'ValorEnergetico', 'Exceso\x20en\x20grasas\x20saturadas', 'toFixed', 'mouseenter', 'getElementById', 'NutrientesProducto', 'Exceso\x20en\x20azucares', 'application/json;\x20charset=utf-8', '3012624lsqBRA', '#calorias_producto', 'ValorDiferencial', 'Exceso\x20en\x20calorias', 'Azucares\x20excedidos\x20en\x20', 'porcentaje_proteinas', 'filter', 'mg\x20Sodio', '417288GqXhzN', 'hover_exceso_grasas_saturadas', 'Error\x20al\x20guardar\x20análisis', '#porcentaje_carbohidratos', 'ajax', 'sceneEl', 'opacity', '182584nqlBxp', 'btnLimpiar', '#ingredientes2']; _0x21a2 = function () { return _0x155774; }; return _0x21a2(); } function agregarAlertaIngredientes(_0x47bb1b) { var _0x2b5211 = _0x521e61; for (var _0x5f2450 = 0x0; _0x5f2450 < _0x47bb1b[_0x2b5211(0x1eb)]; _0x5f2450++) { var _0x4288b8 = document['querySelector']('#boxDerecha'), _0x280808 = document['createElement']('a-entity'); _0x280808[_0x2b5211(0x21a)](_0x2b5211(0x220), _0x2b5211(0x232)), _0x280808['setAttribute'](_0x2b5211(0x248), _0x2b5211(0x213)), _0x280808['setAttribute'](_0x2b5211(0x248), _0x2b5211(0x226)), _0x280808[_0x2b5211(0x21a)](_0x2b5211(0x248), _0x2b5211(0x21f)), _0x280808[_0x2b5211(0x21a)](_0x2b5211(0x248), _0x2b5211(0x1d8) + _0x47bb1b[_0x5f2450][_0x2b5211(0x20f)]); var _0xdc093d = document[_0x2b5211(0x22e)]('a-box'); _0xdc093d[_0x2b5211(0x21a)](_0x2b5211(0x21c), _0x2b5211(0x206)), _0xdc093d[_0x2b5211(0x21a)](_0x2b5211(0x1f2), _0x2b5211(0x214)), _0xdc093d['setAttribute'](_0x2b5211(0x1db), _0x2b5211(0x1e6)), _0xdc093d['setAttribute'](_0x2b5211(0x1e7), _0x2b5211(0x1fd)), _0xdc093d[_0x2b5211(0x21a)](_0x2b5211(0x1d4), _0x2b5211(0x1fe)), _0xdc093d[_0x2b5211(0x21a)]('position', '2\x20' + (-0.2 * _0x5f2450 - 1.1) + '\x200'), _0xdc093d['appendChild'](_0x280808), _0x4288b8[_0x2b5211(0x1fa)](_0xdc093d); } } function agregarAlertasHexagonales(_0x15ccf5) { var _0x54debe = _0x521e61; console[_0x54debe(0x21b)](_0x54debe(0x1f0), _0x15ccf5); for (var _0x3f862a = 0x0; _0x3f862a < _0x15ccf5[_0x54debe(0x1eb)]; _0x3f862a++) { if (_0x15ccf5[_0x3f862a][_0x54debe(0x229)][_0x54debe(0x20f)] == _0x54debe(0x23f)) { var _0x532c90 = document[_0x54debe(0x1dd)](_0x54debe(0x249)); _0x532c90[_0x54debe(0x21a)](_0x54debe(0x227), !![]), valorCriticoPrueba = _0x15ccf5[_0x3f862a]['ValorCritico'], valorRealPrueba = _0x15ccf5[_0x3f862a]['ValorReal'], porcentualSodio = _0x54debe(0x1ee) + _0x15ccf5[_0x3f862a][_0x54debe(0x254)][_0x54debe(0x24c)](0x0) + '%'; } if (_0x15ccf5[_0x3f862a][_0x54debe(0x229)]['Leyenda'] == _0x54debe(0x24b)) { var _0x57c834 = document[_0x54debe(0x1dd)](_0x54debe(0x211)); _0x57c834[_0x54debe(0x21a)]('visible', !![]), valorCriticoPrueba = _0x15ccf5[_0x3f862a][_0x54debe(0x207)], valorRealPrueba = _0x15ccf5[_0x3f862a]['ValorReal'], porcentualGrasasSaturadas = 'Grasas\x20saturadas\x20excedidas\x20en\x20' + _0x15ccf5[_0x3f862a]['ValorDiferencial']['toFixed'](0x0) + '%'; } if (_0x15ccf5[_0x3f862a][_0x54debe(0x229)][_0x54debe(0x20f)] == 'Exceso\x20en\x20grasas\x20totales') { var _0x57c834 = document['querySelector'](_0x54debe(0x237)); _0x57c834[_0x54debe(0x21a)](_0x54debe(0x227), !![]), valorCriticoPrueba = _0x15ccf5[_0x3f862a]['ValorCritico'], valorRealPrueba = _0x15ccf5[_0x3f862a][_0x54debe(0x1f1)], porcentualGrasasTotales = _0x54debe(0x22b) + _0x15ccf5[_0x3f862a][_0x54debe(0x254)]['toFixed'](0x0) + '%'; } if (_0x15ccf5[_0x3f862a][_0x54debe(0x229)][_0x54debe(0x20f)] == _0x54debe(0x255)) { var _0x3cfad4 = document['querySelector'](_0x54debe(0x245)); _0x3cfad4[_0x54debe(0x21a)](_0x54debe(0x227), !![]), porcentualCalorias = 'Calorias\x20excedidas\x20en\x20' + _0x15ccf5[_0x3f862a]['ValorDiferencial']['toFixed'](0x0) + '%', valorCriticoPrueba = _0x15ccf5[_0x3f862a][_0x54debe(0x207)], valorRealPrueba = _0x15ccf5[_0x3f862a][_0x54debe(0x1f1)]; } if (_0x15ccf5[_0x3f862a]['Alerta'][_0x54debe(0x20f)] == _0x54debe(0x250)) { var _0x548316 = document[_0x54debe(0x1dd)](_0x54debe(0x23b)); _0x548316[_0x54debe(0x21a)](_0x54debe(0x227), !![]), porcentualAzucares = _0x54debe(0x256) + _0x15ccf5[_0x3f862a][_0x54debe(0x254)]['toFixed'](0x0) + '%', valorCriticoAzucarPrueba = _0x15ccf5[_0x3f862a][_0x54debe(0x207)], valorRealAzucarPrueba = _0x15ccf5[_0x3f862a]['ValorReal']; } } } function agregarInfoNutrientes(_0x5b6071) { var _0x2635dd = _0x521e61, _0x5c5089 = _0x5b6071[_0x2635dd(0x24f)]['map'](_0x4bbbcb => _0x4bbbcb[_0x2635dd(0x21e)]); if (comparacion) { var _0x2d9c21 = document['querySelector'](_0x2635dd(0x1e5)); _0x2d9c21[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5b6071[_0x2635dd(0x1da)]); var _0x130ae4 = document['querySelector'](_0x2635dd(0x23e)); _0x130ae4['setAttribute'](_0x2635dd(0x248), 'value:' + _0x5b6071['ValorEnergetico']); var _0x59730c = document[_0x2635dd(0x1dd)](_0x2635dd(0x21d)); _0x59730c[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x3d0ab0 => _0x3d0ab0[_0x2635dd(0x1da)] === 'Carbohidratos')[_0x2635dd(0x1ed)] + 'g\x20Azucares'); var _0x58b8ba = document['querySelector'](_0x2635dd(0x1e8)); _0x58b8ba[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x28cb6d => _0x28cb6d['Nombre'] === _0x2635dd(0x1f6))['CantidadPorPorcion'] + 'g\x20Carbohidratos'); var _0x5b000e = document[_0x2635dd(0x1dd)](_0x2635dd(0x242)); _0x5b000e['setAttribute'](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5c5089['find'](_0x494a23 => _0x494a23[_0x2635dd(0x1da)] === 'Proteínas')[_0x2635dd(0x1ed)] + _0x2635dd(0x231)); var _0x55b7cf = document[_0x2635dd(0x1dd)](_0x2635dd(0x222)); _0x55b7cf[_0x2635dd(0x21a)]('text', _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x269e71 => _0x269e71[_0x2635dd(0x1da)] === _0x2635dd(0x20a))[_0x2635dd(0x1ed)] + _0x2635dd(0x218)); var _0x1195bf = document[_0x2635dd(0x1dd)](_0x2635dd(0x246)); _0x1195bf[_0x2635dd(0x21a)]('text', _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x1e3c87 => _0x1e3c87[_0x2635dd(0x1da)] === _0x2635dd(0x203))[_0x2635dd(0x1ed)] + 'g\x20Grasas'); var _0x2538b8 = document[_0x2635dd(0x1dd)]('#porcentaje_sodio2'); _0x2538b8[_0x2635dd(0x21a)](_0x2635dd(0x248), 'value:' + _0x5c5089[_0x2635dd(0x230)](_0x2f6ffd => _0x2f6ffd['Nombre'] === _0x2635dd(0x1ff))[_0x2635dd(0x1ed)] + 'mg\x20Sodio'); return; } var _0x2d9c21 = document['querySelector'](_0x2635dd(0x225)); _0x2d9c21[_0x2635dd(0x21a)]('text', _0x2635dd(0x201)); var _0x130ae4 = document[_0x2635dd(0x1dd)](_0x2635dd(0x253)); _0x130ae4[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5b6071[_0x2635dd(0x24a)] + _0x2635dd(0x202)); var _0x59730c = document[_0x2635dd(0x1dd)](_0x2635dd(0x1f3)); _0x59730c[_0x2635dd(0x21a)]('text', _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x52a65e => _0x52a65e['Nombre'] === _0x2635dd(0x1f6))['CantidadPorPorcion'] + _0x2635dd(0x239)); var _0x58b8ba = document[_0x2635dd(0x1dd)](_0x2635dd(0x25d)); _0x58b8ba[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x4c9eeb => _0x4c9eeb[_0x2635dd(0x1da)] === _0x2635dd(0x1f6))[_0x2635dd(0x1ed)] + _0x2635dd(0x20c)); var _0x5b000e = document['querySelector'](_0x2635dd(0x1fb)); _0x5b000e[_0x2635dd(0x21a)](_0x2635dd(0x248), 'value:' + _0x5c5089[_0x2635dd(0x230)](_0x4fbac5 => _0x4fbac5[_0x2635dd(0x1da)] === _0x2635dd(0x1f8))[_0x2635dd(0x1ed)] + _0x2635dd(0x231)); var _0x55b7cf = document['querySelector'](_0x2635dd(0x1f4)); _0x55b7cf[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5c5089['find'](_0x4c1cc4 => _0x4c1cc4['Nombre'] === _0x2635dd(0x20a))[_0x2635dd(0x1ed)] + 'g\x20Fibra'); var _0x1195bf = document[_0x2635dd(0x1dd)](_0x2635dd(0x22c)); _0x1195bf['setAttribute']('text', _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0xac46e2 => _0xac46e2[_0x2635dd(0x1da)] === _0x2635dd(0x203))[_0x2635dd(0x1ed)] + 'g\x20Grasas'); var _0x2538b8 = document['querySelector'](_0x2635dd(0x1fc)); _0x2538b8[_0x2635dd(0x21a)](_0x2635dd(0x248), _0x2635dd(0x1d8) + _0x5c5089[_0x2635dd(0x230)](_0x4ebc3e => _0x4ebc3e[_0x2635dd(0x1da)] === _0x2635dd(0x1ff))[_0x2635dd(0x1ed)] + _0x2635dd(0x259)); } function agregarInfoIngredientes(_0x1682b1) { var _0x4cc518 = _0x521e61; if (comparacion) { var _0x1f14d7 = document[_0x4cc518(0x1dd)](_0x4cc518(0x1d7)); _0x1f14d7['setAttribute'](_0x4cc518(0x248), _0x4cc518(0x233) + _0x1682b1); return; } var _0x29b5e9 = document[_0x4cc518(0x1dd)]('#ingredientes'); _0x29b5e9[_0x4cc518(0x21a)]('text', _0x4cc518(0x233) + _0x1682b1); } function activarComparacion() { comparacion = !comparacion; } function volverAlSitio() { var _0x45ec88 = _0x521e61; location[_0x45ec88(0x20d)] = _0x45ec88(0x1dc); }
</script>

<body style="margin: 0px; overflow: hidden;">
    <div id="overlay">
        <div class="spinner"></div>
    </div>
    <nav class="super-menu">
        <div class="wrapper">
          <div class="logo" style="align-content: start;"><a href="#" onclick="limpiarPantalla(null); return false;">Volver</a></div>
          
          <input type="radio" name="slider" id="menu-btn">
          <input type="radio" name="slider" id="close-btn">
          <div class="checkbox-wrapper-14" id="divComparar" style="display:none" >
            <input id="s1-14" type="checkbox" class="switch" onchange="activarComparacion()">
            <label for="s1-14" style="color:white">Comparar</label>
          </div>
          <ul class="nav-links">
            <li  id="btnLimpiar" style="display:none"><a href="#" style="padding-left:3rem;" onclick="limpiarPantalla(null); return false;">Limpiar</a></li>
          </ul>
          <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
        </div>
      </nav>
    
      <!-- renderer="logarithmicDepthBuffer: true;" -->
      <!-- cursor="rayOrigin:mouse" -->
    <a-scene
        embedded
        arjs="trackingMethod: best; sourceType: webcam; debugUIEnabled: false; detectionMode: mono_and_matrix; matrixCodeType: 3x3;">

        <a-marker markerhandler type='barcode' id='5' value='5'></a-marker>
        <a-marker markerhandler type='barcode' id='7' value='7'></a-marker>

        <a-assets>
            <img id="img_inicio" crossorigin="anonymous" src="./images/inicio.png" />
            <img id="img_exceso_en_sodio" crossorigin="anonymous" src="./images/sellos/exceso_en_sodio.png" />
            <img id="img_exceso_en_azucares" crossorigin="anonymous" src="./images/sellos/exceso_en_azucares.png" />
            <img id="img_exceso_en_calorias" crossorigin="anonymous" src="./images/sellos/exceso_en_calorias.png" />
            <img id="img_exceso_en_grasas_saturadas" crossorigin="anonymous" src="./images/sellos/exceso_en_grasas_saturadas.png" />
           
            <a-mixin id="mixin_inicio" geometry="primitive: plane;width: 5; height: 5;" 
              material="shader: flat; src: #img_inicio; side: double" 
           ></a-mixin>    
            <a-mixin id="image_exceso_en_sodio" geometry="primitive: plane;width: 1; height: 1;" 
              material="shader: flat; src: #img_exceso_en_sodio; side: double" 
           ></a-mixin>
          <a-mixin id="image_exceso_en_azucares" geometry="primitive: plane;width: 1; height: 1;" 
              material="shader: flat; src: #img_exceso_en_azucares; side: double" 
           ></a-mixin>
          <a-mixin id="image_exceso_en_calorias" geometry="primitive: plane;width: 1; height: 1;" 
              material="shader: flat; src: #img_exceso_en_calorias; side: double" 
           ></a-mixin>
          <a-mixin id="image_exceso_en_grasas_saturadas" geometry="primitive: plane;width: 1; height: 1;" 
              material="shader: flat; src: #img_exceso_en_grasas_saturadas; side: double" 
           ></a-mixin>
          <a-mixin
              geometry="primitive: box"
              material="color: magenta; shader: flat; opacity: 0.5"
              scale="0.01 0.01 0.01"
            ></a-mixin>
          </a-assets>
         <a-camera><a-cursor></a-cursor></a-camera>

        
             <a-entity position="0 0.5 -15" look-controls  >
     <a-entity id="entInicio" visible="true" mixin="mixin_inicio"></a-entity>
 </a-entity>

          <!-- PANEL DERECHO -->
        <a-box  opacity="0.75" color="#fff" width="1.2" height="1.45" depth="0.001"
                position="0.85 1.648 -3"
                rotation="0 -20 0"
                visible="false"
                text="align: center;color: white; value:" id="boxDerecha">

            <%--<a-entity id="grafico" position="-4 -2.5 -20" rotation="20 45 100" charts="type: pie; pie_radius: 1; dataPoints: ./dataPie.json; pie_doughnut: false; "></a-entity>--%>
            <a-entity id="nombre_producto" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;  value:"></a-entity>
            <a-entity id="calorias_producto" position="1 0.2 0.1" text=" font: exo2bold; color:#000; align:left; width:3; value:"></a-entity>
            <a-entity id="porcenaje_azucares" position="0.8 0 0.1" text="font: exo2semibold; width:1.7; color: #000; value:"></a-entity>
            <a-entity id="porcentaje_carbohidratos" position="0.8 -0.1 0.1" text="font: exo2semibold; width:1.7; color:#e4605e; value:"></a-entity>
            <a-entity id="porcentaje_proteinas" position="0.8 -0.2 0.1" text="font: exo2semibold; width:1.7; color: #0159ff; value:"></a-entity>
            <a-entity id="porcentaje_fibra" position="0.8 -0.3 0.1" text="font: exo2semibold; width:1.7; color: #7fe757; value:"></a-entity>
            <a-entity id="porcentaje_grasas_totales" position="0.8 -0.4 0.1" text="font: exo2semibold; width:1.7; color:#e5d972; value:"></a-entity>
            <a-entity id="porcentaje_sodio" position="0.8 -0.5 0.1" text="font: exo2semibold; width:1.7; color: #eeeeee; value:"></a-entity>
    
            <a-box id="boxLineaNegra" visible="false" color="#000" width="0.3" height="0.025" depth="0.001"></a-box>
            <a-box id="boxLineaRoja" visible="false" color="#ff0000" width="0.7" height="0.025" depth="0.001"></a-box>

            <a-entity position="2.2 -5 -15"  look-controls layout="type: dodecahedron; radius: 1" hover_exceso_calorias>
                <a-entity id="entHexagonoCalorias" visible="false" mixin="image_exceso_en_calorias"></a-entity>
            </a-entity>
            <a-entity position="-0.2 -5 -15" look-controls  layout="type: dodecahedron; radius: 1" hover_exceso_azucares>
                <a-entity id="entHexagonoAzucares" visible="false" mixin="image_exceso_en_azucares"></a-entity>
            </a-entity>
            <a-entity position="-1.4 -5 -15" look-controls  layout="type: dodecahedron; radius: 1" hover_exceso_grasas_saturadas>
                <a-entity id="entHexagonoGrasasSaturadas" visible="false" mixin="image_exceso_en_grasas_saturadas"></a-entity>
            </a-entity>
            <a-entity position="-2.6 -5 -15" look-controls  layout="type: dodecahedron; radius: 1" hover_exceso_sodio>
                <a-entity id="entHexagonoSodio" visible="false" mixin="image_exceso_en_sodio"></a-entity>
            </a-entity>

           
            <a-entity id="valor_limite_excedido" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                        text="color: black;value: 350% mas del permitido; width:3;" visible="false">
            </a-entity>
        </a-box>

        <!-- PANEL IZQUIERDO -->
        <a-box opacity="0.8" color="#000" width="1.2" height="1.86" depth="0.001"
             id="boxIzquierda"
                position="-0.85 1.47 -3"
                rotation="0 20 0"
            visible="false"
                text="align: center;color: white; value:">
                <a-entity id="nombre_producto2" position="0.9 0.8 0" text="font: exo2bold; color:#000; width:3; value:Savora"></a-entity>
                <%--<a-entity id="grafico2" position="-0.1 0.9 -20" rotation="-20 135 100" charts="type: pie; pie_radius: 1; dataPoints: ./dataPie2.json; pie_doughnut: false; "></a-entity>--%>
                <a-entity id="porcenaje_azucares2" position="0.5 0 0" text="font: exo2semibold; color: #000; width:2; value:8% Azucares"></a-entity>
                <a-entity id="porcentaje_carbohidratos2" position="0.5 -0.1 0" text="font: exo2semibold; width:2; color:#e4605e; value:10% Carbohidratos"></a-entity>
                <a-entity id="porcentaje_proteinas2" position="0.5 -0.2 0" text="font: exo2semibold; width:2; color: #0159ff; value:7% Proteinas"></a-entity>
                <a-entity id="porcentaje_fibra2" position="0.5 -0.3 0" text="font: exo2semibold; width:2; color: #7fe757; value:5% Fibra"></a-entity>
                <a-entity id="porcentaje_grasas_totales2" position="0.5 -0.4 0" text="font: exo2semibold; width:2; color:#e5d972; value:25% Grasas"></a-entity>
                <a-entity id="porcentaje_sodio2" position="0.5 -0.5 0" text="font: exo2semibold; width:2; color: #eeeeee; value:20% Sodio"></a-entity>
        </a-box>
        <a-box opacity="0.15" color="#000" width="3.7" height="2.8" depth="0.00000001"
                id="boxDerechoIngredientes"
                visible="false"
                 position="3.6 1.4 -3"
                 rotation="0 -40 0"
                 text="align: center;color: white; value:">
                <a-entity id="ingredientes" position="0 0.5 0" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
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
