<?php

/**
 * 
 * Esta clase contiene metodos de uso general en todo el proyecto
 * 
 * @date 2009-05-04
 * @author Gary Rojas
 *
 */
class Utils
{

  /**
   * Devuelve el nombre de subdominio de una URL dada
   *
   * @param string $url, una URL valida
   * @param string $hostname
   * @return string
   *
   */
    private $frontend_routing = null, $help_routing = null, $panel_routing = null, $seller_routing = null, $backend_routing = null;

    public static function getSubdomain($url, $hostname)
    {
      $url = str_replace('http://', '', $url);
      $domain = "\." . implode("\.", explode(".", trim($hostname)));

      $pattern = "([^.|^www]+)$domain";
      if (!ereg($pattern, $url, $regs)) {
        $subdomain = "";
      } else {
        if ($regs[1] != "www") {
          $subdomain = $regs[1];
        } else {
          $subdomain = "";
        }
      }

      return $subdomain;
    }

    /**
     * Devuelve una cadena formateada de la fecha pasada como parametro.
     * El formato usado es el mismo que se usa para PHP, pero solo usamos los siguientes:
     * %d = 01-31; 
     * %l ('L' minuscula) = Nombre del dia (domingo, lunes, martes, ... ); 
     * %D = Nombre corto del dia en tres letras (dom, lun, mar, mie, jue, vie, sab)
     * %m = 01-12;   
     * %F = Nombre del Mes (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre); 
     * %M = Nombre corto del mes en tres letras (ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic)   
     * %Y = Anio: 0000-9999; 
     * %H = Horas: 01-24; 
     * %i = Minutos: 00-59; 
     * %s = Segundos: 00-59 
     * dia de la semana: 0:Domingo, 1:Lunes, 2: Martes ... 6:Sabado
     * 
     * @param string $date, La fecha a ser formateda, debe estar en el formato PHP: Y-m-d H:i:s, o en ISO: yyyy-mm-dd hh:mm:ss
     * @param string $format, formato al que se desea pasar la fecha dada
     * @return string  
     * 
     */
    public static function getFormattedDate($date, $format = '%d %M %Y')
    {
      $day_number = array(1, 7, 6, 5, 4, 3, 2);
      $day_names = array('Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado');
      $month_names = array('', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
      $month_abrev = array('', 'Ene', 'Febr', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic');
      if (!$date)
        return false;
      extract(getdate(strtotime($date)));

      $options['%d'] = ($mday < 10) ? '0' . $mday : $mday;
      $options['%m'] = ($mon < 10) ? '0' . $mon : $mon;
      $options['%Y'] = $year;
      $options['%y'] = substr($year, 2, 2);
      $options['%H'] = ($hours < 10) ? '0' . $hours : $hours;
      $options['%i'] = ($minutes < 10) ? '0' . $minutes : $minutes;
      $options['%s'] = ($seconds < 10) ? '0' . $seconds : $seconds;
      $options['%l'] = $day_names[(int) $wday];
      $options['%n'] = $day_number[(int) $wday];
      $options['%D'] = substr($day_names[(int) $wday], 0, 3);
      $options['%F'] = $month_names[(int) $mon];
      $options['%f'] = $month_abrev[(int) $mon];
      $options['%M'] = substr($month_names[(int) $mon], 0, 3);


      $keys = array();
      $values = array();
      foreach ($options as $k => $v) {
        $keys[] = $k;
        $values[] = $v;
      }

      return str_replace($keys, $values, $format);
    }

    /**
     * Devuelve la fecha resultante despues de agregar el periodo requerido
     *
     * @param string $date, La fecha a la cual se agregara el periodo, debe estar en el formato PHP: Y-m-d H:i:s, o en ISO: yyyy-mm-dd hh:mm:ss
     * @param integer $period, periodo a agregar
     * @param string $type, tipo de tiempo (d: dias, m: meses, y: anios, H: horas, i: minutos, s: segundos)
     * @return string
     *
     */
    public static function addPeriod($date, $period = 0, $type = 'd')
    {
      extract(getdate(strtotime($date)));
      if ($type == 'd')
        $mkdate_end = mktime($hours, $minutes, $seconds, $mon, $mday + $period, $year);
      elseif ($type == 'm')
        $mkdate_end = mktime($hours, $minutes, $seconds, $mon + $period, $mday, $year);
      elseif ($type == 'Y')
        $mkdate_end = mktime($hours, $minutes, $seconds, $mon, $mday, $year + $period);
      elseif ($type == 'H')
        $mkdate_end = mktime($hours + $period, $minutes, $seconds, $mon, $mday, $year);
      elseif ($type == 'i')
        $mkdate_end = mktime($hours, $minutes + $period, $seconds, $mon, $mday, $year);
      elseif ($type == 's')
        $mkdate_end = mktime($hours, $minutes, $seconds + $period, $mon, $mday, $year);

      return date('Y-m-d H:i:s', $mkdate_end);
    }

    /**
     * Devuelve el contenido de la pagina web que se le pasa como parametro.
     * Es similar a file_get_contents cuando se le pasa una URL como parametro. Debe estar habilitada
     * la extension CURL.
     *
     * @param string $url, una URL valida
     * @return string
     */
    public static function fileGetContents($url)
    {
      $ch = curl_init();
      $timeout = 60; // asignamos cero para que espere infinitamente
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
      $retval = curl_exec($ch);
      if (curl_getinfo($ch, CURLINFO_HTTP_CODE) !== 200) {
        return false;
      }

      curl_close($ch);

      return $retval;
    }

    /**
     * Verfica si una cadena esta codificada en UTF-8
     *
     * Yi Stone Li<yili@yahoo-inc.com>
     * Copyright (c) 2007 Yahoo! Inc. All rights reserved.
     * Licensed under the BSD open source license
     *
     * @param string
     *
     * @return bool true si $string es una cadena UTF-8 y false en caso contrario.
     */
    public static function isUTF8($string)
    {
      for ($idx = 0, $strlen = strlen($string); $idx < $strlen; $idx++) {
        $byte = ord($string[$idx]);

        if ($byte & 0x80) {
          if (($byte & 0xE0) == 0xC0) {
            $bytes_remaining = 1; // 2 byte char
          } elseif (($byte & 0xF0) == 0xE0) {
            $bytes_remaining = 2; // 3 byte char
          } elseif (($byte & 0xF8) == 0xF0) {
            $bytes_remaining = 3; // 4 byte char
          } else {
            return false;
          }

          if ($idx + $bytes_remaining >= $strlen) {
            return false;
          }

          while ($bytes_remaining--) {
            if ((ord($string[++$idx]) & 0xC0) != 0x80) {
              return false;
            }
          }
        }
      }

      return true;
    }

    /**
     * Devuelve la cantidad de bytes de una cadena que puede estar 
     * codificada en  ASCII o UTF-8
     * Este script ha sido tomado de php.net
     *
     * @param string
     *
     * @return integer
     */
    public static function strlenUTF8($str)
    {
      //cantidad de caracteres de la cadena
      $strlen_var = strlen($str);

      // string bytes counter
      $d = 0;

      /*
       * Iterate over every character in the string,
       * escaping with a slash or encoding to UTF-8 where necessary
       */
      for ($c = 0; $c < $strlen_var; ++$c) {

        $ord_var_c = ord($str{$d});

        switch (true) {
          case (($ord_var_c >= 0x20) && ($ord_var_c <= 0x7F)):
            // characters U-00000000 - U-0000007F (same as ASCII)
            $d++;
            break;

          case (($ord_var_c & 0xE0) == 0xC0):
            // characters U-00000080 - U-000007FF, mask 110XXXXX
            $d+=2;
            break;

          case (($ord_var_c & 0xF0) == 0xE0):
            // characters U-00000800 - U-0000FFFF, mask 1110XXXX
            $d+=3;
            break;

          case (($ord_var_c & 0xF8) == 0xF0):
            // characters U-00010000 - U-001FFFFF, mask 11110XXX
            $d+=4;
            break;

          case (($ord_var_c & 0xFC) == 0xF8):
            // characters U-00200000 - U-03FFFFFF, mask 111110XX
            $d+=5;
            break;

          case (($ord_var_c & 0xFE) == 0xFC):
            // characters U-04000000 - U-7FFFFFFF, mask 1111110X
            $d+=6;
            break;
          default:
            $d++;
        }
      }

      return $d;
    }

    /**
     * Genera el slug de una cadena dada. La cadena generada tiene las siguientes caracteristicas:
     * - Los caracteres de la cadena estan en minusculas: a-z, 0-9
     * - Los espacios son reemplazados por guiones medios ' ' => '-'
     * - La cadena empieza por: a-z, 0-9
     * - No tiene dos guiones medios seguidos
     *
     *
     * @param string cadena a que va a ser procesada, puede estar codificada en  ASCII o UTF-8
     * @param integer cantidad maxima de palabras que debe tener la cadena resultante
     * @param integer cantidad maxima de caracteres que debe tener la cadena resultante
     *
     * @return string cadena slug
     */
    public static function slugify($string, $max_words = 10, $max_length = 65)
    {
      if (self::isUTF8($string)) {
        $string = utf8_decode($string);
      }
      $string = trim(strtolower($string));
      // $string     = self::extractExtraWhiteSpaces($string);
      $strlength = strlen($string);
      $retval = "";

      for ($i = 0; $i < $strlength; $i++) {

        $ascii = ord($string[$i]);
        if ($ascii == 32 || $ascii == 95 || $ascii == 45) { // " ", "_", "-"
          $retval .= "-";
        } elseif ($ascii == 241 || $ascii == 209) { // "enie"
          $retval .= "n";
        } elseif (($ascii >= 48 && $ascii <= 57) || ($ascii >= 65 && $ascii <= 90) ||
                ($ascii >= 97 && $ascii <= 122)) { // "0-9", "A-Z", "a-z", "-"
          $retval .= $string[$i];
        } elseif (($ascii >= 192 && $ascii <= 197) || ($ascii >= 224 && $ascii <= 229)) {
          $retval .= "a";
        } elseif (($ascii >= 200 && $ascii <= 203) || ($ascii >= 232 && $ascii <= 235)) {
          $retval .= "e";
        } elseif (($ascii >= 204 && $ascii <= 207) || ($ascii >= 236 && $ascii <= 239)) {
          $retval .= "i";
        } elseif (($ascii >= 210 && $ascii <= 214) || ($ascii >= 242 && $ascii <= 246)) {
          $retval .= "o";
        } elseif (($ascii >= 217 && $ascii <= 220) || ($ascii >= 249 && $ascii <= 252)) {
          $retval .= "u";
        }
      }

      $arr_patron = array("/^_{1,}/", "/^-{1,}/", "/_+\$/", "/-+\$/", "/_{2,}/", "/-{2,}/");
      $arr_replace = array("", "", "", "", "_", "-");
      $retval = preg_replace($arr_patron, $arr_replace, $retval);

      do {
        list($arr_words) = array_chunk(explode("-", $retval), $max_words);
        $retval = implode("-", $arr_words);

        $strlength = strlen($retval);
        $max_words--;
      } while ($strlength > $max_length);


      return $retval;
    }

    function copyDir($srcdir, $dstdir, $chmod = 0755, $verbose = false)
    {
      $num = 0;
      $bar_path = '/';  // for windows: '\\', for linux: '/'
      if (!is_dir($dstdir))
        mkdir($dstdir, $chmod);
      if ($curdir = opendir($srcdir)) {
        while ($file = readdir($curdir)) {
          if ($file != '.' && $file != '..') {
            $srcfile = $srcdir . $bar_path . $file;
            $dstfile = $dstdir . $bar_path . $file;
            if (is_file($srcfile)) {
              if (is_file($dstfile))
                $ow = filemtime($srcfile) - filemtime($dstfile); else
                $ow = 1;
              if ($ow > 0) {
                if ($verbose)
                  echo "Copying '$srcfile' to '$dstfile'...";
                if (copy($srcfile, $dstfile)) {
                  chmod($dstfile, $chmod);
                  touch($dstfile, filemtime($srcfile));
                  $num++;
                  if ($verbose)
                    echo "OK\n";
                }
                elseif ($verbose)
                  echo "Error: File '$srcfile' could not be copied!\n";
              }
            } elseif (is_dir($srcfile)) {
              $num += copyDir($srcfile, $dstfile, $chmod, $verbose);
            }
          }
        }
        closedir($curdir);
      }
      return true;
    }

    public static function removeDir($dirname, $verbose = false)
    {
      if (!is_writable($dirname) && $verbose) {
        echo 'El objetivo ' . $dirname . ' no es modificable';
        return false;
      }

      if (is_dir($dirname)) {
        if (chdir($dirname)) {
          $handle = opendir('.');
          while ($item = readdir($handle)) {
            if ($item != "." && $item != "..") {
              if (is_dir($item)) {
                if (!self::removeDir($dirname . "/" . $item))
                  return false;
              } else {
                if (!unlink($item))
                  return false;
              }
            }
          }

          closedir($handle);
          chdir(dirname($dirname));
          return rmdir($dirname);
        }
      }

      return true;
    }

    /**
     * Genera un nombre unico
     * 
     * @param string $prefix    prefijo que se antepondra al nombre generado
     * @param string $suffix    prefijo que se agregara al nombre generado
     * @return string 
     */
    public static function generateUniqueName($prefix = '', $suffix = '')
    {
      return $prefix . uniqid() . $suffix;
    }

    /**
     * Genera una clave de manera aleatoria
     * la letra l (ele) se ha omitido para que no se confunda con 
     * el numero 1
     * 
     * @param int $lenght     longitud de la clave a generar
     * @return string
     */
    public static function randomKey($lenght = 5)
    {
      $chars = 'abcdefghijkmnopqrstuvwxyz0123456789';

      $key = '';
      for ($i = 0; $i < $lenght; $i++) {
        $pos = rand(0, 34);
        $key .= $chars[$pos];
      }

      return $key;
    }

    /**
     * Descomprime un archivo .zip en el directorio dado
     * Debe estar habilitada la extension ZIP
     * 
     * @param $filename       ruta del archivo a descomprimir
     * @param $extract_to     ruta al directorio donde se guardaran los archivo descompresos
     * @param $delete_file    indica si se debe o no eliminar el archivo original
     * @return boolean        true si todo se realizo correctamente
     */
    public static function unzip($filename, $extract_to, $delete_file = false)
    {
      if (!function_exists('zip_open') || !is_readable($filename)) {
        return null;
      }

      $zip = new ZipArchive();
      $zip->open($filename);
      $zip->extractTo($extract_to);
      $zip->close();

      if ($delete_file)
        unlink($filename);
    }

    /**
     * Descomprime un archivo .rar en el directorio dado
     * Debe estar instalado la libreria PECL
     * http://pecl.php.net/package/rar
     * 
     * @param $filename       ruta del archivo a descomprimir
     * @param $extract_to     ruta al directorio donde se guardaran los archivo descompresos
     * @param $delete_file    indica si se debe o no eliminar el archivo original
     * @return boolean        true si todo se realizo correctamente
     */
    public static function unrar($filename, $extract_to, $delete_file = false)
    {
      if (!function_exists('rar_open') || !is_readable($filename)) {
        return null;
      }

      $rar_file = rar_open($filename);
      $entries = rar_list($rar_file);
      print_r($entries);

      foreach ($entries as $entry) {
        $entry->extract($extract_to);
      }

      rar_close($rar_file);
    }

    static public function getSizeImage($url)
    {
      $datos = GetImageSize($url) OR die("Imagen no vÃ¡lida");
      return $datos;
    }

    /**
     * Corta cadenas por medio de una cantidad de caracteres a limitar
     *
     * @param $string     cadena a recortar
     * @param $limit      numero de caracteres a limintar
     * @param $break      caracter limitador
     * @param $pad        caracteres que tendra al final de limitar la cadena
     * @return $string    Retorna la cadena recortada segun limitador
     */
    static public function myTruncate($string, $limit, $break = ".", $pad = "...")
    {
      if (strlen($string) <= $limit)
        return $string;
      if (false !== ($breakpoint = strpos($string, $break, $limit))) {
        if ($breakpoint < strlen($string) - 1) {
          $string = substr($string, 0, $breakpoint) . $pad;
        }
      }
      return $string;
    }

    static public function cutString($string, $max_lenght = 50, $pad = "...")
    {
      if (strlen($string) <= $max_lenght) {
        return $string;
      }
      $string = substr($string, 0, $max_lenght) . $pad;
      return $string;
    }

    /**
     * Crea un html select
     *
     * @param $dbl_options_list datos para llenar el select
     * @param $paramas      parametros para configuraciÃ³n del html select
     */
    static public function select_options($dbl_options_list, $params = array())
    {
      $html_only_options = (isset($params['only_options']) ? $params['only_options'] : true);
      $show_empty_msg = (isset($params['show_empty_msg']) ? $params['show_empty_msg'] : true);
      $html_select = '';
      $html_attribs = '';

      if (!$html_only_options) {
        $html_select_id = $params['id'];
        $html_select_name = (isset($params['name']) ? $params['name'] : $html_select_id);
        $html_select_attrib = (isset($params['attrib']) ? $params['attrib'] : array());
        if (count($html_select_attrib) > 0) {
          foreach ($html_select_attrib as $attrib_key => $attrib_value) {
            $html_attribs .= "$attrib_key=\"$attrib_value\" ";
          }
        }
        $html_attribs = rtrim($html_attribs);
      }
      $html_field_key = (isset($params['field_key']) ? $params['field_key'] : 'id');
      $html_field_value = (isset($params['field_value']) ? $params['field_value'] : 'value');

      if ($show_empty_msg) {
        $html_select_msg = (isset($params['empty_msg']) ? $params['empty_msg'] : '-Seleccione-');
      }
      $html_selected_item = (isset($params['selected_id']) ? $params['selected_id'] : null);

      if (!$html_only_options) {
        $html_select .= "<select name=\"{$html_select_id}\" id=\"{$html_select_name}\" {$html_attribs}>";
      }
      if ($show_empty_msg) {
        $html_select .= "<option value=\"\">{$html_select_msg}</option>";
      }
      foreach ($dbl_options_list as $option) {
        $option_key = $option[$html_field_key];
        $option_value = $option[$html_field_value];
        $html_selected = (($html_selected_item == $option_key) ? " selected=\"selected\"" : "");
        $html_select .= "<option value=\"{$option_key}\"{$html_selected}>{$option_value}</option>";
      }
      if (!$html_only_options) {
        $html_select .= "</select>";
      }
      return $html_select;
    }

    /**
     * Convierte fecha de normal a mysql
     *
     * @param string $date, La fecha a ser modificada
     */
    public static function cambiaf_a_mysql($normal_date = '')
    {
      if (strlen(trim($normal_date)) == 0) {
        return false;
      }
      preg_match('/(?<day>\d{1,2})[\/|-](?<month>\d{1,2})[\/|-](?<year>\d{4})/', $normal_date, $date_parts);
      if (count($date_parts) == 0) {
        return false;
      }
      if ($date_parts['year'] && $date_parts['month'] && $date_parts['day']) {
        return $date_parts['year'] . "-" . $date_parts['month'] . "-" . $date_parts['day'];
      } else {
        return false;
      }
    }

    /**
     * Convierte fecha de mysql a normal
     *
     * @param string $date, La fecha a ser modificada
     */
    public static function cambiaf_a_normal($mysql_date)
    {
      $date_parts = explode("-", $mysql_date);
      if (count($date_parts) > 0) {
        return $date_parts[2] . "/" . $date_parts[1] . "/" . $date_parts[0];
      } else {
        return false;
      }
    }

    public static function generateFrontendRoute($route, $params = array())
    {
      static $instance = null;
      if (!$instance) {
        $instance = new Utils();
      }

      if (!$instance->frontend_routing) {

        $config = new sfRoutingConfigHandler();
        $routes = $config->evaluate(array(dirname(__FILE__) . '/../../apps/frontend/config/routing.yml'));
        $instance->frontend_routing = new sfPatternRouting(new sfEventDispatcher());
        $instance->frontend_routing->setRoutes($routes);
      }

      return $instance->frontend_routing->generate($route, $params);
    }

    public static function generateBackendRoute($route, $params = array(), $absolute = false)
    {
      static $instance = null;
      $backend_route = null;
      if (!$instance) {
        $instance = new Utils();
      }

      if ($absolute) {
        $backend_route = "http://" . sfConfig::get('app_servername') . '/admin';
      }

      if (!$instance->backend_routing) {

        $config = new sfRoutingConfigHandler();
        $routes = $config->evaluate(array(dirname(__FILE__) . '/../../apps/backend/config/routing.yml'));
        $instance->backend_routing = new sfPatternRouting(new sfEventDispatcher());
        $instance->backend_routing->setRoutes($routes);
      }

      return $backend_route . $instance->backend_routing->generate($route, $params);
    }

    public static function generateHelpRoute($route, $params = array(), $absolute = false)
    {
      $frontend_home = '';
      if ($absolute) {
        $frontend_home = "http://" . sfConfig::get('app_servername');
      }
      static $instance = null;
      if (!$instance) {
        $instance = new Utils();
      }
      if (!$instance->help_routing) {
        $config = new sfRoutingConfigHandler();
        $routes = $config->evaluate(array(dirname(__FILE__) . '/../../apps/help/config/routing.yml'));
        $instance->help_routing = new sfPatternRouting(new sfEventDispatcher());
        $instance->help_routing->setRoutes($routes);
      }

      return $frontend_home . '/ayuda' . $instance->help_routing->generate($route, $params);
    }

    public static function generatePanelRoute($route, $params = array())
    {
      static $instance = null;
      if (!$instance) {
        $instance = new Utils();
      }
      if (!$instance->panel_routing) {
        $config = new sfRoutingConfigHandler();
        $routes = $config->evaluate(array(dirname(__FILE__) . '/../../apps/panel/config/routing.yml'));
        $instance->panel_routing = new sfPatternRouting(new sfEventDispatcher());
        $instance->panel_routing->setRoutes($routes);
      }
      return '/panel' . $instance->panel_routing->generate($route, $params);
    }

    public static function generateSellerRoute($route, $params = array(), $absolute = false)
    {
      static $instance = null;
      if (!$instance) {
        $instance = new Utils();
      }
      if (!$instance->seller_routing) {
        $config = new sfRoutingConfigHandler();
        $routes = $config->evaluate(array(dirname(__FILE__) . '/../../apps/seller/config/routing.yml'));
        $instance->seller_routing = new sfPatternRouting(new sfEventDispatcher());
        $instance->seller_routing->setRoutes($routes);
      }
      $route = ($absolute) ? 'https://' . sfConfig::get('app_seller_server_name') . $instance->seller_routing->generate($route, $params) : $instance->seller_routing->generate($route, $params);


      return $route;
    }

    public static function generateDirRoute($route, $params = array())
    {
      $config = new sfRoutingConfigHandler();
      $routes = $config->evaluate(array(dirname(__FILE__) . '/../../apps/dir/config/routing.yml'));
      $routing = new sfPatternRouting(new sfEventDispatcher());
      $routing->setRoutes($routes);
      return $routing->generate($route, $params);
    }

    /**
     * Retorna la informacion estructurada de un codigo ubigeo, es decir el departamento, provincia y distrito del ubigeo.
     * Author: Cesar Oshiro
     * Name Method: getStringUbigeo
     * @return ubigeo_string
     */
    public static function getStringUbigeo($UbigeoID)
    {
      $ubigeo_string = ' ' . substr($UbigeoID, 0, 2) . '0000,' . substr($UbigeoID, 0, 4) . '00,' . $UbigeoID . ' ';

      $q = new Doctrine_Query();
      $q->select('u.name')
              ->from('tgsUbigeo u')
              ->where('u.id in (' . $ubigeo_string . ')')
              ->orderby('u.id');
      $dbr_nameubigeo = $q->fetchArray();
      $count_ubigeo = 0;
      foreach ($dbr_nameubigeo as $dbr_ubidetail) {
        switch ($count_ubigeo) {
          case 0:
            $ubigeo_string = 'Departamento: ' . $dbr_ubidetail['name'];
            $count_ubigeo++;
            break;
          case 1:
            $ubigeo_string.=' - Provincia: ' . $dbr_ubidetail['name'];
            $count_ubigeo++;
            break;
          case 2:
            $ubigeo_string.=' - Distrito: ' . $dbr_ubidetail['name'];
            $count_ubigeo++;
            break;
          default:
            break;
        }
      }
      return $ubigeo_string ? $ubigeo_string : null;
    }

    public static function getSimpleStringUbigeo($UbigeoID)
    {
      $ubigeo_string = ' ' . substr($UbigeoID, 0, 2) . '0000,' . substr($UbigeoID, 0, 4) . '00,' . $UbigeoID . ' ';

      $q = new Doctrine_Query();
      $q->select('u.name')
              ->from('tgsUbigeo u')
              ->where('u.id in (' . $ubigeo_string . ')')
              ->orderby('u.id');
      $dbr_nameubigeo = $q->fetchArray();
      $count_ubigeo = 0;
      foreach ($dbr_nameubigeo as $dbr_ubidetail) {
        switch ($count_ubigeo) {
          case 0:
            $ubigeo_string = ucfirst(mb_strtolower($dbr_ubidetail['name'], 'UTF-8'));
            $count_ubigeo++;
            break;
          case 1:
            $ubigeo_string.=', ' . ucfirst(mb_strtolower($dbr_ubidetail['name'], 'UTF-8'));
            $count_ubigeo++;
            break;
          case 2:
            $ubigeo_string.=', ' . ucfirst(mb_strtolower($dbr_ubidetail['name'], 'UTF-8'));
            $count_ubigeo++;
            break;
          default:
            break;
        }
      }
      return $ubigeo_string ? $ubigeo_string : null;
    }

    public static function getSimpleStringUbigeo2($UbigeoID)
    {
      $UbigeoID = Utils::extractExtraWhiteSpaces($UbigeoID);
      if (strlen($UbigeoID) == 0 || strlen($UbigeoID) < 6) {
        return null;
      }
      $ubigeo_string = ' ' . substr($UbigeoID, 0, 2) . '0000,' . substr($UbigeoID, 0, 4) . '00,' . $UbigeoID . ' ';

      $q = new Doctrine_Query();
      $q->select('u.name')
              ->from('tgsUbigeo u')
              ->where('u.id in (' . $ubigeo_string . ')')
              ->orderby('u.id');
      $dbr_nameubigeo = $q->fetchArray();


      if (isset($dbr_nameubigeo[0]['name']) && isset($dbr_nameubigeo[1]['name']) && isset($dbr_nameubigeo[2]['name'])) {

        $dep_str = ucfirst(mb_strtolower($dbr_nameubigeo[0]['name'], 'UTF-8'));
        $prv_str = ucfirst(mb_strtolower($dbr_nameubigeo[1]['name'], 'UTF-8'));
        $dis_str = ucfirst(mb_strtolower($dbr_nameubigeo[2]['name'], 'UTF-8'));
        $ubigeo_string = $dis_str . ', ' . $prv_str . ', ' . $dep_str;
      }



      return $ubigeo_string ? $ubigeo_string : null;
    }

    /**
     * Calcula el tiempo que ah pasado desde que fue publicado a la fecha, si es hoy saldra en horas sino en dias.
     * Author: Christian Luna
     * Name Method: getTimePublic
     * @return tiempo_publicado
     */
    public static function getTimePublic($datefrom, $dateto = -1)
    {
      // valores predeterminados y asumir si es 0 se pasa en ese
      // su error en lugar de la fecha
      $datefrom = strtotime($datefrom);
      if ($datefrom <= 0) {
        return " mucho tiempo";
      }

      if ($dateto == -1) {
        $dateto = time();
      }

      $difference = $dateto - $datefrom;

      if ($difference < 60) {
        $interval = "s";
      } elseif ($difference >= 60 && $difference < 60 * 60) {
        $interval = "n";
      } elseif ($difference >= 60 * 60 && $difference < 60 * 60 * 24) {
        $interval = "h";
      } elseif ($difference >= 60 * 60 * 24 && $difference < 60 * 60 * 24 * 7) {
        $interval = "d";
      } elseif ($difference >= 60 * 60 * 24 * 7 && $difference < 60 * 60 * 24 * 30) {
        $interval = "ww";
      } elseif ($difference >= 60 * 60 * 24 * 30 && $difference < 60 * 60 * 24 * 365) {
        $interval = "m";
      } elseif ($difference >= 60 * 60 * 24 * 365) {
        $interval = "y";
      }

      switch ($interval) {
        case "m":
          $months_difference = floor($difference / 60 / 60 / 24 / 29);
          while (mktime(date("H", $datefrom), date("i", $datefrom), date("s", $datefrom), date("n", $datefrom) + ($months_difference), date("j", $dateto), date("Y", $datefrom)) < $dateto) {

            $months_difference++;
          }
          $datediff = $months_difference;

          if ($datediff == 12) {
            $datediff--;
          }

          $message = ($datediff == 1) ? "$datediff mes" : "$datediff meses";
          break;

        case "y":
          $datediff = floor($difference / 60 / 60 / 24 / 365);
          $message = ($datediff == 1) ? "$datediff hace un aÃ±o" : "$datediff aÃ±os";
          break;

        case "d":
          $datediff = floor($difference / 60 / 60 / 24);
          $message = ($datediff == 1) ? "$datediff hace dÃ­as" : "$datediff la semana pasada";
          break;

        case "ww":
          $datediff = floor($difference / 60 / 60 / 24 / 7);
          $message = ($datediff == 1) ? "$datediff semana" : "$datediff semanas";
          break;

        case "h":
          $datediff = floor($difference / 60 / 60);
          $message = ($datediff == 1) ? "$datediff hora" : "$datediff horas";
          break;

        case "n":
          $datediff = floor($difference / 60);
          $message = ($datediff == 1) ? "$datediff minuto" : "$datediff minutos";
          break;

        case "s":
          $datediff = $difference;
          $message = ($datediff == 1) ? "$datediff segundo" : "$datediff segundos";
          break;
      }

      $message = "Publicado hace $message";

      return $message;
    }

    public static function extractExtraWhiteSpaces($string, $to_upper = false)
    {
      $string = trim($string);
      $string = preg_replace('/\s[\s]+/', ' ', $string);
      if ($to_upper) {
        $string = mb_strtoupper($string);
      }
      return $string;
    }

    public static function generateSlug($string, $replace = array(), $delimiter = '-')
    {
      if (self::isUTF8($string)) {
        $string = utf8_decode($string);
      }
      $string = Utils::extractExtraWhiteSpaces($string);
      if (!empty($replace)) {
        $string = str_replace((array) $replace, ' ', $string);
      }
      $array_words = array_diff(explode(' ', $string), ProductUtils::getStopWords());
      $string = implode(' ', $array_words);

      $strlength = strlen($string);
      for ($i = 0; $i < $strlength; $i++) {
        $ascii = ord($string[$i]);
        if ($ascii == 241 || $ascii == 209) { // "enie"
          $string[$i] = "n";
        } elseif (($ascii >= 192 && $ascii <= 197) || ($ascii >= 224 && $ascii <= 229)) { // a tilde
          $string[$i] = "a";
        } elseif (($ascii >= 200 && $ascii <= 203) || ($ascii >= 232 && $ascii <= 235)) { // e tilde
          $string[$i] = "e";
        } elseif (($ascii >= 204 && $ascii <= 207) || ($ascii >= 236 && $ascii <= 239)) { // i tilde
          $string[$i] = "i";
        } elseif (($ascii >= 210 && $ascii <= 214) || ($ascii >= 242 && $ascii <= 246)) { // o tilde
          $string[$i] = "o";
        } elseif (($ascii >= 217 && $ascii <= 220) || ($ascii >= 249 && $ascii <= 252)) { // u tilde
          $string[$i] = "u";
        } elseif (($ascii >= 161 && $ascii <= 175) || ($ascii >= 176 && $ascii <= 191)) { // caracteres especiales
          $string[$i] = "";
        }
      }
      $clean = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $string);
      $clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
      $clean = mb_strtolower(trim($clean, '-'));
      $clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);

      return $clean;
    }

