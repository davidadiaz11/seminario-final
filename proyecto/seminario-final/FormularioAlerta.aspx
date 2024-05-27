﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioAlerta.aspx.cs" Inherits="seminario_final.FormularioAlerta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <form class="forms-sample" runat="server">
                    <div class="row">
                        <div class="col-12 ">
                            <h2 class="text-center">Consulta y Modificación de alerta</h2>
                            <div class="row">
                                <div class="col-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">

                                            <div class="text-center">

                                                <%--<img width="200" src="images/sellos/exceso_en_sodio.png" alt="logo" />--%>
                                                <br>
                                                <br>
                                                <h3 id="tituloAlerta" runat="server"></h3>
                                            </div>

                                                      
                                            <div class="form-group">
                                                <label for="txt_nombre">Nombre <small class="text-danger">*</small></label>
                                                <asp:TextBox placeholder="Nombre de la alerta" ID="txt_nombre" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_nombre" ID="rf_nombre" runat="server" ErrorMessage="Ingrese Nombre"></asp:RequiredFieldValidator>
                                            </div>
                                            

                                            <div class="form-group">
                                                <label for="txt_leyenda">Leyenda <small class="text-danger">*</small></label>
                                                <asp:TextBox placeholder="Excedido en..." ID="txt_leyenda" AutoCompleteType="Disabled" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_leyenda" ID="rf_leyenda" runat="server" ErrorMessage="Ingrese Leyenda"></asp:RequiredFieldValidator>
                                            </div>

                                            
                                            <div class="form-group">
                                                <label for="ddl_forma">Forma</label>
                                                <asp:DropDownList CssClass="form-control" ID="ddl_forma" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="ddl_forma" InitialValue="" ID="rf_forma" runat="server" ErrorMessage="Seleccione Tipo"></asp:RequiredFieldValidator>
                                            </div>
                                                        
                                            <div class="form-group">
                                                <label for="ddl_color">Color</label>
                                                <asp:DropDownList CssClass="form-control" ID="ddl_color" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="ddl_color" InitialValue="" ID="rf_color" runat="server" ErrorMessage="Seleccione Tipo"></asp:RequiredFieldValidator>
                                            </div>
                                                  
                                            <div class="form-group">
                                                <label for="ddl_nutriente">Nutriente</label>
                                                <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddl_nutriente_SelectedIndexChanged"  CssClass="form-control" ID="ddl_nutriente" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="ddl_nutriente" InitialValue="" ID="rf_nutriente" runat="server" ErrorMessage="Seleccione Nutriente"></asp:RequiredFieldValidator>
                                            </div>


                                            <div class="form-group">
                                                 <label for="ddl_forma">Tipo de cálculo</label>
                                                 <asp:DropDownList CssClass="form-control" ID="ddl_tipoCalculo" runat="server">
                                                 </asp:DropDownList>
                                                 <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="ddl_tipoCalculo" InitialValue="" ID="rf_tipoCalculo" runat="server" ErrorMessage="Seleccione Tipo de cálculo"></asp:RequiredFieldValidator>
                                             </div>
                                            
                                            <div class="form-group">
                                                 <label for="ddl_forma">Criterio</label>
                                                 <asp:DropDownList CssClass="form-control" ID="ddl_criterio" runat="server">
                                                     <asp:ListItem Value="<"> Menor o igual </asp:ListItem>
                                                     <asp:ListItem Value=">"> Mayor o igual </asp:ListItem>
                                                 </asp:DropDownList>
                                                 <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="ddl_criterio" InitialValue="" ID="rf_criterio" runat="server" ErrorMessage="Seleccione Tipo"></asp:RequiredFieldValidator>
                                             </div>


                                            <div class="form-group">
                                                <label for="txt_valor_critico">Valor crítico <small class="text-danger">*</small></label>
                                                <asp:TextBox ID="txt_valor_critico" min="0" placeholder="De 0 a 100" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="p-0 text-danger small" ControlToValidate="txt_valor_critico" ID="rf_valor_critico" runat="server" ErrorMessage="Ingrese porcentaje crítico"></asp:RequiredFieldValidator>
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
