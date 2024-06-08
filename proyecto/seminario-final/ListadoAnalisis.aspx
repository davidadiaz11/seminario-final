<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoAnalisis.aspx.cs" Inherits="seminario_final.ListadoAnalisis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

    <div class="main-panel">
        <div class="content-wrapper">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="wrapper d-flex justify-content-between">
                                    <h4 class="lead">Lista de Análisis</h4>
                                    <div class="side-right text-right">
                                        <a id="LinkButton2" runat="server" class="text-primary  no-print" onclick="ver_lista();"><i class="mdi mdi-view-headline icon-md"></i></a>
                                        <a onclick="ver_tarjetas();" runat="server" class="text-muted  no-print" id="LinkButton3"><i class="mdi mdi-view-module icon-md"></i></a>
                                        <div>
                                            <small>Cantidad de filas: </small>
                                            <asp:DropDownList OnSelectedIndexChanged="ddl_cant_filas_SelectedIndexChanged" AutoPostBack="true" ID="ddl_cant_filas" runat="server">
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
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
                                                    <ItemTemplate><%# Convert.ToDateTime(Eval("Fecha")).ToString("dd/MM/yyyy") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        Fecha
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("Producto.Nombre") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        Producto
                                                    </HeaderTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <a href="<%# String.Format("VerAnalisis?ahi={0}", Eval("Id")) %>" class="mr-3">
                                                            <i class="mdi mdi-eye icon-md"></i>
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
                        <div class="row mt-2">
                            <asp:Repeater ID="rpt_viajes" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="card card-statistics">
                                            <div class="card-body">
                                                <a class="text-black" href="<%# String.Format("VerAnalisis?ahi={0}", Eval("Id")) %>">

                                                    <div class="wrapper d-flex justify-content-between">
                                                        <div class="side-left">
                                                            <p class="display-6 mb-1 font-weight-light">
                                                                <asp:Label Text='<%# "Producto: " + Eval("Producto.Nombre") %>' runat="server" />
                                                            </p>
                                                        </div>
                                                        <div class="side-right text-right font-weight-light">
                                                            <p class="mb-1">
                                                                <small>
                                                                    <asp:Label Text='<%# "Fecha: " + Convert.ToDateTime(Eval("Fecha")).ToString("dd/MM/yyyy") %>' runat="server" />
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
                <a class="btn btn-primary mr-2 no-print" href="NuevoAnalisis"><span class="menu-title">Nuevo Análisis</span> </a>
            </form>
        </div>
    </div>
</asp:Content>
