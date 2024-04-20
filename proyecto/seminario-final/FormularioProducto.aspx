<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioProducto.aspx.cs" Inherits="seminario_final.FormularioProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Cuerpo" runat="server">

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
                                    <h3>Mayonesa Hellmann's Light</h3>
                                </div>


                                <br>
                                <br>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Valor energético <small class="text-danger">*</small></label>
                                    <input id="txtNombre" type="text" value="22" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Carbohidratos <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="1,2" class="form-control" autocomplete="off" required />
                                </div>

                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Azúcares <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="0,5" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Proteínas <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="0" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Grasas totales <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="1,9" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Grasas saturadas<small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="0" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Grasas trans <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="0" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Fibra alimentaria <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="0" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-1">
                                    <label for="txt_cuit">Sodio <small class="text-danger">*</small></label>
                                    <input id="txtPassword" type="text" value="89" class="form-control" autocomplete="off" required />
                                </div>
                                <br>
                                <div class="form-group col-6">
                                    <label for="txt_cuit">Ingredientes <small class="text-danger">*</small></label>
                                    <textarea rows="4" id="txtPassword" type="text" class="form-control" autocomplete="off" required />agua, aceite de girasol, almidón modificado, huevo líquido, azúcar, vinagre de alcohol, sal, jugo concentrado de limón, estabilizante: goma xántica, acidulante: ácido fosfórico, conservador: ácido sórbico, aromatizantes: idénticos al natural y naturales, secuestrante: EDTA disódico cálcico, antioxidantes: BHA, BHT y colorante: betacaroteno. Contiene Huevo. </textarea>
                                </div>

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