    public static function formatNumber($number_value = '', $decimal_numbers = 2, $english_notation = false)
    {
      $number_value = str_replace('S/.', '', $number_value);
      $number_value = str_replace('s/.', '', $number_value);
      $number_value = str_replace('$', '', $number_value);
      $number_value = Utils::extractExtraWhiteSpaces($number_value);

      if (is_numeric($number_value)) {
        return $english_notation ? number_format($number_value, $decimal_numbers) : number_format($number_value, $decimal_numbers, '.', '');
      } else {
        return '';
      }
    }

    public static function getSessionSellerId()
    {
      if (sfContext::getInstance()->getUser()) {

        if (method_exists(sfContext::getInstance()->getUser(), 'getGuardUser') && sfContext::getInstance()->getUser()->getGuardUser()) {
          return sfContext::getInstance()->getUser()->getGuardUser()->getSeller()->getId();
        } else {
          return null;
        }
      } else {
        return null;
      }
    }

    public static function getSessionUserId()
    {
      if (sfContext::getInstance()->getUser()) {
        if (method_exists(sfContext::getInstance()->getUser(), 'getGuardUser') && sfContext::getInstance()->getUser()->getGuardUser()) {
          return sfContext::getInstance()->getUser()->getUserId();
        } else {
          return null;
        }
      } else {
        return null;
      }
    }

