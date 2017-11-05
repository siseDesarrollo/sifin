// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables
//= require_tree .

$(document).ready(function(){

    //CLASE PARA LAS NOTIFICACIONES
	if($('.notice').text()!=''){
        var firstCharacter = $('.notice').text().substring(0,1);
        var text_notice    = $('.notice').text().substring(1);
        var text_notice_complete = $('.notice').text()
        switch(firstCharacter){
         	case '1': $().toastmessage('showSuccessToast', text_notice);
         	          break;
         	case '2': $().toastmessage('showNoticeToast', text_notice);
         	          break;
         	case '3': $().toastmessage('showWarningToast', text_notice);
         	          break;
         	case '4': $().toastmessage('showErrorToast', text_notice);
         	          break;
         	default: $().toastmessage('showNoticeToast', text_notice_complete);
         	          break;
        }    
    }

    //CLASE PARA TABLAS
    $('.datatable').dataTable( {
        //"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
        //"sPaginationType": "bootstrap",
        "bRetrieve": true,
        "aaSorting": [[ 0, "asc" ]],    
        "oLanguage": {
            "sProcessing":   "Procesando...",
            "sLengthMenu":   "Mostrar _MENU_ ",
            "sZeroRecords":  "No se encontraron resultados",
            "sInfo":         "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
            "sInfoEmpty":    "Mostrando desde 0 hasta 0 de 0 registros",
            "sInfoFiltered": "(filtrado de _MAX_ registros en total)",
            "sInfoPostFix":  "",
            "sSearch":       "Buscar en la tabla:",
            "sUrl":          "",
            "oPaginate": {
                "sFirst":    "Primero",
                "sPrevious": "Anterior",
                "sNext":     "Siguiente",
                "sLast":     "Último"
            }
        }
    });
});
