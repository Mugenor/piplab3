import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("YValidator")
public class YValidator implements Validator {
    public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException{
        System.out.println(component.getClientId() + ": " + value);
        String valueStr = value.toString();
        Double x = new Double(valueStr);
        if(x<-3.0 || x>5.0){
            FacesMessage msg = new FacesMessage("Y validation failed", "Y must be in range from -3 to 5");
            msg.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(msg);
        }
    }
}
