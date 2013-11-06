<?php foreach($a_permission_modules as $parent_module_id => $a_modules) {?>
    <?php echo form_checkbox('module[' . $parent_module_id . ']', 'accept', TRUE);?><?php echo $a_modules['name'];?>
    <br />
    <?php foreach($a_modules['children'] as $children_module_id => $a_children_modules) {?>
        - <?php echo form_checkbox('module[' . $a_children_modules['id'] . ']', 'accept', TRUE);?><?php echo $a_children_modules['name'];?><br />
    <?php }?>
    <br />
<?php }?>

