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
</head>
<body>
    <div class="container-scroller">
        <div class="main-panel print" id="content">
            <div class="content-wrapper">
                <form id="form1" runat="server">
                    <asp:Button ID="btn_admin" OnClick="btn_admin_Click" runat="server" Text="Admin" />
                    <br />
                    <br />
                    <asp:Button ID="btn_usu" OnClick="btn_usu_Click" runat="server" Text="Usuario Consumidor" />
                </form>
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

