SELECT sbs.`name`, dls.total_opening_cash, dls.total_closing_cash, dls.grand_total_calculated, dls.grand_total_z_format 
FROM hpl_daily_sales dls
INNER JOIN hpl_subsidiaries sbs ON(dls.subsidiaries_id=sbs.id);

SELECT tos.name, usr.full_name, dld.opening_cash, dld.closing_cash, dld.retirement_amount_pen, dld.total_calculated, dld.total_x_format
FROM hpl_daily_sales_detail dld
INNER JOIN hpl_type_of_sales tos ON(tos.id=dld.type_of_sales_id)
LEFT JOIN hpl_user usr ON(usr.id=dld.operator_id);