
package Transformar;





import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;




@Path ("/TransformarMensaje")
public class TransformarMensaje {
    
    // Esta clase se encarga de la creacion del
    // XML para homologar los datos provenientes de la interfaz al XML de SOAP  
    @GET
    @Produces (MediaType.TEXT_PLAIN)
    //public String CrearXMLsoap(){
    public String CrearXMLsoap(@QueryParam ("Entrada") String Entrada ) {
       
        
        
        String Contrato = "";
        String Parametro = "";
        String NombreMetodo = "";

        
        try {
            
             String[] ArrayDatos = Entrada.split(",");
        
            if (NombreMetodo != "consultar") 
            {
             String ValorFactura = "";
             ValorFactura = ArrayDatos[3];
                    
            }
         
                Contrato = ArrayDatos[0];
                Parametro = ArrayDatos[1];
                NombreMetodo = ArrayDatos[2];
                
                Contrato = Contrato.replaceAll("Parametro", Parametro);
            
        } 
        catch (Exception e)
        {
            
            return "Error al Transformar el mensaje: "+e.toString();
        }
        
        return Contrato;
        
     }
      
}

