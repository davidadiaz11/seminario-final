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

<link rel="stylesheet" type="text/css" href="https://mayognaise.github.io/aframe-mouse-cursor-component/common.css" />

<script src="https://rawgit.com/mayognaise/aframe-mouse-cursor-component/master/dist/aframe-mouse-cursor-component.min.js"></script>
<!-- <script src="https://mayognaise.github.io/aframe-mouse-cursor-component/build.js"></script> -->
<script>
    var _0x4a620a = _0x3ef2; (function (_0x41b5f2, _0xa45ecc) { var _0x482930 = _0x3ef2, _0x2de879 = _0x41b5f2(); while (!![]) { try { var _0x224a97 = -parseInt(_0x482930(0x144)) / 0x1 * (-parseInt(_0x482930(0x127)) / 0x2) + -parseInt(_0x482930(0x11c)) / 0x3 * (parseInt(_0x482930(0x125)) / 0x4) + -parseInt(_0x482930(0x160)) / 0x5 * (-parseInt(_0x482930(0x15d)) / 0x6) + -parseInt(_0x482930(0x143)) / 0x7 + parseInt(_0x482930(0x120)) / 0x8 + parseInt(_0x482930(0x169)) / 0x9 * (parseInt(_0x482930(0x104)) / 0xa) + -parseInt(_0x482930(0x168)) / 0xb; if (_0x224a97 === _0xa45ecc) break; else _0x2de879['push'](_0x2de879['shift']()); } catch (_0x5f1b34) { _0x2de879['push'](_0x2de879['shift']()); } } }(_0x3283, 0xe0015)); var buscando = ![], comparacion = ![], nutrientes = [_0x4a620a(0x14f), 'porcentaje_carbohidratos', _0x4a620a(0x149), 'porcentaje_proteinas', _0x4a620a(0x124), _0x4a620a(0x119)], sumatoriaAlertas = 0x1, porcentualCalorias = '', porcentualAzucares = '', porcentualGrasasSaturadas = '', porcentualGrasasTotales = '', porcentualSodio = '', valorRealPrueba = 0x0, valorCriticoPrueba = 0x0, valorRealAzucarPrueba = 0x0, valorCriticoAzucarPrueba = 0x0; AFRAME[_0x4a620a(0x10d)](_0x4a620a(0x137), { 'init': function () { var _0x385ff0 = _0x4a620a; this['el'][_0x385ff0(0x14a)][_0x385ff0(0x107)](_0x385ff0(0x10c), _0x1df9ce => { var _0x3c4e9d = _0x385ff0; if (!comparacion) { } const _0x4a4033 = _0x1df9ce[_0x3c4e9d(0xfe)]['id']; iniciarPreloader(), buscarProducto(_0x4a4033); }); } }), AFRAME['registerComponent'](_0x4a620a(0x126), { 'init': function () { var _0x121ae6 = _0x4a620a, _0x32b117 = document[_0x121ae6(0x134)](_0x121ae6(0xff)); this['el'][_0x121ae6(0x107)](_0x121ae6(0xf4), _0x49f5bf => { var _0x57e6f2 = _0x121ae6; _0x32b117[_0x57e6f2(0x147)](_0x57e6f2(0x101), _0x57e6f2(0x13d) + porcentualCalorias), _0x32b117[_0x57e6f2(0x147)](_0x57e6f2(0x111), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, !![]); }); } }), AFRAME[_0x4a620a(0x10d)](_0x4a620a(0x157), { 'init': function () { var _0x19680b = _0x4a620a, _0x14c8e0 = document[_0x19680b(0x134)](_0x19680b(0xeb)); this['el'][_0x19680b(0x107)](_0x19680b(0xf4), _0x129070 => { var _0x3b545d = _0x19680b; _0x14c8e0['setAttribute'](_0x3b545d(0x101), _0x3b545d(0x13d) + porcentualCalorias), _0x14c8e0[_0x3b545d(0x147)](_0x3b545d(0x111), _0x3b545d(0x12f)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, ![]); }); } }), AFRAME[_0x4a620a(0x10d)](_0x4a620a(0xf9), { 'init': function () { var _0x2c06be = _0x4a620a, _0x5c1d30 = document[_0x2c06be(0x134)]('#valor_limite_excedido'); this['el']['addEventListener'](_0x2c06be(0xf4), _0x44b8d1 => { var _0x17d21d = _0x2c06be; _0x5c1d30[_0x17d21d(0x147)]('text', 'value:' + porcentualSodio), _0x5c1d30[_0x17d21d(0x147)](_0x17d21d(0x111), _0x17d21d(0x12f)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, !![]); }); } }), AFRAME[_0x4a620a(0x10d)](_0x4a620a(0x12a), { 'init': function () { var _0x3b7f85 = _0x4a620a, _0x1f03c5 = document[_0x3b7f85(0x134)](_0x3b7f85(0xeb)); this['el'][_0x3b7f85(0x107)](_0x3b7f85(0xf4), _0x413e4a => { var _0x575379 = _0x3b7f85; _0x1f03c5['setAttribute'](_0x575379(0x101), _0x575379(0x13d) + porcentualSodio), _0x1f03c5['setAttribute'](_0x575379(0x111), _0x575379(0x12f)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, ![]); }); } }), AFRAME[_0x4a620a(0x10d)]('hover_exceso_grasas_saturadas', { 'init': function () { var _0x22cbb9 = _0x4a620a, _0xdb8cad = document[_0x22cbb9(0x134)](_0x22cbb9(0xff)); this['el'][_0x22cbb9(0x107)](_0x22cbb9(0xf4), _0x4c01de => { var _0x1740e9 = _0x22cbb9; _0xdb8cad[_0x1740e9(0x147)](_0x1740e9(0x101), 'value:' + porcentualGrasasSaturadas), _0xdb8cad[_0x1740e9(0x147)](_0x1740e9(0x111), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, !![]); }); } }), AFRAME[_0x4a620a(0x10d)](_0x4a620a(0x14d), { 'init': function () { var _0x450e43 = _0x4a620a, _0x2ee94e = document[_0x450e43(0x134)](_0x450e43(0xeb)); this['el'][_0x450e43(0x107)]('mouseenter', _0x5c7cbd => { var _0x53f2c7 = _0x450e43; _0x2ee94e['setAttribute'](_0x53f2c7(0x101), _0x53f2c7(0x13d) + porcentualGrasasSaturadas), _0x2ee94e[_0x53f2c7(0x147)]('visible', _0x53f2c7(0x12f)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba, ![]); }); } }), AFRAME[_0x4a620a(0x10d)](_0x4a620a(0x15e), { 'init': function () { var _0x4e99c1 = _0x4a620a, _0x193eaa = document[_0x4e99c1(0x134)](_0x4e99c1(0xff)); this['el'][_0x4e99c1(0x107)]('mouseenter', _0x40464e => { var _0x19008c = _0x4e99c1; _0x193eaa['setAttribute'](_0x19008c(0x101), _0x19008c(0x13d) + porcentualAzucares), _0x193eaa[_0x19008c(0x147)](_0x19008c(0x111), _0x19008c(0x12f)), ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba, !![]); }); } }), AFRAME[_0x4a620a(0x10d)](_0x4a620a(0x164), { 'init': function () { var _0x222584 = _0x4a620a, _0x3e5a30 = document['querySelector']('#valor_limite_excedido2'); this['el'][_0x222584(0x107)]('mouseenter', _0x6a34c7 => { var _0x445ed3 = _0x222584; _0x3e5a30[_0x445ed3(0x147)](_0x445ed3(0x101), 'value:' + porcentualAzucares), _0x3e5a30[_0x445ed3(0x147)]('visible', 'true'), ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba, ![]); }); } }); function ubicarLineasPorcentuales(_0x428e00, _0x5e70f8, _0x577e97) { var _0x3a807b = _0x4a620a, _0x1e2b3a = ''; !_0x577e97 && (_0x1e2b3a = '2'); var _0x35d0e6 = (_0x428e00 / _0x5e70f8)['toFixed'](0x2);; var _0x53a6f5 = (0x1 - _0x35d0e6)[_0x3a807b(0x10f)](0x2);; if (+_0x53a6f5 + +_0x35d0e6 !== 0x1) return; var _0x5e1a9d = document[_0x3a807b(0x134)]('#boxLineaNegra' + _0x1e2b3a), _0x50eeb3 = document[_0x3a807b(0x134)](_0x3a807b(0x14e) + _0x1e2b3a); _0x5e1a9d[_0x3a807b(0x147)](_0x3a807b(0x146), _0x35d0e6), _0x50eeb3[_0x3a807b(0x147)](_0x3a807b(0x146), _0x53a6f5), _0x5e1a9d['setAttribute'](_0x3a807b(0x142), +_0x53a6f5 * -0.5 + _0x3a807b(0x154)), _0x50eeb3[_0x3a807b(0x147)](_0x3a807b(0x142), +_0x35d0e6 * 0.5 + _0x3a807b(0x154)), _0x5e1a9d['setAttribute'](_0x3a807b(0x111), 'true'), _0x50eeb3['setAttribute']('visible', _0x3a807b(0x12f)); } function iniciarPreloader() { var _0x5a9f2a = _0x4a620a; document[_0x5a9f2a(0xef)](_0x5a9f2a(0x138))[_0x5a9f2a(0x153)] = 'display:block'; } function ocultarPreloader() { var _0x12280e = _0x4a620a; document[_0x12280e(0xef)](_0x12280e(0x138))[_0x12280e(0x153)] = 'display:none'; } function limpiarPantalla(_0x27753d) { var _0x2f7275 = _0x4a620a; nutrientes[_0x2f7275(0x11d)](_0x568c08 => { var _0x1b5365 = _0x2f7275, _0x47ed11 = document[_0x1b5365(0x134)]('#' + _0x568c08); _0x47ed11['setAttribute'](_0x1b5365(0x101), 'value:'); }); var _0x335be2 = document[_0x2f7275(0x134)](_0x2f7275(0x117)), _0x410cb7 = document['querySelector'](_0x2f7275(0x129)); _0x335be2[_0x2f7275(0x147)]('text', _0x2f7275(0x13d)), _0x410cb7[_0x2f7275(0x147)](_0x2f7275(0x101), _0x2f7275(0x13d)), sumatoriaAlertas = 0x1, document[_0x2f7275(0xef)](_0x2f7275(0xf2))[_0x2f7275(0x153)] = _0x2f7275(0xf3), document[_0x2f7275(0xef)](_0x2f7275(0x132))['style'] = _0x2f7275(0xf3), comparacion = ![], _0x27753d['innerHTML'] = ''; } function buscarProducto(_0x40300b) { var _0x381443 = _0x4a620a; ocultarImagenInicio(); if (buscando) return; else buscando = !![]; $[_0x381443(0x141)]({ 'method': _0x381443(0x15a), 'url': _0x381443(0xf7), 'data': JSON[_0x381443(0x135)]({ 'idProducto': +_0x40300b }), 'contentType': _0x381443(0x158) })[_0x381443(0x112)](function (_0x5d2ace) { var _0x3b71a4 = _0x381443; ocultarPreloader(), buscando = ![]; if (_0x5d2ace['d']) { console[_0x3b71a4(0x121)](_0x5d2ace['d']); var _0x47d96f = _0x5d2ace['d'][_0x3b71a4(0xed)], _0xa4c407 = _0x47d96f['filter'](_0x42ccef => _0x42ccef['Alerta']['TipoAlerta'][_0x3b71a4(0x130)] === !![]), _0x57e0e9 = _0x47d96f[_0x3b71a4(0x14c)](_0x4e501f => _0x4e501f[_0x3b71a4(0x15c)][_0x3b71a4(0xf1)]['EsGenerica'] === ![]); agregarAlertasHexagonales(_0xa4c407), agregarAlerta(_0x57e0e9), agregarAlertaIngredientes(_0x5d2ace['d']['IngredientesAlertas']), agregarInfoNutrientes(_0x5d2ace['d']), agregarInfoIngredientes(_0x5d2ace['d'][_0x3b71a4(0x14b)]), guardarAnalisis(_0x40300b), !comparacion ? (habilitarPanelDerecho(), document[_0x3b71a4(0xef)](_0x3b71a4(0x132))[_0x3b71a4(0x153)] = _0x3b71a4(0x108)) : habilitarPanelIzquierdo(); } document[_0x3b71a4(0xef)]('btnLimpiar')['style'] = 'display:show'; })[_0x381443(0x12e)](function (_0x119f21) { var _0xa0a389 = _0x381443; console['log'](_0x119f21), ocultarPreloader(), alert(_0xa0a389(0xfc)); }); } function ocultarImagenInicio() { var _0xe18479 = _0x4a620a, _0x78d4aa = document[_0xe18479(0x134)]('#entInicio'); _0x78d4aa['setAttribute']('visible', ![]); } function habilitarPanelDerecho() { var _0x3d95a6 = _0x4a620a, _0x38ab92 = document['querySelector'](_0x3d95a6(0x13c)); _0x38ab92[_0x3d95a6(0x147)]('visible', !![]); var _0x485526 = document[_0x3d95a6(0x134)](_0x3d95a6(0x11f)); _0x485526[_0x3d95a6(0x147)](_0x3d95a6(0x111), !![]); } function habilitarPanelIzquierdo() { var _0x1d00f4 = _0x4a620a, _0x552029 = document[_0x1d00f4(0x134)]('#boxIzquierda'); _0x552029[_0x1d00f4(0x147)](_0x1d00f4(0x111), !![]); var _0x5f58a2 = document[_0x1d00f4(0x134)]('#boxIzquierdoIngredientes'); _0x5f58a2[_0x1d00f4(0x147)](_0x1d00f4(0x111), !![]); } function guardarAnalisis(_0x14629) { var _0x14f19a = _0x4a620a; $['ajax']({ 'method': _0x14f19a(0x15a), 'url': 'AnalisisNuevo.aspx/GuardarAnalisis', 'data': JSON[_0x14f19a(0x135)]({ 'idProducto': +_0x14629 }), 'contentType': 'application/json;\x20charset=utf-8' })[_0x14f19a(0x112)](function () { })['fail'](function (_0x2c7791) { var _0x221bbd = _0x14f19a; console[_0x221bbd(0x121)](_0x221bbd(0xec), _0x2c7791), alert(_0x221bbd(0x13a)); }); } function agregarAlerta(_0x5ddd61) { var _0x332dc7 = _0x4a620a, _0x456967 = document[_0x332dc7(0x134)]('#boxDerecha'); comparacion && (_0x456967 = document[_0x332dc7(0x134)](_0x332dc7(0x103)), sumatoriaAlertas = 0x1); for (var _0x30725f = 0x0; _0x30725f < _0x5ddd61[_0x332dc7(0xf8)]; _0x30725f++) { var _0x183f03 = document[_0x332dc7(0x122)](_0x332dc7(0x167)); _0x183f03['setAttribute']('position', _0x332dc7(0xfb)), _0x183f03['setAttribute'](_0x332dc7(0x101), _0x332dc7(0xfa)), _0x183f03[_0x332dc7(0x147)](_0x332dc7(0x101), _0x332dc7(0x12d)), _0x183f03[_0x332dc7(0x147)]('text', _0x332dc7(0xf5)), _0x183f03[_0x332dc7(0x147)](_0x332dc7(0x101), _0x332dc7(0x13d) + _0x5ddd61[_0x30725f]['Alerta'][_0x332dc7(0xf6)]); var _0x5abd13 = document[_0x332dc7(0x122)](_0x332dc7(0x136)); _0x5abd13['setAttribute'](_0x332dc7(0x159), '#' + _0x5ddd61[_0x30725f]['Alerta'][_0x332dc7(0xf1)][_0x332dc7(0x161)]['CodigoHexadecimal']), _0x5abd13['setAttribute'](_0x332dc7(0x146), '1.2'), _0x5abd13[_0x332dc7(0x147)](_0x332dc7(0xfd), '0.001'), _0x5abd13[_0x332dc7(0x147)](_0x332dc7(0x11e), _0x332dc7(0x11b)), _0x5abd13['setAttribute'](_0x332dc7(0x145), _0x332dc7(0x128)), _0x5abd13[_0x332dc7(0x147)]('position', '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), _0x5abd13['appendChild'](_0x183f03), _0x456967['appendChild'](_0x5abd13), sumatoriaAlertas = sumatoriaAlertas + 0x1; } } function agregarAlertaIngredientes(_0x1dc1bc) { var _0x545374 = _0x4a620a, _0x12f6b4 = document[_0x545374(0x134)]('#boxDerecha'); comparacion && (_0x12f6b4 = document[_0x545374(0x134)](_0x545374(0x103))); for (var _0x38d248 = 0x0; _0x38d248 < _0x1dc1bc[_0x545374(0xf8)]; _0x38d248++) { var _0x1fb9b3 = document['createElement'](_0x545374(0x136)); _0x1fb9b3['setAttribute']('color', _0x545374(0x102)), _0x1fb9b3[_0x545374(0x147)](_0x545374(0x146), _0x545374(0x12b)), _0x1fb9b3['setAttribute']('depth', _0x545374(0x13e)), _0x1fb9b3['setAttribute'](_0x545374(0x11e), _0x545374(0x11b)), _0x1fb9b3[_0x545374(0x147)]('opacity', _0x545374(0x128)), _0x1fb9b3[_0x545374(0x147)](_0x545374(0x142), '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), sumatoriaAlertas = sumatoriaAlertas + 0x1; var _0xc61ec = document[_0x545374(0x122)]('a-entity'); _0xc61ec[_0x545374(0x147)](_0x545374(0x142), _0x545374(0xfb)), _0xc61ec[_0x545374(0x147)]('text', _0x545374(0xfa)), _0xc61ec[_0x545374(0x147)](_0x545374(0x101), 'color:#000;'), _0xc61ec[_0x545374(0x147)]('text', 'width:1.8;'), _0xc61ec[_0x545374(0x147)](_0x545374(0x101), 'value:' + _0x1dc1bc[_0x38d248][_0x545374(0xf6)]); if (!_0x1dc1bc[_0x38d248][_0x545374(0x115)][_0x545374(0x10b)]) { var _0x419948 = document[_0x545374(0x122)](_0x545374(0x167)); _0x419948[_0x545374(0x147)]('position', '-0.1\x200.1\x200.1'), _0x419948['setAttribute'](_0x545374(0x101), _0x545374(0xfa)), _0x419948['setAttribute'](_0x545374(0x101), 'color:#000;'), _0x419948[_0x545374(0x147)](_0x545374(0x101), 'width:0.8;'), _0x419948[_0x545374(0x147)](_0x545374(0x101), _0x545374(0x13d) + _0x1dc1bc[_0x38d248]['Perfil'][_0x545374(0x114)]), _0x1fb9b3[_0x545374(0x151)](_0x419948); } _0x1fb9b3[_0x545374(0x151)](_0xc61ec), _0x12f6b4['appendChild'](_0x1fb9b3); } } function agregarAlertasHexagonales(_0xf0dee3) { var _0x42e313 = _0x4a620a, _0x122a7b = ''; comparacion && (_0x122a7b = '2'); for (var _0x5c0a3a = 0x0; _0x5c0a3a < _0xf0dee3[_0x42e313(0xf8)]; _0x5c0a3a++) { if (_0xf0dee3[_0x5c0a3a]['Alerta'][_0x42e313(0xf6)] == _0x42e313(0x148)) { var _0x330fb4 = document[_0x42e313(0x134)](_0x42e313(0x123) + _0x122a7b); _0x330fb4[_0x42e313(0x147)](_0x42e313(0x111), !![]), valorCriticoPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0x156)], valorRealPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0xf0)], porcentualSodio = _0x42e313(0x15b) + _0xf0dee3[_0x5c0a3a][_0x42e313(0x100)][_0x42e313(0x10f)](0x0) + '%'; } if (_0xf0dee3[_0x5c0a3a][_0x42e313(0x15c)][_0x42e313(0xf6)] == _0x42e313(0x118)) { var _0x5c0fa5 = document[_0x42e313(0x134)](_0x42e313(0x131) + _0x122a7b); _0x5c0fa5['setAttribute'](_0x42e313(0x111), !![]), valorCriticoPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0x156)], valorRealPrueba = _0xf0dee3[_0x5c0a3a]['ValorReal'], porcentualGrasasSaturadas = _0x42e313(0x15b) + _0xf0dee3[_0x5c0a3a][_0x42e313(0x100)]['toFixed'](0x0) + '%'; } if (_0xf0dee3[_0x5c0a3a][_0x42e313(0x15c)][_0x42e313(0xf6)] == _0x42e313(0x163)) { var _0x5c0fa5 = document[_0x42e313(0x134)]('#entHexagonoGrasasTotales' + _0x122a7b); _0x5c0fa5['setAttribute'](_0x42e313(0x111), !![]), valorCriticoPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0x156)], valorRealPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0xf0)], porcentualGrasasTotales = _0x42e313(0x10a) + _0xf0dee3[_0x5c0a3a][_0x42e313(0x100)][_0x42e313(0x10f)](0x0) + '%'; } if (_0xf0dee3[_0x5c0a3a][_0x42e313(0x15c)]['Leyenda'] == _0x42e313(0x166)) { var _0x44692a = document['querySelector']('#entHexagonoCalorias' + _0x122a7b); _0x44692a[_0x42e313(0x147)](_0x42e313(0x111), !![]), porcentualCalorias = _0x42e313(0x140) + _0xf0dee3[_0x5c0a3a]['ValorDiferencial']['toFixed'](0x0) + '%', valorCriticoPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0x156)], valorRealPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0xf0)]; } if (_0xf0dee3[_0x5c0a3a][_0x42e313(0x15c)]['Leyenda'] == _0x42e313(0x162)) { var _0x3b0fcb = document[_0x42e313(0x134)]('#entHexagonoAzucares' + _0x122a7b); _0x3b0fcb['setAttribute'](_0x42e313(0x111), !![]), porcentualAzucares = _0x42e313(0x13b) + _0xf0dee3[_0x5c0a3a][_0x42e313(0x100)][_0x42e313(0x10f)](0x0) + '%', valorCriticoAzucarPrueba = _0xf0dee3[_0x5c0a3a]['ValorCritico'], valorRealAzucarPrueba = _0xf0dee3[_0x5c0a3a][_0x42e313(0xf0)]; } } } function setearInfoNutriente(_0x19e207, _0xf92840) { var _0x37a41f = _0x4a620a, _0x1e427d = document['querySelector']('#' + _0x19e207); _0x1e427d[_0x37a41f(0x147)]('text', _0x37a41f(0x13d) + _0xf92840); } function agregarInfoNutrientes(_0x31432e) { var _0x2f4846 = _0x4a620a, _0x42bc8e = ''; comparacion && (_0x42bc8e = '2'); var _0x17b600 = _0x31432e[_0x2f4846(0x139)][_0x2f4846(0x15f)](_0x5b1d63 => _0x5b1d63[_0x2f4846(0x13f)]); if (_0x31432e[_0x2f4846(0x114)][_0x2f4846(0xf8)] <= 0x19) setearInfoNutriente(_0x2f4846(0x12c) + _0x42bc8e, _0x31432e[_0x2f4846(0x114)]); else { var _0x1be539 = _0x31432e[_0x2f4846(0x114)][_0x2f4846(0x110)](0x0, 0x18) + '\x0a' + _0x31432e[_0x2f4846(0x114)][_0x2f4846(0x110)](0x19); setearInfoNutriente('nombre_producto' + _0x42bc8e, _0x1be539); } setearInfoNutriente('calorias_producto' + _0x42bc8e, _0x31432e['ValorEnergetico'] + '\x20kcal/porcion'), setearInfoNutriente('porcenaje_azucares' + _0x42bc8e, _0x17b600[_0x2f4846(0xee)](_0x3dba39 => _0x3dba39['Nombre'] === 'Azúcares\x20añadidos')[_0x2f4846(0x113)] + _0x2f4846(0x16a)), setearInfoNutriente(_0x2f4846(0x106) + _0x42bc8e, _0x17b600[_0x2f4846(0xee)](_0x3eb5e6 => _0x3eb5e6[_0x2f4846(0x114)] === _0x2f4846(0x16b))[_0x2f4846(0x113)] + _0x2f4846(0x150)), setearInfoNutriente('porcentaje_proteinas' + _0x42bc8e, _0x17b600[_0x2f4846(0xee)](_0x1072dd => _0x1072dd['Nombre'] === _0x2f4846(0x16c))[_0x2f4846(0x113)] + _0x2f4846(0x109)), setearInfoNutriente(_0x2f4846(0x149) + _0x42bc8e, _0x17b600[_0x2f4846(0xee)](_0x3aafcc => _0x3aafcc[_0x2f4846(0x114)] === 'Fibra')['CantidadPorPorcion'] + _0x2f4846(0x165)), setearInfoNutriente('porcentaje_grasas_totales' + _0x42bc8e, _0x17b600['find'](_0x5ebe6d => _0x5ebe6d[_0x2f4846(0x114)] === _0x2f4846(0x105))['CantidadPorPorcion'] + _0x2f4846(0x11a)), setearInfoNutriente(_0x2f4846(0x119) + _0x42bc8e, _0x17b600['find'](_0x304da7 => _0x304da7[_0x2f4846(0x114)] === _0x2f4846(0x155))[_0x2f4846(0x113)] + _0x2f4846(0x152)); } function agregarInfoIngredientes(_0x52d8b9) { var _0x42ce84 = _0x4a620a; if (comparacion) { var _0x3d0e84 = document['querySelector'](_0x42ce84(0x133)); _0x3d0e84[_0x42ce84(0x147)]('text', _0x42ce84(0x10e) + _0x52d8b9); return; } var _0x305058 = document[_0x42ce84(0x134)](_0x42ce84(0x116)); _0x305058[_0x42ce84(0x147)](_0x42ce84(0x101), 'value:\x20' + _0x52d8b9); } function _0x3ef2(_0x5c0438, _0x4dba99) { var _0x3283be = _0x3283(); return _0x3ef2 = function (_0x3ef238, _0x3538ca) { _0x3ef238 = _0x3ef238 - 0xeb; var _0x118098 = _0x3283be[_0x3ef238]; return _0x118098; }, _0x3ef2(_0x5c0438, _0x4dba99); } function activarComparacion() { comparacion = !comparacion; } function volverAlSitio() { location['href'] = 'Inicio'; } function _0x3283() { var _0x93d138 = ['mouseenter', 'width:1.8;', 'Leyenda', 'AnalisisNuevo.aspx/ObtenerAlertasPorProducto', 'length', 'hover_exceso_sodio', 'font:\x20exo2bold;', '0.4\x200.04\x200.1', 'Error\x20al\x20buscar\x20alertas', 'depth', 'target', '#valor_limite_excedido', 'ValorDiferencial', 'text', 'red', '#boxIzquierda', '10TtgQUi', 'Grasas\x20totales', 'porcentaje_carbohidratos', 'addEventListener', 'display:show', 'g\x20Proteinas', 'Grasas\x20totales\x20excedidas\x20en\x20', 'EsPrincipal', 'markerFound', 'registerComponent', 'value:\x20', 'toFixed', 'substring', 'visible', 'done', 'CantidadPorPorcion', 'Nombre', 'Perfil', '#ingredientes', '#nombre_producto', 'Exceso\x20en\x20grasas\x20saturadas', 'porcentaje_sodio', 'g\x20Grasas', '0.15', '321MpFMoj', 'forEach', 'height', '#boxDerechoIngredientes', '11486792bqUWea', 'log', 'createElement', '#entHexagonoSodio', 'porcentaje_grasas_totales', '55228lGRxJt', 'hover_exceso_calorias', '888330nDebBn', '0.2', '#nombre_producto2', 'hover_exceso_sodio2', '1.2', 'nombre_producto', 'color:#000;', 'fail', 'true', 'EsGenerica', '#entHexagonoGrasasSaturadas', 'divComparar', '#ingredientes2', 'querySelector', 'stringify', 'a-box', 'markerhandler', 'overlay', 'NutrientesProducto', 'Error\x20al\x20guardar\x20análisis', 'Azucares\x20excedidos\x20en\x20', '#boxDerecha', 'value:', '0.001', 'Nutriente', 'Calorias\x20excedidas\x20en\x20', 'ajax', 'position', '9430827WrhQmL', '3aVHbel', 'opacity', 'width', 'setAttribute', 'Exceso\x20en\x20sodio', 'porcentaje_fibra', 'sceneEl', 'Ingredientes', 'filter', 'hover_exceso_grasas_saturadas2', '#boxLineaRoja', 'porcenaje_azucares', 'g\x20Carbohidratos', 'appendChild', 'g\x20Sodio', 'style', '\x20-0.7\x200.1', 'Sodio', 'ValorCritico', 'hover_exceso_calorias2', 'application/json;\x20charset=utf-8', 'color', 'POST', 'Grasas\x20saturadas\x20excedidas\x20en\x20', 'Alerta', '68706aLKDcd', 'hover_exceso_azucares', 'map', '325WeEMcw', 'Color', 'Exceso\x20en\x20azucares', 'Exceso\x20en\x20grasas\x20totales', 'hover_exceso_azucares2', 'g\x20Fibra', 'Exceso\x20en\x20calorias', 'a-entity', '8913938kveezT', '9358506iZmCri', 'g\x20Azucares', 'Carbohidratos', 'Proteínas', '#valor_limite_excedido2', 'Error\x20al\x20guardar\x20análisis:\x20', 'NutrienteAlertas', 'find', 'getElementById', 'ValorReal', 'TipoAlerta', 'btnLimpiar', 'display:none']; _0x3283 = function () { return _0x93d138; }; return _0x3283(); }
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

        <a-marker markerhandler type='barcode' id='5' value='5'></a-marker>
        <a-marker markerhandler type='barcode' id='7' value='7'></a-marker>

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