    public static function generateAccountCode($string, $strings_left)
    {
      $count = strlen($string);
      $replace = '';
      for ($i = 0; $i < $count; $i++) {
        $replace.='*';
      }

      return substr_replace($string, $replace, 0, $count - $strings_left);
    }

    public static function validUrlImage($url)
    {
      if (preg_match('@(https?://([-\w\.]+)+(:\d+)?(/([\w/_\.]*(\?\S+)?)?)?)([^\s]+(\.(?i)(jpg|jpeg|png|gif))$)@', $url)) {
        return 'true';
      } else {
        return 'false';
      }
    }

    /**
     * Retorna una cadena limpia de caracteres especiales.
     * Author: Cesar Oshiro
     * Name Method: string2url
     * @return string
     */
    public static function string2url($toClean)
    {
      $GLOBALS['normalizeChars'] = array('Å ' => 'S', 'Å¡' => 's', 'Ã�' => 'Dj', 'Å½' => 'Z', 'Å¾' => 'z', 'Ã€' => 'A', 'Ã�' => 'A', 'Ã‚' => 'A', 'Ãƒ' => 'A', 'Ã„' => 'A', 'Ã…' => 'A', 'Ã†' => 'A', 'Ã‡' => 'C', 'Ãˆ' => 'E', 'Ã‰' => 'E', 'ÃŠ' => 'E', 'Ã‹' => 'E', 'ÃŒ' => 'I', 'Ã�' => 'I', 'ÃŽ' => 'I', 'Ã�' => 'I', 'Ã‘' => 'N', 'Ã’' => 'O', 'Ã“' => 'O', 'Ã”' => 'O', 'Ã•' => 'O', 'Ã–' => 'O', 'Ã˜' => 'O', 'Ã™' => 'U', 'Ãš' => 'U', 'Ã›' => 'U', 'Ãœ' => 'U', 'Ã�' => 'Y', 'Ãž' => 'B', 'ÃŸ' => 'Ss', 'Ã ' => 'a', 'Ã¡' => 'a', 'Ã¢' => 'a', 'Ã£' => 'a', 'Ã¤' => 'a', 'Ã¥' => 'a', 'Ã¦' => 'a', 'Ã§' => 'c', 'Ã¨' => 'e', 'Ã©' => 'e', 'Ãª' => 'e', 'Ã«' => 'e', 'Ã¬' => 'i', 'Ã­' => 'i', 'Ã®' => 'i', 'Ã¯' => 'i', 'Ã°' => 'o', 'Ã±' => 'n', 'Ã²' => 'o', 'Ã³' => 'o', 'Ã´' => 'o', 'Ãµ' => 'o', 'Ã¶' => 'o', 'Ã¸' => 'o', 'Ã¹' => 'u', 'Ãº' => 'u', 'Ã»' => 'u', 'Ã½' => 'y', 'Ã½' => 'y', 'Ã¾' => 'b', 'Ã¿' => 'y', 'Æ’' => 'f');

      $toClean = strtr($toClean, $GLOBALS['normalizeChars']);
      $toClean = str_replace('&', '-and-', $toClean);
      $toClean = trim(preg_replace('/[^\x9\xA\xD\x20-\x7F]/', '', $toClean)); //remove all illegal chars
      $toClean = str_replace(' ', '-', $toClean);
      $toClean = str_replace(',', '-', $toClean);
      $toClean = str_replace('--', '-', $toClean);

      return $toClean;
    }

