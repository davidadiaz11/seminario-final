using FluentValidation;

namespace seminario_final.Validators
{
    public class NutrienteAlertaValidator : AbstractValidator<ModelNutrienteAlerta>
    {
        public NutrienteAlertaValidator()
        {
            RuleFor(nutrienteAlerta => nutrienteAlerta.ValorCritico).Cascade(CascadeMode.Stop).GreaterThan(0)
                .WithMessage("El valor crítico debe ser mayor a 0")
                .InclusiveBetween(1, 100).When(nutrienteAlerta => nutrienteAlerta.TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_PORCENTUAL.ToString())
                .WithMessage("El valor crítico debe ser mayor a 0 y menor o igual a 100");

            //RuleFor(nutrienteAlerta => nutrienteAlerta.ValorCritico).Cascade(CascadeMode.Stop).InclusiveBetween(1, 100).When(nutrienteAlerta => nutrienteAlerta.TipoCalculo.NombreEnum == TiposCalculoEnum.CALCULO_PORCENTUAL.ToString())
            //    .WithMessage("El valor crítico debe ser mayor a 0 y menor o igual a 100");
        }
    }
}
