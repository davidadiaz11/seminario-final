<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoPerfiles.aspx.cs" Inherits="seminario_final.ListadoPerfiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <form id="form1" runat="server">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="wrapper d-flex justify-content-between">
                                    <h4 class="lead">Lista de Perfiles</h4>
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
                           
                                <asp:CheckBox CssClass="form-group" ID="ch_eliminados" Text="Ver perfiles eliminadas" runat="server" />
                         
                                <div class="row">
                                    <asp:Button CssClass="btn btn-primary btn-rounded  mt-2 mb-3 no-print" ID="btn_buscar" runat="server" Text="Buscar" />
                                </div>
                                <script type="text/javascript">
                                    "use strict";

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
                                                            Text="Nombre" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("nombre")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Convert.ToDateTime(Eval("FechaNacimiento")).ToString("dd/MM/yyyy") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "fechanacimiento"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Fecha Nacimiento" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("fechanacimiento")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate><%# Eval("IngredientesProhibidos") %></ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ingredientesprohibidos"? hfSortDir.Value.ToLower() : "" %>'
                                                            Text="Ingredientes prohibidos" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("ingredientesprohibidos")) %>'></asp:HyperLink>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField>
                                                      <ItemTemplate><%# Convert.ToBoolean(Eval("EsPrincipal")) ? "Sí" : "No" %></ItemTemplate>
                                                      <HeaderTemplate>
                                                          <asp:HyperLink runat="server" CssClass='<%#hfSortName.Value.ToLower() == "esprincipal"? hfSortDir.Value.ToLower() : "" %>'
                                                              Text="Es principal" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("esprincipal")) %>'></asp:HyperLink>
                                                      </HeaderTemplate>
                                                  </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>

                                                        <a href="<%# String.Format("FormularioPerfil?prf={0}", Eval("Id")) %>" class="mr-3">
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

                        <asp:HyperLink ID="h_nombre" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "nombre"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Nombre" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("nombre")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_fecha_nacimiento" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "fechanacimiento"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Fecha nacimiento" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("fechanacimiento")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_ingredientes_prohibidos" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "ingredientesprohibidos"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Ingredientes Prohibidos" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("ingredientesprohibidos")) %>'></asp:HyperLink>
                        <asp:HyperLink ID="h_es_principal" runat="server" CssClass='<%#hfSortName.Value.ToLower() == "esprincipal"? hfSortDir.Value.ToLower() : "" %>'
                            Text="Es Principal" NavigateUrl='<%#string.Format("/ListadoPerfiles?{0}",GetSortLink("esprincipal")) %>'></asp:HyperLink>
                        <div class="row mt-2">
                            <asp:Repeater ID="rpt_viajes" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-2">
                                        <div class="card card-statistics">
                                            <div class="card-body">
                                                <a class="text-black" href="<%# String.Format("FormularioPerfil?prf={0}", Eval("ID")) %>">

                                                    <div class="wrapper d-flex justify-content-between">
                                                        <div class="side-left">
                                                            <p class="display-6 mb-1 font-weight-light">
                                                                <b><asp:Label Text='<%# "Perfil: " +  Eval("Nombre") %>' runat="server" /></b>
                                                            </p> 
                                                            <p class="display-6 mb-1 font-weight-light">
                                                                <small><asp:Label Text='<%# Convert.ToBoolean(Eval("EsPrincipal")) ? "(Es principal)" : "(No es principal)" %>' runat="server" /></small>
                                                            </p>
                                                            <br />
                                                            <p class="mb-1">
                                                                <asp:Label Text='<%# "Fecha Nac: " + Convert.ToDateTime(Eval("FechaNacimiento")).ToString("dd/MM/yyyy") %>' runat="server" />
                                                            </p>
                                                        
                                                            <a class="text-muted" href="<%# String.Format("FormularioPerfil?prf={0}", Eval("ID")) %>"><i class="mdi  mdi-pencil icon-md ml-2 "></i></a>
                                                            <a style='<%# ch_eliminados.Checked ? "display:none": "" %>' onclick="eliminar('<%# Eval("id") %>');" href="#">
                                                                <i class="mdi mdi-delete text-black icon-md"></i>
                                                            </a>
                                                        </div>
                                                        <div class="side-right text-right font-weight-light">
                                                            <p>
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
                <a class="btn btn-primary mr-2 no-print" href="FormularioPerfil"><span class="menu-title">Crear Perfil</span> </a>
            </form>
        </div>
    </div>
</asp:Content>