    public static function cleanString($string)
    {
      $GLOBALS['normalizeChars'] = array('Å ' => 'S', 'Å¡' => 's', 'Ã�' => 'Dj', 'Å½' => 'Z', 'Å¾' => 'z', 'Ã€' => 'Ã�', 'Ã‚' => 'A', 'Ãƒ' => 'A', 'Ã„' => 'A', 'Ã…' => 'A', 'Ã†' => 'A', 'Ã‡' => 'C', 'Ãˆ' => 'Ã‰', 'ÃŠ' => 'E', 'Ã‹' => 'E', 'ÃŒ' => 'Ã�', 'ÃŽ' => 'I', 'Ã�' => 'I', 'Ã’' => 'Ã“', 'Ã”' => 'O', 'Ã•' => 'O', 'Ã–' => 'O', 'Ã˜' => 'O', 'Ã™' => 'Ãš', 'Ã›' => 'U', 'Ãœ' => 'U', 'Ã�' => 'Y', 'Ãž' => 'B', 'ÃŸ' => 'Ss', 'Ã ' => 'Ã¡', 'Ã¢' => 'a', 'Ã£' => 'a', 'Ã¤' => 'a', 'Ã¥' => 'a', 'Ã¦' => 'a', 'Ã§' => 'c', 'Ã¨' => 'Ã©', 'Ãª' => 'e', 'Ã«' => 'e', 'Ã¬' => 'Ã­', 'Ã®' => 'i', 'Ã¯' => 'i', 'Ã°' => 'o', 'Ã²' => 'Ã³', 'Ã´' => 'o', 'Ãµ' => 'o', 'Ã¶' => 'o', 'Ã¸' => 'o', 'Ã¹' => 'Ãº', 'Ã»' => 'u', 'Ã½' => 'y', 'Ã½' => 'y', 'Ã¾' => 'b', 'Ã¿' => 'y', 'Æ’' => 'f');

      $string = strtr($string, $GLOBALS['normalizeChars']);
      $string = str_replace('&', '-and-', $string);
      $string = str_replace(',', ' ', $string);
      $string = preg_replace("/[^\w]\\\'\"/iu", " ", $string);
      return $string;
    }

