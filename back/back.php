<?php
require 'conex.php';
global $db;

// Permite consultar las regiones almacenadas.
if($_POST['traer_regiones'] == 1){
    $regiones = array();

    $stmt_q = mysqli_prepare($db, "SELECT id, nombre from region");
    mysqli_stmt_execute($stmt_q);
    $res_q = mysqli_stmt_get_result($stmt_q);

    while ($row = mysqli_fetch_assoc($res_q)) {
        array_push($regiones, array(
            "id" => $row['id'],
            "region" => $row['nombre']
        ));
    }

    echo json_encode($regiones);
    die;
}

// Permite consultar los candidatos almacenados.
if($_POST['traer_candidato'] == 1){
    $candidato = array();

    $stmt_q = mysqli_prepare($db, "SELECT id, nombre from candidato");
    mysqli_stmt_execute($stmt_q);
    $res_q = mysqli_stmt_get_result($stmt_q);

    while ($row = mysqli_fetch_assoc($res_q)) {
        array_push($candidato, array(
            "id" => $row['id'],
            "nombre" => $row['nombre']
        ));
    }

    echo json_encode($candidato);
    die;
}

// Permite filtrar las comunas pertenecientes a una región en especifico.
if($_POST['filtrar_comunas'] == 1){
    $comunas = array();

    $region_id = $_POST['region_id'];

    $stmt_q = mysqli_prepare($db, "SELECT c.id, c.nombre FROM comuna c
    LEFT JOIN region r on r.id = c.id_region WHERE r.id = ?");
    mysqli_stmt_bind_param($stmt_q, "i", $region_id);
    mysqli_stmt_execute($stmt_q);
    $result = mysqli_stmt_get_result($stmt_q);
    while($row = mysqli_fetch_assoc($result)){
        array_push($comunas, array(
            "id" => $row['id'],
            "comuna" => $row['nombre'],
        ));
    }

    echo json_encode($comunas);
    die;
}

// Permite traer datos de "como se enteró de nosotros"
if($_POST['traer_nosotros'] == 1){
    $nos_conocio = array();

    $stmt_q = mysqli_prepare($db, "SELECT id, tipo from nosotros");
    mysqli_stmt_execute($stmt_q);
    $res_q = mysqli_stmt_get_result($stmt_q);

    while ($row = mysqli_fetch_assoc($res_q)) {
        array_push($nos_conocio, array(
            "id" => $row['id'],
            "nombre" => $row['tipo']
        ));
    }

    echo json_encode($nos_conocio);
    die;
}

// Permite registrar el voto y los datos del votante.
if($_POST['enviar_voto'] == 1){
    // Votante data
    $nombres = $_POST['nombres'];
    $alias = $_POST['alias'];
    $rut = $_POST['rut'];
    $email = $_POST['email'];

    // Voto data
    $region_id = $_POST['region_id'];
    $comuna_id = $_POST['comuna_id'];
    $id_candidato = $_POST['candidato_id'];
    $ids_nosotros = $_POST['nosotros'];

    $error = 1;
    $mensaje = "";

    // Verificamos si el rut ingresado ya votó
    $stmt_voto = mysqli_prepare($db, "SELECT rut FROM votante WHERE rut = ?");
    mysqli_stmt_bind_param($stmt_voto, "s", $rut);
    mysqli_stmt_execute($stmt_voto);
    $result_voto = mysqli_stmt_get_result($stmt_voto);

    // En caso de no existir el rut, permitimos insertar los datos del votante
    if (intval(mysqli_num_rows($result_voto)) == 0) {
        $stmt_q = mysqli_prepare($db, "INSERT INTO votante(rut, nomb_apell, alias, email) VALUES(?, ?, ?, ?)");
        mysqli_stmt_bind_param($stmt_q, "ssss", $rut, $nombres, $alias, $email);
        $q = mysqli_stmt_execute($stmt_q);

        if ($q) {

            $id_votante = mysqli_insert_id($db); // Rescatamos id de inserción del votante.
            // Insertamos voto.
            $stmt_q2 = mysqli_prepare($db, "INSERT INTO voto(id_votante, id_region, id_comuna, id_candidato) VALUES(?, ?, ?, ?)");
            mysqli_stmt_bind_param($stmt_q2, "iiii", $id_votante, $region_id, $comuna_id, $id_candidato);
            $q2 = mysqli_stmt_execute($stmt_q2);

            // Insertamos valores de checkbox "como se enteró de nosotros"
            $id_voto = mysqli_insert_id($db);
            for ($i=0; $i < count($ids_nosotros); $i++) { 
                $stmt_q4 = mysqli_prepare($db, "INSERT INTO voto_nosotros(id_voto, id_nosotros) VALUES(?, ?)");
                mysqli_stmt_bind_param($stmt_q4, "ii", $id_voto, $ids_nosotros[$i]);
                $q4 = mysqli_stmt_execute($stmt_q4);
            }

            // Verificamos si dio algun error al momento de insertar el voto, de ser así, eliminamos los datos del votante para que pueda volver a votar.
            if($q2 && $q4){
                $mensaje = "¡Votación registrada con éxito!";
                $error = 0;
            }else{
                $mensaje = "¡Ocurrio un problema al registrar el voto, vuelva a intentarlo!";

                // Eliminamos datos del votante por error al momento de registrar la votación.
                $stmt_q3 = mysqli_prepare($db, "DELETE FROM votante WHERE id = ? and rut = ?");
                mysqli_stmt_bind_param($stmt_q3, "is", $id_votante, $rut);
                $q3 = mysqli_stmt_execute($stmt_q3);
            }
        }else{
            $mensaje = "¡No se pudo registrar la votación!";
        }
    }else{
        $mensaje = "¡El rut ingresado ya voto!";
    }

    $datos['mensaje'] = $mensaje;
    $datos['error'] = $error;
    echo json_encode($datos);
    die;
}

?>