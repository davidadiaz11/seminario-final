﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoAlertas.aspx.cs" Inherits="seminario_final.ListadoAlertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

    <style>
        .dot {
            height: 25px;
            width: 25px;
            border-radius: 50%;
            display: inline-block;
        }

        .checkbox .btn,
        .checkbox-inline .btn {
            padding-left: 2em;
            min-width: 8em;
        }

        .checkbox label,
        .checkbox-inline label {
            padding-top: 0.7em;
            text-align: left;
            padding-left: 1em;
        }
    </style>

    <div class="main-panel">
        <div class="content-wrapper">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="wrapper d-flex justify-content-between">
                                    <h4 class="lead">Lista de Alertas</h4>
                                    <div class="side-right text-right">
                                        <a id="LinkButton2" runat="server" class="text-primary  no-print" onclick="ver_lista();"><i class="mdi mdi-view-headline icon-md"></i></a>
                                        <a onclick="ver_tarjetas();" runat="server" class="text-muted  no-print" id="LinkButton3"><i class="mdi mdi-view-module icon-md"></i></a>
                                        <div>
                                            <small>Cantidad de filas: </small>
                                            <asp:DropDownList CssClass="form-control" OnSelectedIndexChanged="ddl_cant_filas_SelectedIndexChanged" AutoPostBack="true" ID="ddl_cant_filas" runat="server">
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="btn btn-default">
                                            <asp:CheckBox CssClass="form-group" AutoPostBack="true" ID="ch_eliminados" OnCheckedChanged="ch_eliminados_CheckedChanged" Text="Ver alertas eliminadas" runat="server" />
                                        </label>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    "use strict";
                                    window.onload = function () {
                                        if (document.getElementById("Cuerpo_txt_nombre").value != "")
                                            document.getElementById("Cuerpo_lnk_nombre").click();
                                        if (document.getElementById("Cuerpo_txt_doc").value != "")
                                            document.getElementById("Cuerpo_lnk_doc").click();
                                    }

                                    function eliminar(id) {
                                        iziToast.warning({ title: '', message: 'Estas seguro?', timeout: 20000, buttons: [['<button style=padding-right:20px>Sí</button>', function (instance, toast) { instance.hide({ transitionOut: 'flipOutX', onClosing: function (instance, toast, closedBy) { hacerpostback(id) } }, toast, 'buttonName') }, !0], ['<button>No</button>', function (instance, toast) { instance.hide({ transitionOut: 'flipOutX' }, toast, 'buttonName') }]] });
                                    }

                                    function hacerpostback(id) {
                                        __doPostBack('eliminar', id);
                                    }


                                    function hacerpostbackRecuperar(id) {
                                        __doPostBack('recuperar', id);
                                    }

                                    function ver_lista() {
                                        document.getElementById("Cuerpo_vista_lista").style = "display:block";
                                        document.getElementById("Cuerpo_vista_repeater").style = "display:none";
                                        document.getElementById("Cuerpo_LinkButton2").attributes["class"].value = "text-primary  no-print";
                                        document.getElementById("Cuerpo_LinkButton3").attributes["class"].value = "text-muted  no-print";
                                    }

                                    function ver_tarjetas() {
                                        document.getElementById("Cuerpo_vista_lista").style = "display:none";
                                        document.getElementById("Cuerpo_vista_repeater").style = "display:block";
                                        document.getElementById("Cuerpo_LinkButton2").attributes["class"].value = "text-muted  no-print";
                                        document.getElementById("Cuerpo_LinkButton3").attributes["class"].value = "text-primary  no-print";
                                    }

                                </script>

                                <div class="row">
                                    <div class="table-responsive">
                                        <asp:GridView ID="vista_lista" CssClass="table table-striped order" GridLines="None" runat="server" AllowSorting="true" AutoGenerateColumns="False" AllowPaging="True">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%#Eval("NutrientesAlerta[0].Alerta.Nombre") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ale_nombre"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Nombre" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("ale_nombre")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("NutrientesAlerta[0].Alerta.Leyenda") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ale_leyenda"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Leyenda" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("ale_leyenda")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("Nombre") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nut_nombre"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Nutriente" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("nut_nombre")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("NutrientesAlerta[0].Operador").ToString() == ">" ? "Mayor o igual" : "Menor o igual" %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "anu_operador"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Operador" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("anu_operador")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("NutrientesAlerta[0].ValorCritico") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "anu_valor_critico"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Valor Crítico" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("anu_valor_critico")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <%#   Eval("NutrientesAlerta[0].Alerta.TipoAlerta.Forma.Nombre") %>
                                                        <span class="dot" style='<%# "background-color:#" + Eval("NutrientesAlerta[0].Alerta.TipoAlerta.Color.CodigoHexadecimal") %>'></span>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        Forma y Color
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <a title="Modificar" style='<%# ch_eliminados.Checked ? "display:none": "" %>' href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>" class="mr-3">
                                                            <i class="mdi mdi-pencil text-dark icon-md"></i>
                                                        </a>
                                                        <a title="Eliminar" style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("NutrientesAlerta[0].Id") %>');" href="#">
                                                            <i class="mdi mdi-delete text-danger icon-md"></i>
                                                        </a>
                                                        <a title="Recuperar" style='<%# ch_eliminados.Checked ? "": "display:none" %>' onclick="hacerpostbackRecuperar('<%# Eval("NutrientesAlerta[0].Id") %>');" href="#">
                                                            <i class="mdi mdi-undo-variant text-dark icon-md"></i>
                                                        </a>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                    <p class="badge badge-success font-weight-normal mt-2 mr-4" runat="server" id="span_mensaje"></p>

                                    <div class="btn-group-sm" role="group">
                                        <asp:Literal ID="l1Pagger" runat="server"></asp:Literal>
                                    </div>
                                    <asp:HiddenField ID="hfCurrentPage" runat="server" Value="0" />
                                    <asp:HiddenField ID="hfSortName" runat="server" Value="" />
                                    <asp:HiddenField ID="hfSortDir" runat="server" Value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row order small" id="vista_repeater" style="display: none" runat="server">
                    <div class="col-12">
                        <asp:HyperLink ID="h_nombre" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ale_nombre"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Nombre" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("ale_nombre")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_leyenda" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ale_leyenda"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Leyenda" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("ale_leyenda")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_nutrientes" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nut_nombre"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Nutrientes" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("nut_nombre")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_valor_critico" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "anu_valor_critico"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Valor crítico" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("anu_valor_critico")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_operador" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "anu_operador"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Operador" NavigateUrl='<%#string.Format("/ListadoAlertas?{0}",GetSortLink("anu_operador")) %>'></asp:HyperLink>
                        <div class="row mt-2">
                            <asp:Repeater ID="rpt_viajes" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="card card-statistics">
                                            <div class="card-body">
                                                <a class="text-black" href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>">
                                                    <div class="wrapper d-flex justify-content-between">
                                                        <div class="side-left">
                                                            <p class="display-6 mb-1 font-weight-light">
                                                                <asp:Label Text='<%# "Nombre: " + Eval("NutrientesAlerta[0].Alerta.Nombre") %>' runat="server" />
                                                            </p>
                                                            <p class="mb-1">
                                                                <asp:Label Text='<%# "Leyenda: " + Eval("NutrientesAlerta[0].Alerta.Leyenda") %>' runat="server" />
                                                            </p>
                                                            <p class="mb-1">
                                                                <asp:Label Text='<%# "Nutriente: " + Eval("Nombre") + " " + Eval("NutrientesAlerta[0].Operador") + "= " + Eval("NutrientesAlerta[0].ValorCritico") %>' runat="server" />
                                                            </p>
                                                            <a title="Modificar" style='<%# ch_eliminados.Checked ? "display:none": "" %>' href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>"><i class="mdi  mdi-pencil text-danger icon-md ml-2 "></i></a>
                                                            <a title="Eliminar" style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("NutrientesAlerta[0].Id") %>');" href="#">
                                                                <i class="mdi mdi-delete text-danger icon-md"></i>
                                                            </a>
                                                            <a title="Recuperar" style='<%# ch_eliminados.Checked ? "": "display:none" %>' onclick="hacerpostbackRecuperar('<%# Eval("NutrientesAlerta[0].Id") %>');" href="#">
                                                                <i class="mdi mdi-undo-variant text-dark icon-md"></i>
                                                            </a>
                                                        </div>
                                                        <div class="side-right text-right font-weight-light">
                                                            <p class="mb-1">
                                                                <small>
                                                                    <asp:Label Text='<%#  Eval("NutrientesAlerta[0].Alerta.TipoAlerta.Forma.Nombre") %>' runat="server" />
                                                                    <span class="dot" style='<%# "background-color:#" + Eval("NutrientesAlerta[0].Alerta.TipoAlerta.Color.CodigoHexadecimal") %>'></span>
                                                                </small>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <br>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <a class="btn btn-primary mr-2 no-print" href="FormularioAlerta"><span class="menu-title">Crear Alerta</span> </a>
            </form>
        </div>
    </div>
</asp:Content>