    /**
     * Para funciones generales
     * Author: Cesar Oshiro
     * Name Method: dateadd
     * @return datetime
     */
    public static function dateadd($date, $dd = 0, $mm = 0, $yy = 0, $hh = 0, $mn = 0, $ss = 0)
    {
      $date_r = getdate(strtotime($date));

      $date_result = date("Y-m-d H:i:s", mktime(($date_r["hours"] + $hh), ($date_r["minutes"] + $mn), ($date_r["seconds"] + $ss), ($date_r["mon"] + $mm), ($date_r["mday"] + $dd), ($date_r["year"] + $yy)));
      return $date_result;
    }

    /**
     * Para funciones generales
     * Author: Cesar Oshiro
     * Name Method: ultimoDiaMes
     * @return datetime
     */
    public static function ultimoDiaMes($mes, $aÃ±o, $return_only_day = false)
    {
      for ($dia = 28; $dia <= 31; $dia++) {
        if (checkdate($mes, $dia, $aÃ±o)) {
          $fecha = "$aÃ±o/$mes/$dia";
        }
      }
      if ($return_only_day) {
        $fecha = explode('/', $fecha);
        return $fecha[2];
      } else {
        return $fecha;
      }
    }

    public static function valdiateFilterParams($filter_table = '', $filter_params = array())
    {
      if ($filter_table == '' || count($filter_params) == 0 || empty($filter_params)) {
        return false;
      }
      if (!key_exists($filter_table, $filter_params)) {
        return false;
      }
      if (count($filter_params[$filter_table]) == 0 || empty($filter_params[$filter_table])) {
        return false;
      }
      return $filter_params[$filter_table];
    }

    public static function cleanFieldSearh($field_key = '', $filter_params = array(), $string_field = false)
    {
      if (key_exists($field_key, $filter_params) && strlen(trim($filter_params[$field_key])) > 0) {
        if ($string_field) {
          $search_field = str_replace(' ', '%', $filter_params[$field_key]);
        } else {
          $search_field = trim($filter_params[$field_key]);
        }
        return $search_field;
      }
    }

    public static function cleanFieldDateSearh($field_key = '', $filter_params = array())
    {
      if (key_exists($field_key, $filter_params) && strlen(trim($filter_params[$field_key])) > 0) {
        return Utils::cambiaf_a_mysql($filter_params[$field_key]);
      }
      return false;
    }

    /**
     * Resta la fecha $date_1 menos $date_2 y devuelve el resultado en el tipo de tiempo solicitado.
     * Las fechas deben estar en el formato PHP: Y-m-d H:i:s, o en ISO: yyyy-mm-dd hh:mm:ss
     *
     * @param string $date_1,         Fecha a la que se le restara
     * @param string $date_2,         Fecha que resta
     * @param string $type,           Tipo de tiempo (d: dias, H: horas, i: minutos, s: segundos)
     * @return string
     *
     */
    public static function dateDiff($date_1, $date_2, $type = 's')
    {
      $mk_date_1 = strtotime($date_1);
      $mk_date_2 = strtotime($date_2);

      if (!$mk_date_1 || !$mk_date_2) {
        return false;
      }

      $seconds = $mk_date_1 - $mk_date_2;

      switch ($type) {
        case 's':      //segundos
          $retval = $seconds;
          break;

        case 'i':      //minutos
          $retval = $seconds / 60;
          break;

        case 'H':    //horas
          $retval = $seconds / 3600;
          break;

        case 'd':    //dias
          $retval = $seconds / 86400;
          break;

        default:
          $retval = false;
      }

      return $retval;
    }

    public static function hidePayCode($str_pay_code, $show_only = 4)
    {
      $hide_digits = str_repeat("**** ", 3);
      return $hide_digits . substr($str_pay_code, strlen($str_pay_code) - 4, strlen($str_pay_code));
    }

    public static function validDate($date)
    {
      if (strlen(trim($date)) == 0 || strlen(trim($date)) > 10) {
        return false;
      }
      return true;
    }

