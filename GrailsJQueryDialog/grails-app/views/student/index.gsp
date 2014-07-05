<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">

<title>Grails JQuery Dialog</title>
<g:javascript library="jquery" />
<r:require modules="jquery-ui"/>
<g:javascript library="blockUI" />
<g:javascript>
	$(document).ready(function() {
       <g:remoteFunction controller="student" action="studentList" update="studentListTable" onLoading="showAjaxLoader();" onLoaded="hideAjaxLoader('');" />
       $("#studentFormPopUp").dialog({
				resizable: false,
			    autoOpen: false,
			    position: [null, 100],
			    dialogClass: "myDialogClass",
			    height:'auto',
			    width:'auto',
			    modal: true,
				open : function(event, ui) {
					$("#studentFormPopUp").dialog( 'option','title','Student');
				},
				beforeClose: function() {
					$('div.ui-widget-overlay').removeClass('dailog-overlay-style');
			    }
			});
    });
    
    function showAjaxLoader(){
		    $.blockUI( { message: "<h5>Loading...</h5>"} );
		}
		function hideAjaxLoader(elementId){
		    $.unblockUI();
		    if(elementId.length > 0){
		        $(".ui-dialog-titlebar").show();
		        $("#"+elementId).dialog( "open" );
		    }
		}
		function hidePopUp(popUpName){			
		    $('#'+popUpName).dialog('close');
		}
</g:javascript>
<r:layoutResources/>
</head>
<body>
<r:layoutResources/>
	<br><br>
	<div id="studentFormPopUp" style="display: none;"></div>
	<div align="center">
		<button onclick="${remoteFunction(controller:"student",action:"openStudentPopUp",update:"studentFormPopUp",onLoading:"showAjaxLoader();",onLoaded:"hideAjaxLoader('studentFormPopUp');")}">Add</button>
	</div>
  	<div id="studentListTable" class="table-style" align="center" style="overflow: auto;"></div>
</body>
</html>