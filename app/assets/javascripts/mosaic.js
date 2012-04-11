///////////////////////////////////////
//
// domready...
//
//////////////////////////////////////
$(document).ready(function () {
    
    // adjust font size
    //--------------------------------------------------------------------------
    adjustBaseFontSize(365); // 360 is calibri height
    
    
    // do the math...
    //--------------------------------------------------------------------------
    scaleAndCenterMosaic();
    
    $(window).resize( function() { scaleAndCenterMosaic(); }); 
    
    // reload page periodically
    //--------------------------------------------------------------------------
    setInterval(function(){
        window.location.reload();
    }, interval * 1000);
    
});