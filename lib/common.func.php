<?php
/**
 * Created by PhpStorm.
 * User: cpf
 * Date: 2016/12/2
 * Time: 15:35
 */

function alertMes($mes, $url){
    echo "<script>alert('{$mes}')</script>";
    echo "<script>window.location='{$url}';</script>";
}

