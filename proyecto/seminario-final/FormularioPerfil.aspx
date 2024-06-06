<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioPerfil.aspx.cs" Inherits="seminario_final.FormularioPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
                <form class="forms-sample" runat="server">
                    <div class="row">
                        <div class="col-12 ">
                            <h2 class="text-center">Perfil</h2>
                            <div class="row">
                                <div class="col-6 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="txt_nombre">Nombre <small class="text-danger">*</small></label>
                                                <asp:TextBox placeholder="Nombre de la alerta" ID="txt_nombre" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
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
                                            <asp:Button CssClass="btn btn-primary col-3 col-md-2" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
                                            <button type="button" class="btn btn-light no-print" onclick="history.go(-1);">Cancelar</button>
                                            <div>
                                                <div>
                                                    <div>
                                                        <br>
                                                        <br>
                                                        <button class="btn">Cancelar</button>
                                                        <button class="btn btn-primary">Guardar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
        </div>

    </div>


</asp:Content>
