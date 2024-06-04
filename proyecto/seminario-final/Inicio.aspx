<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="seminario_final.Inicio" %>

<asp:Content ID="Content8" ContentPlaceHolderID="Cuerpo" runat="Server">
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
            <form class="forms-sample" runat="server">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                        <div class="card card-statistics">
                            <a href="NuevoAnalisis">
                                <div class="card-body">
                                    <div class="clearfix">
                                        <div class="float-left">
                                            <i class="mdi mdi-check-circle text-success icon-lg"></i>
                                        </div>
                                        <div class="float-right">
                                            <p class="mb-0 text-right text-dark">Nuevo</p>
                                            <div class="fluid-container">
                                                <h5 class="font-weight-medium text-right mb-0">Análisis</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                        <div class="card card-statistics">
                            <a href="ListadoAnalisis">
                                <div class="card-body">
                                    <div class="clearfix">
                                        <div class="float-left">
                                            <i class="mdi mdi-receipt text-warning icon-lg"></i>
                                        </div>
                                        <div class="float-right">
                                            <p class="mb-0 text-right text-dark">Ver todos</p>
                                            <div class="fluid-container">
                                                <h5 class="font-weight-medium text-right mb-0">Análisis históricos</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                        <div class="card card-statistics">
                            <a href="ListadoProductos">
                                <div class="card-body">
                                    <div class="clearfix">
                                        <div class="float-left">
                                            <i class="mdi mdi-food text-yellow icon-lg"></i>
                                        </div>
                                        <div class="float-right">
                                            <p class="mb-0 text-right text-dark">Ver todos</p>
                                            <div class="fluid-container">
                                                <h5 class="font-weight-medium text-right mb-0">Productos</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
                        <div class="card card-statistics">
                            <a href="ListadoAlertas">
                                <div class="card-body">
                                    <div class="clearfix">
                                        <div class="float-left">
                                            <i class="mdi mdi-poll-box text-info icon-lg"></i>
                                        </div>
                                        <div class="float-right">
                                            <p class="mb-0 text-right text-dark">Ver todos</p>
                                            <div class="fluid-container">
                                                <h5 class="font-weight-medium text-right mb-0">Sellos</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title text-primary text-center mb-2">Últimos Análisis</h2>
                                <hr class="hr" />
                                <asp:Repeater ID="rpt_ultimos" runat="server">
                                    <ItemTemplate>
                                        <a class="text-black" href="<%# String.Format("VerAnalisis?ahi={0}", Eval("Id")) %>">
                                            <div class="wrapper d-flex justify-content-between">
                                                <div class="side-left">
                                                    <p class="display-5 mb-1 font-weight-light">
                                                        <asp:Label Text='<%# Eval("Producto.Nombre").ToString() %>' runat="server" />
                                                    </p>
                                                    <p class="mb-1">
                                                        <asp:Label Text='<%# "Fecha: " + Eval("Fecha", "{0:dd/MM/yy}") %>' runat="server" />
                                                    </p>
                                                    <small class="text-muted">Hace <%# Math.Floor((DateTime.UtcNow.AddHours(-3).Date).Subtract(Convert.ToDateTime(Eval("Fecha")).Date).TotalDays).ToString() %> días</small>
                                                </div>
                                                <div class="side-right text-right">
                                                </div>
                                            </div>
                                        </a>
                                        <br />
                                        <hr class="hr" />
                                    </ItemTemplate>
                                    <SeparatorTemplate></SeparatorTemplate>
                                </asp:Repeater>
                                <a href="ListadoAnalisis" class="text-primary ">Ver todos</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title text-primary text-center mb-2">Últimos sellos creados</h2>
                                <hr class="hr" />
                                <asp:Repeater ID="rpt_ultimos_sellos" runat="server">
                                    <ItemTemplate>
                                        <a class="text-black" href="<%# String.Format("FormularioAlerta?anu={0}", Eval("NutrientesAlerta[0].Id")) %>">
                                            <div class="wrapper d-flex justify-content-between">
                                                <div class="side-left">
                                                    <p class="display-5 mb-1 font-weight-light">
                                                        <asp:Label Text='<%# Eval("NutrientesAlerta[0].Alerta.Leyenda").ToString() %>' runat="server" />
                                                    </p>
                                                    <p class="mb-1">
                                                        <asp:Label Text='<%# Eval("NutrientesAlerta[0].Alerta.TipoAlerta.Forma.Nombre") %>' runat="server" />
                                                        <span class="dot" style='<%# "background-color:#" + Eval("NutrientesAlerta[0].Alerta.TipoAlerta.Color.CodigoHexadecimal") %>'></span>
                                                    </p>
                                                </div>
                                                <div class="side-right text-right">
                                                    <p class="mt-2 mb-1">
                                                        <asp:Label Text='<%# "Creado el " + Eval("NutrientesAlerta[0].Alerta.FechaCreacion", "{0:dd/MM/yy}") %>' runat="server" />
                                                    </p>
                                                    <small class="text-muted">Hace <%# Math.Floor((DateTime.UtcNow.AddHours(-3).Date).Subtract(Convert.ToDateTime(Eval("NutrientesAlerta[0].Alerta.FechaCreacion")).Date).TotalDays).ToString() %> días</small>

                                                </div>
                                            </div>
                                        </a>
                                        <br />
                                        <br />
                                        <hr class="hr" />
                                    </ItemTemplate>
                                    <SeparatorTemplate></SeparatorTemplate>
                                </asp:Repeater>
                                <a href="ListadoAlertas" class="text-primary ">Ver todos</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
