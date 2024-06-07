<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioPerfil.aspx.cs" Inherits="seminario_final.FormularioPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="col-12 col-md-4">
                <form class="forms-sample" runat="server">
                    <div class="col-12 ">
                        <h2 class="text-center">Consulta y modificación de perfil</h2>
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="txt_nombre">Nombre <small class="text-danger">*</small></label>
                                            <asp:TextBox placeholder="Nombre del perfil" ID="txt_nombre" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_nombre" ID="rf_nombre" runat="server" ErrorMessage="Ingrese Nombre"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="txt_fecha_nacimiento">Fecha de nacimiento <small class="text-danger">*</small></label>
                                            <asp:TextBox ID="txt_fecha_nacimiento" TextMode="Date" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_fecha_nacimiento" ID="rf_fecha_nacimiento" runat="server" ErrorMessage="Seleccione Fecha de nacimiento"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="txt_nombre">Ingredientes prohibidos</label>
                                            <asp:TextBox TextMode="MultiLine" Rows="3" placeholder="Azúcar; Cacao; Maní" ID="txt_ingredientes_prohibidos" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Button CssClass="btn btn-primary col-5 col-md-4" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
                                        <asp:Button CssClass="btn btn-light col-5 col-md-4" runat="server" Text="Cancelar" OnClientClick="history.go(-1);" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
