<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConfiguracionPerfiiles.aspx.cs" Inherits="seminario_final.ConfiguracionPerfiiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

    <form class="forms-sample" runat="server">
        <div class="row">
            <div class="col-12 ">
                <h2 class="text-center">Configuración de Perfiles</h2>
                <div class="row">


                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">

                                <div class="text-center">

                                    <img width="500" src="images/user.png" alt="logo" />
                                    <br>
                                    <br>
                                    <h3>Perfil principal: Mariano</h3>
                                </div>


                                <br>

                                <div class="form-group col-2">
                                    <label for="txt_cuit">Fecha de nacimiento <small class="text-danger">*</small></label>
                                    <input id="txtNombre" type="date" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-3">
                                    <label for="txt_cuit">Lista de ingredientes intolerados</label>
                                    <input type="text" class="form-control" value="Orégano, aceite de girasol" />
                                    <br>
                                </div>

                                <hr>

                                <br>

                                <div class="col-12 text-center">
                                    <label class="h4">Otros perfiles:</label><img width="70" src="images/user-rosa.png" alt="logo" />
                                    Juli
                                </div>


                                <br>

                                <h3>Agrega nuevo perfil</h3>
                                <br>
                                <br>
                                <div class="form-group col-2">
                                    <label for="txt_cuit">Nombre <small class="text-danger">*</small></label>
                                    <input id="txtNombre" type="text" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-2">
                                    <label for="txt_cuit">Fecha de nacimiento <small class="text-danger">*</small></label>
                                    <input id="txtNombre" type="date" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-3">
                                    <label for="txt_cuit">Lista de ingredientes intolerados </label>
                                    <input type="text" class="form-control" value="" />


                                </div>

                                <br>

                                <br>

                                <div>
                                </div>
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
</asp:Content>
