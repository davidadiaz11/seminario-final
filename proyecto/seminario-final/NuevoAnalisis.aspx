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
    var buscando = false;
    var comparacion = false;
    var nutrientes = ['porcenaje_azucares', 'porcentaje_carbohidratos', 'porcentaje_fibra', 'porcentaje_proteinas', 'porcentaje_grasas_totales', 'porcentaje_sodio']

    var sumatoriaAlertas = 1;

    var porcentualCalorias = "";
    var porcentualAzucares = "";
    var porcentualGrasasSaturadas = "";
    var porcentualGrasasTotales = "";
    var porcentualSodio = "";

    var valorRealAzucares = 0;
    var valorCriticoAzucares = 0;

    var valorRealCalorias = 0;
    var valorCriticoCalorias = 0;

    var valorRealGrasasSaturadas = 0;
    var valorCriticoGrasasSaturadas = 0;

    var valorRealGrasasTotales = 0;
    var valorCriticoGrasasTotales = 0;

    var valorRealSodio = 0;
    var valorCriticoSodio = 0;


    var porcentualCalorias2 = "";
    var porcentualAzucares2 = "";
    var porcentualGrasasSaturadas2 = "";
    var porcentualGrasasTotales2 = "";
    var porcentualSodio2 = "";

    var valorRealAzucares2 = 0;
    var valorCriticoAzucares2 = 0;

    var valorRealCalorias2 = 0;
    var valorCriticoCalorias2 = 0;

    var valorRealGrasasSaturadas2 = 0;
    var valorCriticoGrasasSaturadas2 = 0;

    var valorRealGrasasTotales2 = 0;
    var valorCriticoGrasasTotales2 = 0;

    var valorRealSodio2 = 0;
    var valorCriticoSodio2 = 0;

    AFRAME.registerComponent('markerhandler', {
        init: function () {
            this.el.sceneEl.addEventListener('markerFound', (value) => {
                if (!comparacion) {
                    // limpiarPantalla(this.el);
                }
                const idClickeado = value.target.id;
                iniciarPreloader();
                buscarProducto(idClickeado);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_calorias', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualCalorias);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoCalorias, valorRealCalorias, true);
            })
            //this.el.addEventListener('mouseleave', (e) => {

            //    // valor_limite_excedido.setAttribute('visible', 'false');
            //})
        }
    });

    AFRAME.registerComponent('hover_exceso_calorias2', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido2");
            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualCalorias2);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoCalorias2, valorRealCalorias2, false);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_sodio', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
            this.el.addEventListener('mouseenter', (e) => {

                valor_limite_excedido.setAttribute('text', 'value:' + porcentualSodio);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoSodio, valorRealSodio, true);
            })
            //this.el.addEventListener('mouseleave', (e) => {
            //    // valor_limite_excedido.setAttribute('visible', 'false');
            //})
        }
    });

    AFRAME.registerComponent('hover_exceso_sodio2', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido2");
            this.el.addEventListener('mouseenter', (e) => {

                valor_limite_excedido.setAttribute('text', 'value:' + porcentualSodio2);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoSodio2, valorRealSodio2, false);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_grasas_totales', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");

            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualGrasasTotales);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoGrasasTotales, valorRealGrasasTotales, true);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_grasas_totales2', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido2");

            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualGrasasTotales2);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoGrasasTotales2, valorRealGrasasTotales2, false);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_grasas_saturadas', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");

            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualGrasasSaturadas);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoGrasasSaturadas, valorRealGrasasSaturadas, true);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_grasas_saturadas2', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido2");

            this.el.addEventListener('mouseenter', (e) => {
                valor_limite_excedido.setAttribute('text', 'value:' + porcentualGrasasSaturadas2);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoGrasasSaturadas2, valorRealGrasasSaturadas2, false);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_azucares', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido");
            this.el.addEventListener('mouseenter', (e) => {

                valor_limite_excedido.setAttribute('text', 'value:' + porcentualAzucares);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoAzucares, valorRealAzucares, true);
            })
        }
    });

    AFRAME.registerComponent('hover_exceso_azucares2', {
        init: function () {
            var valor_limite_excedido = document.querySelector("#valor_limite_excedido2");
            this.el.addEventListener('mouseenter', (e) => {

                valor_limite_excedido.setAttribute('text', 'value:' + porcentualAzucares2);
                valor_limite_excedido.setAttribute('visible', 'true');
                ubicarLineasPorcentuales(valorCriticoAzucares2, valorRealAzucares2, false);
            })
        }
    });

    function ubicarLineasPorcentuales(valorCritico, valorReal, esDerecha) {
        var index = '';
        if (!esDerecha) {
            index = '2';
        }
        //hacer el calculo de qué porcentaje representa cada uno
        var porcentajeCritico = ((valorCritico) / valorReal).toFixed(2);;

        var porcentajeReal = (1 - porcentajeCritico).toFixed(2);;


        if (+porcentajeReal + +porcentajeCritico !== 1) {
            return;
        }

        var boxLineaNegra = document.querySelector("#boxLineaNegra" + index);
        var boxLineaRoja = document.querySelector("#boxLineaRoja" + index);

        boxLineaNegra.setAttribute('width', porcentajeCritico);
        boxLineaRoja.setAttribute('width', porcentajeReal);

        boxLineaNegra.setAttribute('position', (+porcentajeReal * (-0.5)) + " -0.7 0.1");
        boxLineaRoja.setAttribute('position', (+porcentajeCritico * 0.5) + " -0.7 0.1");
        boxLineaNegra.setAttribute('visible', 'true');
        boxLineaRoja.setAttribute('visible', 'true');
    }


    function iniciarPreloader() {
        document.getElementById("overlay").style = "display:block";
    }
    function ocultarPreloader() {
        document.getElementById("overlay").style = "display:none";
    }

    function limpiarPantalla() {
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

        sumatoriaAlertas = 1;

        document.getElementById("btnLimpiar").style = "display:none";
        document.getElementById("divComparar").style = "display:none";

        comparacion = false;
        habilitarPanelDerecho(false);
        habilitarPanelIzquierdo(false);
        mostrarImagenInicio(true);
    }

    function buscarProducto(idClickeado) {
        mostrarImagenInicio(false);

        if (buscando) {
            return;
        } else {
            buscando = true;
        }
        $.ajax({
            method: "POST",
            url: "NuevoAnalisis.aspx/ObtenerAlertasPorProducto",
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
                    habilitarPanelDerecho(true)
                    document.getElementById("divComparar").style = "display:show";
                } else {
                    habilitarPanelIzquierdo(true)
                }
            }
            document.getElementById("btnLimpiar").style = "display:show";
        }).fail(function (msg) {
            console.log(msg)
            buscando = false;
            ocultarPreloader();
            alert('Error al buscar alertas')
        });
    }

    function mostrarImagenInicio(habilitar) {
        var entInicio = document.querySelector('#entInicio');
        entInicio.setAttribute("visible", habilitar);
    }
    function habilitarPanelDerecho(habilitar) {
        var boxDerecha = document.querySelector('#boxDerecha');
        boxDerecha.setAttribute("visible", habilitar);
        var boxDerechoIngredientes = document.querySelector('#boxDerechoIngredientes');
        boxDerechoIngredientes.setAttribute("visible", habilitar);
    }
    function habilitarPanelIzquierdo(habilitar) {
        var boxIzquierda = document.querySelector('#boxIzquierda');
        boxIzquierda.setAttribute("visible", habilitar);
        var boxIzquierdoIngredientes = document.querySelector('#boxIzquierdoIngredientes');
        boxIzquierdoIngredientes.setAttribute("visible", habilitar);
    }

    function guardarAnalisis(idClickeado) {
        $.ajax({
            method: "POST",
            url: "NuevoAnalisis.aspx/GuardarAnalisis",
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

        var box = document.querySelector('#boxDerecha');
        if (comparacion) {
            box = document.querySelector('#boxIzquierda');
            sumatoriaAlertas = 1;
        }

        for (var i = 0; i < alertas.length; i++) {
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
            figura.setAttribute("opacity", "0.5");
            figura.setAttribute("position", "0 " + ((-0.2 * sumatoriaAlertas) - 1.1) + " 0");
            figura.appendChild(txt)
            box.appendChild(figura);

            sumatoriaAlertas = sumatoriaAlertas + 1;
        }
    }

    function agregarAlertaIngredientes(alertas) {
        var box = document.querySelector('#boxDerecha');
        if (comparacion) {
            box = document.querySelector('#boxIzquierda');
        }
        for (var i = 0; i < alertas.length; i++) {

            var figura = document.createElement('a-box');
            figura.setAttribute("color", "red");
            figura.setAttribute("width", "1.2");
            figura.setAttribute("depth", "0.001");
            figura.setAttribute("height", "0.15");
            figura.setAttribute("opacity", "0.5");
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
            box.appendChild(figura);
        }
    }

    function agregarAlertasHexagonales(alertas) {
        var index = '';
        if (comparacion) {
            index = '2';
        }
        for (var i = 0; i < alertas.length; i++) {

            if (alertas[i].Alerta.Leyenda == "Exceso en sodio") {
                var entHexagonoSodio = document.querySelector('#entHexagonoSodio' + index);
                entHexagonoSodio.setAttribute("visible", true);
                if (index == '') {
                    porcentualSodio = "Sodio excedido en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                    valorCriticoSodio = alertas[i].ValorCritico;
                    valorRealSodio = alertas[i].ValorReal;
                } else {
                    porcentualSodio2 = "Sodio excedido en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                    valorCriticoSodio2 = alertas[i].ValorCritico;
                    valorRealSodio2 = alertas[i].ValorReal;
                }


            }
            if (alertas[i].Alerta.Leyenda == "Exceso en grasas saturadas") {
                var entHexagonoGrasasSaturadas = document.querySelector('#entHexagonoGrasasSaturadas' + index);
                entHexagonoGrasasSaturadas.setAttribute("visible", true);
                if (index == '') {
                    valorCriticoGrasasSaturadas = alertas[i].ValorCritico;
                    valorRealGrasasSaturadas = alertas[i].ValorReal;
                    porcentualGrasasSaturadas = "Grasas saturadas excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                } else {
                    valorCriticoGrasasSaturadas2 = alertas[i].ValorCritico;
                    valorRealGrasasSaturadas2 = alertas[i].ValorReal;
                    porcentualGrasasSaturadas2 = "Grasas saturadas excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                }

            }
            if (alertas[i].Alerta.Leyenda == "Exceso en grasas totales") {
                var entHexagonoGrasasTotales = document.querySelector('#entHexagonoGrasasTotales' + index);
                entHexagonoGrasasTotales.setAttribute("visible", true);
                if (index == '') {
                    valorCriticoGrasasTotales = alertas[i].ValorCritico;
                    valorRealGrasasTotales = alertas[i].ValorReal;
                    porcentualGrasasTotales = "Grasas totales excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                } else {
                    valorCriticoGrasasTotales2 = alertas[i].ValorCritico;
                    valorRealGrasasTotales2 = alertas[i].ValorReal;
                    porcentualGrasasTotales2 = "Grasas totales excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                }

            }
            if (alertas[i].Alerta.Leyenda == "Exceso en calorias") {
                var entHexagonoCalorias = document.querySelector('#entHexagonoCalorias' + index);
                entHexagonoCalorias.setAttribute("visible", true);
                if (index == '') {
                    porcentualCalorias = "Calorias excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                    valorCriticoCalorias = alertas[i].ValorCritico;
                    valorRealCalorias = alertas[i].ValorReal;
                } else {
                    porcentualCalorias2 = "Calorias excedidas en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                    valorCriticoCalorias2 = alertas[i].ValorCritico;
                    valorRealCalorias2 = alertas[i].ValorReal;
                }

            }
            if (alertas[i].Alerta.Leyenda == "Exceso en azucares") {
                var entHexagonoAzucares = document.querySelector('#entHexagonoAzucares' + index);
                entHexagonoAzucares.setAttribute("visible", true);
                if (index == '') {
                    porcentualAzucares = "Azucares excedidos en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                    valorCriticoAzucares = alertas[i].ValorCritico;
                    valorRealAzucares = alertas[i].ValorReal;
                } else {
                    porcentualAzucares2 = "Azucares excedidos en " + alertas[i].ValorDiferencial.toFixed(0) + "%";
                    valorCriticoAzucares2 = alertas[i].ValorCritico;
                    valorRealAzucares2 = alertas[i].ValorReal;
                }

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

    function setearInfoNutriente(id, valor) {
        var elemento = document.querySelector('#' + id);
        elemento.setAttribute("text", "value:" + valor);
    }

    function agregarInfoNutrientes(producto) {
        var index = '';
        if (comparacion) {
            index = '2';
        }

        var nutrientes = producto.NutrientesProducto.map(a => a.Nutriente);

        if (producto.Nombre.length <= 25) {
            setearInfoNutriente('nombre_producto' + index, producto.Nombre);
        } else {
            var nuevoNombre = producto.Nombre.substring(0, 24) + "\n" + producto.Nombre.substring(24);
            setearInfoNutriente('nombre_producto' + index, nuevoNombre);
        }
        setearInfoNutriente('porcion_producto' + index, "Porcion: " + producto.PorcionText);
        setearInfoNutriente('calorias_producto' + index, producto.ValorEnergetico + ' kcal/porcion');
        setearInfoNutriente('porcenaje_azucares' + index, nutrientes.find(x => x.Nombre === 'Azúcares añadidos').CantidadPorPorcion + "g Azucares");
        setearInfoNutriente('porcentaje_carbohidratos' + index, nutrientes.find(x => x.Nombre === 'Carbohidratos').CantidadPorPorcion + "g Carbohidratos");
        setearInfoNutriente('porcentaje_proteinas' + index, nutrientes.find(x => x.Nombre === 'Proteínas').CantidadPorPorcion + "g Proteinas");
        setearInfoNutriente('porcentaje_fibra' + index, nutrientes.find(x => x.Nombre === 'Fibra').CantidadPorPorcion + "g Fibra");
        setearInfoNutriente('porcentaje_grasas_totales' + index, nutrientes.find(x => x.Nombre === 'Grasas totales').CantidadPorPorcion + "g Grasas");
        setearInfoNutriente('porcentaje_sodio' + index, nutrientes.find(x => x.Nombre === 'Sodio').CantidadPorPorcion + "g Sodio");
    }

    function agregarInfoIngredientes(ingredientesText) {
        var ingredientesTextAdaptado = ingredientesText.replace(/;/g, ',').normalize('NFD');
        if (comparacion) {
            var ingredientes2 = document.querySelector('#ingredientes2');
            ingredientes2.setAttribute("text", "value: " + ingredientesTextAdaptado);
            return;
        }
        var ingredientes = document.querySelector('#ingredientes');
        ingredientes.setAttribute("text", "value: " + ingredientesTextAdaptado);
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
            visible="false"
            text="align: center;color: white; value:" id="boxDerecha">

            <%--<a-entity id="grafico" position="-4 -2.5 -20" rotation="20 45 100" charts="type: pie; pie_radius: 1; dataPoints: ./dataPie.json; pie_doughnut: false; "></a-entity>--%>
            <a-entity id="nombre_producto" position="0.45 0.6 0.1" text=" font: exo2bold; color:#000; width:2; align:left;"></a-entity>
            <a-entity id="calorias_producto" position="1 0.2 0.1" text=" font: exo2bold; color:#000; align:left; width:3;"></a-entity>
            <a-entity id="porcion_producto" position="0.25 0.1 0.1" text=" font: exo2bold; color:#757575; align:left; width:1.5;"></a-entity>
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


            <a-entity id="valor_limite_excedido" position="0.23 -0.65 0.1" scale="0.52 0.52 0.525"
                text="color: black;value:; width:3;" visible="false">
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
            <a-entity id="porcion_producto2" position="0.25 0.1 0.1" text=" font: exo2bold; color:#292929; align:left; width:1.5; value:"></a-entity>
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
            <a-entity id="titulo_ingredientes" position="0.5 1.2 0.1" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
        <a-box opacity="0.75" color="#fff" width="3.7" height="2.8" depth="0.001"
            id="boxIzquierdoIngredientes"
            visible="false"
            position="-3.6 1.4 -3"
            rotation="0 40 0"
            text="align: center;color: white; value:">
            <a-entity id="ingredientes2" position="0 -0.1 0.1" text="font: exo2semibold; width:3; color: #000; value:"></a-entity>
            <a-entity id="titulo_ingredientes2" position="0.5 1.2 0.1" text="font: exo2semibold; width:4; color: #000; value: Ingredientes"></a-entity>
        </a-box>
    </a-scene>
</body>
