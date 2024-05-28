using FluentValidation;

namespace seminario_final.Validators
{
    public class AlertaValidator : AbstractValidator<ModelAlerta>
    {
        public AlertaValidator()
        {
            RuleFor(alerta => alerta.Nombre).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("El {PropertyName} es requerido");
            RuleFor(alerta => alerta.Leyenda).Cascade(CascadeMode.Stop).NotEmpty().WithMessage("La {PropertyName} es requerida");
            RuleFor(alerta => alerta.TipoAlerta.Id).Cascade(CascadeMode.Stop).NotEmpty().When(alerta => alerta.Id > 0).WithMessage("El tipo de alerta es requerido");
        }
    }
}
