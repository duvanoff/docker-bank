<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


require 'vendor/autoload.php';
//include 'API.php';

$app = new \Slim\App();

$app->get('/despachar/{valor}', function (Request $request, Response $response) {
    
	$valor = $request->getAttribute('valor');

    
	//$mensaje= '{"consumo":{"host":"http://localhost/api/index.php/sumas/","tipo_servicio":"REST"},"metodo":{"nombre":"consultar","tipo_http":"GET"},"contrato":""}';
     
	//$mensajeDecode=json_decode($mensaje, true);
	//$url=$mensajeDecode["consumo"]["host"];
	/*$url="http://localhost/api/index.php/"
	$parametros= array("sumas" => "1"));
	$mensajeDecode['tipo_http']="GET";
	
	$rs 	= API::GET($URL.'sumas/1/2',$token);
	$array  = API::JSON_TO_ARRAY($rs);*/
	
	//$mensajeDecode=json_decode($mensaje, true);
/*
	if ($mensajeDecode["consumo"]['tipo_servicio']=="REST"){
		switch ($mensajeDecode['tipo_http']) {
			case "GET":
				  $respuesta=sendGet($url,$parametros);
				break;
			case "POST":
				  $respuesta=sendPost($url,$parametros);
				break;
			case "PUT":
				  $respuesta=sendPut($url,$parametros);
				break;
			case "DELETE":
				 $respuesta=sendDelete($url,$parametros);
				break;
		}
	}else if($mensajeDecode["consumo"]['tipo_servicio']=="SOAP"){
		
	}*/
	
	
	$data=$array;
    $newResponse = $response->withHeader('Content-type', 'application/json');
    $newResponse = $response->withJson($data);
  
    return $valor;
	//var_dump($respuesta);
  
});

$app->run();

/*
	public function sendGet($url,$parametros)
{

          //datos a enviar
            $data = $parametros;
            //url contra la que atacamos
            $ch = curl_init($url);
            //a true, obtendremos una respuesta de la url, en otro caso, 
            //true si es correcto, false si no lo es
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            //establecemos el verbo http que queremos utilizar para la petición
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
            //enviamos el array data
            curl_setopt($ch, CURLOPT_POSTFIELDS,http_build_query($data));
            //obtenemos la respuesta
            $response = curl_exec($ch);
            // Se cierra el recurso CURL y se liberan los recursos del sistema
            curl_close($ch);
            if(!$response) {
                return false;
            }else{
                return $response;
            }
        
}

public function sendPost()
{
	//datos a enviar
	$data = array("a" => "a");
	//url contra la que atacamos
	$ch = curl_init("http://localhost/API/post");
	//a true, obtendremos una respuesta de la url, en otro caso, 
	//true si es correcto, false si no lo es
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	//establecemos el verbo http que queremos utilizar para la petición
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
	//enviamos el array data
	curl_setopt($ch, CURLOPT_POSTFIELDS,http_build_query($data));
	//obtenemos la respuesta
	$response = curl_exec($ch);
	// Se cierra el recurso CURL y se liberan los recursos del sistema
	curl_close($ch);
	if(!$response) {
		return false;
	}else{
		return $response;
	}
}

public function sendPut()
{
	//datos a enviar
	$data = array("a" => "a");
	//url contra la que atacamos
	$ch = curl_init("http://localhost/WebService/API_Rest/api.php");
	//a true, obtendremos una respuesta de la url, en otro caso, 
	//true si es correcto, false si no lo es
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	//establecemos el verbo http que queremos utilizar para la petición
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
	//enviamos el array data
	curl_setopt($ch, CURLOPT_POSTFIELDS,http_build_query($data));
	//obtenemos la respuesta
	$response = curl_exec($ch);
	// Se cierra el recurso CURL y se liberan los recursos del sistema
	curl_close($ch);
	if(!$response) {
		return false;
	}else{
		var_dump($response);
	}
}



public function sendDelete()
{
	//datos a enviar
	$data = array("a" => "a");
	//url contra la que atacamos
	$ch = curl_init("http://localhost/WebService/API_Rest/api.php");
	//a true, obtendremos una respuesta de la url, en otro caso, 
	//true si es correcto, false si no lo es
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	//establecemos el verbo http que queremos utilizar para la petición
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
	//enviamos el array data
	curl_setopt($ch, CURLOPT_POSTFIELDS,http_build_query($data));
	//obtenemos la respuesta
	$response = curl_exec($ch);
	// Se cierra el recurso CURL y se liberan los recursos del sistema
	curl_close($ch);
	if(!$response) {
		return false;
	}else{
		var_dump($response);
	}
}
*/


