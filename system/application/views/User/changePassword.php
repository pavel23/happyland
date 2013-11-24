<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Cambiar Contraseña</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">                        
                <?php echo form_open(site_url('User/changePassword'), array('class' => 'form-horizontal')); ?>
                <?php if ($this->session->flashdata('message')) : ?>
                    <div class="alert alert-danger">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
                    </div>
                <?php endif; ?>
                <div class="form-group">
                    <?php echo form_label('Contraseña Actual', 'formuser_current_password', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">                        
                        <?php echo form_input(array('name' => 'formuser[current_password]', 'id' => 'formuser_current_password', 'type' => 'password', 'placeholder' => 'Contraseña Actual', 'autofocus' => 'autofocus', 'class' => 'form-control'), set_value('formuser[current_password]')) ?>       
                        <?php echo form_error('formuser[current_password]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Nueva Contraseña', 'formuser_new_password', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[new_password]', 'id' => 'formuser_new_password', 'type' => 'password', 'placeholder' => 'Ingresar Nueva Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control'), set_value('formuser[new_password]')) ?>       
                        <?php echo form_error('formuser[new_password]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Repetir Nueva Contraseña', 'formuser_repeat_new_password', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[repeat_new_password]', 'id' => 'formuser_repeat_new_password', 'type' => 'password', 'placeholder' => 'Repetir Nueva Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>
                        <?php echo form_error('formuser[repeat_new_password]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Pregunta Secreta', 'formuser_secret_question', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[secret_question]', 'id' => 'formuser_secret_question', 'type' => 'text', 'placeholder' => 'Pregunta Secreta', 'autofocus' => 'autofocus', 'class' => 'form-control'), set_value('formuser[secret_question]')) ?>
                        <?php echo form_error('formuser[secret_question]') ?>
                    </div>
                </div>

                <div class="form-group">
                    <?php echo form_label('Respuesta a la Pregunta Secreta', 'formuser_secret_answer', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_password(array('name' => 'formuser[secret_answer]', 'id' => 'formuser_secret_answer', 'type' => 'text', 'placeholder' => 'Respuesta Pregunta Secreta', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>
                        <?php echo form_error('formuser[secret_answer]') ?>
                    </div>
                </div>

                <div class="form-actions no-margin-bottom">
                    <?php echo form_submit('Save', 'Guardar', 'class="btn btn-primary"'); ?>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>