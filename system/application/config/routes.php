<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

$route['default_controller']            = 'Login';

/*
 * Rutas de acceso al modulo de login
 */
$route['login.html']                    = 'Login/index';

/*
 * Rutas de acceso al modulo de perfiles
 */
$route['usuarios/listar.html']                    = 'User/index';
$route['usuarios/agregar.html']                   = 'User/maintenanceUser';
$route['usuarios/(:num)/modificar.html']          = 'User/maintenanceUser/$1';

/*
 * Rutas de acceso al modulo de perfiles
 */
$route['perfil/listar.html']                    = 'Profile/index';
$route['perfil/agregar.html']                   = 'Profile/profile_maintenance';
$route['perfil/(:num)/modificar.html']          = 'Profile/profile_maintenance/$1';
$route['perfil/(:num)/eliminar.html']           = 'Profile/profile_delete/$1';
$route['perfil/exportar-excel.html']            = 'Profile/export_excel';

/*
 * Rutas de acceso al modulo de ventas diarias
 */
$route['venta-diaria/listar.html']              = 'daily_sales_controller/index';
$route['venta-diaria/registrar.html']           = 'daily_sales_controller/maintenanceForm';
$route['venta-diaria/(:num)/modificar.html']    = 'daily_sales_controller/maintenanceForm/$1';
$route['venta-diaria/procesar-datos.html']      = 'daily_sales_controller/processForm';

$route['venta-diaria/lista-operarios.html']      = 'daily_sales_controller/getJSONOperators';
$route['venta-diaria/otras-ventas-diarias.html'] = 'daily_sales_controller/getJSONDailySaleOthers';

$route['404_override'] = '';


/* End of file routes.php */
/* Location: ./application/config/routes.php */