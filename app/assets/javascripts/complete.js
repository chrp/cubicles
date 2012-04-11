///////////////////////////////////////
//
// domready...
//
//////////////////////////////////////
$(document).ready(function () {
  
    // toggle default values in forms
    //--------------------------------------------------------------------------
    $('.has-default-value').toggleDefaultValue();
    
    
    // adjust font size
    //--------------------------------------------------------------------------
    adjustBaseFontSize(365); // 360 is calibri height
    
    
    // remove submit button outline
    //--------------------------------------------------------------------------
    $('.f-submit').focus(function(){ $(this).blur(); });
    
    
    // submit search
    //--------------------------------------------------------------------------
    $('.search-form').submit(function(){
        
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
                $(this).parent('div').after('<p class="error-warning">Please enter a search term!</p>');   
            }
        });
        if(!hasErrors) {
           return true;
        }
        return false;
    });
});
