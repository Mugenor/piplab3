import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("RValidator")
public class RValidator implements Validator {
    public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException {
        System.out.println(component.getClientId() + ": " + value);
        String valueStr = value.toString();
        Double x = new Double(valueStr);
        if(x<1.0 || x>4.0){
            FacesMessage msg = new FacesMessage("R validation failed", "R must be in range from 1 to 4");
            msg.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(msg);
        }
    }
}
