<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioProducto.aspx.cs" Inherits="seminario_final.FormularioProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <form class="forms-sample" runat="server">
                    <div class="row">
                        <div class="col-12 ">
                            <h2 class="text-center">Consulta y Modificación de producto</h2>
                            <div class="row">
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

                                            <div class="text-center">

                                                <img width="500" src="images/productos/mayonesa2.png" alt="logo" />
                                                <img width="500" src="images/productos/mayonesa.png" alt="logo" />
                                                <br>
                                                <br>
                                                <h3 id="tituloProducto" runat="server"></h3>
                                            </div>


                                            <div class="form-group">
                                                <label for="txt_nombre">Nombre <small class="text-danger">*</small></label>
                                                <asp:TextBox placeholder="Nombre del producto" ID="txt_nombre" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_nombre" ID="rf_nombre" runat="server" ErrorMessage="Ingrese Nombre"></asp:RequiredFieldValidator>
                                            </div>


                                            <div class="form-group">
                                                <label for="txt_valor_energetico">Valor energético <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_valor_energetico" min="0" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_valor_energetico" ID="rf_valor_energetico" runat="server" ErrorMessage="Ingrese Valor energético"></asp:RequiredFieldValidator>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="txt_carbohidratos">Carbohidratos <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_carbohidratos" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_carbohidratos" ID="rf_carbohidratos" runat="server" ErrorMessage="Ingrese Carbohidratos"></asp:RequiredFieldValidator>
                                            </div>
                                                   
                                            <div class="form-group">
                                                <label for="txt_azucares">Azúcares <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_azucares" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_azucares" ID="rf_azucares" runat="server" ErrorMessage="Ingrese Azúcares"></asp:RequiredFieldValidator>
                                            </div>
                                                              
                                            <div class="form-group">
                                                <label for="txt_proteinas">Proteínas <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_proteinas" min="0"  step=”any″ CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_proteinas" ID="rf_proteinas" runat="server" ErrorMessage="Ingrese Proteínas"></asp:RequiredFieldValidator>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="txt_grasas_totales">Grasas totales <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_grasas_totales" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_grasas_totales" ID="rf_grasas_totales" runat="server" ErrorMessage="Grasas totales"></asp:RequiredFieldValidator>
                                            </div>         

                                            <div class="form-group">
                                                <label for="txt_grasas_saturadas">Grasas saturadas <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_grasas_saturadas" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_grasas_saturadas" ID="rf_grasas_saturadas" runat="server" ErrorMessage="Grasas saturadas"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <label for="txt_grasas_trans">Grasas trans <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_grasas_trans" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_grasas_trans" ID="rf_grasas_trans" runat="server" ErrorMessage="Grasas trans"></asp:RequiredFieldValidator>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="txt_fibra">Fibra <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_fibra" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_fibra" ID="rf_fibra" runat="server" ErrorMessage="Ingrese Fibra"></asp:RequiredFieldValidator>
                                            </div>
                                                   
                                            <div class="form-group">
                                                <label for="txt_sodio">Sodio <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_sodio" min="0" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_sodio" ID="rf_sodio" runat="server" ErrorMessage="Ingrese Sodio"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <label for="ddl_tipo_porcion">Tipo de porción</label>
                                                <asp:DropDownList CssClass="form-control" ID="ddl_tipo_porcion" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="ddl_tipo_porcion" InitialValue="" ID="rf_tipo_porcion" runat="server" ErrorMessage="Seleccione Tipo"></asp:RequiredFieldValidator>
                                            </div>

                                              <div class="form-group">
                                                  <label for="txt_porcion">Porción <small class="text-danger">*</small></label>
                                                  <asp:TextBox ID="txt_porcion" min="0" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                                  <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_porcion" ID="rf_porcion" runat="server" ErrorMessage="Ingrese Porción"></asp:RequiredFieldValidator>
                                              </div>
                                            
                                            <div class="form-group">
                                                <label for="txt_ingredientes">Ingredientes <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_ingredientes" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_ingredientes" InitialValue="" ID="rf_ingredientes" runat="server" ErrorMessage="Ingrese Ingredientes"></asp:RequiredFieldValidator>
                                            </div>

                                            <asp:Button CssClass="btn btn-primary col-3 col-md-2" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
                                            <button type="button" class="btn btn-light no-print" onclick="history.go(-1);">Cancelar</button>
                                            <script type="text/javascript">
                                                "use strict";
                                           
                                                document.getElementById("ctl00").addEventListener('keypress', function (event) {
                                                    if (event.keyCode == 13)
                                                        event.preventDefault();
                                                })

                                            </script>
                                            <asp:HiddenField ID="hf_editar" runat="server" />


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

    </div>


</asp:Content>
