<?php

$db = mysqli_connect("localhost", "root", "", "desis_db");
if (!($db))
{
    echo "Error, no se pudo conectar a la db";
    die;
}