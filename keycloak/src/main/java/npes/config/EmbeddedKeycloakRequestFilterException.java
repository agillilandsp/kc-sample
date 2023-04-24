package npes.config;
public class EmbeddedKeycloakRequestFilterException extends RuntimeException {

    public EmbeddedKeycloakRequestFilterException(Throwable e){
        super(e);
    }
    
    public EmbeddedKeycloakRequestFilterException(String message, Throwable e){
        super(message, e);
    }

}