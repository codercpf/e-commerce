<?php
/**
 * Created by PhpStorm.
 * User: cpf
 * Date: 2016/12/2
 * Time: 15:35
 */

function connect(){
    $link = mysql_connect(DB_HOST,DB_USER,DB_PWD) or die("���ݿ�����ʧ��");
    mysql_set_charset(DB_CHARSET);
    mysql_select_db(DB_DBNAME) or die("ָ�����ݿ��ʧ��");

}

//��������  $array=array()
function insert($table, $array){
    $keys = join(",", array_keys($array));
    $vals = "'".join("','",array_values($array))."'";
    $sql = "insert {$table}($keys) values({$vals})";
    mysql_query($sql);
    return mysql_insert_id();       //���ز������ݵ�ID
}

//��������  $array=array()
//update imooc_admin set username='king' where id=1
function update($table, $array, $where=null){
    foreach($array as $key=>$val){
        if($str==null){
            $sep="";
        }else{
            $sep=",";
        }
        $str .= $sep.$key."='".$val."'";
    }
        $sql = "update {$table} set {$str} ".($where==null?null:" where ".$where);
        mysql_query($sql);
        return mysql_affected_rows();       //������Ӱ���¼������
}

//ɾ������
function delete($table, $where=null){
    $where = $where==null ? null : " where ".$where;
    $sql = "delete from {$table} {where}";
    mysql_query($sql);
    return mysql_affected_rows();
}

//��ѯһ����¼
function fetchOne($sql, $result_type=MYSQL_ASSOC){
    $result = mysql_query($sql);
    $row = mysql_fetch_array($result, $result_type);
    return $row;
}

//��ѯ���м�¼
function fetchAll($sql, $result_type=MYSQL_ASSOC){
    $rows=array();
    $result = mysql_query($sql);
    while(@$row=mysql_fetch_array($result,$result_type)){
        $rows[] = $row;
    }
    return $rows;
}

//�õ�������м�¼����
function getResultNum($sql){
    $result = mysql_query($sql);
    return mysql_num_rows($result);
}




