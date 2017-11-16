package Transformar;


import java.io.StringWriter;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerException;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

@Path ("/XML")

public class ConvertirXML {
    
    @GET
    @Produces (MediaType.TEXT_HTML)
    public String ConvertirXML(@QueryParam ("Entrada") String Entrada ){
        
        String resp = "";
        String XMLEntrada = "";
        String XSLPlantilla = "";
        
        try {
            
            String[] ArrayDatos = Entrada.split(",");
            XMLEntrada = ArrayDatos[0];
            XSLPlantilla = ArrayDatos[1];
          
            TransformerFactory factory = TransformerFactory.newInstance();
            StreamSource xslStream = new StreamSource(XSLPlantilla);
            
            StreamSource in = new StreamSource(XMLEntrada);
            StringWriter writer = new StringWriter();
            StreamResult out = new StreamResult(writer);
           
            try {
                
                Transformer transformer = factory.newTransformer(xslStream); // Plantilla
                transformer.transform(in, out);
                resp = writer.toString() ;
            
            } 
            catch (TransformerException e) {
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            
           return "Error al Convertir XML: " + e.toString(); 
        }
          
        return resp ;

    }
    
}

