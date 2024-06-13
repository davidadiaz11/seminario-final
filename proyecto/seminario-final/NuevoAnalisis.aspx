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
    var _0x5781e6=_0x9ae0;(function(_0x99357a,_0x1a0d4e){var _0x4877c8=_0x9ae0,_0x4cf583=_0x99357a();while(!![]){try{var _0x5b4712=parseInt(_0x4877c8(0x21b))/0x1+parseInt(_0x4877c8(0x236))/0x2+parseInt(_0x4877c8(0x1f3))/0x3+parseInt(_0x4877c8(0x222))/0x4*(parseInt(_0x4877c8(0x260))/0x5)+-parseInt(_0x4877c8(0x24e))/0x6*(parseInt(_0x4877c8(0x204))/0x7)+parseInt(_0x4877c8(0x207))/0x8+-parseInt(_0x4877c8(0x22f))/0x9;if(_0x5b4712===_0x1a0d4e)break;else _0x4cf583['push'](_0x4cf583['shift']());}catch(_0x23b5d5){_0x4cf583['push'](_0x4cf583['shift']());}}}(_0x31f4,0xac268));function _0x31f4(){var _0x11543b=['NuevoAnalisis.aspx/GuardarAnalisis','true','width','TipoAlerta','Azúcares\x20añadidos','hover_exceso_grasas_saturadas','#boxLineaNegra','Error\x20al\x20guardar\x20análisis','ValorDiferencial','15uQyfsM','CantidadPorPorcion','value:\x20','Carbohidratos','\x20-0.7\x200.1','ValorEnergetico','Nombre','Error\x20al\x20guardar\x20análisis:\x20','Fibra','style','setAttribute','#ingredientes','Sodio\x20excedido\x20en\x20','hover_exceso_azucares','0.2','3319065PsaYOW','nombre_producto','opacity','g\x20Sodio','IngredientesAlertas','replace','Azucares\x20excedidos\x20en\x20','btnLimpiar','0.001','Exceso\x20en\x20azucares','height','porcentaje_grasas_totales','stringify','#ingredientes2','#boxIzquierda','color','EsPrincipal','7KIYtrB','fail','markerhandler','5925528MLrLTL','addEventListener','porcentaje_proteinas','ValorReal','application/json;\x20charset=utf-8','ajax','\x20kcal/porcion','porcentaje_sodio','filter','depth','mouseenter','Perfil','#boxDerecha','EsGenerica','ValorCritico','#valor_limite_excedido2','Inicio','NFD','#valor_limite_excedido','Alerta','1229789ScIyey','g\x20Fibra','Sodio','registerComponent','createElement','#nombre_producto','g\x20Grasas','574436MHDtIf','display:show','done','NutrientesProducto','porcentaje_fibra','divComparar','#boxIzquierdoIngredientes','0.15','markerFound','visible','display:block','Exceso\x20en\x20sodio','porcentaje_carbohidratos','34163568aUNNTH','#boxDerechoIngredientes','text','hover_exceso_calorias','appendChild','find','map','2816050ZFQYqO','#entHexagonoGrasasSaturadas','hover_exceso_sodio','porcenaje_azucares','getElementById','calorias_producto','href','NuevoAnalisis.aspx/ObtenerAlertasPorProducto','0.4\x200.04\x200.1','log','toFixed','font:\x20exo2bold;','Grasas\x20totales','a-box','Proteínas','color:#000;','g\x20Azucares','substring','position','display:none','#entHexagonoCalorias','-0.1\x200.1\x200.1','value:','a-entity','2487642gSbIpV','hover_exceso_grasas_saturadas2','Ingredientes','Leyenda','length','innerHTML','querySelector','#entInicio','width:1.8;'];_0x31f4=function(){return _0x11543b;};return _0x31f4();}var buscando=![],comparacion=![],nutrientes=['porcenaje_azucares',_0x5781e6(0x22e),_0x5781e6(0x226),'porcentaje_proteinas',_0x5781e6(0x1fe),_0x5781e6(0x20e)],sumatoriaAlertas=0x1,porcentualCalorias='',porcentualAzucares='',porcentualGrasasSaturadas='',porcentualGrasasTotales='',porcentualSodio='',valorRealPrueba=0x0,valorCriticoPrueba=0x0,valorRealAzucarPrueba=0x0,valorCriticoAzucarPrueba=0x0;AFRAME[_0x5781e6(0x21e)](_0x5781e6(0x206),{'init':function(){var _0x38208b=_0x5781e6;this['el']['sceneEl'][_0x38208b(0x208)](_0x38208b(0x22a),_0x3a9e78=>{if(!comparacion){}const _0x1bc513=_0x3a9e78['target']['id'];iniciarPreloader(),buscarProducto(_0x1bc513);});}}),AFRAME['registerComponent'](_0x5781e6(0x232),{'init':function(){var _0x229c60=_0x5781e6,_0x66621b=document[_0x229c60(0x254)](_0x229c60(0x219));this['el']['addEventListener'](_0x229c60(0x211),_0x4d6661=>{var _0x174732=_0x229c60;_0x66621b[_0x174732(0x26a)](_0x174732(0x231),_0x174732(0x24c)+porcentualCalorias),_0x66621b[_0x174732(0x26a)]('visible','true'),ubicarLineasPorcentuales(valorCriticoPrueba,valorRealPrueba,!![]);});}}),AFRAME[_0x5781e6(0x21e)]('hover_exceso_calorias2',{'init':function(){var _0x5828f4=_0x5781e6,_0x34d42d=document[_0x5828f4(0x254)]('#valor_limite_excedido2');this['el']['addEventListener'](_0x5828f4(0x211),_0x3e39b1=>{var _0x310abd=_0x5828f4;_0x34d42d['setAttribute'](_0x310abd(0x231),_0x310abd(0x24c)+porcentualCalorias),_0x34d42d[_0x310abd(0x26a)](_0x310abd(0x22b),_0x310abd(0x258)),ubicarLineasPorcentuales(valorCriticoPrueba,valorRealPrueba,![]);});}}),AFRAME[_0x5781e6(0x21e)](_0x5781e6(0x238),{'init':function(){var _0x33f79f=_0x5781e6,_0x4cb8df=document[_0x33f79f(0x254)](_0x33f79f(0x219));this['el'][_0x33f79f(0x208)]('mouseenter',_0x10b536=>{var _0x27e6e2=_0x33f79f;_0x4cb8df['setAttribute'](_0x27e6e2(0x231),_0x27e6e2(0x24c)+porcentualSodio),_0x4cb8df[_0x27e6e2(0x26a)](_0x27e6e2(0x22b),'true'),ubicarLineasPorcentuales(valorCriticoPrueba,valorRealPrueba,!![]);});}}),AFRAME[_0x5781e6(0x21e)]('hover_exceso_sodio2',{'init':function(){var _0x2ee268=_0x5781e6,_0x337dc1=document['querySelector'](_0x2ee268(0x216));this['el'][_0x2ee268(0x208)](_0x2ee268(0x211),_0x1a7487=>{var _0x3d9f29=_0x2ee268;_0x337dc1['setAttribute'](_0x3d9f29(0x231),_0x3d9f29(0x24c)+porcentualSodio),_0x337dc1['setAttribute'](_0x3d9f29(0x22b),_0x3d9f29(0x258)),ubicarLineasPorcentuales(valorCriticoPrueba,valorRealPrueba,![]);});}}),AFRAME[_0x5781e6(0x21e)](_0x5781e6(0x25c),{'init':function(){var _0x2d8506=_0x5781e6,_0x2c5946=document[_0x2d8506(0x254)]('#valor_limite_excedido');this['el'][_0x2d8506(0x208)](_0x2d8506(0x211),_0x5d79b2=>{var _0x4948af=_0x2d8506;_0x2c5946[_0x4948af(0x26a)](_0x4948af(0x231),_0x4948af(0x24c)+porcentualGrasasSaturadas),_0x2c5946[_0x4948af(0x26a)](_0x4948af(0x22b),'true'),ubicarLineasPorcentuales(valorCriticoPrueba,valorRealPrueba,!![]);});}}),AFRAME[_0x5781e6(0x21e)](_0x5781e6(0x24f),{'init':function(){var _0x3a0366=_0x5781e6,_0xf66ae3=document['querySelector'](_0x3a0366(0x216));this['el']['addEventListener'](_0x3a0366(0x211),_0x4715bf=>{var _0x48415d=_0x3a0366;_0xf66ae3[_0x48415d(0x26a)](_0x48415d(0x231),'value:'+porcentualGrasasSaturadas),_0xf66ae3[_0x48415d(0x26a)](_0x48415d(0x22b),_0x48415d(0x258)),ubicarLineasPorcentuales(valorCriticoPrueba,valorRealPrueba,![]);});}}),AFRAME[_0x5781e6(0x21e)](_0x5781e6(0x1f1),{'init':function(){var _0x241ce4=_0x5781e6,_0x4c6613=document['querySelector'](_0x241ce4(0x219));this['el']['addEventListener'](_0x241ce4(0x211),_0x54133d=>{var _0x2eb44c=_0x241ce4;_0x4c6613[_0x2eb44c(0x26a)](_0x2eb44c(0x231),_0x2eb44c(0x24c)+porcentualAzucares),_0x4c6613['setAttribute'](_0x2eb44c(0x22b),_0x2eb44c(0x258)),ubicarLineasPorcentuales(valorCriticoAzucarPrueba,valorRealAzucarPrueba,!![]);});}}),AFRAME[_0x5781e6(0x21e)]('hover_exceso_azucares2',{'init':function(){var _0x59d165=_0x5781e6,_0x44c96d=document[_0x59d165(0x254)](_0x59d165(0x216));this['el'][_0x59d165(0x208)](_0x59d165(0x211),_0x3fbcf2=>{var _0x392cc6=_0x59d165;_0x44c96d[_0x392cc6(0x26a)](_0x392cc6(0x231),_0x392cc6(0x24c)+porcentualAzucares),_0x44c96d[_0x392cc6(0x26a)]('visible',_0x392cc6(0x258)),ubicarLineasPorcentuales(valorCriticoAzucarPrueba,valorRealAzucarPrueba,![]);});}});function ubicarLineasPorcentuales(_0x2b6c4b,_0x3927e1,_0x243505){var _0x550cce=_0x5781e6,_0x353f9c='';!_0x243505&&(_0x353f9c='2');var _0x3e3372=(_0x2b6c4b/_0x3927e1)[_0x550cce(0x240)](0x2);;var _0x5c8c20=(0x1-_0x3e3372)['toFixed'](0x2);;if(+_0x5c8c20+ +_0x3e3372!==0x1)return;var _0xa2a4b=document[_0x550cce(0x254)](_0x550cce(0x25d)+_0x353f9c),_0x48ffad=document[_0x550cce(0x254)]('#boxLineaRoja'+_0x353f9c);_0xa2a4b[_0x550cce(0x26a)](_0x550cce(0x259),_0x3e3372),_0x48ffad[_0x550cce(0x26a)](_0x550cce(0x259),_0x5c8c20),_0xa2a4b[_0x550cce(0x26a)](_0x550cce(0x248),+_0x5c8c20*-0.5+_0x550cce(0x264)),_0x48ffad['setAttribute'](_0x550cce(0x248),+_0x3e3372*0.5+_0x550cce(0x264)),_0xa2a4b['setAttribute']('visible','true'),_0x48ffad[_0x550cce(0x26a)]('visible','true');}function iniciarPreloader(){var _0x36b3bc=_0x5781e6;document[_0x36b3bc(0x23a)]('overlay')[_0x36b3bc(0x269)]=_0x36b3bc(0x22c);}function ocultarPreloader(){var _0x13c8fc=_0x5781e6;document[_0x13c8fc(0x23a)]('overlay')[_0x13c8fc(0x269)]='display:none';}function limpiarPantalla(_0x431732){var _0x293e82=_0x5781e6;nutrientes['forEach'](_0x760d5d=>{var _0xd63143=_0x9ae0,_0xfba730=document['querySelector']('#'+_0x760d5d);_0xfba730[_0xd63143(0x26a)](_0xd63143(0x231),_0xd63143(0x24c));});var _0xc6c4cf=document[_0x293e82(0x254)](_0x293e82(0x220)),_0x4d8a30=document[_0x293e82(0x254)]('#nombre_producto2');_0xc6c4cf[_0x293e82(0x26a)](_0x293e82(0x231),_0x293e82(0x24c)),_0x4d8a30[_0x293e82(0x26a)](_0x293e82(0x231),'value:'),sumatoriaAlertas=0x1,document[_0x293e82(0x23a)](_0x293e82(0x1fa))['style']=_0x293e82(0x249),document[_0x293e82(0x23a)](_0x293e82(0x227))[_0x293e82(0x269)]=_0x293e82(0x249),comparacion=![],_0x431732[_0x293e82(0x253)]='';}function buscarProducto(_0x41daea){var _0x9021f4=_0x5781e6;ocultarImagenInicio();if(buscando)return;else buscando=!![];$[_0x9021f4(0x20c)]({'method':'POST','url':_0x9021f4(0x23d),'data':JSON[_0x9021f4(0x1ff)]({'idProducto':+_0x41daea}),'contentType':'application/json;\x20charset=utf-8'})['done'](function(_0x3a2005){var _0x4983eb=_0x9021f4;ocultarPreloader(),buscando=![];if(_0x3a2005['d']){console[_0x4983eb(0x23f)](_0x3a2005['d']);var _0xfa5e44=_0x3a2005['d']['NutrienteAlertas'],_0x1d0bf5=_0xfa5e44[_0x4983eb(0x20f)](_0x5402aa=>_0x5402aa[_0x4983eb(0x21a)]['TipoAlerta'][_0x4983eb(0x214)]===!![]),_0x1a5212=_0xfa5e44[_0x4983eb(0x20f)](_0x592647=>_0x592647[_0x4983eb(0x21a)][_0x4983eb(0x25a)][_0x4983eb(0x214)]===![]);agregarAlertasHexagonales(_0x1d0bf5),agregarAlerta(_0x1a5212),agregarAlertaIngredientes(_0x3a2005['d'][_0x4983eb(0x1f7)]),agregarInfoNutrientes(_0x3a2005['d']),agregarInfoIngredientes(_0x3a2005['d'][_0x4983eb(0x250)]),guardarAnalisis(_0x41daea),!comparacion?(habilitarPanelDerecho(),document[_0x4983eb(0x23a)](_0x4983eb(0x227))[_0x4983eb(0x269)]=_0x4983eb(0x223)):habilitarPanelIzquierdo();}document[_0x4983eb(0x23a)](_0x4983eb(0x1fa))[_0x4983eb(0x269)]=_0x4983eb(0x223);})[_0x9021f4(0x205)](function(_0x523a89){var _0x4e06f9=_0x9021f4;console[_0x4e06f9(0x23f)](_0x523a89),ocultarPreloader(),alert('Error\x20al\x20buscar\x20alertas');});}function ocultarImagenInicio(){var _0x4fff36=_0x5781e6,_0x5a5912=document[_0x4fff36(0x254)](_0x4fff36(0x255));_0x5a5912[_0x4fff36(0x26a)](_0x4fff36(0x22b),![]);}function habilitarPanelDerecho(){var _0xed64c4=_0x5781e6,_0x5bfb50=document[_0xed64c4(0x254)]('#boxDerecha');_0x5bfb50[_0xed64c4(0x26a)](_0xed64c4(0x22b),!![]);var _0x9662d0=document['querySelector'](_0xed64c4(0x230));_0x9662d0[_0xed64c4(0x26a)]('visible',!![]);}function habilitarPanelIzquierdo(){var _0x393af5=_0x5781e6,_0x4b1b90=document[_0x393af5(0x254)]('#boxIzquierda');_0x4b1b90[_0x393af5(0x26a)](_0x393af5(0x22b),!![]);var _0x10b093=document[_0x393af5(0x254)](_0x393af5(0x228));_0x10b093[_0x393af5(0x26a)](_0x393af5(0x22b),!![]);}function guardarAnalisis(_0x50e264){var _0x5be5f6=_0x5781e6;$['ajax']({'method':'POST','url':_0x5be5f6(0x257),'data':JSON[_0x5be5f6(0x1ff)]({'idProducto':+_0x50e264}),'contentType':_0x5be5f6(0x20b)})[_0x5be5f6(0x224)](function(){})[_0x5be5f6(0x205)](function(_0x26e392){var _0x561fd7=_0x5be5f6;console[_0x561fd7(0x23f)](_0x561fd7(0x267),_0x26e392),alert(_0x561fd7(0x25e));});}function agregarAlerta(_0x22f79a){var _0x53959a=_0x5781e6,_0x504527=document['querySelector']('#boxDerecha');comparacion&&(_0x504527=document[_0x53959a(0x254)](_0x53959a(0x201)),sumatoriaAlertas=0x1);for(var _0x5be292=0x0;_0x5be292<_0x22f79a[_0x53959a(0x252)];_0x5be292++){var _0x43dfee=document['createElement'](_0x53959a(0x24d));_0x43dfee[_0x53959a(0x26a)](_0x53959a(0x248),_0x53959a(0x23e)),_0x43dfee['setAttribute']('text','font:\x20exo2bold;'),_0x43dfee[_0x53959a(0x26a)](_0x53959a(0x231),'color:#000;'),_0x43dfee[_0x53959a(0x26a)](_0x53959a(0x231),'width:1.8;'),_0x43dfee[_0x53959a(0x26a)](_0x53959a(0x231),_0x53959a(0x24c)+_0x22f79a[_0x5be292][_0x53959a(0x21a)][_0x53959a(0x251)]);var _0x13c997=document['createElement'](_0x53959a(0x243));_0x13c997[_0x53959a(0x26a)](_0x53959a(0x202),'#'+_0x22f79a[_0x5be292][_0x53959a(0x21a)][_0x53959a(0x25a)]['Color']['CodigoHexadecimal']),_0x13c997[_0x53959a(0x26a)](_0x53959a(0x259),'1.2'),_0x13c997[_0x53959a(0x26a)](_0x53959a(0x210),_0x53959a(0x1fb)),_0x13c997['setAttribute'](_0x53959a(0x1fd),_0x53959a(0x229)),_0x13c997[_0x53959a(0x26a)](_0x53959a(0x1f5),'0.2'),_0x13c997[_0x53959a(0x26a)]('position','0\x20'+(-0.2*sumatoriaAlertas-1.1)+'\x200'),_0x13c997[_0x53959a(0x233)](_0x43dfee),_0x504527[_0x53959a(0x233)](_0x13c997),sumatoriaAlertas=sumatoriaAlertas+0x1;}}function agregarAlertaIngredientes(_0x2ca5d4){var _0x49bf7d=_0x5781e6,_0x11f84a=document[_0x49bf7d(0x254)](_0x49bf7d(0x213));comparacion&&(_0x11f84a=document['querySelector'](_0x49bf7d(0x201)));for(var _0x3fa6fe=0x0;_0x3fa6fe<_0x2ca5d4[_0x49bf7d(0x252)];_0x3fa6fe++){var _0x158d7d=document[_0x49bf7d(0x21f)](_0x49bf7d(0x243));_0x158d7d[_0x49bf7d(0x26a)]('color','red'),_0x158d7d[_0x49bf7d(0x26a)](_0x49bf7d(0x259),'1.2'),_0x158d7d['setAttribute'](_0x49bf7d(0x210),'0.001'),_0x158d7d['setAttribute']('height',_0x49bf7d(0x229)),_0x158d7d[_0x49bf7d(0x26a)](_0x49bf7d(0x1f5),_0x49bf7d(0x1f2)),_0x158d7d[_0x49bf7d(0x26a)]('position','0\x20'+(-0.2*sumatoriaAlertas-1.1)+'\x200'),sumatoriaAlertas=sumatoriaAlertas+0x1;var _0x5734f0=document['createElement'](_0x49bf7d(0x24d));_0x5734f0[_0x49bf7d(0x26a)]('position',_0x49bf7d(0x23e)),_0x5734f0['setAttribute'](_0x49bf7d(0x231),_0x49bf7d(0x241)),_0x5734f0['setAttribute'](_0x49bf7d(0x231),_0x49bf7d(0x245)),_0x5734f0[_0x49bf7d(0x26a)](_0x49bf7d(0x231),_0x49bf7d(0x256)),_0x5734f0['setAttribute']('text',_0x49bf7d(0x24c)+_0x2ca5d4[_0x3fa6fe][_0x49bf7d(0x251)]);if(!_0x2ca5d4[_0x3fa6fe][_0x49bf7d(0x212)][_0x49bf7d(0x203)]){var _0x5269f7=document['createElement'](_0x49bf7d(0x24d));_0x5269f7[_0x49bf7d(0x26a)](_0x49bf7d(0x248),_0x49bf7d(0x24b)),_0x5269f7['setAttribute'](_0x49bf7d(0x231),'font:\x20exo2bold;'),_0x5269f7['setAttribute'](_0x49bf7d(0x231),_0x49bf7d(0x245)),_0x5269f7[_0x49bf7d(0x26a)]('text','width:0.8;'),_0x5269f7['setAttribute']('text',_0x49bf7d(0x24c)+_0x2ca5d4[_0x3fa6fe][_0x49bf7d(0x212)][_0x49bf7d(0x266)]),_0x158d7d[_0x49bf7d(0x233)](_0x5269f7);}_0x158d7d['appendChild'](_0x5734f0),_0x11f84a[_0x49bf7d(0x233)](_0x158d7d);}}function agregarAlertasHexagonales(_0x40cc6){var _0x173aff=_0x5781e6,_0x20b102='';comparacion&&(_0x20b102='2');for(var _0x288a83=0x0;_0x288a83<_0x40cc6[_0x173aff(0x252)];_0x288a83++){if(_0x40cc6[_0x288a83][_0x173aff(0x21a)][_0x173aff(0x251)]==_0x173aff(0x22d)){var _0x20d2fe=document['querySelector']('#entHexagonoSodio'+_0x20b102);_0x20d2fe[_0x173aff(0x26a)](_0x173aff(0x22b),!![]),valorCriticoPrueba=_0x40cc6[_0x288a83][_0x173aff(0x215)],valorRealPrueba=_0x40cc6[_0x288a83][_0x173aff(0x20a)],porcentualSodio=_0x173aff(0x1f0)+_0x40cc6[_0x288a83][_0x173aff(0x25f)][_0x173aff(0x240)](0x0)+'%';}if(_0x40cc6[_0x288a83][_0x173aff(0x21a)][_0x173aff(0x251)]=='Exceso\x20en\x20grasas\x20saturadas'){var _0xa3b3c0=document[_0x173aff(0x254)](_0x173aff(0x237)+_0x20b102);_0xa3b3c0['setAttribute'](_0x173aff(0x22b),!![]),valorCriticoPrueba=_0x40cc6[_0x288a83][_0x173aff(0x215)],valorRealPrueba=_0x40cc6[_0x288a83]['ValorReal'],porcentualGrasasSaturadas='Grasas\x20saturadas\x20excedidas\x20en\x20'+_0x40cc6[_0x288a83]['ValorDiferencial'][_0x173aff(0x240)](0x0)+'%';}if(_0x40cc6[_0x288a83]['Alerta'][_0x173aff(0x251)]=='Exceso\x20en\x20calorias'){var _0x575d88=document[_0x173aff(0x254)](_0x173aff(0x24a)+_0x20b102);_0x575d88[_0x173aff(0x26a)](_0x173aff(0x22b),!![]),porcentualCalorias='Calorias\x20excedidas\x20en\x20'+_0x40cc6[_0x288a83]['ValorDiferencial'][_0x173aff(0x240)](0x0)+'%',valorCriticoPrueba=_0x40cc6[_0x288a83][_0x173aff(0x215)],valorRealPrueba=_0x40cc6[_0x288a83][_0x173aff(0x20a)];}if(_0x40cc6[_0x288a83][_0x173aff(0x21a)][_0x173aff(0x251)]==_0x173aff(0x1fc)){var _0x1242e3=document['querySelector']('#entHexagonoAzucares'+_0x20b102);_0x1242e3[_0x173aff(0x26a)](_0x173aff(0x22b),!![]),porcentualAzucares=_0x173aff(0x1f9)+_0x40cc6[_0x288a83][_0x173aff(0x25f)][_0x173aff(0x240)](0x0)+'%',valorCriticoAzucarPrueba=_0x40cc6[_0x288a83]['ValorCritico'],valorRealAzucarPrueba=_0x40cc6[_0x288a83][_0x173aff(0x20a)];}}}function setearInfoNutriente(_0x3eafc6,_0x4f1ed0){var _0x27e6c6=_0x5781e6,_0x2c5feb=document[_0x27e6c6(0x254)]('#'+_0x3eafc6);_0x2c5feb[_0x27e6c6(0x26a)]('text',_0x27e6c6(0x24c)+_0x4f1ed0);}function agregarInfoNutrientes(_0x3b886d){var _0x4e9cb3=_0x5781e6,_0x2bde50='';comparacion&&(_0x2bde50='2');var _0x27c2c9=_0x3b886d[_0x4e9cb3(0x225)][_0x4e9cb3(0x235)](_0x12c694=>_0x12c694['Nutriente']);if(_0x3b886d[_0x4e9cb3(0x266)][_0x4e9cb3(0x252)]<=0x19)setearInfoNutriente('nombre_producto'+_0x2bde50,_0x3b886d[_0x4e9cb3(0x266)]);else{var _0x7ba311=_0x3b886d['Nombre'][_0x4e9cb3(0x247)](0x0,0x18)+'\x0a'+_0x3b886d[_0x4e9cb3(0x266)]['substring'](0x18);setearInfoNutriente(_0x4e9cb3(0x1f4)+_0x2bde50,_0x7ba311);}setearInfoNutriente(_0x4e9cb3(0x23b)+_0x2bde50,_0x3b886d[_0x4e9cb3(0x265)]+_0x4e9cb3(0x20d)),setearInfoNutriente(_0x4e9cb3(0x239)+_0x2bde50,_0x27c2c9[_0x4e9cb3(0x234)](_0x3b15f0=>_0x3b15f0[_0x4e9cb3(0x266)]===_0x4e9cb3(0x25b))[_0x4e9cb3(0x261)]+_0x4e9cb3(0x246)),setearInfoNutriente(_0x4e9cb3(0x22e)+_0x2bde50,_0x27c2c9['find'](_0x2666d7=>_0x2666d7[_0x4e9cb3(0x266)]===_0x4e9cb3(0x263))[_0x4e9cb3(0x261)]+'g\x20Carbohidratos'),setearInfoNutriente(_0x4e9cb3(0x209)+_0x2bde50,_0x27c2c9['find'](_0x284d2d=>_0x284d2d[_0x4e9cb3(0x266)]===_0x4e9cb3(0x244))[_0x4e9cb3(0x261)]+'g\x20Proteinas'),setearInfoNutriente(_0x4e9cb3(0x226)+_0x2bde50,_0x27c2c9[_0x4e9cb3(0x234)](_0x4288e8=>_0x4288e8[_0x4e9cb3(0x266)]===_0x4e9cb3(0x268))[_0x4e9cb3(0x261)]+_0x4e9cb3(0x21c)),setearInfoNutriente('porcentaje_grasas_totales'+_0x2bde50,_0x27c2c9[_0x4e9cb3(0x234)](_0x5a4497=>_0x5a4497[_0x4e9cb3(0x266)]===_0x4e9cb3(0x242))['CantidadPorPorcion']+_0x4e9cb3(0x221)),setearInfoNutriente('porcentaje_sodio'+_0x2bde50,_0x27c2c9['find'](_0x40e5dc=>_0x40e5dc['Nombre']===_0x4e9cb3(0x21d))[_0x4e9cb3(0x261)]+_0x4e9cb3(0x1f6));}function agregarInfoIngredientes(_0x5e4a2c){var _0x290509=_0x5781e6,_0x5612c1=_0x5e4a2c[_0x290509(0x1f8)](/;/g,',')['normalize'](_0x290509(0x218));if(comparacion){var _0x5f5afa=document[_0x290509(0x254)](_0x290509(0x200));_0x5f5afa['setAttribute'](_0x290509(0x231),_0x290509(0x262)+_0x5612c1);return;}var _0x297b8d=document[_0x290509(0x254)](_0x290509(0x26b));_0x297b8d[_0x290509(0x26a)]('text',_0x290509(0x262)+_0x5612c1);}function activarComparacion(){comparacion=!comparacion;}function _0x9ae0(_0xd35225,_0x330eb8){var _0x31f46a=_0x31f4();return _0x9ae0=function(_0x9ae0ac,_0x3a4f2f){_0x9ae0ac=_0x9ae0ac-0x1f0;var _0x71d440=_0x31f46a[_0x9ae0ac];return _0x71d440;},_0x9ae0(_0xd35225,_0x330eb8);}function volverAlSitio(){var _0x142826=_0x5781e6;location[_0x142826(0x23c)]=_0x142826(0x217);}
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
            <a-entity id="ingredientes" position="0 -0.1 0" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes" position="0.5 1.2 0" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
        <a-box opacity="0.15" color="#000" width="3.7" height="2.8" depth="0.00000001"
            id="boxIzquierdoIngredientes"
            visible="false"
            position="-3.6 1.4 -3"
            rotation="0 40 0"
            text="align: center;color: white; value:">
            <a-entity id="ingredientes2" position="0 -0.1 0" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes2" position="0.5 1.2 0" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
    </a-scene>
</body>
