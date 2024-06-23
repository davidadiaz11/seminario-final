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
    var _0x3bb693 = _0x17bc; (function (_0x5819c8, _0x1273d0) { var _0x454f71 = _0x17bc, _0x29aa0f = _0x5819c8(); while (!![]) { try { var _0x1c587e = parseInt(_0x454f71(0x180)) / 0x1 + parseInt(_0x454f71(0x12c)) / 0x2 * (parseInt(_0x454f71(0x123)) / 0x3) + -parseInt(_0x454f71(0x120)) / 0x4 + -parseInt(_0x454f71(0x18b)) / 0x5 + -parseInt(_0x454f71(0x114)) / 0x6 * (-parseInt(_0x454f71(0x141)) / 0x7) + -parseInt(_0x454f71(0x173)) / 0x8 * (-parseInt(_0x454f71(0x11f)) / 0x9) + -parseInt(_0x454f71(0x13d)) / 0xa * (-parseInt(_0x454f71(0x18c)) / 0xb); if (_0x1c587e === _0x1273d0) break; else _0x29aa0f['push'](_0x29aa0f['shift']()); } catch (_0x5d9518) { _0x29aa0f['push'](_0x29aa0f['shift']()); } } }(_0x1922, 0x50545)); var buscando = ![], comparacion = ![], nutrientes = ['porcentaje_azucares', _0x3bb693(0x138), _0x3bb693(0x14e), 'porcentaje_proteinas', _0x3bb693(0x137), _0x3bb693(0x185)], sumatoriaAlertas = 0x1, porcentualCalorias = '', porcentualAzucares = '', porcentualGrasasSaturadas = '', porcentualGrasasTotales = '', porcentualSodio = '', valorRealAzucares = 0x0, valorCriticoAzucares = 0x0, valorRealCalorias = 0x0, valorCriticoCalorias = 0x0, valorRealGrasasSaturadas = 0x0, valorCriticoGrasasSaturadas = 0x0, valorRealGrasasTotales = 0x0, valorCriticoGrasasTotales = 0x0, valorRealSodio = 0x0, valorCriticoSodio = 0x0, porcentualCalorias2 = '', porcentualAzucares2 = '', porcentualGrasasSaturadas2 = '', porcentualGrasasTotales2 = '', porcentualSodio2 = '', valorRealAzucares2 = 0x0, valorCriticoAzucares2 = 0x0, valorRealCalorias2 = 0x0, valorCriticoCalorias2 = 0x0, valorRealGrasasSaturadas2 = 0x0, valorCriticoGrasasSaturadas2 = 0x0, valorRealGrasasTotales2 = 0x0, valorCriticoGrasasTotales2 = 0x0, valorRealSodio2 = 0x0, valorCriticoSodio2 = 0x0; function _0x1922() { var _0x36df25 = ['g\x20Azucares', '#alertasInferioresDerechas', 'color:#000;', 'width', 'a-entity', 'href', 'display:show', 'TipoAlerta', 'innerHTML', 'text', 'hover_exceso_sodio2', 'NutrientesProducto', 'Exceso\x20en\x20sodio', 'Sodio', 'color', 'NuevoAnalisis.aspx/GuardarAnalisis', 'Exceso\x20en\x20calorias', 'ajax', 'normalize', 'position', '#entHexagonoGrasasTotales', 'hover_exceso_grasas_totales', 'application/json;\x20charset=utf-8', 'Grasas\x20totales\x20excedidas\x20en\x20', 'a-box', '#boxDerechoIngredientes', 'querySelector', 'font:\x20exo2bold;', 'g\x20Sodio', '#boxDerecha', '#alertasInferioresIzquierdas', 'log', '#nombre_producto2', 'markerFound', '88IXpazf', 'height', 'hover_exceso_grasas_totales2', 'hover_exceso_azucares', '#boxIzquierdoIngredientes', 'width:0.8;', '#entInicio', 'true', '1.2', 'target', 'btnLimpiar', 'NutrienteAlertas', 'setAttribute', '107638cKaynU', 'checked', 'registerComponent', 'stringify', 'createElement', 'porcentaje_sodio', '0.4\x200.04\x200.1', 'hover_exceso_grasas_saturadas', 'value:\x20', '#entHexagonoCalorias', 'addEventListener', '2310420tYhhic', '550099HVfzwU', 'visible', 'Exceso\x20en\x20azucares', 'EsPrincipal', 'Perfil', 'getElementById', '#ingredientes', 'Azúcares\x20añadidos', 'length', 'hover_exceso_azucares2', 'fail', '\x20-0.7\x200.1', '10218XUlkSt', 'g\x20Carbohidratos', 'Grasas\x20totales', '-0.1\x200.1\x200.1', 'toFixed', 'divComparar', 'CantidadPorPorcion', 'g\x20Grasas', 'value:', 'ValorCritico', '#boxIzquierda', '285624WHLwhE', '2190364poJqcC', 'Leyenda', 'style', '40719wlepaZ', '#valor_limite_excedido', 'Exceso\x20en\x20grasas\x20totales', 'Color', 'Inicio', '#entHexagonoGrasasSaturadas', 'porcentaje_proteinas', 'done', 'NFD', '38uEyDRw', 'EsGenerica', '#valor_limite_excedido2', 'find', 'Alerta', 'calorias_producto', 'Sodio\x20excedido\x20en\x20', 'Calorias\x20excedidas\x20en\x20', '0.001', 'Proteínas', 'mouseenter', 'porcentaje_grasas_totales', 'porcentaje_carbohidratos', '0.5', 'NuevoAnalisis.aspx/ObtenerAlertasPorProducto', 'width:1.8;', 'porcentaje_azucares', '40WIWqSZ', 'filter', 'opacity', 'Grasas\x20saturadas\x20excedidas\x20en\x20', '1743ErpMmd', 'porcion_producto', 'substring', 'g\x20Proteinas', 'ValorDiferencial', '#entHexagonoSodio', 'depth', 'overlay', 'Nombre', 'ValorReal', 'POST', 'display:block', 'display:none', 'porcentaje_fibra', 'map', 'appendChild']; _0x1922 = function () { return _0x36df25; }; return _0x1922(); } AFRAME[_0x3bb693(0x182)]('markerhandler', { 'init': function () { var _0x146191 = _0x3bb693; this['el']['sceneEl']['addEventListener'](_0x146191(0x172), _0x4e3d46 => { var _0x2c3421 = _0x146191; if (!comparacion) { } const _0x1e38ae = _0x4e3d46[_0x2c3421(0x17c)]['id']; iniciarPreloader(), buscarProducto(_0x1e38ae); }); } }), AFRAME[_0x3bb693(0x182)]('hover_exceso_calorias', { 'init': function () { var _0x35af1c = _0x3bb693, _0x1988ba = document[_0x35af1c(0x16b)](_0x35af1c(0x124)); this['el']['addEventListener'](_0x35af1c(0x136), _0x3762f1 => { var _0x278e75 = _0x35af1c; _0x1988ba['setAttribute'](_0x278e75(0x15a), _0x278e75(0x11c) + porcentualCalorias), _0x1988ba['setAttribute'](_0x278e75(0x18d), 'true'), ubicarLineasPorcentuales(valorCriticoCalorias, valorRealCalorias, !![]); }); } }), AFRAME[_0x3bb693(0x182)]('hover_exceso_calorias2', { 'init': function () { var _0x53be50 = _0x3bb693, _0x4063a5 = document[_0x53be50(0x16b)](_0x53be50(0x12e)); this['el'][_0x53be50(0x18a)](_0x53be50(0x136), _0x10cf68 => { var _0x107b28 = _0x53be50; _0x4063a5[_0x107b28(0x17f)](_0x107b28(0x15a), _0x107b28(0x11c) + porcentualCalorias2), _0x4063a5[_0x107b28(0x17f)](_0x107b28(0x18d), _0x107b28(0x17a)), ubicarLineasPorcentuales(valorCriticoCalorias2, valorRealCalorias2, ![]); }); } }), AFRAME[_0x3bb693(0x182)]('hover_exceso_sodio', { 'init': function () { var _0x2ade00 = _0x3bb693, _0x5db291 = document[_0x2ade00(0x16b)]('#valor_limite_excedido'); this['el'][_0x2ade00(0x18a)](_0x2ade00(0x136), _0x52952d => { var _0x29679a = _0x2ade00; _0x5db291['setAttribute'](_0x29679a(0x15a), _0x29679a(0x11c) + porcentualSodio), _0x5db291[_0x29679a(0x17f)](_0x29679a(0x18d), _0x29679a(0x17a)), ubicarLineasPorcentuales(valorCriticoSodio, valorRealSodio, !![]); }); } }), AFRAME[_0x3bb693(0x182)](_0x3bb693(0x15b), { 'init': function () { var _0x228181 = _0x3bb693, _0x416ced = document[_0x228181(0x16b)](_0x228181(0x12e)); this['el']['addEventListener'](_0x228181(0x136), _0x118023 => { var _0x5e109b = _0x228181; _0x416ced[_0x5e109b(0x17f)](_0x5e109b(0x15a), _0x5e109b(0x11c) + porcentualSodio2), _0x416ced['setAttribute'](_0x5e109b(0x18d), _0x5e109b(0x17a)), ubicarLineasPorcentuales(valorCriticoSodio2, valorRealSodio2, ![]); }); } }), AFRAME['registerComponent'](_0x3bb693(0x166), { 'init': function () { var _0x1508c9 = _0x3bb693, _0x1496c3 = document[_0x1508c9(0x16b)]('#valor_limite_excedido'); this['el']['addEventListener'](_0x1508c9(0x136), _0x5c0e4e => { var _0x53d194 = _0x1508c9; _0x1496c3[_0x53d194(0x17f)]('text', _0x53d194(0x11c) + porcentualGrasasTotales), _0x1496c3[_0x53d194(0x17f)](_0x53d194(0x18d), 'true'), ubicarLineasPorcentuales(valorCriticoGrasasTotales, valorRealGrasasTotales, !![]); }); } }), AFRAME[_0x3bb693(0x182)](_0x3bb693(0x175), { 'init': function () { var _0x4f1fda = _0x3bb693, _0x2e66b4 = document[_0x4f1fda(0x16b)](_0x4f1fda(0x12e)); this['el'][_0x4f1fda(0x18a)](_0x4f1fda(0x136), _0x4f93c4 => { var _0x4b45f8 = _0x4f1fda; _0x2e66b4[_0x4b45f8(0x17f)](_0x4b45f8(0x15a), 'value:' + porcentualGrasasTotales2), _0x2e66b4[_0x4b45f8(0x17f)](_0x4b45f8(0x18d), 'true'), ubicarLineasPorcentuales(valorCriticoGrasasTotales2, valorRealGrasasTotales2, ![]); }); } }), AFRAME[_0x3bb693(0x182)](_0x3bb693(0x187), { 'init': function () { var _0x50a4bf = _0x3bb693, _0x4e4c94 = document[_0x50a4bf(0x16b)](_0x50a4bf(0x124)); this['el'][_0x50a4bf(0x18a)](_0x50a4bf(0x136), _0x21a874 => { var _0x4b9b2f = _0x50a4bf; _0x4e4c94[_0x4b9b2f(0x17f)]('text', _0x4b9b2f(0x11c) + porcentualGrasasSaturadas), _0x4e4c94[_0x4b9b2f(0x17f)]('visible', _0x4b9b2f(0x17a)), ubicarLineasPorcentuales(valorCriticoGrasasSaturadas, valorRealGrasasSaturadas, !![]); }); } }), AFRAME[_0x3bb693(0x182)]('hover_exceso_grasas_saturadas2', { 'init': function () { var _0x2c5461 = _0x3bb693, _0x42464e = document[_0x2c5461(0x16b)](_0x2c5461(0x12e)); this['el'][_0x2c5461(0x18a)](_0x2c5461(0x136), _0x2e42c9 => { var _0x5dba8f = _0x2c5461; _0x42464e[_0x5dba8f(0x17f)]('text', _0x5dba8f(0x11c) + porcentualGrasasSaturadas2), _0x42464e[_0x5dba8f(0x17f)](_0x5dba8f(0x18d), _0x5dba8f(0x17a)), ubicarLineasPorcentuales(valorCriticoGrasasSaturadas2, valorRealGrasasSaturadas2, ![]); }); } }), AFRAME[_0x3bb693(0x182)](_0x3bb693(0x176), { 'init': function () { var _0x51d6b5 = _0x3bb693, _0x5e6e99 = document[_0x51d6b5(0x16b)](_0x51d6b5(0x124)); this['el'][_0x51d6b5(0x18a)](_0x51d6b5(0x136), _0x8611c9 => { var _0x41cd23 = _0x51d6b5; _0x5e6e99[_0x41cd23(0x17f)](_0x41cd23(0x15a), 'value:' + porcentualAzucares), _0x5e6e99[_0x41cd23(0x17f)]('visible', _0x41cd23(0x17a)), ubicarLineasPorcentuales(valorCriticoAzucares, valorRealAzucares, !![]); }); } }), AFRAME[_0x3bb693(0x182)](_0x3bb693(0x195), { 'init': function () { var _0xdff7b1 = _0x3bb693, _0x16e7fa = document['querySelector'](_0xdff7b1(0x12e)); this['el'][_0xdff7b1(0x18a)](_0xdff7b1(0x136), _0x1f5bd4 => { var _0x1f9fd1 = _0xdff7b1; _0x16e7fa[_0x1f9fd1(0x17f)](_0x1f9fd1(0x15a), 'value:' + porcentualAzucares2), _0x16e7fa[_0x1f9fd1(0x17f)]('visible', _0x1f9fd1(0x17a)), ubicarLineasPorcentuales(valorCriticoAzucares2, valorRealAzucares2, ![]); }); } }); function ubicarLineasPorcentuales(_0x323928, _0x1e7a10, _0x202a81) { var _0x4a3021 = _0x3bb693, _0xc3fc7e = ''; !_0x202a81 && (_0xc3fc7e = '2'); var _0x1151b6 = (_0x323928 / _0x1e7a10)['toFixed'](0x2);; var _0x1f1cca = (0x1 - _0x1151b6)['toFixed'](0x2);; if (+_0x1f1cca + +_0x1151b6 !== 0x1) return; var _0xdb4d10 = document[_0x4a3021(0x16b)]('#boxLineaNegra' + _0xc3fc7e), _0x207918 = document[_0x4a3021(0x16b)]('#boxLineaRoja' + _0xc3fc7e); _0xdb4d10['setAttribute'](_0x4a3021(0x154), _0x1151b6), _0x207918[_0x4a3021(0x17f)](_0x4a3021(0x154), _0x1f1cca), _0xdb4d10['setAttribute'](_0x4a3021(0x164), +_0x1f1cca * -0.5 + '\x20-0.7\x200.1'), _0x207918['setAttribute'](_0x4a3021(0x164), +_0x1151b6 * 0.5 + _0x4a3021(0x197)), _0xdb4d10[_0x4a3021(0x17f)]('visible', _0x4a3021(0x17a)), _0x207918[_0x4a3021(0x17f)](_0x4a3021(0x18d), _0x4a3021(0x17a)); } function iniciarPreloader() { var _0x53b949 = _0x3bb693; document[_0x53b949(0x191)](_0x53b949(0x148))[_0x53b949(0x122)] = _0x53b949(0x14c); } function ocultarPreloader() { var _0x2e16c9 = _0x3bb693; document['getElementById'](_0x2e16c9(0x148))[_0x2e16c9(0x122)] = _0x2e16c9(0x14d); } function limpiarPantalla() { var _0x34e190 = _0x3bb693; nutrientes['forEach'](_0x5d0dd2 => { var _0x57d15d = _0x17bc, _0x5822c9 = document[_0x57d15d(0x16b)]('#' + _0x5d0dd2); _0x5822c9[_0x57d15d(0x17f)]('text', _0x57d15d(0x11c)); }); var _0x6eeea4 = document[_0x34e190(0x16b)]('#nombre_producto'), _0x26d7f8 = document['querySelector'](_0x34e190(0x171)); _0x6eeea4[_0x34e190(0x17f)]('text', _0x34e190(0x11c)), _0x26d7f8[_0x34e190(0x17f)](_0x34e190(0x15a), 'value:'), sumatoriaAlertas = 0x1, document['getElementById']('btnLimpiar')[_0x34e190(0x122)] = 'display:none', document[_0x34e190(0x191)](_0x34e190(0x119))[_0x34e190(0x122)] = _0x34e190(0x14d), document[_0x34e190(0x16b)](_0x34e190(0x16f))[_0x34e190(0x159)] = '', document[_0x34e190(0x16b)](_0x34e190(0x152))[_0x34e190(0x159)] = ''; var _0x10a427 = document[_0x34e190(0x16b)]('.switch'); _0x10a427[_0x34e190(0x181)] = ![], comparacion = ![], habilitarPanelDerecho(![]), habilitarPanelIzquierdo(![]), mostrarImagenInicio(!![]); } function buscarProducto(_0x8aa9be) { var _0x290b6b = _0x3bb693; mostrarImagenInicio(![]); if (buscando) return; else buscando = !![]; $[_0x290b6b(0x162)]({ 'method': _0x290b6b(0x14b), 'url': _0x290b6b(0x13a), 'data': JSON[_0x290b6b(0x183)]({ 'idProducto': +_0x8aa9be }), 'contentType': 'application/json;\x20charset=utf-8' })[_0x290b6b(0x12a)](function (_0xce9b0d) { var _0x50e593 = _0x290b6b; ocultarPreloader(), buscando = ![]; if (_0xce9b0d['d']) { console[_0x50e593(0x170)](_0xce9b0d['d']); var _0x512ba2 = _0xce9b0d['d'][_0x50e593(0x17e)], _0x249613 = _0x512ba2[_0x50e593(0x13e)](_0x5171e9 => _0x5171e9[_0x50e593(0x130)][_0x50e593(0x158)][_0x50e593(0x12d)] === !![]), _0x180398 = _0x512ba2[_0x50e593(0x13e)](_0x410848 => _0x410848[_0x50e593(0x130)][_0x50e593(0x158)][_0x50e593(0x12d)] === ![]); !comparacion ? (limpiarHexagonos(''), document['querySelector'](_0x50e593(0x152))[_0x50e593(0x159)] = '') : (limpiarHexagonos('2'), document[_0x50e593(0x16b)](_0x50e593(0x16f))['innerHTML'] = ''), sumatoriaAlertas = 0x1, agregarAlertasHexagonales(_0x249613), agregarAlerta(_0x180398), agregarAlertaIngredientes(_0xce9b0d['d']['IngredientesAlertas']), agregarInfoNutrientes(_0xce9b0d['d']), agregarInfoIngredientes(_0xce9b0d['d']['Ingredientes']), guardarAnalisis(_0x8aa9be), !comparacion ? (habilitarPanelDerecho(!![]), document[_0x50e593(0x191)]('divComparar')[_0x50e593(0x122)] = _0x50e593(0x157)) : habilitarPanelIzquierdo(!![]); } document[_0x50e593(0x191)](_0x50e593(0x17d))[_0x50e593(0x122)] = _0x50e593(0x157); })[_0x290b6b(0x196)](function (_0x39aa24) { console['log'](_0x39aa24), buscando = ![], ocultarPreloader(), alert('Error\x20al\x20buscar\x20alertas'); }); } function mostrarImagenInicio(_0x190f26) { var _0x266863 = _0x3bb693, _0x4a139b = document[_0x266863(0x16b)](_0x266863(0x179)); _0x4a139b[_0x266863(0x17f)]('visible', _0x190f26); } function habilitarPanelDerecho(_0x2507c4) { var _0x3bc91f = _0x3bb693, _0x46759b = document[_0x3bc91f(0x16b)](_0x3bc91f(0x16e)); _0x46759b[_0x3bc91f(0x17f)]('visible', _0x2507c4); var _0x2ab1b1 = document[_0x3bc91f(0x16b)](_0x3bc91f(0x16a)); _0x2ab1b1[_0x3bc91f(0x17f)](_0x3bc91f(0x18d), _0x2507c4); } function habilitarPanelIzquierdo(_0x1cd0ac) { var _0x5df307 = _0x3bb693, _0x526fb2 = document['querySelector']('#boxIzquierda'); _0x526fb2[_0x5df307(0x17f)](_0x5df307(0x18d), _0x1cd0ac); var _0xad5677 = document['querySelector'](_0x5df307(0x177)); _0xad5677[_0x5df307(0x17f)](_0x5df307(0x18d), _0x1cd0ac); } function guardarAnalisis(_0x3bf9ac) { var _0x34d940 = _0x3bb693; $['ajax']({ 'method': 'POST', 'url': _0x34d940(0x160), 'data': JSON[_0x34d940(0x183)]({ 'idProducto': +_0x3bf9ac }), 'contentType': _0x34d940(0x167) })['done'](function () { })[_0x34d940(0x196)](function (_0x39d98e) { var _0x533ea3 = _0x34d940; console[_0x533ea3(0x170)]('Error\x20al\x20guardar\x20análisis:\x20', _0x39d98e), alert('Error\x20al\x20guardar\x20análisis'); }); } function agregarAlerta(_0x539d35) { var _0x42badf = _0x3bb693, _0x1e4918 = document[_0x42badf(0x16b)](_0x42badf(0x16e)); comparacion && (_0x1e4918 = document[_0x42badf(0x16b)](_0x42badf(0x11e)), sumatoriaAlertas = 0x1); for (var _0x12d17b = 0x0; _0x12d17b < _0x539d35['length']; _0x12d17b++) { var _0x3e0cef = document[_0x42badf(0x184)](_0x42badf(0x155)); _0x3e0cef[_0x42badf(0x17f)]('position', _0x42badf(0x186)), _0x3e0cef[_0x42badf(0x17f)](_0x42badf(0x15a), _0x42badf(0x16c)), _0x3e0cef[_0x42badf(0x17f)]('text', _0x42badf(0x153)), _0x3e0cef['setAttribute'](_0x42badf(0x15a), _0x42badf(0x13b)), _0x3e0cef[_0x42badf(0x17f)](_0x42badf(0x15a), _0x42badf(0x11c) + _0x539d35[_0x12d17b][_0x42badf(0x130)][_0x42badf(0x121)]); var _0x2337d8 = document[_0x42badf(0x184)](_0x42badf(0x169)); _0x2337d8['setAttribute']('color', '#' + _0x539d35[_0x12d17b][_0x42badf(0x130)][_0x42badf(0x158)][_0x42badf(0x126)]['CodigoHexadecimal']), _0x2337d8[_0x42badf(0x17f)](_0x42badf(0x154), _0x42badf(0x17b)), _0x2337d8[_0x42badf(0x17f)](_0x42badf(0x147), _0x42badf(0x134)), _0x2337d8['setAttribute']('height', '0.15'), _0x2337d8['setAttribute'](_0x42badf(0x13f), _0x42badf(0x139)), _0x2337d8['setAttribute'](_0x42badf(0x164), '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), _0x2337d8[_0x42badf(0x150)](_0x3e0cef), _0x1e4918[_0x42badf(0x150)](_0x2337d8), sumatoriaAlertas = sumatoriaAlertas + 0x1; } } function agregarAlertaIngredientes(_0x4f0917) { var _0x33e906 = _0x3bb693, _0x5f1caf = document[_0x33e906(0x16b)]('#alertasInferioresDerechas'); comparacion && (_0x5f1caf = document[_0x33e906(0x16b)](_0x33e906(0x16f))); for (var _0x4d1e22 = 0x0; _0x4d1e22 < _0x4f0917[_0x33e906(0x194)]; _0x4d1e22++) { var _0x50a90c = document[_0x33e906(0x184)](_0x33e906(0x169)); _0x50a90c[_0x33e906(0x17f)](_0x33e906(0x15f), 'red'), _0x50a90c[_0x33e906(0x17f)](_0x33e906(0x154), _0x33e906(0x17b)), _0x50a90c['setAttribute'](_0x33e906(0x147), _0x33e906(0x134)), _0x50a90c[_0x33e906(0x17f)](_0x33e906(0x174), '0.15'), _0x50a90c[_0x33e906(0x17f)](_0x33e906(0x13f), _0x33e906(0x139)), _0x50a90c[_0x33e906(0x17f)](_0x33e906(0x164), '0\x20' + (-0.2 * sumatoriaAlertas - 1.1) + '\x200'), sumatoriaAlertas = sumatoriaAlertas + 0x1; var _0x4b962c = document[_0x33e906(0x184)]('a-entity'); _0x4b962c[_0x33e906(0x17f)](_0x33e906(0x164), '0.4\x200.04\x200.1'), _0x4b962c[_0x33e906(0x17f)]('text', 'font:\x20exo2bold;'), _0x4b962c[_0x33e906(0x17f)](_0x33e906(0x15a), 'color:#000;'), _0x4b962c[_0x33e906(0x17f)]('text', _0x33e906(0x13b)), _0x4b962c[_0x33e906(0x17f)]('text', _0x33e906(0x11c) + _0x4f0917[_0x4d1e22][_0x33e906(0x121)]); if (!_0x4f0917[_0x4d1e22][_0x33e906(0x190)][_0x33e906(0x18f)]) { var _0x43184a = document[_0x33e906(0x184)](_0x33e906(0x155)); _0x43184a[_0x33e906(0x17f)](_0x33e906(0x164), _0x33e906(0x117)), _0x43184a[_0x33e906(0x17f)](_0x33e906(0x15a), _0x33e906(0x16c)), _0x43184a[_0x33e906(0x17f)](_0x33e906(0x15a), _0x33e906(0x153)), _0x43184a[_0x33e906(0x17f)](_0x33e906(0x15a), _0x33e906(0x178)), _0x43184a['setAttribute'](_0x33e906(0x15a), _0x33e906(0x11c) + _0x4f0917[_0x4d1e22][_0x33e906(0x190)][_0x33e906(0x149)]), _0x50a90c[_0x33e906(0x150)](_0x43184a); } _0x50a90c['appendChild'](_0x4b962c), _0x5f1caf[_0x33e906(0x150)](_0x50a90c); } } function agregarAlertasHexagonales(_0x4d9844) { var _0x8a67b1 = _0x3bb693, _0x6858be = ''; comparacion && (_0x6858be = '2'); for (var _0x130865 = 0x0; _0x130865 < _0x4d9844[_0x8a67b1(0x194)]; _0x130865++) { if (_0x4d9844[_0x130865][_0x8a67b1(0x130)][_0x8a67b1(0x121)] == _0x8a67b1(0x15d)) { var _0x9f7889 = document[_0x8a67b1(0x16b)](_0x8a67b1(0x146) + _0x6858be); _0x9f7889[_0x8a67b1(0x17f)](_0x8a67b1(0x18d), !![]), _0x6858be == '' ? (porcentualSodio = _0x8a67b1(0x132) + _0x4d9844[_0x130865]['ValorDiferencial'][_0x8a67b1(0x118)](0x0) + '%', valorCriticoSodio = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealSodio = _0x4d9844[_0x130865][_0x8a67b1(0x14a)]) : (porcentualSodio2 = _0x8a67b1(0x132) + _0x4d9844[_0x130865][_0x8a67b1(0x145)][_0x8a67b1(0x118)](0x0) + '%', valorCriticoSodio2 = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealSodio2 = _0x4d9844[_0x130865][_0x8a67b1(0x14a)]); } if (_0x4d9844[_0x130865][_0x8a67b1(0x130)][_0x8a67b1(0x121)] == 'Exceso\x20en\x20grasas\x20saturadas') { var _0x3e472f = document['querySelector'](_0x8a67b1(0x128) + _0x6858be); _0x3e472f[_0x8a67b1(0x17f)](_0x8a67b1(0x18d), !![]), _0x6858be == '' ? (valorCriticoGrasasSaturadas = _0x4d9844[_0x130865]['ValorCritico'], valorRealGrasasSaturadas = _0x4d9844[_0x130865]['ValorReal'], porcentualGrasasSaturadas = _0x8a67b1(0x140) + _0x4d9844[_0x130865]['ValorDiferencial'][_0x8a67b1(0x118)](0x0) + '%') : (valorCriticoGrasasSaturadas2 = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealGrasasSaturadas2 = _0x4d9844[_0x130865]['ValorReal'], porcentualGrasasSaturadas2 = 'Grasas\x20saturadas\x20excedidas\x20en\x20' + _0x4d9844[_0x130865][_0x8a67b1(0x145)][_0x8a67b1(0x118)](0x0) + '%'); } if (_0x4d9844[_0x130865][_0x8a67b1(0x130)][_0x8a67b1(0x121)] == _0x8a67b1(0x125)) { var _0x41d613 = document[_0x8a67b1(0x16b)](_0x8a67b1(0x165) + _0x6858be); _0x41d613['setAttribute']('visible', !![]), _0x6858be == '' ? (valorCriticoGrasasTotales = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealGrasasTotales = _0x4d9844[_0x130865][_0x8a67b1(0x14a)], porcentualGrasasTotales = _0x8a67b1(0x168) + _0x4d9844[_0x130865][_0x8a67b1(0x145)][_0x8a67b1(0x118)](0x0) + '%') : (valorCriticoGrasasTotales2 = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealGrasasTotales2 = _0x4d9844[_0x130865]['ValorReal'], porcentualGrasasTotales2 = _0x8a67b1(0x168) + _0x4d9844[_0x130865][_0x8a67b1(0x145)][_0x8a67b1(0x118)](0x0) + '%'); } if (_0x4d9844[_0x130865][_0x8a67b1(0x130)][_0x8a67b1(0x121)] == _0x8a67b1(0x161)) { var _0x581cb5 = document['querySelector']('#entHexagonoCalorias' + _0x6858be); _0x581cb5['setAttribute'](_0x8a67b1(0x18d), !![]), _0x6858be == '' ? (porcentualCalorias = 'Calorias\x20excedidas\x20en\x20' + _0x4d9844[_0x130865][_0x8a67b1(0x145)]['toFixed'](0x0) + '%', valorCriticoCalorias = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealCalorias = _0x4d9844[_0x130865]['ValorReal']) : (porcentualCalorias2 = _0x8a67b1(0x133) + _0x4d9844[_0x130865]['ValorDiferencial']['toFixed'](0x0) + '%', valorCriticoCalorias2 = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealCalorias2 = _0x4d9844[_0x130865][_0x8a67b1(0x14a)]); } if (_0x4d9844[_0x130865][_0x8a67b1(0x130)]['Leyenda'] == _0x8a67b1(0x18e)) { var _0xa0b9ad = document['querySelector']('#entHexagonoAzucares' + _0x6858be); _0xa0b9ad[_0x8a67b1(0x17f)](_0x8a67b1(0x18d), !![]), _0x6858be == '' ? (porcentualAzucares = 'Azucares\x20excedidos\x20en\x20' + _0x4d9844[_0x130865][_0x8a67b1(0x145)][_0x8a67b1(0x118)](0x0) + '%', valorCriticoAzucares = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealAzucares = _0x4d9844[_0x130865][_0x8a67b1(0x14a)]) : (porcentualAzucares2 = 'Azucares\x20excedidos\x20en\x20' + _0x4d9844[_0x130865]['ValorDiferencial'][_0x8a67b1(0x118)](0x0) + '%', valorCriticoAzucares2 = _0x4d9844[_0x130865][_0x8a67b1(0x11d)], valorRealAzucares2 = _0x4d9844[_0x130865][_0x8a67b1(0x14a)]); } } } function setearInfoNutriente(_0x593c52, _0x4dc4b3) { var _0x8b3c9d = _0x3bb693, _0x1ee5e0 = document[_0x8b3c9d(0x16b)]('#' + _0x593c52); _0x1ee5e0[_0x8b3c9d(0x17f)]('text', 'value:' + _0x4dc4b3); } function agregarInfoNutrientes(_0x32458e) { var _0x5880e5 = _0x3bb693, _0x48e6d7 = ''; comparacion && (_0x48e6d7 = '2'); var _0x1f81c2 = _0x32458e[_0x5880e5(0x15c)][_0x5880e5(0x14f)](_0x3edf31 => _0x3edf31['Nutriente']); if (_0x32458e[_0x5880e5(0x149)][_0x5880e5(0x194)] <= 0x19) setearInfoNutriente('nombre_producto' + _0x48e6d7, _0x32458e[_0x5880e5(0x149)]); else { var _0x29dd15 = _0x32458e['Nombre'][_0x5880e5(0x143)](0x0, 0x18) + '\x0a' + _0x32458e[_0x5880e5(0x149)][_0x5880e5(0x143)](0x18); setearInfoNutriente('nombre_producto' + _0x48e6d7, _0x29dd15); } setearInfoNutriente(_0x5880e5(0x142) + _0x48e6d7, 'Porcion:\x20' + _0x32458e['PorcionText']), setearInfoNutriente(_0x5880e5(0x131) + _0x48e6d7, _0x32458e['ValorEnergetico']), setearInfoNutriente(_0x5880e5(0x13c) + _0x48e6d7, _0x1f81c2[_0x5880e5(0x12f)](_0x209fa5 => _0x209fa5[_0x5880e5(0x149)] === _0x5880e5(0x193))[_0x5880e5(0x11a)] + _0x5880e5(0x151)), setearInfoNutriente(_0x5880e5(0x138) + _0x48e6d7, _0x1f81c2[_0x5880e5(0x12f)](_0x19ea4a => _0x19ea4a[_0x5880e5(0x149)] === 'Carbohidratos')['CantidadPorPorcion'] + _0x5880e5(0x115)), setearInfoNutriente(_0x5880e5(0x129) + _0x48e6d7, _0x1f81c2['find'](_0x2c95a2 => _0x2c95a2[_0x5880e5(0x149)] === _0x5880e5(0x135))[_0x5880e5(0x11a)] + _0x5880e5(0x144)), setearInfoNutriente(_0x5880e5(0x14e) + _0x48e6d7, _0x1f81c2[_0x5880e5(0x12f)](_0x568943 => _0x568943[_0x5880e5(0x149)] === 'Fibra')[_0x5880e5(0x11a)] + 'g\x20Fibra'), setearInfoNutriente(_0x5880e5(0x137) + _0x48e6d7, _0x1f81c2[_0x5880e5(0x12f)](_0x361ddc => _0x361ddc[_0x5880e5(0x149)] === _0x5880e5(0x116))[_0x5880e5(0x11a)] + _0x5880e5(0x11b)), setearInfoNutriente(_0x5880e5(0x185) + _0x48e6d7, _0x1f81c2['find'](_0x1845f6 => _0x1845f6[_0x5880e5(0x149)] === _0x5880e5(0x15e))[_0x5880e5(0x11a)] + _0x5880e5(0x16d)); } function agregarInfoIngredientes(_0x5658ed) { var _0x40cbd5 = _0x3bb693, _0x4f5063 = _0x5658ed['replace'](/;/g, ',')[_0x40cbd5(0x163)](_0x40cbd5(0x12b)); if (comparacion) { var _0x1afe12 = document[_0x40cbd5(0x16b)]('#ingredientes2'); _0x1afe12[_0x40cbd5(0x17f)](_0x40cbd5(0x15a), _0x40cbd5(0x188) + _0x4f5063); return; } var _0x1dbfd3 = document[_0x40cbd5(0x16b)](_0x40cbd5(0x192)); _0x1dbfd3['setAttribute']('text', _0x40cbd5(0x188) + _0x4f5063); } function activarComparacion() { comparacion = !comparacion; } function volverAlSitio() { var _0x64a3a4 = _0x3bb693; location[_0x64a3a4(0x156)] = _0x64a3a4(0x127); } function _0x17bc(_0x225aa9, _0x19fa97) { var _0x1922a3 = _0x1922(); return _0x17bc = function (_0x17bc86, _0x5330e8) { _0x17bc86 = _0x17bc86 - 0x114; var _0xbdfce7 = _0x1922a3[_0x17bc86]; return _0xbdfce7; }, _0x17bc(_0x225aa9, _0x19fa97); } function limpiarHexagonos(_0x23cf61) { var _0x5565ab = _0x3bb693, _0x4d31e0 = document['querySelector'](_0x5565ab(0x146) + _0x23cf61); _0x4d31e0[_0x5565ab(0x17f)](_0x5565ab(0x18d), ![]); var _0x33181e = document[_0x5565ab(0x16b)](_0x5565ab(0x128) + _0x23cf61); _0x33181e['setAttribute'](_0x5565ab(0x18d), ![]); var _0x228af4 = document[_0x5565ab(0x16b)](_0x5565ab(0x165) + _0x23cf61); _0x228af4[_0x5565ab(0x17f)](_0x5565ab(0x18d), ![]); var _0x4cf686 = document[_0x5565ab(0x16b)](_0x5565ab(0x189) + _0x23cf61); _0x4cf686[_0x5565ab(0x17f)]('visible', ![]); var _0x4e4a39 = document['querySelector']('#entHexagonoAzucares' + _0x23cf61); _0x4e4a39['setAttribute'](_0x5565ab(0x18d), ![]); }
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
            <img id="img_fondo" crossorigin="anonymous" src="./images/fondo.png" />

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
        <a-box  width="1.2" opacity="0.5" height="1.45" depth="0.01"
            position="0.85 1.648 -3"
            rotation="0 -20 0"
            material="shader: flat; src: #img_fondo;"
            visible="false" id="boxDerecha">

            <%--<a-entity id="grafico" position="-4 -2.5 -20" rotation="20 45 100" charts="type: pie; pie_radius: 1; dataPoints: ./dataPie.json; pie_doughnut: false; "></a-entity>--%>
            <a-entity id="nombre_producto" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;"></a-entity>
            <a-entity id="calorias_producto" position="-0.4 0.23 0.1" text="font: exo2bold; color:#000; align:center; width:2.5;"></a-entity>
            <a-entity                        position="0.2 0.2 0.1" text="font:exo2bold; color:#000; value:kcal/porcion; align:left; width:1;"></a-entity>
            <a-entity id="porcion_producto" position="0.23 0.14 0.1" text="font:exo2bold; color:#757575; align:left; width:0.8;"></a-entity>
            <a-entity id="porcentaje_azucares" position="0.8 0 0.1" text="font: exo2semibold; width:1.7; color: #000;"></a-entity>
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

            <a-box id="alertasInferioresDerechas" width="0.0001" height="0.0001"></a-box>

            <a-entity id="valor_limite_excedido" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black;value:; width:3;" visible="false">
            </a-entity>
        </a-box>

        <!-- PANEL IZQUIERDO -->
        <a-box opacity="0.5" width="1.2" height="1.45" depth="0.01"
            position="-0.85 1.648 -3"
            rotation="0 20 0"
            material="shader: flat; src: #img_fondo;"
            visible="false"
            id="boxIzquierda">

            <a-entity id="nombre_producto2" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;  value:"></a-entity>
            <a-entity id="calorias_producto2" position="-0.4 0.23 0.1" text=" font: exo2bold; color:#000; align:center; width:2.5; value:"></a-entity>
            <a-entity                        position="0.2 0.2 0.1" text=" font: exo2bold; color:#000; value:kcal/porcion; align:left; width:1;"></a-entity>
            <a-entity id="porcion_producto2" position="0.23 0.14 0.1" text=" font: exo2bold; color:#757575; align:left; width:0.8; value:"></a-entity>
            <a-entity id="porcentaje_azucares2" position="0.75 0 0.1" text="font: exo2semibold; width:1.7; color: #000; value:"></a-entity>
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

            <a-box id="alertasInferioresIzquierdas" width="0.0001" height="0.0001"></a-box>

            <a-entity id="valor_limite_excedido2" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black; width:3;" visible="false">
            </a-entity>
        </a-box>
        <a-box opacity="0.75" color="#fff" width="3.7" height="2.8" depth="0.01"
            id="boxDerechoIngredientes"
            visible="false"
            position="3.6 1.4 -3"
            rotation="0 -40 0"
            text="align: center;color: white;">
            <a-entity id="ingredientes" position="0 -0.1 0.1" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes" position="0.5 1.2 0.2" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
        <a-box opacity="0.75" color="#fff" width="3.7" height="2.8" depth="0.01"
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
