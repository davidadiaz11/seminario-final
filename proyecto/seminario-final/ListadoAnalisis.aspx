<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoAnalisis.aspx.cs" Inherits="seminario_final.ListadoAnalisis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

    <form class="forms-sample" runat="server">
                        <div class="row">
                            <div class="col-12 ">
                                        <h2 class="text-center">Registro histórico de análisis realizados</h2>
                                        <div class="row">


                                            <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">


<div class="row">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <a class="@(hfSortName.ToLower() == "fecha" ? hfSortDir : "")" href="#">Fecha</a>
                                                        </th>
                                                        <th>
                                                            <a class="@(hfSortName.ToLower() == "tipo" ? hfSortDir : "")" href="#">Producto</a>
                                                        </th>

                                                        <th>
                                                            <a class="@(hfSortName.ToLower() == "cliente" ? hfSortDir : "")" href="#">Sellos</a>
                                                        </th>

                                                      
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                        <tr>
                                                            <td>01/05/2023</td>
                                                            <td>Mayonesa Light</td>
                                                            <td>Exceso en grasas totales, Exceso en sodio</td>
                                                            
                                                            <td>
                                                                <a class="text-dark mr-3" href="#">
                                                                    <i class="mdi mdi-eye icon-md"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                </tbody>

                                            </table>
                                        </div>
                                        <p class="badge badge-success font-weight-normal mt-2 mr-4" runat="server" id="span_mensaje">1 análisis encontrado</p>
                                        <div class="btn-group-sm" role="group">
                                            
                                        </div>
                                    </div>


                                            <div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
                                   
                     
                       

                    </form>
</asp:Content>
