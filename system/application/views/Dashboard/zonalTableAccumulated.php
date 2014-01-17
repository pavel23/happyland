<table class="table table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Local</th>
            <th>Ppto.</th>
            <th>Vta. Real</th>
            <th>Vta. Real/Ppto.</th>
            <th>% Vta. vs Total</th>
        </tr>
    </thead>
    <tbody>
        <?php $local_number=1;?>
        <?php foreach($data_table as $table){?>
            <?php 
                $sale_vs_ppto       = number_format(($table->grand_total_z_format_sum/$table->budget_amount_sum)*100, 2);
                $icon_style         = ($sale_vs_ppto>=100 ? 'glyphicon-circle-arrow-up' : 'glyphicon-circle-arrow-down');
                $percent_sale_accum = number_format(($table->grand_total_z_format_sum/$total_z_sum)*100, 2);
                if($sale_vs_ppto>=0 && $sale_vs_ppto<95) {
                    $text_style = 'red_text';
                } elseif($sale_vs_ppto>=95 && $sale_vs_ppto<=100) {
                    $text_style = 'yellow_text';
                }else {
                    $text_style = 'green_text';
                }
            ?>
            <tr>
                <td><?php echo $local_number;?></td>
                <td><?php echo $table->subsidiaries_name;?></td>
                <td>S/. <?php echo number_format($table->budget_amount_sum, 2);?></td>
                <td>S/. <?php echo number_format($table->grand_total_z_format_sum, 2);?></td>
                <td class="<?php echo $text_style;?>"><?php echo $sale_vs_ppto;?> % <span class="glyphicon <?php echo $icon_style;?>"></span></td>
                <td><?php echo number_format($percent_sale_accum, 2);?> %</td>
                <?php $local_number++;?>
            </tr>
        <?php }?>
    </tbody>
</table>