    /**
     * Retorna una cadena encriptada en AES 128 CBC.
     * Author: Cesar Oshiro
     * Name Method: executeEncriptedString
     * @return string
     */
    public static function executeEncriptedString($URL)
    {
      $size = mcrypt_get_block_size('rijndael-128', 'cbc');
      $input = Utils::pkcs5_pad($URL, $size);

      $key = Utils::hex2bin(sfConfig::get('app_token_key_encription'));
      $td = mcrypt_module_open("rijndael-128", "", "cbc", "");
      mcrypt_generic_init($td, $key, Utils::hex2bin(sfConfig::get('app_token_iv_encription')));
      $encrypted = mcrypt_generic($td, $input);
      mcrypt_generic_deinit($td);
      mcrypt_module_close($td);
      return bin2hex($encrypted);
    }

    /**
     * Retorna una cadena des encriptada en AES 128 CBC.
     * Author: Cesar Oshiro
     * Name Method: executeUnEncriptedString
     * @return string
     */
    public static function executeUnEncriptedString($Encrypted)
    {

      $key = Utils::hex2bin(sfConfig::get('app_token_key_encription'));
      $code = Utils::hex2bin($Encrypted);
      $td = mcrypt_module_open("rijndael-128", "", "cbc", "");
      mcrypt_generic_init($td, $key, Utils::hex2bin(sfConfig::get('app_token_iv_encription')));
      $decrypted = mdecrypt_generic($td, $code);
      mcrypt_generic_deinit($td);
      mcrypt_module_close($td);
      return $decrypted;
    }

    /**
     * Retorna la informacion de una compra.
     * Author:
     * Name Method: getTramaInnovaccion
     * @return number(10)
     */
    public static function getTramaInnovaccion()
    {
      $trama = '';
      do {
        $num_unitario = dechex(rand(1, 11));
        if (strstr($trama, strval($num_unitario)) == '') {
          $trama .= strval($num_unitario);
        }
      } while (strlen($trama) < 11);

      return $trama;
    }

    public static function hex2bin($hexdata)
    {
      $bindata = "";

      for ($i = 0; $i < strlen($hexdata); $i += 2) {
        $bindata .= chr(hexdec(substr($hexdata, $i, 2)));
      }

      return $bindata;
    }

    public static function pkcs5_pad($text, $blocksize)
    {
      $pad = $blocksize - (strlen($text) % $blocksize);
      return $text . str_repeat(chr($pad), $pad);
    }

    /**
     * Retorna un array que contiene 3 valores: precio venta producto neto, monto impuestos sobre el producto y
     * el costo de envio sobre el producto.
     * Author: Cesar Oshiro
     * Name Method: getWorkDate
     * @return datetime
     */
    public static function getWorkDate($num_days, $date_input = null)
    {
      if (is_null($date_input)) {
        $date_input = date('Y-m-d H:i:s');
      }
      $date_final = Utils::add_date($date_input, $num_days, 0, 0);
      $hora_final = intval(Utils::getFormattedDate($date_final, '%H'));
      $numberofday = date('N', strtotime($date_final));
      $addDay = 0;
      //echo "$numberofday <br>";
      if ($numberofday == 7) {
        $addDay = 1;
      } elseif (($numberofday == 6 && $hora_final >= 13)) {
        $addDay = 2;
      }

      $date_final = Utils::add_date($date_final, $addDay, 0, 0);

      return $date_final;
    }

    public static function add_date($givendate, $day = 0, $mth = 0, $yr = 0)
    {
      $cd = strtotime($givendate);
      $newdate = date('Y-m-d H:i:s', mktime(date('H', $cd), date('i', $cd), date('s', $cd), date('m', $cd) + $mth, date('d', $cd) + $day, date('Y', $cd) + $yr));
      return $newdate;
    }

    public static function fullLower($string)
    {
      $convert_to = array(
          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
          "v", "w", "x", "y", "z", "Ã ", "Ã¡", "Ã¢", "Ã£", "Ã¤", "Ã¥", "Ã¦", "Ã§", "Ã¨", "Ã©", "Ãª", "Ã«", "Ã¬", "Ã­", "Ã®", "Ã¯",
          "Ã°", "Ã±", "Ã²", "Ã³", "Ã´", "Ãµ", "Ã¶", "Ã¸", "Ã¹", "Ãº", "Ã»", "Ã¼", "Ã½", "Ð°", "Ð±", "Ð²", "Ð³", "Ð´", "Ðµ", "Ñ‘", "Ð¶",
          "Ð·", "Ð¸", "Ð¹", "Ðº", "Ð»", "Ð¼", "Ð½", "Ð¾", "Ð¿", "Ñ€", "Ñ�", "Ñ‚", "Ñƒ", "Ñ„", "Ñ…", "Ñ†", "Ñ‡", "Ñˆ", "Ñ‰", "ÑŠ", "Ñ‹",
          "ÑŒ", "Ñ�", "ÑŽ", "Ñ�"
      );
      $convert_from = array(
          "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
          "V", "W", "X", "Y", "Z", "Ã€", "Ã�", "Ã‚", "Ãƒ", "Ã„", "Ã…", "Ã†", "Ã‡", "Ãˆ", "Ã‰", "ÃŠ", "Ã‹", "ÃŒ", "Ã�", "ÃŽ", "Ã�",
          "Ã�", "Ã‘", "Ã’", "Ã“", "Ã”", "Ã•", "Ã–", "Ã˜", "Ã™", "Ãš", "Ã›", "Ãœ", "Ã�", "Ð�", "Ð‘", "Ð’", "Ð“", "Ð”", "Ð•", "Ð�", "Ð–",
          "Ð—", "Ð˜", "Ð™", "Ðš", "Ð›", "Ðœ", "Ð�", "Ðž", "ÐŸ", "Ð ", "Ð¡", "Ð¢", "Ð£", "Ð¤", "Ð¥", "Ð¦", "Ð§", "Ð¨", "Ð©", "Ðª", "Ðª",
          "Ð¬", "Ð­", "Ð®", "Ð¯"
      );

      return str_replace($convert_from, $convert_to, $string);
    }

    /**
     * Devuelve la fecha resultante despues de agregar el periodo requerido en formato xs:dateTime
     *
     * @param string $date, La fecha a la cual se agregara el periodo, debe estar en el formato PHP: Y-m-d H:i:s, o en ISO: yyyy-mm-dd hh:mm:ss
     * @param integer $period, periodo a agregar
     * @param string $type, tipo de tiempo (d: dias, m: meses, y: anios, H: horas, i: minutos, s: segundos)
     * @return string
     *
     */
    public static function addPeriodXSDateTime($date, $period = 0, $type = 'd')
    {
      extract(getdate(strtotime($date)));
      if ($type == 'd')
        $mkdate_end = mktime($hours, $minutes, $seconds, $mon, $mday + $period, $year);
      elseif ($type == 'm')
        $mkdate_end = mktime($hours, $minutes, $seconds, $mon + $period, $mday, $year);
      elseif ($type == 'Y')
        $mkdate_end = mktime($hours, $minutes, $seconds, $mon, $mday, $year + $period);
      elseif ($type == 'H')
        $mkdate_end = mktime($hours + $period, $minutes, $seconds, $mon, $mday, $year);
      elseif ($type == 'i')
        $mkdate_end = mktime($hours, $minutes + $period, $seconds, $mon, $mday, $year);
      elseif ($type == 's')
        $mkdate_end = mktime($hours, $minutes, $seconds + $period, $mon, $mday, $year);

      return date('Y-m-d\TH:i:s', $mkdate_end);
    }

    public static function url_exists($web, $errors = array(404, 500), $timeout = 30)
    {

      $url = parse_url($web);

      $host = $url['host'];

      if (isset($url['path']))
        $path = '/';

      if (isset($url['port'])) {
        $port = $url['port'];
      } elseif ($scheme = strtolower($url['scheme'])) {
        $port = getservbyname($scheme, 'udp');
      }
      if (!$port)
        $port = 80;

      if (isset($url['query']))
        $path .= "?$url[query]";
      $fp = fsockopen($host, $port, $errno, $errstr, $timeout);

      if ($fp) {
        $head = '';
        fputs($fp, "GET $path HTTP/1.0 Host: $host ");
        while (!feof($fp)) {
          $head = fgets($fp, 1024);
          // echo "$head<br>";
          // descomentar la lÃ­nea anterior para ver las cabeceras
          if ($head === " " or $head === " ")
            return 1;
          foreach ($errors as $error) {
            if (strpos($head, " $error ")) {
              fclose($fp);
              return 0;
            }
          }
        }
        fclose($fp);
      } else {
        return 0;
      }
      return 1;
    }

    public static function getSecureSearch($str)
    {
      $aExepciones = ProductUtils::getStopWords();

      $str = preg_replace('/[^Ã¡Ã©Ã­Ã³ÃºÃ±\w]+/i', "-", $str);
      $str = str_replace('-', ' ', str_replace('-', ' ', $str));
      $str = mb_strtoupper($str, 'UTF-8');
      $str = explode(" ", strtolower(trim($str)));
      $str = array_filter($str);
      $str = array_diff($str, $aExepciones);
      $str = array_unique($str);
      $str = array_filter($str);
      $str = implode(" ", $str);
      $str = strtoupper($str);

      return $str;
    }

