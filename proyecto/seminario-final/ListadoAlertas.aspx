<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoAlertas.aspx.cs" Inherits="seminario_final.ListadoAlertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

    <style>
        .dot {
            height: 25px;
            width: 25px;
            border-radius: 50%;
            display: inline-block;
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
                                            <asp:DropDownList OnSelectedIndexChanged="ddl_cant_filas_SelectedIndexChanged" AutoPostBack="true" ID="ddl_cant_filas" runat="server">
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <asp:CheckBox CssClass="form-group" ID="ch_eliminados" Text="Ver alertas eliminadas" runat="server" />

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
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nombre"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Nombre" NavigateUrl='<%#string.Format("/Alertas?{0}",GetSortLink("nombre")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("NutrientesAlerta[0].Alerta.Leyenda") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "leyenda"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Leyenda" NavigateUrl='<%#string.Format("/Alertas?{0}",GetSortLink("leyenda")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("Nombre") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nutriente"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Nutriente" NavigateUrl='<%#string.Format("/Alertas?{0}",GetSortLink("nutriente")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("NutrientesAlerta[0].Operador").ToString() == ">" ? "Mayor o igual" : "Menor o igual" %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "operador"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Operador" NavigateUrl='<%#string.Format("/Alertas?{0}",GetSortLink("operador")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("NutrientesAlerta[0].ValorCritico") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "valorcritico"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Valor Crítico" NavigateUrl='<%#string.Format("/Alertas?{0}",GetSortLink("valorcritico")) %>'></asp:HyperLink>
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
                                                        <a href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>" class="mr-3">
                                                            <i class="mdi mdi-pencil text-muted icon-md"></i>
                                                        </a>
                                                        <a style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("id") %>');" href="#">
                                                            <i class="mdi mdi-delete text-black icon-md"></i>
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
                                    <%-- Hidden fileds --%>
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
                                                <a class="text-black" href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>">

                                                    <div class="wrapper d-flex justify-content-between">
                                                        <div class="side-left">
                                                            <p class="display-6 mb-1 font-weight-light">
                                                                <asp:Label Text='<%# "Nombre: " + Eval("NutrientesAlerta[0].Alerta.Nombre") %>' runat="server" />
                                                            </p>
                                                            <p class="mb-1">
                                                                <asp:Label Text='<%# "Leyenda: " + Eval("NutrientesAlerta[0].Alerta.Leyenda") %>' runat="server" />
                                                            </p>



                                                            <a class="text-muted" href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>"><i class="mdi  mdi-pencil icon-md ml-2 "></i></a>
                                                            <a style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("id") %>');" href="#">
                                                                <i class="mdi mdi-delete text-black icon-md"></i>
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
                <button type="button" class="btn btn-success small no-print" onclick="print();">Imprimir</button>
            </form>
        </div>
    </div>
</asp:Content>
