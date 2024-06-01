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
    var buscando = false;
    var comparacion = false;
    var nutrientes = ['porcenaje_azucares', 'porcentaje_carbohidratos', 'porcentaje_fibra', 'porcentaje_proteinas', 'porcentaje_grasas_totales', 'porcentaje_sodio']

    var sumatoriaAlertas = 1;

    var porcentualCalorias = "";
    var porcentualAzucares = "";
    var porcentualGrasasSaturadas = "";
    var porcentualGrasasTotales = "";
    var porcentualSodio = "";

    var valorRealPrueba = 0;
    var valorCriticoPrueba = 0;

    var valorRealAzucarPrueba = 0;
    var valorCriticoAzucarPrueba = 0;

    AFRAME.registerComponent('markerhandler', {
        init: function () {
            this.el.sceneEl.addEventListener('markerFound', (value) => {
                if (!comparacion) {
                    // limpiarPantalla(this.el);
                }
                const idClickeado = value.target.id;
                iniciarPreloader();
                buscarProducto(this.el, idClickeado);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_calorias', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualCalorias);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba);
            })
            //this.el.addEventListener('mouseleave', (e) => {

            //    // valor_limite_excedido.setAttribute('visible', 'false');
            //})
        }
    });


    AFRAME.registerComponent('hover_exceso_sodio', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
            this.el.addEventListener('mouseenter', (e) => {

                valor_limite_excedido.setAttribute('text', 'value:' + porcentualSodio);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba);
            })
            //this.el.addEventListener('mouseleave', (e) => {
            //    // valor_limite_excedido.setAttribute('visible', 'false');
            //})
        }
    });



    AFRAME.registerComponent('hover_exceso_grasas_saturadas', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");

            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualGrasasSaturadas);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoPrueba, valorRealPrueba);
            })
            //this.el.addEventListener('mouseleave', (e) => {
            //    // valor_limite_excedido.setAttribute('visible', 'false');
            //})
        }
    });

    function ubicarLineasPorcentuales(valorCritico, valorReal) {

        //hacer el calculo de qué porcentaje representa cada uno
        var porcentajeCritico = ((valorCritico) / valorReal).toFixed(2);;

        var porcentajeReal = (1 - porcentajeCritico).toFixed(2);;


        if (+porcentajeReal + +porcentajeCritico !== 1) {
            return;
        }

        var boxLineaNegra = document.querySelector("#boxLineaNegra");
        var boxLineaRoja = document.querySelector("#boxLineaRoja");

        boxLineaNegra.setAttribute('width', porcentajeCritico);
        boxLineaRoja.setAttribute('width', porcentajeReal);

        boxLineaNegra.setAttribute('position', (+porcentajeReal * (-0.5)) + " -0.7 0.1");
        boxLineaRoja.setAttribute('position', (+porcentajeCritico * 0.5) + " -0.7 0.1");
        boxLineaNegra.setAttribute('visible', 'true');
        boxLineaRoja.setAttribute('visible', 'true');
    }

    AFRAME.registerComponent('hover_exceso_azucares', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
            this.el.addEventListener('mouseenter', (e) => {

                valor_limite_excedido.setAttribute('text', 'value:' + porcentualAzucares);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoAzucarPrueba, valorRealAzucarPrueba);
            })
            //this.el.addEventListener('mouseleave', (e) => {
            //    // valor_limite_excedido.setAttribute('visible', 'false');
            //})
        }
    });

    function iniciarPreloader() {
        document.getElementById("overlay").style = "display:block";
    }
    function ocultarPreloader() {
        document.getElementById("overlay").style = "display:none";
    }

    function limpiarPantalla(marker) {
        nutrientes.forEach(x => {
            var elemento = document.querySelector('#' + x);
            elemento.setAttribute("text", "value:");
        })

        //var grafico = document.querySelector('#grafico');
        //grafico.setAttribute("visible", false);

        var nombre_producto1 = document.querySelector('#nombre_producto');
        var nombre_producto2 = document.querySelector('#nombre_producto2');
        nombre_producto1.setAttribute("text", "value:");
        nombre_producto2.setAttribute("text", "value:");

        document.getElementById("btnLimpiar").style = "display:none";
        document.getElementById("divComparar").style = "display:none";

        comparacion = false;
        marker.innerHTML = '';
    }

    function buscarProducto(elem, idClickeado) {
        ocultarImagenInicio();

        if (buscando) {
            return;
        } else {
            buscando = true;
        }
        $.ajax({
            method: "POST",
            url: "AnalisisNuevo.aspx/ObtenerAlertasPorProducto",
            data: JSON.stringify({
                idProducto: +idClickeado
            }),
            contentType: "application/json; charset=utf-8"
        }).done(function (response) {
            ocultarPreloader();
            buscando = false;

            if (response.d) {
                console.log(response.d)
                //var alertas = response.d.NutrientesProducto.filter(x => x.Nutriente.NutrientesAlerta != null).map(a => a.Nutriente.NutrientesAlerta[0].Alerta);
                var alertas = response.d.NutrienteAlertas;
                var alertasHexagonales = alertas.filter(x => x.Alerta.TipoAlerta.EsGenerica === true);
                var alertasPersonalizadas = alertas.filter(x => x.Alerta.TipoAlerta.EsGenerica === false);



                agregarAlertasHexagonales(alertasHexagonales);
                agregarAlerta(alertasPersonalizadas);
                agregarAlertaIngredientes(response.d.IngredientesAlertas)
                //agregarGraficoPorcentual();
                agregarInfoNutrientes(response.d);
                agregarInfoIngredientes(response.d.Ingredientes);

                guardarAnalisis(idClickeado);

                if (!comparacion) {
                    habilitarPanelDerecho()
                    document.getElementById("divComparar").style = "display:show";
                } else {
                    habilitarPanelIzquierdo()
                }
            }

            document.getElementById("btnLimpiar").style = "display:show";
        }).fail(function (msg) {
            console.log(msg)
            ocultarPreloader();
            alert('Error al buscar alertas')
        });
    }

    function ocultarImagenInicio() {
        var entInicio = document.querySelector('#entInicio');
        entInicio.setAttribute("visible", false);
    }
    function habilitarPanelDerecho() {
        var boxDerecha = document.querySelector('#boxDerecha');
        boxDerecha.setAttribute("visible", true);
        var boxDerechoIngredientes = document.querySelector('#boxDerechoIngredientes');
        boxDerechoIngredientes.setAttribute("visible", true);
    }
    function habilitarPanelIzquierdo() {
        var boxIzquierda = document.querySelector('#boxIzquierda');
        boxIzquierda.setAttribute("visible", true);
        var boxIzquierdoIngredientes = document.querySelector('#boxIzquierdoIngredientes');
        boxIzquierdoIngredientes.setAttribute("visible", true);
    }

    function guardarAnalisis(idClickeado) {
        $.ajax({
            method: "POST",
            url: "AnalisisNuevo.aspx/GuardarAnalisis",
            data: JSON.stringify({
                idProducto: +idClickeado
            }),
            contentType: "application/json; charset=utf-8"
        }).done(function () {
        }).fail(function (msg) {
            console.log('Error al guardar análisis: ', msg)
            alert('Error al guardar análisis')
        });
    }


    function agregarAlerta(alertas) {
        for (var i = 0; i < alertas.length; i++) {
            var boxDerecha = document.querySelector('#boxDerecha');

            var txt = document.createElement('a-entity');
            txt.setAttribute("position", "0.4 0.04 0.1");
            txt.setAttribute("text", "font: exo2bold;");
            txt.setAttribute("text", "color:#000;");
            txt.setAttribute("text", "width:1.8;");
            txt.setAttribute("text", "value:" + alertas[i].Alerta.Leyenda);

            var figura = document.createElement('a-box');
            figura.setAttribute("color", "#" + alertas[i].Alerta.TipoAlerta.Color.CodigoHexadecimal);
            figura.setAttribute("width", "1.2");
            figura.setAttribute("depth", "0.001");
            figura.setAttribute("height", "0.15");
            figura.setAttribute("opacity", "0.2");
            figura.setAttribute("position", "0 " + ((-0.2 * sumatoriaAlertas) - 1.1) + " 0");
            figura.appendChild(txt)
            boxDerecha.appendChild(figura);

            sumatoriaAlertas = sumatoriaAlertas + 1;
        }
    }

    function agregarAlertaIngredientes(alertas) {
        for (var i = 0; i < alertas.length; i++) {
            var boxDerecha = document.querySelector('#boxDerecha');

            var figura = document.createElement('a-box');
            figura.setAttribute("color", "red");
            figura.setAttribute("width", "1.2");
            figura.setAttribute("depth", "0.001");
            figura.setAttribute("height", "0.15");
            figura.setAttribute("opacity", "0.2");
            figura.setAttribute("position", "0 " + ((-0.2 * sumatoriaAlertas) - 1.1) + " 0");
            sumatoriaAlertas = sumatoriaAlertas + 1;

            var txt = document.createElement('a-entity');
            txt.setAttribute("position", "0.4 0.04 0.1");
            txt.setAttribute("text", "font: exo2bold;");
            txt.setAttribute("text", "color:#000;");
            txt.setAttribute("text", "width:1.8;");
            txt.setAttribute("text", "value:" + alertas[i].Leyenda);

            if (!alertas[i].Perfil.EsPrincipal) {
                var txtPerfil = document.createElement('a-entity');
                txtPerfil.setAttribute("position", "-0.1 0.1 0.1");
                txtPerfil.setAttribute("text", "font: exo2bold;");
                txtPerfil.setAttribute("text", "color:#000;");
                txtPerfil.setAttribute("text", "width:0.8;");
                txtPerfil.setAttribute("text", "value:" + alertas[i].Perfil.Nombre);
                figura.appendChild(txtPerfil)
            }
            figura.appendChild(txt)
            boxDerecha.appendChild(figura);
        }
    }

    function agregarAlertasHexagonales(alertas) {
        console.log('alertas hexa: ', alertas)
        for (var i = 0; i < alertas.length; i++) {

            if (alertas[i].Alerta.Leyenda == "Exceso en sodio") {
                var entHexagonoSodio = document.querySelector('#entHexagonoSodio');
                entHexagonoSodio.setAttribute("visible", true);
                valorCriticoPrueba = alertas[i].ValorCritico;
                valorRealPrueba = alertas[i].ValorReal;
                porcentualSodio = "Grasas saturadas excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";

            }
            if (alertas[i].Alerta.Leyenda == "Exceso en grasas saturadas") {
                var entHexagonoGrasasSaturadas = document.querySelector('#entHexagonoGrasasSaturadas');
                entHexagonoGrasasSaturadas.setAttribute("visible", true);
                valorCriticoPrueba = alertas[i].ValorCritico;
                valorRealPrueba = alertas[i].ValorReal;
                porcentualGrasasSaturadas = "Grasas saturadas excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
            }
            if (alertas[i].Alerta.Leyenda == "Exceso en grasas totales") {
                var entHexagonoGrasasSaturadas = document.querySelector('#entHexagonoGrasasTotales');
                entHexagonoGrasasSaturadas.setAttribute("visible", true);
                valorCriticoPrueba = alertas[i].ValorCritico;
                valorRealPrueba = alertas[i].ValorReal;
                porcentualGrasasTotales = "Grasas totales excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
            }
            if (alertas[i].Alerta.Leyenda == "Exceso en calorias") {
                var entHexagonoCalorias = document.querySelector('#entHexagonoCalorias');
                entHexagonoCalorias.setAttribute("visible", true);
                porcentualCalorias = "Calorias excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";

                valorCriticoPrueba = alertas[i].ValorCritico;
                valorRealPrueba = alertas[i].ValorReal;

                //var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
                //TODO-TESIS: Mostrar en cuanto fue que se excedió.
                //valor_limite_excedido.setAttribute('text', 'value:Calorias excedidas en ' + alertas[i].ValorDiferencial + ' %');

            }
            if (alertas[i].Alerta.Leyenda == "Exceso en azucares") {
                var entHexagonoAzucares = document.querySelector('#entHexagonoAzucares');
                entHexagonoAzucares.setAttribute("visible", true);
                porcentualAzucares = "Azucares excedidos en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                valorCriticoAzucarPrueba = alertas[i].ValorCritico;
                valorRealAzucarPrueba = alertas[i].ValorReal;
            }
        }
    }

    //function agregarGraficoPorcentual() {
    //    var grafico = document.querySelector('#grafico');
    //    grafico.setAttribute("visible", true);

    //    if (comparacion) {
    //        var grafico = document.querySelector('#grafico2');
    //        grafico.setAttribute("charts", "pie_radius: 1; ");
    //        grafico.setAttribute("charts", "type: pie; ");
    //        grafico.setAttribute("charts", "dataPoints: ./dataPie2.json;  ");
    //        grafico.setAttribute("charts", "pie_doughnut: false; ");
    //        return;
    //    }

    //    var grafico = document.querySelector('#grafico');
    //    grafico.setAttribute("charts", "pie_radius: 1; ");
    //    grafico.setAttribute("charts", "type: pie; ");
    //    grafico.setAttribute("charts", "dataPoints: ./dataPie.json;  ");
    //    grafico.setAttribute("charts", "pie_doughnut: false; ");
    //}

    function agregarInfoNutrientes(producto) {
        var nutrientes = producto.NutrientesProducto.map(a => a.Nutriente);

        if (comparacion) {
            var nombre_producto = document.querySelector('#nombre_producto2');
            nombre_producto.setAttribute("text", "value:" + producto.Nombre);

            var calorias_producto = document.querySelector('#calorias_producto2');
            calorias_producto.setAttribute("text", "value:" + producto.ValorEnergetico);

            var porcenaje_azucares = document.querySelector('#porcenaje_azucares2');
            porcenaje_azucares.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Carbohidratos').CantidadPorPorcion + "g Azucares");

            var porcentaje_carbohidratos = document.querySelector('#porcentaje_carbohidratos2');
            porcentaje_carbohidratos.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Carbohidratos').CantidadPorPorcion + "g Carbohidratos");

            var porcentaje_proteinas = document.querySelector('#porcentaje_proteinas2');
            porcentaje_proteinas.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Proteínas').CantidadPorPorcion + "g Proteinas");

            var porcentaje_fibra = document.querySelector('#porcentaje_fibra2');
            porcentaje_fibra.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Fibra').CantidadPorPorcion + "g Fibra");

            var porcentaje_grasas_totales = document.querySelector('#porcentaje_grasas_totales2');
            porcentaje_grasas_totales.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Grasas totales').CantidadPorPorcion + "g Grasas");

            var porcentaje_sodio = document.querySelector('#porcentaje_sodio2');
            porcentaje_sodio.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Sodio').CantidadPorPorcion + "mg Sodio");
            return;
        }

        var nombre_producto = document.querySelector('#nombre_producto');
        nombre_producto.setAttribute("text", "value: Mayonesa; ");

        var calorias_producto = document.querySelector('#calorias_producto');
        calorias_producto.setAttribute("text", "value:" + producto.ValorEnergetico + " kcal/porcion");

        var porcenaje_azucares = document.querySelector('#porcenaje_azucares');
        porcenaje_azucares.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Carbohidratos').CantidadPorPorcion + "g Azucares");

        var porcentaje_carbohidratos = document.querySelector('#porcentaje_carbohidratos');
        porcentaje_carbohidratos.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Carbohidratos').CantidadPorPorcion + "g Carbohidratos");

        var porcentaje_proteinas = document.querySelector('#porcentaje_proteinas');
        porcentaje_proteinas.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Proteínas').CantidadPorPorcion + "g Proteinas");

        var porcentaje_fibra = document.querySelector('#porcentaje_fibra');
        porcentaje_fibra.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Fibra').CantidadPorPorcion + "g Fibra");

        var porcentaje_grasas_totales = document.querySelector('#porcentaje_grasas_totales');
        porcentaje_grasas_totales.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Grasas totales').CantidadPorPorcion + "g Grasas");

        var porcentaje_sodio = document.querySelector('#porcentaje_sodio');
        porcentaje_sodio.setAttribute("text", "value:" + nutrientes.find(x => x.Nombre === 'Sodio').CantidadPorPorcion + "mg Sodio");
    }

    function agregarInfoIngredientes(ingredientesText) {
        if (comparacion) {
            var ingredientes2 = document.querySelector('#ingredientes2');
            ingredientes2.setAttribute("text", "value: " + ingredientesText);
            return;
        }
        var ingredientes = document.querySelector('#ingredientes');
        ingredientes.setAttribute("text", "value: " + ingredientesText);
    }

    function activarComparacion() {
        comparacion = !comparacion;
    }

    function volverAlSitio() {
        location.href = "Inicio";
    }
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
