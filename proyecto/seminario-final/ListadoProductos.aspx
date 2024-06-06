<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoProductos.aspx.cs" Inherits="seminario_final.ListadoProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="wrapper d-flex justify-content-between">
                                    <h4 class="lead">Lista de Productos</h4>
                                    <div class="side-right text-right">
                                        <a id="LinkButton2" runat="server" class="text-primary  no-print" onclick="ver_lista();"><i class="mdi mdi-view-headline icon-md"></i></a>
                                        <a onclick="ver_tarjetas();" runat="server" class="text-muted  no-print" id="LinkButton3"><i class="mdi mdi-view-module icon-md"></i></a>
                                        <div>
                                            <small>Cantidad de filas: </small>
                                            <asp:DropDownList OnSelectedIndexChanged="ddl_cant_filas_SelectedIndexChanged" AutoPostBack="true" ID="ddl_cant_filas" runat="server">
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="15">15</asp:ListItem>
                                                <asp:ListItem Value="20">20</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <asp:LinkButton ID="lnk_nombre" CssClass="nav-link-filtro small mr-2" runat="server" aria-expanded="false" aria-controls="fil_nombre" data-toggle="collapse" href="#fil_nombre">
                                <span>Nombre</span>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="lnk_doc" CssClass="nav-link-filtro small mr-2" runat="server" aria-expanded="false" aria-controls="doc" data-toggle="collapse" href="#doc">
                                <span>Ingredientes</span>
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="lnk_sello" CssClass="nav-link-filtro small mr-2" runat="server" aria-expanded="false" aria-controls="sello" data-toggle="collapse" href="#sello">
                                <span>Sello</span>
                                    </asp:LinkButton>

                                </div>
                                <asp:CheckBox CssClass="form-group" ID="ch_eliminados" Text="Ver productos eliminados" runat="server" />
                                <div class="collapse mt-1" id="fil_nombre">
                                    <div class="col-12">
                                        <div class="row">
                                            <p class="mr-2 mt-1">Nombre</p>
                                            <asp:TextBox ID="txt_nombre" AutoCompleteType="Disabled" CssClass="form-control form-control-sm col-xl-2 col-lg-2 col-md-2 col-9" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="collapse mt-1" id="doc">
                                    <div class="col-12">
                                        <div class="row">
                                            <p class="mr-2 mt-1">Ingrediente</p>
                                            <asp:DropDownList CssClass="form-control form-control-sm col-xl-2 col-lg-2 col-md-2 col-6" ID="ddl_ingrediente" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1"> Ingrediente 1 </asp:ListItem>
                                                <asp:ListItem Value="2"> Ingrediente 2 </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="collapse mt-1" id="sello">
                                    <div class="col-12">
                                        <div class="row">
                                            <p class="mr-2 mt-1">Sello</p>
                                            <asp:DropDownList CssClass="form-control form-control-sm col-xl-2 col-lg-2 col-md-2 col-6" ID="ddl_sello" runat="server">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="1"> Sello 1 </asp:ListItem>
                                                <asp:ListItem Value="2"> Sello 2 </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <asp:Button CssClass="btn btn-primary btn-rounded  mt-2 mb-3 no-print" ID="btn_buscar" runat="server" Text="Buscar" />
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
                                                    <ItemTemplate><%#Eval("Nombre") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nombre"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Nombre" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("nombre")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("PorcionText") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "porcion"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Porción" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("porcion")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate> <i class="mdi mdi-eye text-primary icon-md" title='<%# Eval("Ingredientes") %>'></i></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ingredientes"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Ingredientes" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("ingredientes")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate> <i class="mdi mdi-atom text-primary icon-md" title='<%# Eval("NutrientesText") %>'></i></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nutrientes"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Nutrientes" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("nutrientes")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <a href="<%# String.Format("FormularioProducto?pro={0}", Eval("ID")) %>" class="mr-3">
                                                            <i class="mdi mdi-pencil text-dark icon-md"></i>
                                                        </a>
                                                        <a style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("id") %>');" href="#">
                                                            <i class="mdi mdi-delete text-danger icon-md"></i>
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

                        <asp:HyperLink ID="h_nombre" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nombre"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Nombre" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("nombre")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_tipo_porcion" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "porcion"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Porción" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("porcion")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_alertas" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "alertas"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Alertas" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("alertas")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_ingredientes" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ingredientes"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Ingredientes" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("ingredientes")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_nutrientes" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nutrientes"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Nutrientes" NavigateUrl='<%#string.Format("/ListadoProductos?{0}",GetSortLink("nutrientes")) %>'></asp:HyperLink>
                        <div class="row mt-2">
                            <asp:Repeater ID="rpt_viajes" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="card card-statistics">
                                            <div class="card-body">
                                                <a class="text-black" href="<%# String.Format("FormularioProducto?pro={0}", Eval("ID")) %>">

                                                    <div class="wrapper d-flex justify-content-between">
                                                        <div class="side-left">
                                                            <p class="display-6 mb-1 font-weight-light">
                                                                <asp:Label Text='<%# Eval("nombre") %>' runat="server" />
                                                            </p>
                                                            <p class="mb-1">
                                                                <asp:Label Text='<%# Eval("PorcionText") %>' runat="server" />
                                                            </p>

                                                            <a class="text-warning" href="<%# String.Format("ListadoProductos?pro={0}", Eval("ID")) %>"><i class="mdi  mdi-receipt icon-md "></i></a>
                                                            <a class="text-muted" href="<%# String.Format("FormularioProducto?pro={0}", Eval("ID")) %>"><i class="mdi  mdi-pencil icon-md ml-2 "></i></a>
                                                            <a style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("id") %>');" href="#">
                                                                <i class="mdi mdi-delete text-black icon-md"></i>
                                                            </a>
                                                        </div>
                                                        <div class="side-right text-right font-weight-light">
                                                            <p>
                                                                <asp:Label Text='<%#Eval("Ingredientes") %>' runat="server" />
                                                                <asp:Label Text='<%# Eval("NutrientesText") %>' runat="server" />
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
            </form>
        </div>
    </div>
</asp:Content>