    /**
     * Retorna un array que contiene la suma de dos arrays
     * Author: Cesar Oshiro
     * Name Method: getSumByTwoArrays
     * @return datetime
     */
    public static function getSumByTwoArrays($operator1, $operator2)
    {
      $longitud = (strlen($operator1) > strlen($operator2)) ? strlen($operator1) : strlen($operator2);
      $diferencia = (strlen($operator1) > strlen($operator2)) ? (strlen($operator1) - strlen($operator2)) : (strlen($operator2) - strlen($operator1));
      (strlen($operator1) > strlen($operator2)) ? $operator2 = str_pad($operator2, $longitud, '0', STR_PAD_LEFT) : $operator1 = str_pad($operator1, $longitud, '0', STR_PAD_LEFT);
      $longitud--;
      $adicionar = 0;
      $suma_array = array();
      $suma_tmp = 0;
      for ($i = $longitud; $i >= 0; $i--) {
        $suma_tmp = $operator1[$i] + $operator2[$i] + $adicionar;
        if ($suma_tmp > 9) {
          $suma_array[$i] = $suma_tmp % 10;
          $adicionar = ($suma_tmp - $suma_array[$i]) / 10;
        } else {
          $suma_array[$i] = $suma_tmp;
          $adicionar = 0;
        }
      }
      ksort($suma_array);
      return implode("", $suma_array);
    }

    public static function getMonths()
    {
      return array('1' => 'Enero', '2' => 'Febrero', '3' => 'Marzo', '4' => 'Abril', '5' => 'Mayo', '6' => 'Junio', '7' => 'Julio', '8' => 'Agosto', '9' => 'Setiembre', '10' => 'Octubre', '11' => 'Noviembre', '12' => 'Diciembre');
    }
    
    public static function getMonthsName($month_number=null, $short_text=false) {
        $a_months = self::getMonths();
        $s_month_name = ($short_text ? substr($a_months[$month_number], 0, 3) : $a_months[$month_number]);
        return $s_month_name;
    }

    public static function getYears()
    {
      $actual_year = date('Y');
      $years = array();
      for ($i = 0; $i < 5; $i++) {
        $years[$actual_year - $i] = $actual_year - $i;
      }
      return $years;
    }

    public static function cleanTags($string)
    {
      return preg_replace('/\<.+?\>/', '', $string);
    }

    public static function isMailAcpGroup($email)
    {
      if (preg_match('/^[a-zA-Z\_\.\-0-9]+@(conecta|mibanco|protecta|secura|somosempresa|aprenda|vivencia|innovaccion|cambioygerencia|grupoacp|tiggres)+\.(com|com.pe|.pe){1}$/', $email)) {
        return true;
      }
      return false;
    }

