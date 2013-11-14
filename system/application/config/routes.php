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
$route['usuarios/listar.html']                      = 'User/index';
$route['usuarios/agregar.html']                     = 'User/maintenanceUser';
$route['usuarios/(:num)/modificar.html']            = 'User/maintenanceUser/$1';

/*
 * Rutas de acceso al modulo de perfiles
 */
$route['perfil/listar.html']                        = 'Profile/index';
$route['perfil/agregar.html']                       = 'Profile/maintenanceProfile';
$route['perfil/(:num)/modificar.html']              = 'Profile/maintenanceProfile/$1';
$route['perfil/(:num)/eliminar.html']               = 'Profile/deleteProfile/$1';
$route['perfil/exportar-excel.html']                = 'Profile/exportExcel';
$route['perfil/cargar-datos-tabla.html']            = 'Profile/getDataTable';

$route['perfil/(:num)/permisos-por-modulo.html']    = 'Profile/getModalPermission/$1';
$route['perfil/guardar-permisos-por-modulo.html']   = 'Profile/saveModalPermission';

/*
 * Rutas de acceso al modulo de ventas diarias
 */
$route['venta-diaria/listar.html']                  = 'DailySales/index';
$route['venta-diaria/registrar.html']               = 'DailySales/maintenanceForm';
$route['venta-diaria/(:num)/modificar.html']        = 'DailySales/maintenanceForm/$1';
$route['venta-diaria/procesar-datos.html']          = 'DailySales/processForm';

$route['venta-diaria/lista-operarios.html']         = 'DailySales/getJSONOperators';
$route['venta-diaria/otras-ventas-diarias.html']    = 'DailySales/getJSONDailySaleOthers';
$route['venta-diaria/venta-diaria-por_fecha.html']    = 'DailySales/getDailySaleCalendar';

$route['404_override'] = '';


/* End of file routes.php */
/* Location: ./application/config/routes.php */