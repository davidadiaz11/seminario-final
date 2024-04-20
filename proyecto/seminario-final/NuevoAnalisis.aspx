﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevoAnalisis.aspx.cs" Inherits="seminario_final.NuevoAnalisis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

    <style type="text/css">
        .algo {
            color: #000;
        }
    </style>
    <script src="https://cdn.rawgit.com/jeromeetienne/AR.js/1.5.0/aframe/examples/vendor/aframe/build/aframe.min.js"></script>
    <script src="https://cdn.rawgit.com/jeromeetienne/AR.js/1.5.0/aframe/build/aframe-ar.js"></script>
    <!-- <script>THREEx.ArToolkitContext.baseURL = 'https://rawgit.com/jeromeetienne/ar.js/master/three.js/'</script> -->
    <a-scene embedded arjs='trackingMethod: best;'>
        <a-anchor hit-testing-enabled='false'>
            <a-box position='0 0.5 0' material='opacity: 0.1;'>
                <a-entity class="algo" text="value: PRODUCTO EXCEDIDO EN GRASAS: ⚫⚫⚫⚫⚫⚫|⚫⚫ 120% grasas"></a-entity>

            </a-box>
        </a-anchor>
        <a-camera-static />
    </a-scene>


    <!-- <script>
    window.onload = function(){
        var el = document.querySelector('#my-element');
var object = el.getObject3D('mesh');

// compute bounding box
var bbox = new THREE.Box3().setFromObject(obj);
console.log(bbox.min, bbox.max)


var helper = new THREE.BoundingBoxHelper(someObject3D, 0xff0000);
helper.update();
// If you want a visible bounding box
scene.add(helper);
// If you just want the numbers
console.log(helper.box.min);
console.log(helper.box.max);
    }
</script> -->
</asp:Content>
