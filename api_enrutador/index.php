<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require 'vendor/autoload.php';

$app = new \Slim\App();

$app->get('/enrutar/{valor}/{numero}', function (Request $request, Response $response) {
    $valor = $request->getAttribute('valor');
    $numero = $request->getAttribute('numero');
    $bines = substr($numero, 0, 3); 
	
	$datos_consumo=getProveedor($bines);
	$datos_metodo=getMetodo($valor);
	$datos_contrato=getContrato($bines,$valor);
	
	$data = array('consumo' => $datos_consumo,
				  'metodo' => $datos_metodo,
				  'contrato' => $datos_contrato
				);
    $newResponse = $response->withHeader('Content-type', 'application/json');
    $newResponse = $response->withJson($data);
  
    return $newResponse;
  
});

$app->run();

function conexion(){
$servername = "localhost";
$username = "root";
$password = "root";
$baseDatos="banco";

// Create connection
$con=mysqli_connect($servername,$username ,$password ,$baseDatos);

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

  
 return $con;
}

function getProveedor($bines){
	$con=conexion();
	$result = mysqli_query($con,"SELECT a.`host`,a.`tipo_servicio` FROM `proveedor_servicio`a WHERE a.`id`='".$bines."';");
	$respuesta= array();
	
	if (mysqli_num_rows($result) > 0) {
		// output data of each row
		while($row = mysqli_fetch_assoc($result)) {
			$respuesta["host"]=$row["host"];
			$respuesta["tipo_servicio"]=$row["tipo_servicio"];
		}
		return $respuesta;
	} 
	return false;

	mysqli_close($con);	
}

function getMetodo($valor){
	$con=conexion();
	$result = mysqli_query($con,"SELECT a.`nombre`,a.`tipo_http` FROM `metodos_consumo` a WHERE a.`id`='".$valor."';");
	$respuesta= array();
	
	if (mysqli_num_rows($result) > 0) {
		// output data of each row
		while($row = mysqli_fetch_assoc($result)) {
			$respuesta["nombre"]=$row["nombre"];
			$respuesta["tipo_http"]=$row["tipo_http"];
		}
		return $respuesta;
	} 
	return false;

	mysqli_close($con);	
}

function getContrato($bines,$valor){
	$con=conexion();
	$result = mysqli_query($con,"SELECT a.`contrato` FROM `proveedor_contrato` a WHERE a.`id_proveedor`='".$bines."' AND a.`id_metodo`='".$valor."';");
	$respuesta="";
	
	if (mysqli_num_rows($result) > 0) {
		// output data of each row
		while($row = mysqli_fetch_assoc($result)) {
			$respuesta=$row["contrato"];
		}
		return $respuesta;
	} 
	return false;

	mysqli_close($con);	
}