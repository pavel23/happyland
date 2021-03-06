<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
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

$route['default_controller'] = 'login';

/*
 * Rutas de acceso al modulo de login
 */
$route['login.html'] = 'Login/index';
$route['autenticacion.html'] = 'Login/authentication';
$route['verificar_usuario.html'] = 'Login/verifyUser';
$route['recuperar_contrasenia.html'] = 'Login/recovering';

/*
 * Rutas de acceso al modulo de perfiles
 */
//$route['usuarios/page/(:num)/listar.html']    = 'User/index';
$route['usuarios/listar.html'] = 'User/index';
$route['usuarios/agregar.html'] = 'User/maintenanceUser';
$route['usuarios/(:num)/modificar.html'] = 'User/maintenanceUser/$1';
$route['usuarios/(:num)/eliminar.html'] = 'User/deleteUser/$1';
$route['usuarios/cargar-datos-tabla.html'] = 'User/getDataTableList';
$route['usuarios/cambiar_contrasenia.html'] = 'User/changePassword';

$route['index.html']                               = 'Dashboard/index';
$route['ventas-diarias/datos-grafico-barras.html'] = 'Dashboard/DayliSalesBarChart';

$route['directorio-principal.html'] = 'Dashboard/DirectoryDashboardIndex';
$route['zonales-principal.html']    = 'Dashboard/ZonalDashboardIndex';
$route['data-gauge-zonal.html']    = 'Dashboard/getDataGaugeByZonal';


/*
 * Rutas de acceso al modulo de perfiles
 */
$route['perfil/listar.html'] = 'Profile/index';
$route['perfil/agregar.html'] = 'Profile/maintenanceProfile';
$route['perfil/(:num)/modificar.html'] = 'Profile/maintenanceProfile/$1';
$route['perfil/(:num)/eliminar.html'] = 'Profile/deleteProfile/$1';
$route['perfil/exportar-excel.html'] = 'Profile/exportExcel';
$route['perfil/cargar-datos-tabla.html'] = 'Profile/getDataTableList';
$route['perfil/(:num)/permisos-por-modulo.html'] = 'Profile/getModalPermission/$1';
$route['perfil/guardar-permisos-por-modulo.html'] = 'Profile/saveModalPermission';

/*
 * Rutas de acceso al modulo de ventas diarias
 */
$route['venta-diaria/listar.html'] = 'DailySales/index';
$route['venta-diaria/listado-control-gestion.html'] = 'DailySales/managementIndex';
$route['venta-diaria/cargar-datos-venta-control-gestion.html'] = 'DailySales/getManagementListData';
$route['venta-diaria/registrar.html'] = 'DailySales/maintenanceForm';
$route['venta-diaria/(:num)/modificar.html'] = 'DailySales/maintenanceForm/$1';
$route['venta-diaria/procesar-datos.html'] = 'DailySales/processForm';
$route['venta-diaria/(:num)/cerrar-venta-diaria.html'] = 'DailySales/closeDailySale/$1';
$route['venta-diaria/(:num)/abrir-venta-diaria.html'] = 'DailySales/openDailySale/$1';
$route['venta-diaria/exportar-venta-diaria.html'] = 'DailySales/exportExcel';

$route['venta-diaria/listar-presupuesto.html'] = 'BudgetSales/listBudget';
$route['venta-diaria/registrar-presupuesto.html'] = 'BudgetSales/maintenanceBudget';
$route['venta-diaria/(:num)/modificar-presupuesto.html'] = 'BudgetSales/maintenanceBudget/$1';
$route['venta-diaria/(:num)/cargar-datos-presupuesto.html'] = 'BudgetSales/getDataBudgetJson/$1';
$route['venta-diaria/(:num)/guardar-datos-presupuesto.html'] = 'BudgetSales/saveDataBudget/$1';

$route['venta-diaria/lista-operarios.html'] = 'DailySales/getJSONOperators';
$route['venta-diaria/otras-ventas-diarias.html'] = 'DailySales/getJSONDailySaleOthers';
$route['venta-diaria/venta-diaria-por_fecha.html'] = 'DailySales/getDailySaleCalendar';
$route['venta-diaria/cargar-datos-tabla.html'] = 'DailySales/getDataTableList';

$route['reportes/seleccionar-reporte.html'] = 'Reports/index';
$route['reportes/ventas-por-dia.html'] = 'Reports/reportSalesByDay';
$route['reportes/ventas-acumuladas-rango-fecha.html'] = 'Reports/reportSalesAccumulatedByRange';

$route['404_override'] = '';


/* End of file routes.php */
/* Location: ./application/config/routes.php */