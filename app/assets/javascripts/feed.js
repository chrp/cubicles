///////////////////////////////////////
//
// domready...
//
//////////////////////////////////////
$(document).ready(function () {

    
    // start me up!!!
    //--------------------------------------------------------------------------
    setInterval(updateFeed, (interval * 1000));
    
    
    // style file inputs
    //--------------------------------------------------------------------------
    $('input[type="file"]').maskFileInput();
    $('textarea.max-350').maxlength(350);
    $('textarea.max-400').maxlength(400);
    
    
    // toggle default values in forms
    //--------------------------------------------------------------------------
    $('.has-default-value').toggleDefaultValue();
    
    
    // adjust font size
    //--------------------------------------------------------------------------
    adjustBaseFontSize(365); // 360 is calibri height
    
    
    // remove submit button outline
    //--------------------------------------------------------------------------
    $('.f-submit').focus(function(){ $(this).blur(); });
    

    // submit form
    //--------------------------------------------------------------------------
    $('.comment-form').submit(function(){
        
        var hasErrors = false;
        //remove old warnings
        if($('.error-warning').length > 0) {
            $('.error-warning').remove();
        }
        
        // prevent sending of default values
        $(this).find('.has-default-value').each(function(){
            // found element still containing default value
            if($(this).isDefaultValue()) {
                hasErrors = true;
                $(this).after('<p class="error-warning">Please fill in this field!</p>');   
            }
        });
        if(!hasErrors) {
           return true;
        }
        return false;
    });

});