    public static function verifyUrlImage($url = '')
    {
      $url = Utils::extractExtraWhiteSpaces($url);
      if (strlen($url) == 0) {
        return false;
      }
      $hdrs = @get_headers($url);
      if (is_array($hdrs)) {
        /* echo $str_hdrs = '['.implode('][',$hdrs).']';
          print_r($hdrs); */
        //Content-Type: image/jpeg
        if (preg_match('/^HTTP\\/\\d+\\.\\d+\\s+2\\d\\d\\s+.*$/', $hdrs[0])) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }

    /**
     * Imprime con print_r(), el parametro de entrada, formateandolo con etiquetas <pre>
     * Author: Javier Roque
     * Name Method: print_pre
     */
    public static function print_pre($mixed = null)
    {
      echo '<pre>';
      print_r($mixed);
      echo '</pre>';
    }

    public static function downloadCurlContent($url_image = '', $file_name = '', $download_directory = '', $content_type = 'image')
    {
      $return_method = array();
      try {
        $download_directory = (strlen(Utils::ExtractExtraWhiteSpaces($download_directory)) > 0 ? $download_directory : sfConfig::get('app_path_directory') . DIRECTORY_SEPARATOR . proMultimedia::$directory_temp_default);
        $curl_handler = curl_init($url_image);
        $file_name = (strlen($file_name) > 0 ? $file_name : 'unknow_name_' . rand());
        $path_file_name = $download_directory . DIRECTORY_SEPARATOR . $file_name;
        $file_stream = fopen($path_file_name, 'w');

        curl_setopt($curl_handler, CURLOPT_FILE, $file_stream);
        curl_setopt($curl_handler, CURLOPT_HEADER, 0);
        curl_setopt($curl_handler, CURLOPT_SSL_VERIFYPEER, false);
        curl_exec($curl_handler);

        $curl_info = curl_getinfo($curl_handler);
        curl_close($curl_handler);
        fclose($file_stream);

        if ($curl_info['http_code'] != 200) {
          if (file_exists($path_file_name)) {
            unlink($path_file_name);
          }
          throw new Exception('Url no encontrada');
        }

        switch ($content_type) {
          case 'image':
            $mime_type = array(
                'image/jpe' => 'jpg',
                'image/jpeg' => 'jpg',
                'image/jpg' => 'jpg',
                'image/gif' => 'gif',
                'image/bmp' => 'bmp',
                'image/png' => 'png'
            );
            break;

          case 'text':
            $mime_type = array(
                'text/plain' => 'txt',
                'text/html' => 'html',
                'application/json' => 'json',
                'application/xml' => 'xml'
            );
            break;

          default:
            return false;
            break;
        }
        $accepted_formats = array_keys($mime_type);
        if (!in_array($curl_info['content_type'], $accepted_formats)) {
          if (file_exists($path_file_name)) {
            unlink($path_file_name);
          }
          throw new Exception('Formato de archivo no soportado ' . $curl_info['content_type']);
        }
        $file_extension = $mime_type[$curl_info['content_type']];
        rename($path_file_name, $download_directory . DIRECTORY_SEPARATOR . $file_name . '.' . $file_extension);

        $return_method['success'] = 1;
        $return_method['temp_file_name'] = $file_name . '.' . $file_extension;
        $return_method['message'] = 'Imagen generada correctamente';
      } catch (Exception $e) {
        $return_method['success'] = 0;
        $return_method['message'] = $e->getMessage();
      }
      return $return_method;
    }

    public static function updateOrderOlva($orders)
    {
      $dbl_order = array();
      if ($orders instanceof Doctrine_Collection) {
        $dbl_order = $orders;
      } else {
        $dbl_order = new Doctrine_Collection('ordOrder');
        $dbl_order->add($orders);
      }
      $results = null;
      if (count($dbl_order) > 0) {


        $endpoint = sfConfig::get('app_url_olva_normal') . "tiggresService/TiggresWSService?wsdl";
        $uri = sfConfig::get('app_url_olva_normal') . "tiggresService/TiggresWSService";
        $local_cert = sfConfig::get('sf_root_dir') . '/resources/olva.cer';

        $objClient = new SoapClient($endpoint, array("local_cert" => $local_cert, "uri" => $uri, "style" => SOAP_DOCUMENT, "use" => SOAP_LITERAL, "location" => $endpoint, "trace" => true, "exceptions" => true));
        $objClient->__setSoapHeaders();
        $counter = 0;

        foreach ($dbl_order as $dbr_order) {
          $dbr_order->refresh(true);
          if ($dbr_order->getRcvOlva() == 1) {
            $cad_items = '';
            $type_invoice = null;

            foreach ($dbr_order->getItems() as $dbr_orditem) {
              $cad_items .= $dbr_orditem->getTitleName() . ', ';
            }
            foreach ($dbr_order->getContacts() as $dbr_contact) {
              if ($dbr_contact->getType() == 'S') {
                $phone_ship = $dbr_contact->getPhoneNumber();
                $type_doc_ship = explode(':', $dbr_contact->getDni());
                $document_ship = $type_doc_ship[1];
                $type_doc_ship = strtoupper(substr($type_doc_ship[0], 0, 1));
                $first_name_ship = $dbr_contact->getFirstName();
                $last_name_ship = $dbr_contact->getLastName();
                $address_ship = $dbr_contact->getAddress1();
                $reference_ship = $dbr_contact->getAddress2();
                $ubigeo_ship = $dbr_contact->getUbigeoId();
              } elseif ($dbr_contact->getType() == 'F') {
                $phone_inv = $dbr_contact->getPhoneNumber();
                $type_doc_inv = explode(':', $dbr_contact->getDni());
                $document_inv = $type_doc_inv[1];
                $type_doc_inv = strtoupper(substr($type_doc_inv[0], 0, 1));
                $first_name_inv = $dbr_contact->getFirstName();
                $last_name_inv = $dbr_contact->getLastName();
                $address_inv = $dbr_contact->getAddress1();
                $reference_inv = $dbr_contact->getAddress2();
                $ubigeo_inv = $dbr_contact->getUbigeoId();
              }
            }
            if ($dbr_order->getHasInvoice()) {
              $type_invoice = 'F';
              $document_inv = $dbr_order->getShopping()->getCompanyRucInv();
              $type_doc_inv = 'R';
            } else {
              $type_invoice = 'B';
            }
            $args_input[0] = $dbr_order->getNumbergen();
            $args_input[1] = $dbr_order->getSeller()->getName();
            $args_input[2] = $dbr_order->getTotalWeight();
            $args_input[3] = substr($cad_items, 0, -2);

            $args_input[4] = $first_name_ship;
            $args_input[5] = $last_name_ship;
            $args_input[6] = $document_ship;
            $args_input[7] = $address_ship;
            $args_input[8] = $reference_ship;
            $args_input[9] = $phone_ship;
            $args_input[10] = $ubigeo_ship;
            $args_input[11] = $first_name_inv;
            $args_input[12] = $last_name_inv;
            $args_input[13] = $dbr_order->getShopping()->getCompanyNameInv();
            $args_input[14] = $document_inv;
            $args_input[15] = $type_doc_inv;
            $args_input[16] = $address_inv;
            $args_input[17] = $reference_inv;
            $args_input[18] = $ubigeo_inv;
            $args_input[19] = $dbr_order->getSellerId();
            $args_input[20] = $type_doc_ship;
            $args_input[21] = $type_invoice;
            $args_input[22] = $dbr_order->getStatus();

            $response[] = new OrderData($args_input);
            $counter++;
          }
        }

        if ($counter > 0) {
          try {
            $objResponse = $objClient->regPedido(array('pedido' => $response));
            $results = (array) $objResponse->return;
          } catch (SoapFault $fault) {

          }
        }
      }
      return $results;
    }

    /**
     * ORdena un array asociativo de acuerdo al nombre de la clave
     * @param type $array
     * @param type $on
     * @param type $order
     * @return type 
     */
    public static function arrayMultisort($array, $on, $order = 'ASC')
    {
      $new_array = array();
      $sortable_array = array();

      if (count($array) > 0) {
        foreach ($array as $k => $v) {
          if (is_array($v)) {
            foreach ($v as $k2 => $v2) {
              if ($k2 == $on) {
                $sortable_array[$k] = $v2;
              }
            }
          } else {
            $sortable_array[$k] = $v;
          }
        }

        switch ($order) {
          case 'ASC':
            asort($sortable_array);
            break;
          case 'DESC':
            arsort($sortable_array);
            break;
        }

        foreach ($sortable_array as $k => $v) {
          $new_array[$k] = $array[$k];
        }
      }

      return $new_array;
    }

    /**
     *
     * Se utiliza para procesar REFERENCE's o MESSAGE-ID's de cabeceras de mensajes de correo
     * Recibe una lista de ids del tipo <5646asd6a5d4.asd@asd> <5646asd6a598.asd@asd> <5646asd6a899.asd@asd>...
     * y la transforma en  array('5646asd6a5d4.asd@asd','5646asd6a598.asd@asd','5646asd6a899.asd@asd')
     * 
     * @param type $str_ids
     * @return type 
     */
    public static function cleanMessageIds($str_ids = '')
    {

      if (!$str_ids)
        return false;

      $arr_ids = preg_split("/<([^>]+)>/i", $str_ids, 0, PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE);

      return $arr_ids;
    }

    public static function generatePurchaseOrders($response = null)
    {
      /* Generando y actualizando las ordenes de compra */
      ////////////////////////////////////////////////////////////////////////
      $dbl_orders = Doctrine::getTable('ordOrder')->getOrdersForPurchaseOrderGeneration();
      $dbl_created_orders = array();
      $paths = array();
      //echo count($dbl_orders);die();

      set_time_limit(0);

      foreach ($dbl_orders as $dbr_order) {
        $orders = Doctrine::getTable('tgrPurchaseOrder')->generatePurchaseOrders($dbr_order);
        if (is_array($orders)) {
          $dbl_created_orders = array_merge($dbl_created_orders, $orders);
        } else {
          $dbl_created_orders[] = $orders;
        }
      }

      sfConfig::set('sf_web_debug', false);

      if (count($dbl_created_orders)) {

        // Recorremos el Array de Ordenes para encontrar los ids de los proveedores
        $j = 0;
        $id_suppliers = array();
        foreach ($dbl_created_orders as $dbr_order) {
          $id_suppliers[$j] = $dbr_order->getSupplierSellerId();
          $j++;
        }

        // Recorremos el Array de ids de proveedores para generar los correos con las ordenes de compra
        $id_suppliers = array_unique($id_suppliers);
        foreach ($id_suppliers as $id_supplier_seller) {

          $path = array();
          $contact_email = "";
          $contact_name = "";
          $arg_array = array();

          $i = 0;
          foreach ($dbl_created_orders as $dbr_order) {
            if ($id_supplier_seller == $dbr_order->getSupplierSellerId()) {
              $dbr_seller = Doctrine::getTable('tgsSeller')->findOneById($dbr_order->getSellerId());

              // Generando PDF para ordenes de compra
              $pdf = new utilPdf();
              $path[] = $pdf->generatePurchaseOrder($dbr_order, $dbr_seller->getUbigeoId(), true);

              // Generando PDF para etiquetas
              $order = Doctrine::getTable('ordOrder')->findOneByIdAndSellerId($dbr_order->getOrderId(), 96);
              $pdf_eti = new utilPdf();
              $path[] = $pdf_eti->generatTagLabelOrder($order, true);

              $arg_array[$i] = $dbr_order;
              //if ($i==0) {
              $contact_email = $dbr_order->getSupplierSeller()->getContactEmail();
              $contact_name = $dbr_order->getSupplierSeller()->getSupplier()->getName();
              //}
              $i++;
            }
          }

          if (strlen(Utils::extractExtraWhiteSpaces($contact_email)) > 0) {
            try {
              $arg_array['num'] = $i;
              $arg_array['name'] = $contact_name;
              $args = array(
                  'message' => 'alert_purchase_order',
                  'vars' => $arg_array
              );

              $body = sfContext::getInstance()->getController()->getAction(sfContext::getInstance()->getModuleName(), sfContext::getInstance()->getActionName())->getPartial('mail_template', $args);

              $mensaje = Swift_Message::newInstance()
                      ->setFrom(array(sfConfig::get('app_email_from') => sfConfig::get('app_email_from_name')))
                      ->setTo(array($contact_email, 'cpena@tiggres.com', 'jposada@tiggres.com', 'lnoblecilla@tiggres.com'))
                      ->setSubject('Tienes ' . $i . ' ordenes de compra')
                      ->setBody($body, 'text/html');
              for ($k = 0; $k < count($path); $k++) {
                $mensaje->attach(Swift_Attachment::fromPath($path[$k]));
              }

              sfContext::getInstance()->getMailer()->send($mensaje);

              if ($response) {
                $response['success'] = 1;
                $response['message'] = 'Actualizado Correctamente';
              }
            } catch (Exception $e) {
              echo $e->getMessage() . '<br>';
              echo $e->getLine() . '<br>';
              echo $e->getFile() . '<br>';
              echo $e->getTraceAsString() . '<br>';
            }
          }
        }
      }
      ////////////////////////////////////////////////////////////////////////

      return $response;
    }

    /**
     * Devuelve un numero agregandole con ceros a la derecha o izquierda
     *
     * @param decimal $number, numeroa agregar ceros
     * @param integer $length, cantidad de caracteres
     * @param $str_pad
     * @return string
     *
     */
    public static function zeroFill($number, $length, $str_pad = STR_PAD_LEFT)
    {
      $number = trim($number);
      return str_pad($number, $length, '0', $str_pad);
    }

    /**
     * Devuelve una cadena con un texto agregado
     *
     * @param string $texto, texto agregar a la cadena que se retornara
     * @param integer $length, cantidad de caracteres
     * @return string
     *
     */
    public static function fillBlank($texto, $length)
    {
      $texto = trim($texto);
      return str_pad($texto, $length);
    }

    public static function mround($number, $precision = 0)
    {

      $precision = ($precision == 0 ? 1 : $precision);
      $pow = pow(10, $precision);

      $ceil = ceil($number * $pow) / $pow;
      $floor = floor($number * $pow) / $pow;

      $pow = pow(10, $precision + 1);

      $diffCeil = $pow * ($ceil - $number);
      $diffFloor = $pow * ($number - $floor) + ($number < 0 ? -1 : 1);

      if ($diffCeil >= $diffFloor)
        return $floor;
      else
        return $ceil;
    }

}