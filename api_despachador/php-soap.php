<?php
ini_set('soap.wsdl_cache_enabled', 0);
ini_set('soap.wsdl_cache_ttl', 900);
ini_set('default_socket_timeout', 15);

class ClienteSoap
{
    // Declaración de una propiedad
    #public $var = 'un valor predeterminado';
	public $params;

    // Declaración de un método
    public function Consumir($param1) {
        echo $this->params;
    }
}


$params = array('param1'=>$param1);


$wsdl = 'http://service_url/method?WSDL';

$options = array(
		'uri'=>'http://schemas.xmlsoap.org/soap/envelope/',
		'style'=>SOAP_RPC,
		'use'=>SOAP_ENCODED,
		'soap_version'=>SOAP_1_1,
		'cache_wsdl'=>WSDL_CACHE_NONE,
		'connection_timeout'=>15,
		'trace'=>true,
		'encoding'=>'UTF-8',
		'exceptions'=>true,
	);
try {
	$soap = new SoapClient($wsdl, $options);
	$data = $soap->method($params);
}
catch(Exception $e) {
	die($e->getMessage());
}
  
var_dump($data);


?>