import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

@FacesValidator("XValidator")
public class XValidator implements Validator {
    public void validate(FacesContext context, UIComponent component, Object value) throws ValidatorException{
        System.out.println(component.getClientId() + ": " + value);
        String valueStr = value.toString();
            Double x = new Double(valueStr);
            if(x<-2.0 || x>2.0){
                FacesMessage msg = new FacesMessage("X validation failed", "X must be in range from -2 to 2");
                msg.setSeverity(FacesMessage.SEVERITY_ERROR);
                throw new ValidatorException(msg);
            }
    }
}
