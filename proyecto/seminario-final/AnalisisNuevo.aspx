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
    var _0x205bc0 = _0xaf34; function _0xaf34(_0x25e1fb, _0x5f5c9f) { var _0x178504 = _0x1785(); return _0xaf34 = function (_0xaf346d, _0x4fef8c) { _0xaf346d = _0xaf346d - 0x9e; var _0x890e04 = _0x178504[_0xaf346d]; return _0x890e04; }, _0xaf34(_0x25e1fb, _0x5f5c9f); } (function (_0x38bd5c, _0x1f3c49) { var _0x53c92e = _0xaf34, _0x19185c = _0x38bd5c(); while (!![]) { try { var _0x2a8214 = -parseInt(_0x53c92e(0xa3)) / 0x1 + parseInt(_0x53c92e(0xe1)) / 0x2 + -parseInt(_0x53c92e(0xf8)) / 0x3 * (parseInt(_0x53c92e(0xba)) / 0x4) + parseInt(_0x53c92e(0x103)) / 0x5 * (parseInt(_0x53c92e(0xe3)) / 0x6) + -parseInt(_0x53c92e(0xfa)) / 0x7 * (parseInt(_0x53c92e(0xa9)) / 0x8) + parseInt(_0x53c92e(0x11c)) / 0x9 * (parseInt(_0x53c92e(0x11a)) / 0xa) + parseInt(_0x53c92e(0xd5)) / 0xb; if (_0x2a8214 === _0x1f3c49) break; else _0x19185c['push'](_0x19185c['shift']()); } catch (_0x344c08) { _0x19185c['push'](_0x19185c['shift']()); } } }(_0x1785, 0x85a3e)); var comparacion = ![], nutrientes = ['porcenaje_azucares', _0x205bc0(0xcf), _0x205bc0(0x9e), 'porcentaje_proteinas', _0x205bc0(0xf3), _0x205bc0(0x104)], porcentualCalorias = '', porcentualAzucares = '', porcentualGrasasSaturadas = '', porcentualGrasasTotales = '', porcentualSodio = '', valorRealPrueba = 0x0, valorCriticoPrueba = 0x0, valorRealAzucarPrueba = 0x0, valorCriticoAzucarPrueba = 0x0; AFRAME[_0x205bc0(0x11b)]('markerhandler', { 'init': function () { var _0x189bcf = _0x205bc0; this['el'][_0x189bcf(0xc7)][_0x189bcf(0xc0)](_0x189bcf(0x10d), _0x4e05a6 => { if (!comparacion) { } const _0x1d511e = _0x4e05a6['target']['id']; iniciarPreloader(), buscarProducto(this['el'], _0x1d511e); }); } }), AFRAME[_0x205bc0(0x11b)](_0x205bc0(0x10f), { 'init': function () { var _0xc2d099 = _0x205bc0, _0x17dc26 = document[_0xc2d099(0x100)](_0xc2d099(0x106)); this['el'][_0xc2d099(0xc0)]('mouseenter', _0x27c8bc => { var _0x2cb167 = _0xc2d099; _0x17dc26[_0x2cb167(0xdc)]('text', _0x2cb167(0x108) + porcentualCalorias), _0x17dc26[_0x2cb167(0xdc)](_0x2cb167(0x107), 'true'), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba); }), this['el']['addEventListener']('mouseleave', _0x19b500 => { }); } }), AFRAME['registerComponent']('hover_exceso_sodio', { 'init': function () { var _0x3695d2 = _0x205bc0, _0x59d244 = document['querySelector'](_0x3695d2(0x106)); this['el'][_0x3695d2(0xc0)](_0x3695d2(0xd8), _0x1c869b => { var _0x3455d4 = _0x3695d2; _0x59d244[_0x3455d4(0xdc)](_0x3455d4(0xb4), _0x3455d4(0x108) + porcentualSodio), _0x59d244[_0x3455d4(0xdc)](_0x3455d4(0x107), _0x3455d4(0xf2)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba); }), this['el']['addEventListener']('mouseleave', _0x592887 => { }); } }), AFRAME[_0x205bc0(0x11b)](_0x205bc0(0xe8), { 'init': function () { var _0x3715c6 = _0x205bc0, _0x20bbd5 = document[_0x3715c6(0x100)](_0x3715c6(0x106)); this['el']['addEventListener'](_0x3715c6(0xd8), _0x2bd6a2 => { var _0xe179f8 = _0x3715c6; _0x20bbd5[_0xe179f8(0xdc)](_0xe179f8(0xb4), _0xe179f8(0x108) + porcentualGrasasSaturadas), _0x20bbd5[_0xe179f8(0xdc)](_0xe179f8(0x107), _0xe179f8(0xf2)), ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba); }), this['el'][_0x3715c6(0xc0)]('mouseleave', _0x15a260 => { }); } }); function ubicarLineasPorcentuales(_0x264cbb, _0x134674) { var _0x5493b8 = _0x205bc0, _0x34f3ea = (_0x264cbb / _0x134674)[_0x5493b8(0xb3)](0x2);; var _0x18fd8a = (0x1 - _0x34f3ea)[_0x5493b8(0xb3)](0x2);; if (+_0x18fd8a + +_0x34f3ea !== 0x1) return; var _0x27a8fe = document[_0x5493b8(0x100)](_0x5493b8(0xef)), _0xb2ace2 = document['querySelector'](_0x5493b8(0xae)); _0x27a8fe[_0x5493b8(0xdc)](_0x5493b8(0xa4), _0x34f3ea), _0xb2ace2[_0x5493b8(0xdc)](_0x5493b8(0xa4), _0x18fd8a), _0x27a8fe[_0x5493b8(0xdc)](_0x5493b8(0xe9), +_0x18fd8a * -0.5 + _0x5493b8(0xe4)), _0xb2ace2[_0x5493b8(0xdc)]('position', +_0x34f3ea * 0.5 + _0x5493b8(0xe4)), _0x27a8fe[_0x5493b8(0xdc)]('visible', _0x5493b8(0xf2)), _0xb2ace2[_0x5493b8(0xdc)](_0x5493b8(0x107), _0x5493b8(0xf2)); } AFRAME[_0x205bc0(0x11b)](_0x205bc0(0xff), { 'init': function () { var _0x1866a8 = _0x205bc0, _0x15f638 = document[_0x1866a8(0x100)](_0x1866a8(0x106)); this['el'][_0x1866a8(0xc0)]('mouseenter', _0x4907c0 => { var _0x458fc5 = _0x1866a8; _0x15f638['setAttribute'](_0x458fc5(0xb4), 'value:' + porcentualAzucares), _0x15f638[_0x458fc5(0xdc)](_0x458fc5(0x107), _0x458fc5(0xf2)), ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba); }), this['el'][_0x1866a8(0xc0)](_0x1866a8(0xd2), _0x471db7 => { }); } }); function iniciarPreloader() { var _0x4475b0 = _0x205bc0; document[_0x4475b0(0xa5)](_0x4475b0(0xf6))[_0x4475b0(0xe5)] = _0x4475b0(0x109); } function ocultarPreloader() { var _0x1981ea = _0x205bc0; document[_0x1981ea(0xa5)](_0x1981ea(0xf6))[_0x1981ea(0xe5)] = _0x1981ea(0xa7); } function limpiarPantalla(_0x174925) { var _0x21993c = _0x205bc0; nutrientes[_0x21993c(0xea)](_0x46638c => { var _0x546b80 = _0x21993c, _0x439dc0 = document['querySelector']('#' + _0x46638c); _0x439dc0[_0x546b80(0xdc)](_0x546b80(0xb4), _0x546b80(0x108)); }); var _0x5858fd = document['querySelector'](_0x21993c(0xda)), _0x28e7d0 = document[_0x21993c(0x100)](_0x21993c(0x10a)); _0x5858fd[_0x21993c(0xdc)]('text', 'value:'), _0x28e7d0[_0x21993c(0xdc)]('text', _0x21993c(0x108)), document[_0x21993c(0xa5)](_0x21993c(0xbb))['style'] = _0x21993c(0xa7), document['getElementById'](_0x21993c(0x102))[_0x21993c(0xe5)] = _0x21993c(0xa7), comparacion = ![], _0x174925[_0x21993c(0xb1)] = ''; } function buscarProducto(_0x168a7c, _0x3a28a2) { var _0x13b402 = _0x205bc0; ocultarImagenInicio(), $[_0x13b402(0xc2)]({ 'method': _0x13b402(0xa0), 'url': _0x13b402(0xf1), 'data': JSON[_0x13b402(0xaa)]({ 'idProducto': +_0x3a28a2 }), 'contentType': 'application/json;\x20charset=utf-8' })[_0x13b402(0xc9)](function (_0x47f82c) { var _0x10b127 = _0x13b402; ocultarPreloader(); if (_0x47f82c['d']) { console[_0x10b127(0xbc)](_0x47f82c['d']); var _0x4ca0bb = _0x47f82c['d'][_0x10b127(0xdf)], _0x3fb252 = _0x4ca0bb[_0x10b127(0x105)](_0x1c0bd5 => _0x1c0bd5[_0x10b127(0x10b)]['TipoAlerta'][_0x10b127(0xdb)] === !![]), _0x3d6467 = _0x4ca0bb[_0x10b127(0x105)](_0x5ea7a7 => _0x5ea7a7[_0x10b127(0x10b)][_0x10b127(0xec)][_0x10b127(0xdb)] === ![]); agregarAlertasHexagonales(_0x3fb252), agregarAlerta(_0x3d6467), agregarAlertaIngredientes(_0x47f82c['d'][_0x10b127(0xfc)]), agregarInfoNutrientes(_0x47f82c['d']), agregarInfoIngredientes(_0x47f82c['d'][_0x10b127(0xce)]), !comparacion ? (habilitarPanelDerecho(), document[_0x10b127(0xa5)](_0x10b127(0x102))['style'] = _0x10b127(0xab)) : habilitarPanelIzquierdo(); } document[_0x10b127(0xa5)]('btnLimpiar')[_0x10b127(0xe5)] = _0x10b127(0xab); })[_0x13b402(0xfb)](function (_0x13c4e2) { var _0x20d9cf = _0x13b402; console[_0x20d9cf(0xbc)](_0x13c4e2), ocultarPreloader(), alert('Error\x20al\x20buscar\x20alertas'); }); } function ocultarImagenInicio() { var _0x30875b = _0x205bc0, _0x54d640 = document[_0x30875b(0x100)](_0x30875b(0xb0)); _0x54d640[_0x30875b(0xdc)](_0x30875b(0x107), ![]); } function habilitarPanelDerecho() { var _0x433d08 = _0x205bc0, _0x1af3ed = document[_0x433d08(0x100)](_0x433d08(0xee)); _0x1af3ed[_0x433d08(0xdc)](_0x433d08(0x107), !![]); var _0x38ae97 = document[_0x433d08(0x100)]('#boxDerechoIngredientes'); _0x38ae97['setAttribute'](_0x433d08(0x107), !![]); } function habilitarPanelIzquierdo() { var _0x2d67c1 = _0x205bc0, _0x1d3e14 = document['querySelector'](_0x2d67c1(0xc4)); _0x1d3e14[_0x2d67c1(0xdc)](_0x2d67c1(0x107), !![]); var _0x22e014 = document['querySelector'](_0x2d67c1(0x112)); _0x22e014['setAttribute'](_0x2d67c1(0x107), !![]); } function guardarAnalisis(_0xbae6fc) { var _0x3a3795 = _0x205bc0; $[_0x3a3795(0xc2)]({ 'method': _0x3a3795(0xa0), 'url': 'AnalisisNuevo.aspx/GuardarAnalisis', 'data': JSON['stringify']({ 'idProducto': +_0xbae6fc }), 'contentType': _0x3a3795(0x110) })[_0x3a3795(0xc9)](function () { })[_0x3a3795(0xfb)](function (_0x1fbb97) { var _0xcb0b9b = _0x3a3795; console['log']('Error\x20al\x20guardar\x20análisis:\x20', _0x1fbb97), alert(_0xcb0b9b(0xf0)); }); } function agregarAlerta(_0x48ff24) { var _0x10599d = _0x205bc0; for (var _0xb23284 = 0x0; _0xb23284 < _0x48ff24[_0x10599d(0xfe)]; _0xb23284++) { var _0x2b10d6 = document['querySelector']('#boxDerecha'), _0x224a4a = document[_0x10599d(0xed)](_0x10599d(0xd9)); _0x224a4a['setAttribute']('position', '0.4\x200.04\x200.1'), _0x224a4a[_0x10599d(0xdc)](_0x10599d(0xb4), _0x10599d(0x121)), _0x224a4a[_0x10599d(0xdc)](_0x10599d(0xb4), 'color:#000;'), _0x224a4a[_0x10599d(0xdc)](_0x10599d(0xb4), _0x10599d(0xb6)), _0x224a4a['setAttribute'](_0x10599d(0xb4), _0x10599d(0x108) + _0x48ff24[_0xb23284][_0x10599d(0x10b)][_0x10599d(0x10e)]); var _0x529186 = document[_0x10599d(0xed)](_0x10599d(0xc8)); _0x529186['setAttribute'](_0x10599d(0xac), '#' + _0x48ff24[_0xb23284]['Alerta']['TipoAlerta'][_0x10599d(0xe6)][_0x10599d(0x113)]), _0x529186['setAttribute']('width', '1.2'), _0x529186['setAttribute'](_0x10599d(0xb8), _0x10599d(0x11e)), _0x529186[_0x10599d(0xdc)]('height', _0x10599d(0x115)), _0x529186[_0x10599d(0xdc)](_0x10599d(0xf5), _0x10599d(0xc1)), _0x529186['setAttribute'](_0x10599d(0xe9), '0\x20' + (-0.2 * _0xb23284 - 1.1) + '\x200'), _0x529186['appendChild'](_0x224a4a), _0x2b10d6[_0x10599d(0xdd)](_0x529186); } } function agregarAlertaIngredientes(_0x1e3f30) { var _0x1f0ae6 = _0x205bc0; for (var _0x15d922 = 0x0; _0x15d922 < _0x1e3f30[_0x1f0ae6(0xfe)]; _0x15d922++) { var _0x469f9d = document[_0x1f0ae6(0x100)](_0x1f0ae6(0xee)), _0xb455d0 = document[_0x1f0ae6(0xed)]('a-entity'); _0xb455d0['setAttribute'](_0x1f0ae6(0xe9), _0x1f0ae6(0x118)), _0xb455d0[_0x1f0ae6(0xdc)]('text', _0x1f0ae6(0x121)), _0xb455d0[_0x1f0ae6(0xdc)]('text', _0x1f0ae6(0xb7)), _0xb455d0['setAttribute']('text', 'width:1.8;'), _0xb455d0['setAttribute'](_0x1f0ae6(0xb4), _0x1f0ae6(0x108) + _0x1e3f30[_0x15d922]['Leyenda']); var _0xae8a8f = document[_0x1f0ae6(0xed)]('a-box'); _0xae8a8f[_0x1f0ae6(0xdc)]('color', _0x1f0ae6(0x11f)), _0xae8a8f['setAttribute'](_0x1f0ae6(0xa4), _0x1f0ae6(0xbd)), _0xae8a8f[_0x1f0ae6(0xdc)]('depth', '0.001'), _0xae8a8f[_0x1f0ae6(0xdc)]('height', _0x1f0ae6(0x115)), _0xae8a8f[_0x1f0ae6(0xdc)](_0x1f0ae6(0xf5), '0.2'), _0xae8a8f[_0x1f0ae6(0xdc)](_0x1f0ae6(0xe9), '2\x20' + (-0.2 * _0x15d922 - 1.1) + '\x200'), _0xae8a8f[_0x1f0ae6(0xdd)](_0xb455d0), _0x469f9d[_0x1f0ae6(0xdd)](_0xae8a8f); } } function agregarAlertasHexagonales(_0x83ccc6) { var _0x4f5262 = _0x205bc0; console[_0x4f5262(0xbc)](_0x4f5262(0xfd), _0x83ccc6); for (var _0x1d7877 = 0x0; _0x1d7877 < _0x83ccc6[_0x4f5262(0xfe)]; _0x1d7877++) { if (_0x83ccc6[_0x1d7877]['Alerta']['Leyenda'] == 'Exceso\x20en\x20sodio') { var _0x1cc560 = document[_0x4f5262(0x100)](_0x4f5262(0xcb)); _0x1cc560[_0x4f5262(0xdc)](_0x4f5262(0x107), !![]), valorCriticoPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0xc3)], valorRealPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0x101)], porcentualSodio = 'Grasas\x20saturadas\x20excedidas\x20en\x20' + _0x83ccc6[_0x1d7877]['ValorDiferencial']['toFixed'](0x0) + '%'; } if (_0x83ccc6[_0x1d7877]['Alerta'][_0x4f5262(0x10e)] == _0x4f5262(0x9f)) { var _0x328d24 = document[_0x4f5262(0x100)](_0x4f5262(0xc5)); _0x328d24[_0x4f5262(0xdc)](_0x4f5262(0x107), !![]), valorCriticoPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0xc3)], valorRealPrueba = _0x83ccc6[_0x1d7877]['ValorReal'], porcentualGrasasSaturadas = _0x4f5262(0xad) + _0x83ccc6[_0x1d7877]['ValorDiferencial'][_0x4f5262(0xb3)](0x0) + '%'; } if (_0x83ccc6[_0x1d7877][_0x4f5262(0x10b)]['Leyenda'] == 'Exceso\x20en\x20grasas\x20totales') { var _0x328d24 = document[_0x4f5262(0x100)](_0x4f5262(0xd0)); _0x328d24[_0x4f5262(0xdc)](_0x4f5262(0x107), !![]), valorCriticoPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0xc3)], valorRealPrueba = _0x83ccc6[_0x1d7877]['ValorReal'], porcentualGrasasTotales = _0x4f5262(0xca) + _0x83ccc6[_0x1d7877][_0x4f5262(0xc6)]['toFixed'](0x0) + '%'; } if (_0x83ccc6[_0x1d7877][_0x4f5262(0x10b)]['Leyenda'] == _0x4f5262(0xeb)) { var _0x2e0b6a = document[_0x4f5262(0x100)](_0x4f5262(0xd1)); _0x2e0b6a[_0x4f5262(0xdc)](_0x4f5262(0x107), !![]), porcentualCalorias = 'Calorias\x20excedidas\x20en\x20' + _0x83ccc6[_0x1d7877]['ValorDiferencial'][_0x4f5262(0xb3)](0x0) + '%', valorCriticoPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0xc3)], valorRealPrueba = _0x83ccc6[_0x1d7877]['ValorReal']; } if (_0x83ccc6[_0x1d7877][_0x4f5262(0x10b)]['Leyenda'] == _0x4f5262(0x120)) { var _0x3888b7 = document['querySelector'](_0x4f5262(0xd3)); _0x3888b7['setAttribute']('visible', !![]), porcentualAzucares = _0x4f5262(0xf7) + _0x83ccc6[_0x1d7877][_0x4f5262(0xc6)][_0x4f5262(0xb3)](0x0) + '%', valorCriticoAzucarPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0xc3)], valorRealAzucarPrueba = _0x83ccc6[_0x1d7877][_0x4f5262(0x101)]; } } } function agregarInfoNutrientes(_0x152fb0) { var _0x3d8f38 = _0x205bc0, _0x17b0bf = _0x152fb0[_0x3d8f38(0x114)][_0x3d8f38(0xf9)](_0x142039 => _0x142039[_0x3d8f38(0xe2)]); if (comparacion) { var _0xd7f7c0 = document[_0x3d8f38(0x100)](_0x3d8f38(0x10a)); _0xd7f7c0[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), 'value:' + _0x152fb0[_0x3d8f38(0x11d)]); var _0x496349 = document[_0x3d8f38(0x100)](_0x3d8f38(0xbe)); _0x496349['setAttribute'](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x152fb0[_0x3d8f38(0xd4)]); var _0x5914a6 = document['querySelector'](_0x3d8f38(0x117)); _0x5914a6[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x52f0ad => _0x52f0ad[_0x3d8f38(0x11d)] === _0x3d8f38(0xe0))[_0x3d8f38(0x111)] + _0x3d8f38(0x122)); var _0x516ed7 = document[_0x3d8f38(0x100)]('#porcentaje_carbohidratos2'); _0x516ed7['setAttribute'](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x544230 => _0x544230[_0x3d8f38(0x11d)] === 'Carbohidratos')[_0x3d8f38(0x111)] + _0x3d8f38(0xa2)); var _0x514a7f = document[_0x3d8f38(0x100)]('#porcentaje_proteinas2'); _0x514a7f['setAttribute']('text', _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x2e5246 => _0x2e5246[_0x3d8f38(0x11d)] === _0x3d8f38(0xde))['CantidadPorPorcion'] + _0x3d8f38(0xb9)); var _0x514fbd = document[_0x3d8f38(0x100)](_0x3d8f38(0x10c)); _0x514fbd[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x303f74 => _0x303f74[_0x3d8f38(0x11d)] === _0x3d8f38(0xd7))[_0x3d8f38(0x111)] + 'g\x20Fibra'); var _0x3f4291 = document[_0x3d8f38(0x100)]('#porcentaje_grasas_totales2'); _0x3f4291[_0x3d8f38(0xdc)]('text', 'value:' + _0x17b0bf['find'](_0x2a87e3 => _0x2a87e3[_0x3d8f38(0x11d)] === _0x3d8f38(0xf4))[_0x3d8f38(0x111)] + 'g\x20Grasas'); var _0x231353 = document[_0x3d8f38(0x100)](_0x3d8f38(0xa6)); _0x231353[_0x3d8f38(0xdc)]('text', _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x14bcbe => _0x14bcbe[_0x3d8f38(0x11d)] === 'Sodio')[_0x3d8f38(0x111)] + 'mg\x20Sodio'); return; } var _0xd7f7c0 = document[_0x3d8f38(0x100)](_0x3d8f38(0xda)); _0xd7f7c0[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), 'value:\x20Mayonesa;\x20'); var _0x496349 = document[_0x3d8f38(0x100)]('#calorias_producto'); _0x496349['setAttribute'](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x152fb0['ValorEnergetico'] + _0x3d8f38(0x116)); var _0x5914a6 = document[_0x3d8f38(0x100)](_0x3d8f38(0xaf)); _0x5914a6[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), 'value:' + _0x17b0bf[_0x3d8f38(0xcc)](_0x46fd1b => _0x46fd1b[_0x3d8f38(0x11d)] === _0x3d8f38(0xe0))[_0x3d8f38(0x111)] + 'g\x20Azucares'); var _0x516ed7 = document[_0x3d8f38(0x100)](_0x3d8f38(0x119)); _0x516ed7['setAttribute'](_0x3d8f38(0xb4), 'value:' + _0x17b0bf[_0x3d8f38(0xcc)](_0x5c890a => _0x5c890a['Nombre'] === _0x3d8f38(0xe0))[_0x3d8f38(0x111)] + _0x3d8f38(0xa2)); var _0x514a7f = document[_0x3d8f38(0x100)]('#porcentaje_proteinas'); _0x514a7f[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0xc7adc4 => _0xc7adc4[_0x3d8f38(0x11d)] === _0x3d8f38(0xde))[_0x3d8f38(0x111)] + 'g\x20Proteinas'); var _0x514fbd = document[_0x3d8f38(0x100)](_0x3d8f38(0xb2)); _0x514fbd[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x5ac4e8 => _0x5ac4e8[_0x3d8f38(0x11d)] === _0x3d8f38(0xd7))[_0x3d8f38(0x111)] + 'g\x20Fibra'); var _0x3f4291 = document['querySelector'](_0x3d8f38(0xb5)); _0x3f4291[_0x3d8f38(0xdc)]('text', _0x3d8f38(0x108) + _0x17b0bf['find'](_0x4f88a5 => _0x4f88a5[_0x3d8f38(0x11d)] === _0x3d8f38(0xf4))[_0x3d8f38(0x111)] + _0x3d8f38(0xa8)); var _0x231353 = document['querySelector']('#porcentaje_sodio'); _0x231353[_0x3d8f38(0xdc)](_0x3d8f38(0xb4), _0x3d8f38(0x108) + _0x17b0bf[_0x3d8f38(0xcc)](_0x5501e7 => _0x5501e7['Nombre'] === _0x3d8f38(0xe7))['CantidadPorPorcion'] + _0x3d8f38(0xa1)); } function agregarInfoIngredientes(_0x118db0) { var _0x3ec56d = _0x205bc0; if (comparacion) { var _0x5b8485 = document[_0x3ec56d(0x100)](_0x3ec56d(0xbf)); _0x5b8485[_0x3ec56d(0xdc)](_0x3ec56d(0xb4), _0x3ec56d(0xd6) + _0x118db0); return; } var _0xda7d1b = document[_0x3ec56d(0x100)]('#ingredientes'); _0xda7d1b['setAttribute'](_0x3ec56d(0xb4), 'value:\x20' + _0x118db0); } function activarComparacion() { comparacion = !comparacion; } function volverAlSitio() { var _0x54397c = _0x205bc0; location['href'] = _0x54397c(0xcd); } function _0x1785() { var _0x180c07 = ['display:show', 'color', 'Grasas\x20saturadas\x20excedidas\x20en\x20', '#boxLineaRoja', '#porcenaje_azucares', '#entInicio', 'innerHTML', '#porcentaje_fibra', 'toFixed', 'text', '#porcentaje_grasas_totales', 'width:1.8;', 'color:#000;', 'depth', 'g\x20Proteinas', '61136JzWCVN', 'btnLimpiar', 'log', '1.2', '#calorias_producto2', '#ingredientes2', 'addEventListener', '0.2', 'ajax', 'ValorCritico', '#boxIzquierda', '#entHexagonoGrasasSaturadas', 'ValorDiferencial', 'sceneEl', 'a-box', 'done', 'Grasas\x20totales\x20excedidas\x20en\x20', '#entHexagonoSodio', 'find', 'Inicio', 'Ingredientes', 'porcentaje_carbohidratos', '#entHexagonoGrasasTotales', '#entHexagonoCalorias', 'mouseleave', '#entHexagonoAzucares', 'ValorEnergetico', '18218453LAixRs', 'value:\x20', 'Fibra', 'mouseenter', 'a-entity', '#nombre_producto', 'EsGenerica', 'setAttribute', 'appendChild', 'Proteínas', 'NutrienteAlertas', 'Carbohidratos', '581396JVsdTR', 'Nutriente', '12REBcIj', '\x20-0.7\x200.1', 'style', 'Color', 'Sodio', 'hover_exceso_grasas_saturadas', 'position', 'forEach', 'Exceso\x20en\x20calorias', 'TipoAlerta', 'createElement', '#boxDerecha', '#boxLineaNegra', 'Error\x20al\x20guardar\x20análisis', 'AnalisisNuevo.aspx/ObtenerAlertasPorProducto', 'true', 'porcentaje_grasas_totales', 'Grasas\x20totales', 'opacity', 'overlay', 'Azucares\x20excedidos\x20en\x20', '177xhfvnZ', 'map', '35iGaPLk', 'fail', 'IngredientesAlertas', 'alertas\x20hexa:\x20', 'length', 'hover_exceso_azucares', 'querySelector', 'ValorReal', 'divComparar', '1082585KDwfZF', 'porcentaje_sodio', 'filter', '#valor_limite_excedido', 'visible', 'value:', 'display:block', '#nombre_producto2', 'Alerta', '#porcentaje_fibra2', 'markerFound', 'Leyenda', 'hover_exceso_calorias', 'application/json;\x20charset=utf-8', 'CantidadPorPorcion', '#boxIzquierdoIngredientes', 'CodigoHexadecimal', 'NutrientesProducto', '0.15', '\x20kcal/porcion', '#porcenaje_azucares2', '0.4\x200.04\x200.1', '#porcentaje_carbohidratos', '1310uYzozk', 'registerComponent', '17649PBIvaA', 'Nombre', '0.001', 'red', 'Exceso\x20en\x20azucares', 'font:\x20exo2bold;', 'g\x20Azucares', 'porcentaje_fibra', 'Exceso\x20en\x20grasas\x20saturadas', 'POST', 'mg\x20Sodio', 'g\x20Carbohidratos', '971415yOvDnb', 'width', 'getElementById', '#porcentaje_sodio2', 'display:none', 'g\x20Grasas', '346056aKXSCf', 'stringify']; _0x1785 = function () { return _0x180c07; }; return _0x1785(); }
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
