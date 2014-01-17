$(document).ready(function() {
    $('#form_recover_dni').on('keyup', function() {
        var $this = $(this);
        if (!$this.val()) {
            return false;
        }

        if ($this.val().length < 8) {
            return false;
        }

        $.ajax({
            url: $this.data('url_verify_user'),
            type: 'post',
            data: {user_dni: $this.val()},
            dataType: 'json',
            success: function(response) {
                var $error_user = $this.parent();
                if ($error_user.find('.has-error').length) {
                    $error_user.find('.has-error').remove();
                }
                if (response.success === 1) {
                    $('#form_recover_secret_question').html('Respuesta Secreta : ¿' + response.secret_question + '?');
                    $('.view-recover').show();
                } else {
                    $error_user.append('<span class="has-error">' + response.message + '</span>')
                }
            }
        });
    });
});

