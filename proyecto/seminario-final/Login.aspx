<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="seminario_final.Login" %>

<!DOCTYPE html>
<html lang="es-AR" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seminario Final</title>
    <meta charset="utf-8" />
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css" />
    <link rel="stylesheet" href="vendors/css/vendor.bundle.addons.min.css" />
    <link href="css/iziToast.css" rel="stylesheet" />
    <script src="js/iziToast.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/style.min.css" />
    <link rel="shortcut icon" href="images/logo.ico" />

    <style>
        body {
            /*            width: 100%;*/
            /*            overflow-x: hidden;*/
            /*            overscroll-behavior: contain;*/
        }

        html {
            overscroll-behavior: contain;
        }

        html, body {
            height: 100%;
        }

        .header {
            height: 100%;
        }

        html {
            overflow: hidden;
        }

        body {
            overflow-y: scroll;
            -webkit-overflow-scrolling: touch;
        }



        .iziToast-buttons {
            /*            padding-left:83px;*/
            align-items: center;
            align-content: center;
        }

        .iziToast-buttons, .iziToast-texts {
            padding-left: 3rem;
        }

        .spinner {
            width: 80px;
            height: 80px;
            border: 2px solid #f3f3f3;
            border-top: 3px solid #f25a41;
            border-radius: 100%;
            position: absolute;
            z-index: 999;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            animation: spin 1s infinite linear;
        }

        @keyframes spin {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        .navbar.default-layout .navbar-brand-wrapper .navbar-brand img {
            /*            height: 100px;*/
            width: 115px;
            padding-bottom: 0.51rem;
        }

        .navbar-brand-wrapper {
            height: 100px;
        }

        #overlay {
            height: 100%;
            width: 100%;
            background: rgba(0, 0, 0, 0.55);
            position: fixed;
            z-index: 99;
            left: 0;
            top: 0;
            display: none;
        }

        .btn-yellow {
            color: #fff;
            background-color: #d6d62f;
            border-color: #d6d62f;
        }

        .main-panel {
            width: 100%;
        }



        .navbar.default-layout .navbar-brand-wrapper {
            height: 50px;
        }

        .navbar.default-layout {
            background: #404041;
        }

        .banner {
            max-width: 100%;
            height: auto;
        }


        .img2 {
            width: 50px;
        }

        .img {
            width: 100%;
        }

        /*PC*/
        @media (min-width:900px) {

            .img-1 {
                content: url("images/flyermalena1200x450.png");
            }

            .img-2 {
                content: url("images/flyermalena1200x450.png");
            }

            .img-3 {
                content: url("images/flyermalena1200x450.png");
            }

            .imagen {
                width: 50%;
            }

            .logo {
                width: 15%;
            }

            .apreton {
                height: 200px;
                background: url(images/cta1.png) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                background-size: cover;
            }

            .cta-btn {
                padding: 50px 0;
            }

            .botones {
                font-size: .995rem;
                color: #363636;
            }

            .suconsulta {
                font-size: 1.8rem;
                color: #363636;
            }

            .comentarios {
                /*margin-left: 33.33333333333333%;*/
                margin-left: 20%;
                width: 60%;
            }

            .texto-comentario {
                padding: 15px 15px 5px 200px;
                font-size: 2rem;
            }

            .altura-comentario {
                height: 200px;
            }

            .text-envios {
                font-size: 20px;
            }
        }







        /*Smartphone*/
        @media (max-width:700px) {

            .img-1 {
                content: url("images/flyermalena.png");
            }

            .img-2 {
                content: url("images/flyermalena.png");
            }

            .img-3 {
                content: url("images/flyermalena.png");
            }

            .imagen {
                width: 100%;
            }

            .logo {
                width: 50%;
            }

            .comentarios {
                width: 100%;
            }

            .texto-comentario {
                padding: 15px 15px 5px 120px;
                font-size: 0.7rem;
            }

            .altura-comentario {
            }

            .apreton {
                height: 130px;
                background: url(images/9009.png) no-repeat center center fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                background-size: cover;
                background-attachment: fixed;
            }

            .cta-btn {
                padding: 40px 0;
            }

            .text-envios {
                font-size: 13px;
            }
        }


        input {
            height: 2em;
            width: 2em;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper">

            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row no-print">
                <div class="text-center col-10 navbar-brand-wrapper d-flex align-items-top justify-content-center" style="background-color: #404041">
                    <a class="navbar-brand brand-logo" style="padding-left: 20%" href="#">
                        <img src="./images/logo.svg" alt="logo" />
                    </a>
                    <a class="navbar-brand brand-logo-mini" style="padding-left: 20%" id="acceso" runat="server" href="#">
                        <img src="./images/logo.svg" alt="logo" />
                    </a>

                </div>
            </nav>
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="col-12 col-md-4">
                        <form class="forms-sample" runat="server">
                            <div class="col-12">
                                <h2 class="text-center">Nuevo usuario</h2>
                                <div class="row">
                                    <div class="col-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label for="txt_email">Email <small class="text-danger">*</small></label>
                                                    <asp:TextBox placeholder="Ingrese email" ID="txt_email" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_email" ID="rf_email" runat="server" ErrorMessage="Ingrese Email"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_contrasenia">Contraseña <small class="text-danger">*</small></label>
                                                    <asp:TextBox placeholder="Ingrese contraseña" ID="txt_contrasenia" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_contrasenia" ID="rf_contrasenia" runat="server" ErrorMessage="Ingrese Contraseña"></asp:RequiredFieldValidator>
                                                </div>
                                                <asp:Button CssClass="btn btn-primary col-5 col-md-4" ID="btn_ingresar" runat="server" Text="Ingresar" OnClick="btn_ingresar_Click" />
                                                <asp:Button CssClass="btn btn-light col-5 col-md-4" runat="server" Text="Cancelar" OnClientClick="history.go(-1);" />
                                                <br />
                                                <br />
                                                <hr />
                                                <a class="btn btn-success col-12 col-md-4 mr-1" href="FormularioUsuario">Crear cuenta</a>
                                                <asp:Button CssClass="btn btn-primary col-12 col-md-4 mt-1" runat="server" Text="Demo" ID="btn_demo" CausesValidation="False" OnClick="btn_demo_Click" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="vendors/js/vendor.bundle.base.js"></script>
    <script src="js/misc.js"></script>
    <script src="js/off-canvas.js"></script>
    <div class="text-right" style="background-color: #363636">
        <label class="text-white mr-2">Seminario Final de Ingeniería en Software - David Díaz</label>
    </div>
</body>
</html>

