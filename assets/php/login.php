<?php

//valores
$usuario = $_POST['user'];
$password = $_POST['pass'];

//Prevenir sql Injection
$usuario = stripcslashes($usuario);
$password = stripcslashes($password);
$usuario = mysql_real_escape_string($usuario);
$password = mysql_real_escape_string($password);

//conectar al sever y usar base de datos
mysql_connect("localhost", "root", "");
mysql_select_db("mapacalordb");

//el query hacia la base de datos
$result =mysql_query("select * from usuarios where usuario= '$usuario' and passsword ='$password'")
                or die("No pudo conectarse a la base de datos".mysql_error());
$row = mysql_fetch_array($result);
if ($row['usuario'] == $usuario && $row['password'] == $password)
    {
        echo "Bienvenido ".$row['usuario'];
    } else { echo "Error";}

?>