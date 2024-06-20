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
    var _0x51e6ad = _0x71c8; (function (_0x498eb2, _0x250b66) { var _0x1546fb = _0x71c8, _0x99e1b = _0x498eb2(); while (!![]) { try { var _0x1a8fa8 = parseInt(_0x1546fb(0x1fb)) / 0x1 * (parseInt(_0x1546fb(0x1f3)) / 0x2) + -parseInt(_0x1546fb(0x1d2)) / 0x3 * (parseInt(_0x1546fb(0x1b9)) / 0x4) + -parseInt(_0x1546fb(0x1ab)) / 0x5 + parseInt(_0x1546fb(0x19c)) / 0x6 + -parseInt(_0x1546fb(0x1ac)) / 0x7 + -parseInt(_0x1546fb(0x208)) / 0x8 * (parseInt(_0x1546fb(0x1bf)) / 0x9) + parseInt(_0x1546fb(0x186)) / 0xa * (parseInt(_0x1546fb(0x1b0)) / 0xb); if (_0x1a8fa8 === _0x250b66) break; else _0x99e1b['push'](_0x99e1b['shift']()); } catch (_0x57ca75) { _0x99e1b['push'](_0x99e1b['shift']()); } } }(_0x3427, 0x1d7ae)); var buscando = ![], comparacion = ![], nutrientes = [_0x51e6ad(0x1b2), _0x51e6ad(0x205), _0x51e6ad(0x1c9), _0x51e6ad(0x201), 'porcentaje_grasas_totales', _0x51e6ad(0x1c7)], sumatoriaAlertas = 0x1, porcentualCalorias = '', porcentualAzucares = '', porcentualGrasasSaturadas = '', porcentualGrasasTotales = '', porcentualSodio = '', valorRealAzucares = 0x0, valorCriticoAzucares = 0x0, valorRealCalorias = 0x0, valorCriticoCalorias = 0x0, valorRealGrasasSaturadas = 0x0, valorCriticoGrasasSaturadas = 0x0, valorRealGrasasTotales = 0x0, valorCriticoGrasasTotales = 0x0, valorRealSodio = 0x0, valorCriticoSodio = 0x0, porcentualCalorias2 = '', porcentualAzucares2 = '', porcentualGrasasSaturadas2 = '', porcentualGrasasTotales2 = '', porcentualSodio2 = '', valorRealAzucares2 = 0x0, valorCriticoAzucares2 = 0x0, valorRealCalorias2 = 0x0, valorCriticoCalorias2 = 0x0, valorRealGrasasSaturadas2 = 0x0, valorCriticoGrasasSaturadas2 = 0x0, valorRealGrasasTotales2 = 0x0, valorCriticoGrasasTotales2 = 0x0, valorRealSodio2 = 0x0, valorCriticoSodio2 = 0x0; AFRAME[_0x51e6ad(0x1ea)]('markerhandler', { 'init': function () { var _0x10db05 = _0x51e6ad; this['el']['sceneEl']['addEventListener'](_0x10db05(0x19d), _0x352587 => { var _0x456a96 = _0x10db05; if (!comparacion) { } const _0x109706 = _0x352587[_0x456a96(0x189)]['id']; iniciarPreloader(), buscarProducto(_0x109706); }); } }), AFRAME['registerComponent']('hover_exceso_calorias', { 'init': function () { var _0x8d8f9d = _0x51e6ad, _0x2c1b0f = document[_0x8d8f9d(0x185)](_0x8d8f9d(0x18b)); this['el'][_0x8d8f9d(0x203)](_0x8d8f9d(0x1ec), _0x829ac7 => { var _0x273fb8 = _0x8d8f9d; _0x2c1b0f[_0x273fb8(0x1cd)](_0x273fb8(0x207), _0x273fb8(0x1e9) + porcentualCalorias), _0x2c1b0f[_0x273fb8(0x1cd)](_0x273fb8(0x1aa), _0x273fb8(0x193)), ubicarLineasPorcentuales(valorCriticoCalorias, valorRealCalorias, !![]); }); } }), AFRAME[_0x51e6ad(0x1ea)]('hover_exceso_calorias2', { 'init': function () { var _0x1db0e7 = _0x51e6ad, _0x2f0f7f = document[_0x1db0e7(0x185)](_0x1db0e7(0x1db)); this['el']['addEventListener'](_0x1db0e7(0x1ec), _0x5747ab => { var _0x19bb9d = _0x1db0e7; _0x2f0f7f['setAttribute'](_0x19bb9d(0x207), _0x19bb9d(0x1e9) + porcentualCalorias2), _0x2f0f7f[_0x19bb9d(0x1cd)](_0x19bb9d(0x1aa), _0x19bb9d(0x193)), ubicarLineasPorcentuales(valorCriticoCalorias2, valorRealCalorias2, ![]); }); } }), AFRAME[_0x51e6ad(0x1ea)](_0x51e6ad(0x1d4), { 'init': function () { var _0x41868f = _0x51e6ad, _0x2e561d = document['querySelector'](_0x41868f(0x18b)); this['el'][_0x41868f(0x203)](_0x41868f(0x1ec), _0x44eaed => { var _0xef40b7 = _0x41868f; _0x2e561d[_0xef40b7(0x1cd)](_0xef40b7(0x207), _0xef40b7(0x1e9) + porcentualSodio), _0x2e561d['setAttribute'](_0xef40b7(0x1aa), 'true'), ubicarLineasPorcentuales(valorCriticoSodio, valorRealSodio, !![]); }); } }), AFRAME['registerComponent']('hover_exceso_sodio2', { 'init': function () { var _0x11a7b9 = _0x51e6ad, _0x5cb51c = document['querySelector'](_0x11a7b9(0x1db)); this['el'][_0x11a7b9(0x203)]('mouseenter', _0x341746 => { var _0x2259d2 = _0x11a7b9; _0x5cb51c[_0x2259d2(0x1cd)](_0x2259d2(0x207), _0x2259d2(0x1e9) + porcentualSodio2), _0x5cb51c[_0x2259d2(0x1cd)]('visible', 'true'), ubicarLineasPorcentuales(valorCriticoSodio2, valorRealSodio2, ![]); }); } }), AFRAME[_0x51e6ad(0x1ea)](_0x51e6ad(0x1ad), { 'init': function () { var _0x42f31b = _0x51e6ad, _0x4e0dbd = document['querySelector'](_0x42f31b(0x18b)); this['el'][_0x42f31b(0x203)](_0x42f31b(0x1ec), _0x177391 => { var _0x2b0022 = _0x42f31b; _0x4e0dbd[_0x2b0022(0x1cd)](_0x2b0022(0x207), _0x2b0022(0x1e9) + porcentualGrasasTotales), _0x4e0dbd['setAttribute'](_0x2b0022(0x1aa), _0x2b0022(0x193)), ubicarLineasPorcentuales(valorCriticoGrasasTotales, valorRealGrasasTotales, !![]); }); } }), AFRAME['registerComponent'](_0x51e6ad(0x19e), { 'init': function () { var _0x43ada6 = _0x51e6ad, _0x287cc4 = document[_0x43ada6(0x185)]('#valor_limite_excedido2'); this['el'][_0x43ada6(0x203)](_0x43ada6(0x1ec), _0x5f3e86 => { var _0x222664 = _0x43ada6; _0x287cc4[_0x222664(0x1cd)](_0x222664(0x207), _0x222664(0x1e9) + porcentualGrasasTotales2), _0x287cc4[_0x222664(0x1cd)]('visible', 'true'), ubicarLineasPorcentuales(valorCriticoGrasasTotales2, valorRealGrasasTotales2, ![]); }); } }), AFRAME[_0x51e6ad(0x1ea)](_0x51e6ad(0x1e8), { 'init': function () { var _0x4df7d1 = _0x51e6ad, _0xdd50a4 = document[_0x4df7d1(0x185)](_0x4df7d1(0x18b)); this['el'][_0x4df7d1(0x203)](_0x4df7d1(0x1ec), _0x353d1b => { var _0x4a60c6 = _0x4df7d1; _0xdd50a4[_0x4a60c6(0x1cd)](_0x4a60c6(0x207), _0x4a60c6(0x1e9) + porcentualGrasasSaturadas), _0xdd50a4[_0x4a60c6(0x1cd)](_0x4a60c6(0x1aa), _0x4a60c6(0x193)), ubicarLineasPorcentuales(valorCriticoGrasasSaturadas, valorRealGrasasSaturadas, !![]); }); } }), AFRAME[_0x51e6ad(0x1ea)](_0x51e6ad(0x1e2), { 'init': function () { var _0x321090 = _0x51e6ad, _0x148071 = document[_0x321090(0x185)](_0x321090(0x1db)); this['el'][_0x321090(0x203)](_0x321090(0x1ec), _0x83984b => { var _0x4cab07 = _0x321090; _0x148071[_0x4cab07(0x1cd)](_0x4cab07(0x207), _0x4cab07(0x1e9) + porcentualGrasasSaturadas2), _0x148071[_0x4cab07(0x1cd)](_0x4cab07(0x1aa), _0x4cab07(0x193)), ubicarLineasPorcentuales(valorCriticoGrasasSaturadas2, valorRealGrasasSaturadas2, ![]); }); } }), AFRAME[_0x51e6ad(0x1ea)](_0x51e6ad(0x1f8), { 'init': function () { var _0x53b32d = _0x51e6ad, _0x10fa10 = document['querySelector'](_0x53b32d(0x18b)); this['el'][_0x53b32d(0x203)](_0x53b32d(0x1ec), _0x1f6794 => { var _0x217848 = _0x53b32d; _0x10fa10[_0x217848(0x1cd)]('text', _0x217848(0x1e9) + porcentualAzucares), _0x10fa10[_0x217848(0x1cd)](_0x217848(0x1aa), _0x217848(0x193)), ubicarLineasPorcentuales(valorCriticoAzucares, valorRealAzucares, !![]); }); } }), AFRAME[_0x51e6ad(0x1ea)]('hover_exceso_azucares2', { 'init': function () { var _0x1e1c08 = _0x51e6ad, _0x52931e = document[_0x1e1c08(0x185)](_0x1e1c08(0x1db)); this['el'][_0x1e1c08(0x203)]('mouseenter', _0x312102 => { var _0x2a4c71 = _0x1e1c08; _0x52931e[_0x2a4c71(0x1cd)](_0x2a4c71(0x207), _0x2a4c71(0x1e9) + porcentualAzucares2), _0x52931e[_0x2a4c71(0x1cd)](_0x2a4c71(0x1aa), 'true'), ubicarLineasPorcentuales(valorCriticoAzucares2, valorRealAzucares2, ![]); }); } }); function ubicarLineasPorcentuales(_0x5e8485, _0x55ecb9, _0xf066b6) { var _0x157a9b = _0x51e6ad, _0x503832 = ''; !_0xf066b6 && (_0x503832 = '2'); var _0x452f4b = (_0x5e8485 / _0x55ecb9)['toFixed'](0x2);; var _0x7d499 = (0x1 - _0x452f4b)[_0x157a9b(0x1ae)](0x2);; if (+_0x7d499 + +_0x452f4b !== 0x1) return; var _0x463620 = document['querySelector']('#boxLineaNegra' + _0x503832), _0x3a04c7 = document[_0x157a9b(0x185)]('#boxLineaRoja' + _0x503832); _0x463620[_0x157a9b(0x1cd)]('width', _0x452f4b), _0x3a04c7[_0x157a9b(0x1cd)]('width', _0x7d499), _0x463620[_0x157a9b(0x1cd)]('position', +_0x7d499 * -0.5 + _0x157a9b(0x1b6)), _0x3a04c7['setAttribute'](_0x157a9b(0x1fc), +_0x452f4b * 0.5 + _0x157a9b(0x1b6)), _0x463620[_0x157a9b(0x1cd)](_0x157a9b(0x1aa), 'true'), _0x3a04c7['setAttribute'](_0x157a9b(0x1aa), 'true'); } function iniciarPreloader() { var _0x364c4d = _0x51e6ad; document[_0x364c4d(0x1a1)](_0x364c4d(0x1ee))[_0x364c4d(0x198)] = _0x364c4d(0x1f2); } function ocultarPreloader() { var _0x553d3c = _0x51e6ad; document[_0x553d3c(0x1a1)]('overlay')['style'] = _0x553d3c(0x1c2); } function limpiarPantalla() { var _0x395770 = _0x51e6ad; nutrientes[_0x395770(0x191)](_0x1d7043 => { var _0x4d41bb = _0x395770, _0x3fb1a7 = document[_0x4d41bb(0x185)]('#' + _0x1d7043); _0x3fb1a7[_0x4d41bb(0x1cd)](_0x4d41bb(0x207), _0x4d41bb(0x1e9)); }), document[_0x395770(0x185)](_0x395770(0x1c1))[_0x395770(0x1a3)] = ''; var _0x4dc591 = document[_0x395770(0x185)](_0x395770(0x1d0)), _0x56ac6a = document[_0x395770(0x185)](_0x395770(0x184)); _0x4dc591['setAttribute']('text', 'value:'), _0x56ac6a[_0x395770(0x1cd)](_0x395770(0x207), _0x395770(0x1e9)), sumatoriaAlertas = 0x1, document[_0x395770(0x1a1)](_0x395770(0x1cf))[_0x395770(0x198)] = _0x395770(0x1c2), document['getElementById']('divComparar')[_0x395770(0x198)] = 'display:none', comparacion = ![], habilitarPanelDerecho(![]), habilitarPanelIzquierdo(![]), mostrarImagenInicio(!![]); } function _0x71c8(_0x531859, _0x37e6b9) { var _0x3427a0 = _0x3427(); return _0x71c8 = function (_0x71c830, _0x4921d5) { _0x71c830 = _0x71c830 - 0x184; var _0x721241 = _0x3427a0[_0x71c830]; return _0x721241; }, _0x71c8(_0x531859, _0x37e6b9); } function buscarProducto(_0xf72323) { var _0x12e41f = _0x51e6ad; mostrarImagenInicio(![]); if (buscando) return; else buscando = !![]; $['ajax']({ 'method': _0x12e41f(0x1d5), 'url': _0x12e41f(0x1fe), 'data': JSON['stringify']({ 'idProducto': +_0xf72323 }), 'contentType': _0x12e41f(0x1bb) })[_0x12e41f(0x1b7)](function (_0x2ea7f1) { var _0x272c1f = _0x12e41f; ocultarPreloader(), buscando = ![]; if (_0x2ea7f1['d']) { console[_0x272c1f(0x196)](_0x2ea7f1['d']); var _0x58c767 = _0x2ea7f1['d']['NutrienteAlertas'], _0x14b095 = _0x58c767[_0x272c1f(0x1c5)](_0x3c596e => _0x3c596e['Alerta'][_0x272c1f(0x1d7)]['EsGenerica'] === !![]), _0x53c924 = _0x58c767[_0x272c1f(0x1c5)](_0x820c70 => _0x820c70[_0x272c1f(0x194)][_0x272c1f(0x1d7)][_0x272c1f(0x1cb)] === ![]); agregarAlertasHexagonales(_0x14b095), agregarAlerta(_0x53c924), agregarAlertaIngredientes(_0x2ea7f1['d'][_0x272c1f(0x1b4)]), agregarInfoNutrientes(_0x2ea7f1['d']), agregarInfoIngredientes(_0x2ea7f1['d'][_0x272c1f(0x1a5)]), guardarAnalisis(_0xf72323), !comparacion ? (habilitarPanelDerecho(!![]), document[_0x272c1f(0x1a1)]('divComparar')['style'] = _0x272c1f(0x1ef)) : habilitarPanelIzquierdo(!![]); } document[_0x272c1f(0x1a1)](_0x272c1f(0x1cf))[_0x272c1f(0x198)] = _0x272c1f(0x1ef); })[_0x12e41f(0x18d)](function (_0x31d174) { var _0x57a974 = _0x12e41f; console[_0x57a974(0x196)](_0x31d174), buscando = ![], ocultarPreloader(), alert('Error\x20al\x20buscar\x20alertas'); }); } function mostrarImagenInicio(_0x22ea29) { var _0x542fe5 = _0x51e6ad, _0x25146c = document[_0x542fe5(0x185)]('#entInicio'); _0x25146c[_0x542fe5(0x1cd)]('visible', _0x22ea29); } function habilitarPanelDerecho(_0x4de669) { var _0x481583 = _0x51e6ad, _0xb3aeba = document[_0x481583(0x185)](_0x481583(0x1af)); _0xb3aeba[_0x481583(0x1cd)](_0x481583(0x1aa), _0x4de669); var _0x593e6c = document['querySelector']('#boxDerechoIngredientes'); _0x593e6c['setAttribute'](_0x481583(0x1aa), _0x4de669); } function habilitarPanelIzquierdo(_0x32b246) { var _0x4deecd = _0x51e6ad, _0x39e9be = document[_0x4deecd(0x185)](_0x4deecd(0x19a)); _0x39e9be['setAttribute'](_0x4deecd(0x1aa), _0x32b246); var _0x282951 = document[_0x4deecd(0x185)](_0x4deecd(0x19f)); _0x282951[_0x4deecd(0x1cd)]('visible', _0x32b246); } function guardarAnalisis(_0x3a1c9d) { var _0x28bed0 = _0x51e6ad; $[_0x28bed0(0x18f)]({ 'method': _0x28bed0(0x1d5), 'url': _0x28bed0(0x202), 'data': JSON[_0x28bed0(0x1c8)]({ 'idProducto': +_0x3a1c9d }), 'contentType': 'application/json;\x20charset=utf-8' })[_0x28bed0(0x1b7)](function () { })[_0x28bed0(0x18d)](function (_0x134135) { var _0x484ce4 = _0x28bed0; console[_0x484ce4(0x196)](_0x484ce4(0x209), _0x134135), alert('Error\x20al\x20guardar\x20análisis'); }); } function agregarAlerta(_0x517aa8) { var _0x1804a1 = _0x51e6ad, _0x185d46 = document[_0x1804a1(0x185)](_0x1804a1(0x1c1)), _0x30c637 = document[_0x1804a1(0x185)](_0x1804a1(0x1af)); comparacion && (_0x30c637 = document[_0x1804a1(0x185)](_0x1804a1(0x19a)), sumatoriaAlertas = 0x1); for (var _0x3f7766 = 0x0; _0x3f7766 < _0x517aa8['length']; _0x3f7766++) { var _0x384851 = document[_0x1804a1(0x1b1)]('a-entity'); _0x384851[_0x1804a1(0x1cd)](_0x1804a1(0x1fc), _0x1804a1(0x1ce)), _0x384851[_0x1804a1(0x1cd)](_0x1804a1(0x207), _0x1804a1(0x1f7)), _0x384851[_0x1804a1(0x1cd)](_0x1804a1(0x207), _0x1804a1(0x1d1)), _0x384851[_0x1804a1(0x1cd)](_0x1804a1(0x207), _0x1804a1(0x187)), _0x384851[_0x1804a1(0x1cd)]('text', _0x1804a1(0x1e9) + _0x517aa8[_0x3f7766]['Alerta']['Leyenda']); var _0x1b6766 = document[_0x1804a1(0x1b1)](_0x1804a1(0x1a2)); _0x1b6766[_0x1804a1(0x1cd)](_0x1804a1(0x1d8), '#' + _0x517aa8[_0x3f7766][_0x1804a1(0x194)][_0x1804a1(0x1d7)]['Color'][_0x1804a1(0x1c0)]), _0x1b6766['setAttribute'](_0x1804a1(0x190), '1.2'), _0x1b6766[_0x1804a1(0x1cd)](_0x1804a1(0x200), '0.001'), _0x1b6766[_0x1804a1(0x1cd)](_0x1804a1(0x1dc), _0x1804a1(0x1df)), _0x1b6766[_0x1804a1(0x1cd)](_0x1804a1(0x192), _0x1804a1(0x1c4)), _0x1b6766[_0x1804a1(0x1cd)](_0x1804a1(0x1fc), '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), _0x1b6766[_0x1804a1(0x188)](_0x384851), _0x185d46[_0x1804a1(0x188)](_0x1b6766), sumatoriaAlertas = sumatoriaAlertas + 0x1; } } function agregarAlertaIngredientes(_0x556586) { var _0x5228c3 = _0x51e6ad, _0x4aa9f7 = document['querySelector'](_0x5228c3(0x1c1)), _0x10cebd = document[_0x5228c3(0x185)](_0x5228c3(0x1af)); comparacion && (_0x10cebd = document['querySelector']('#boxIzquierda')); for (var _0x346d6b = 0x0; _0x346d6b < _0x556586[_0x5228c3(0x1e3)]; _0x346d6b++) { var _0x32dbec = document[_0x5228c3(0x1b1)](_0x5228c3(0x1a2)); _0x32dbec['setAttribute'](_0x5228c3(0x1d8), 'red'), _0x32dbec[_0x5228c3(0x1cd)](_0x5228c3(0x190), '1.2'), _0x32dbec[_0x5228c3(0x1cd)](_0x5228c3(0x200), '0.001'), _0x32dbec[_0x5228c3(0x1cd)]('height', _0x5228c3(0x1df)), _0x32dbec[_0x5228c3(0x1cd)](_0x5228c3(0x192), _0x5228c3(0x1c4)), _0x32dbec['setAttribute']('position', '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), sumatoriaAlertas = sumatoriaAlertas + 0x1; var _0xd947f2 = document[_0x5228c3(0x1b1)](_0x5228c3(0x1e6)); _0xd947f2['setAttribute'](_0x5228c3(0x1fc), '0.4\x200.04\x200.1'), _0xd947f2[_0x5228c3(0x1cd)]('text', _0x5228c3(0x1f7)), _0xd947f2[_0x5228c3(0x1cd)]('text', _0x5228c3(0x1d1)), _0xd947f2[_0x5228c3(0x1cd)](_0x5228c3(0x207), _0x5228c3(0x187)), _0xd947f2['setAttribute'](_0x5228c3(0x207), _0x5228c3(0x1e9) + _0x556586[_0x346d6b][_0x5228c3(0x1f0)]); if (!_0x556586[_0x346d6b][_0x5228c3(0x1be)]['EsPrincipal']) { var _0x325408 = document[_0x5228c3(0x1b1)](_0x5228c3(0x1e6)); _0x325408[_0x5228c3(0x1cd)](_0x5228c3(0x1fc), _0x5228c3(0x1fd)), _0x325408[_0x5228c3(0x1cd)](_0x5228c3(0x207), _0x5228c3(0x1f7)), _0x325408['setAttribute']('text', _0x5228c3(0x1d1)), _0x325408[_0x5228c3(0x1cd)]('text', _0x5228c3(0x1f1)), _0x325408[_0x5228c3(0x1cd)](_0x5228c3(0x207), _0x5228c3(0x1e9) + _0x556586[_0x346d6b][_0x5228c3(0x1be)]['Nombre']), _0x32dbec[_0x5228c3(0x188)](_0x325408); } _0x32dbec[_0x5228c3(0x188)](_0xd947f2), _0x4aa9f7['appendChild'](_0x32dbec); } } function agregarAlertasHexagonales(_0x17d4fc) { var _0x55ec52 = _0x51e6ad, _0xdd4e4b = ''; comparacion && (_0xdd4e4b = '2'); for (var _0x362807 = 0x0; _0x362807 < _0x17d4fc[_0x55ec52(0x1e3)]; _0x362807++) { if (_0x17d4fc[_0x362807]['Alerta']['Leyenda'] == _0x55ec52(0x1a7)) { var _0x671b21 = document[_0x55ec52(0x185)]('#entHexagonoSodio' + _0xdd4e4b); _0x671b21[_0x55ec52(0x1cd)]('visible', !![]), _0xdd4e4b == '' ? (porcentualSodio = _0x55ec52(0x1f4) + _0x17d4fc[_0x362807]['ValorDiferencial'][_0x55ec52(0x1ae)](0x0) + '%', valorCriticoSodio = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealSodio = _0x17d4fc[_0x362807][_0x55ec52(0x20b)]) : (porcentualSodio2 = _0x55ec52(0x1f4) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)]['toFixed'](0x0) + '%', valorCriticoSodio2 = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealSodio2 = _0x17d4fc[_0x362807][_0x55ec52(0x20b)]); } if (_0x17d4fc[_0x362807][_0x55ec52(0x194)]['Leyenda'] == _0x55ec52(0x1b3)) { var _0x1dbb50 = document[_0x55ec52(0x185)](_0x55ec52(0x19b) + _0xdd4e4b); _0x1dbb50[_0x55ec52(0x1cd)](_0x55ec52(0x1aa), !![]), _0xdd4e4b == '' ? (valorCriticoGrasasSaturadas = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealGrasasSaturadas = _0x17d4fc[_0x362807][_0x55ec52(0x20b)], porcentualGrasasSaturadas = 'Grasas\x20saturadas\x20excedidas\x20en\x20' + _0x17d4fc[_0x362807]['ValorDiferencial']['toFixed'](0x0) + '%') : (valorCriticoGrasasSaturadas2 = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealGrasasSaturadas2 = _0x17d4fc[_0x362807]['ValorReal'], porcentualGrasasSaturadas2 = _0x55ec52(0x1d6) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)][_0x55ec52(0x1ae)](0x0) + '%'); } if (_0x17d4fc[_0x362807][_0x55ec52(0x194)][_0x55ec52(0x1f0)] == _0x55ec52(0x195)) { var _0x34338c = document[_0x55ec52(0x185)]('#entHexagonoGrasasTotales' + _0xdd4e4b); _0x34338c[_0x55ec52(0x1cd)](_0x55ec52(0x1aa), !![]), _0xdd4e4b == '' ? (valorCriticoGrasasTotales = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealGrasasTotales = _0x17d4fc[_0x362807][_0x55ec52(0x20b)], porcentualGrasasTotales = _0x55ec52(0x1de) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)][_0x55ec52(0x1ae)](0x0) + '%') : (valorCriticoGrasasTotales2 = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealGrasasTotales2 = _0x17d4fc[_0x362807]['ValorReal'], porcentualGrasasTotales2 = 'Grasas\x20totales\x20excedidas\x20en\x20' + _0x17d4fc[_0x362807]['ValorDiferencial']['toFixed'](0x0) + '%'); } if (_0x17d4fc[_0x362807][_0x55ec52(0x194)][_0x55ec52(0x1f0)] == _0x55ec52(0x1a9)) { var _0xe71060 = document[_0x55ec52(0x185)](_0x55ec52(0x1a4) + _0xdd4e4b); _0xe71060[_0x55ec52(0x1cd)]('visible', !![]), _0xdd4e4b == '' ? (porcentualCalorias = _0x55ec52(0x1cc) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)][_0x55ec52(0x1ae)](0x0) + '%', valorCriticoCalorias = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealCalorias = _0x17d4fc[_0x362807][_0x55ec52(0x20b)]) : (porcentualCalorias2 = _0x55ec52(0x1cc) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)][_0x55ec52(0x1ae)](0x0) + '%', valorCriticoCalorias2 = _0x17d4fc[_0x362807]['ValorCritico'], valorRealCalorias2 = _0x17d4fc[_0x362807][_0x55ec52(0x20b)]); } if (_0x17d4fc[_0x362807][_0x55ec52(0x194)]['Leyenda'] == _0x55ec52(0x1e1)) { var _0x5bc2a6 = document[_0x55ec52(0x185)](_0x55ec52(0x1dd) + _0xdd4e4b); _0x5bc2a6['setAttribute'](_0x55ec52(0x1aa), !![]), _0xdd4e4b == '' ? (porcentualAzucares = _0x55ec52(0x1eb) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)][_0x55ec52(0x1ae)](0x0) + '%', valorCriticoAzucares = _0x17d4fc[_0x362807][_0x55ec52(0x1c6)], valorRealAzucares = _0x17d4fc[_0x362807][_0x55ec52(0x20b)]) : (porcentualAzucares2 = _0x55ec52(0x1eb) + _0x17d4fc[_0x362807][_0x55ec52(0x1b8)][_0x55ec52(0x1ae)](0x0) + '%', valorCriticoAzucares2 = _0x17d4fc[_0x362807]['ValorCritico'], valorRealAzucares2 = _0x17d4fc[_0x362807]['ValorReal']); } } } function setearInfoNutriente(_0xd48206, _0x3f21c9) { var _0x2abed2 = _0x51e6ad, _0x25c402 = document[_0x2abed2(0x185)]('#' + _0xd48206); _0x25c402[_0x2abed2(0x1cd)](_0x2abed2(0x207), _0x2abed2(0x1e9) + _0x3f21c9); } function agregarInfoNutrientes(_0x1a5931) { var _0x315efc = _0x51e6ad, _0x52b7b7 = ''; comparacion && (_0x52b7b7 = '2'); var _0x4d8659 = _0x1a5931['NutrientesProducto']['map'](_0x4b68c3 => _0x4b68c3[_0x315efc(0x1ff)]); if (_0x1a5931[_0x315efc(0x1f5)][_0x315efc(0x1e3)] <= 0x19) setearInfoNutriente(_0x315efc(0x1a0) + _0x52b7b7, _0x1a5931[_0x315efc(0x1f5)]); else { var _0x1798dc = _0x1a5931[_0x315efc(0x1f5)][_0x315efc(0x20a)](0x0, 0x18) + '\x0a' + _0x1a5931[_0x315efc(0x1f5)][_0x315efc(0x20a)](0x18); setearInfoNutriente(_0x315efc(0x1a0) + _0x52b7b7, _0x1798dc); } setearInfoNutriente(_0x315efc(0x1bc) + _0x52b7b7, _0x315efc(0x1f6) + _0x1a5931[_0x315efc(0x1d9)]), setearInfoNutriente(_0x315efc(0x1fa) + _0x52b7b7, _0x1a5931[_0x315efc(0x1e4)]), setearInfoNutriente('porcenaje_azucares' + _0x52b7b7, _0x4d8659[_0x315efc(0x18a)](_0x263e40 => _0x263e40[_0x315efc(0x1f5)] === _0x315efc(0x18c))[_0x315efc(0x1ed)] + _0x315efc(0x1a8)), setearInfoNutriente(_0x315efc(0x205) + _0x52b7b7, _0x4d8659[_0x315efc(0x18a)](_0x547890 => _0x547890[_0x315efc(0x1f5)] === _0x315efc(0x1ba))[_0x315efc(0x1ed)] + 'g\x20Carbohidratos'), setearInfoNutriente(_0x315efc(0x201) + _0x52b7b7, _0x4d8659['find'](_0x9e225b => _0x9e225b['Nombre'] === _0x315efc(0x1ca))[_0x315efc(0x1ed)] + _0x315efc(0x18e)), setearInfoNutriente('porcentaje_fibra' + _0x52b7b7, _0x4d8659[_0x315efc(0x18a)](_0x27bd38 => _0x27bd38['Nombre'] === _0x315efc(0x199))[_0x315efc(0x1ed)] + _0x315efc(0x1e0)), setearInfoNutriente(_0x315efc(0x1f9) + _0x52b7b7, _0x4d8659[_0x315efc(0x18a)](_0x599c5a => _0x599c5a[_0x315efc(0x1f5)] === _0x315efc(0x1e7))[_0x315efc(0x1ed)] + _0x315efc(0x1e5)), setearInfoNutriente(_0x315efc(0x1c7) + _0x52b7b7, _0x4d8659['find'](_0x12ec70 => _0x12ec70[_0x315efc(0x1f5)] === _0x315efc(0x197))['CantidadPorPorcion'] + _0x315efc(0x1b5)); } function agregarInfoIngredientes(_0x14f7a5) { var _0x433710 = _0x51e6ad, _0x2acadd = _0x14f7a5['replace'](/;/g, ',')[_0x433710(0x1c3)](_0x433710(0x1a6)); if (comparacion) { var _0x1964aa = document[_0x433710(0x185)](_0x433710(0x1d3)); _0x1964aa[_0x433710(0x1cd)](_0x433710(0x207), _0x433710(0x206) + _0x2acadd); return; } var _0x1bbd62 = document[_0x433710(0x185)](_0x433710(0x1da)); _0x1bbd62['setAttribute']('text', 'value:\x20' + _0x2acadd); } function activarComparacion() { comparacion = !comparacion; } function volverAlSitio() { var _0x10e3d2 = _0x51e6ad; location[_0x10e3d2(0x1bd)] = _0x10e3d2(0x204); } function _0x3427() { var _0x1378f0 = ['g\x20Azucares', 'Exceso\x20en\x20calorias', 'visible', '1089520LQShKx', '212191BlkOUI', 'hover_exceso_grasas_totales', 'toFixed', '#boxDerecha', '26444UKbcAR', 'createElement', 'porcenaje_azucares', 'Exceso\x20en\x20grasas\x20saturadas', 'IngredientesAlertas', 'g\x20Sodio', '\x20-0.7\x200.1', 'done', 'ValorDiferencial', '52fKIuaB', 'Carbohidratos', 'application/json;\x20charset=utf-8', 'porcion_producto', 'href', 'Perfil', '661239jAmIiw', 'CodigoHexadecimal', '#acavan', 'display:none', 'normalize', '0.5', 'filter', 'ValorCritico', 'porcentaje_sodio', 'stringify', 'porcentaje_fibra', 'Proteínas', 'EsGenerica', 'Calorias\x20excedidas\x20en\x20', 'setAttribute', '0.4\x200.04\x200.1', 'btnLimpiar', '#nombre_producto', 'color:#000;', '48183SJObUg', '#ingredientes2', 'hover_exceso_sodio', 'POST', 'Grasas\x20saturadas\x20excedidas\x20en\x20', 'TipoAlerta', 'color', 'PorcionText', '#ingredientes', '#valor_limite_excedido2', 'height', '#entHexagonoAzucares', 'Grasas\x20totales\x20excedidas\x20en\x20', '0.15', 'g\x20Fibra', 'Exceso\x20en\x20azucares', 'hover_exceso_grasas_saturadas2', 'length', 'ValorEnergetico', 'g\x20Grasas', 'a-entity', 'Grasas\x20totales', 'hover_exceso_grasas_saturadas', 'value:', 'registerComponent', 'Azucares\x20excedidos\x20en\x20', 'mouseenter', 'CantidadPorPorcion', 'overlay', 'display:show', 'Leyenda', 'width:0.8;', 'display:block', '225114vALLZu', 'Sodio\x20excedido\x20en\x20', 'Nombre', 'Porcion:\x20', 'font:\x20exo2bold;', 'hover_exceso_azucares', 'porcentaje_grasas_totales', 'calorias_producto', '1lwdrwH', 'position', '-0.1\x200.1\x200.1', 'NuevoAnalisis.aspx/ObtenerAlertasPorProducto', 'Nutriente', 'depth', 'porcentaje_proteinas', 'NuevoAnalisis.aspx/GuardarAnalisis', 'addEventListener', 'Inicio', 'porcentaje_carbohidratos', 'value:\x20', 'text', '8qoXUmm', 'Error\x20al\x20guardar\x20análisis:\x20', 'substring', 'ValorReal', '#nombre_producto2', 'querySelector', '2080aNShUi', 'width:1.8;', 'appendChild', 'target', 'find', '#valor_limite_excedido', 'Azúcares\x20añadidos', 'fail', 'g\x20Proteinas', 'ajax', 'width', 'forEach', 'opacity', 'true', 'Alerta', 'Exceso\x20en\x20grasas\x20totales', 'log', 'Sodio', 'style', 'Fibra', '#boxIzquierda', '#entHexagonoGrasasSaturadas', '231852RIngdR', 'markerFound', 'hover_exceso_grasas_totales2', '#boxIzquierdoIngredientes', 'nombre_producto', 'getElementById', 'a-box', 'innerHTML', '#entHexagonoCalorias', 'Ingredientes', 'NFD', 'Exceso\x20en\x20sodio']; _0x3427 = function () { return _0x1378f0; }; return _0x3427(); }
</script>

<body style="margin: 0px; overflow: hidden;">
    <div id="overlay">
        <div class="spinner"></div>
    </div>
    <nav class="super-menu">
        <div class="wrapper">
            <div class="logo" style="align-content: start;"><a href="Inicio">Volver</a></div>

            <input type="radio" name="slider" id="menu-btn">
            <input type="radio" name="slider" id="close-btn">
            <div class="checkbox-wrapper-14" id="divComparar" style="display: none">
                <input id="s1-14" type="checkbox" class="switch" onchange="activarComparacion()">
                <label for="s1-14" style="color: white">Comparar</label>
            </div>
            <ul class="nav-links">
                <li id="btnLimpiar" style="display: none"><a href="#" style="padding-left: 3rem;" onclick="limpiarPantalla(); return false;">Limpiar</a></li>
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
            <img id="img_exceso_en_grasas_totales" crossorigin="anonymous" src="./images/sellos/exceso_en_grasas_totales.png" />

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
            <a-mixin id="image_exceso_en_grasas_totales" geometry="primitive: plane;width: 1; height: 1;"
                material="shader: flat; src: #img_exceso_en_grasas_totales; side: double">
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
            visible="false"id="boxDerecha">

            <%--<a-entity id="grafico" position="-4 -2.5 -20" rotation="20 45 100" charts="type: pie; pie_radius: 1; dataPoints: ./dataPie.json; pie_doughnut: false; "></a-entity>--%>
            <a-entity id="nombre_producto" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;"></a-entity>
            <a-entity id="calorias_producto" position="-0.4 0.23 0.1" text="font: exo2bold; color:#000; align:center; width:2.5;"></a-entity>
            <a-entity                        position="0.2 0.2 0.1" text="font:exo2bold; color:#000; value:kcal/porcion; align:left; width:1;"></a-entity>
            <a-entity id="porcion_producto" position="0.23 0.14 0.1" text="font:exo2bold; color:#757575; align:left; width:0.8;"></a-entity>
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
            <a-entity position="-2.6 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_grasas_totales>
                <a-entity id="entHexagonoGrasasTotales" visible="false" mixin="image_exceso_en_grasas_totales"></a-entity>
            </a-entity>
            <a-entity position="-3.8 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_sodio>
                <a-entity id="entHexagonoSodio" visible="false" mixin="image_exceso_en_sodio"></a-entity>
            </a-entity>

            <div id="acavan">

            </div>

            <a-entity id="valor_limite_excedido" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black;value:; width:3;" visible="false">
            </a-entity>
        </a-box>

        <!-- PANEL IZQUIERDO -->
        <a-box opacity="0.75" color="#fff" width="1.2" height="1.45" depth="0.001"
            position="-0.85 1.648 -3"
            rotation="0 20 0"
            visible="false"
            id="boxIzquierda">

            <a-entity id="nombre_producto2" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;  value:"></a-entity>
            <a-entity id="calorias_producto2" position="-0.4 0.23 0.1" text=" font: exo2bold; color:#000; align:center; width:2.5; value:"></a-entity>
            <a-entity                        position="0.2 0.2 0.1" text=" font: exo2bold; color:#000; value:kcal/porcion; align:left; width:1;"></a-entity>
            <a-entity id="porcion_producto2" position="0.23 0.14 0.1" text=" font: exo2bold; color:#757575; align:left; width:0.8; value:"></a-entity>
            <a-entity id="porcenaje_azucares2" position="0.75 0 0.1" text="font: exo2semibold; width:1.7; color: #000; value:"></a-entity>
            <a-entity id="porcentaje_carbohidratos2" position="0.75 -0.1 0.1" text="font: exo2semibold; width:1.7; color:#e4605e; value:"></a-entity>
            <a-entity id="porcentaje_proteinas2" position="0.75 -0.2 0.1" text="font: exo2semibold; width:1.7; color: #0159ff; value:"></a-entity>
            <a-entity id="porcentaje_fibra2" position="0.75 -0.3 0.1" text="font: exo2semibold; width:1.7; color: #7fe757; value:"></a-entity>
            <a-entity id="porcentaje_grasas_totales2" position="0.75 -0.4 0.1" text="font: exo2semibold; width:1.7; color:#e5d972; value:"></a-entity>
            <a-entity id="porcentaje_sodio2" position="0.75 -0.5 0.1" text="font: exo2semibold; width:1.7; color: #eeeeee; value:"></a-entity>

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
            <a-entity position="-0.2 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_grasas_totales2>
                <a-entity id="entHexagonoGrasasTotales2" visible="false" mixin="image_exceso_en_grasas_totales"></a-entity>
            </a-entity>
            <a-entity position="-1.4 -5 -15" look-controls layout="type: dodecahedron; radius: 1" hover_exceso_sodio2>
                <a-entity id="entHexagonoSodio2" visible="false" mixin="image_exceso_en_sodio"></a-entity>
            </a-entity>


            <a-entity id="valor_limite_excedido2" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black; width:3;" visible="false">
            </a-entity>
        </a-box>
        <a-box opacity="0.75" color="#fff" width="3.7" height="2.8" depth="0.001"
            id="boxDerechoIngredientes"
            visible="false"
            position="3.6 1.4 -3"
            rotation="0 -40 0"
            text="align: center;color: white;">
            <a-entity id="ingredientes" position="0 -0.1 0.1" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes" position="0.5 1.2 0.2" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
        <a-box opacity="0.75" color="#fff" width="3.7" height="2.8" depth="0.001"
            id="boxIzquierdoIngredientes"
            visible="false"
            position="-3.6 1.4 -3"
            rotation="0 40 0"
            text="align: center;color: white; value:">
            <a-entity id="ingredientes2" position="0 -0.1 0.1" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes2" position="0.5 1.2 0.2" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
    </a-scene>
</body>
