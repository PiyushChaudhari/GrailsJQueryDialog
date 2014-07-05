<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
<g:javascript>
	var actionType = "${calledAction}";
	if(actionType == 'updateStudent'){
		$("#studentFormPopUp").dialog( 'option','title','Update Student');
	}else{
		$("#studentFormPopUp").dialog( 'option','title','Create Student');
	}
	$( "#dateOfBirth" ).datepicker({
		dateFormat: "mm/dd/yy",
		changeMonth: true,
     	changeYear: true,
	});
</g:javascript>
<r:layoutResources/>
</head>
<body>
<r:layoutResources/>
		<g:formRemote name="studentForm" url='[controller: 'student', action:"${calledAction}"]' update="[success: 'studentListTable', failure: 'studentFormPopUp']" onSuccess="hidePopUp('studentFormPopUp');">
		<g:if test="${calledAction == 'updateStudent' }" >
			<g:hiddenField name="id" value="${student?.id}" />
		</g:if>
		<div id="studentFormPopUp-content">
	  		<table>
				<tbody>
					<tr>
				  		<td>Name:</td> 
				  		<td><g:textField name="name" id="name" value="${student?.name}"  /></td>
				  	</tr>
				  	<tr>
				  		<td></td> 
				  		<td> <g:fieldError bean="${student}" field="name"></g:fieldError> </td>
				  	</tr>
				  	<tr>
				  		<td>Date Of Birth:</td> 
				  		<td><g:textField name="dateOfBirth" id="dateOfBirth" value="${student?.dateOfBirth ? formatDate(format:"MM/dd/yyyy",date:student?.dateOfBirth) : student?.dateOfBirth}"  /></td>
				  	</tr>
				  	<tr>
				  		<td></td> 
				  		<td><g:fieldError bean="${student}" field="dateOfBirth"/></td>
				  	</tr>
				  	<tr>
				  		<td valign="top">Address:</td> 
				  		<td><g:textArea name="address">${student?.address}</g:textArea> </td>
				  	</tr>
				  	<tr>
				  		<td>Higest Qualification:</td> 
				  		<td><g:select name="higestQualification" noSelection="['':'-Select-']" id="higestQualification" from="${com.dialog.Student.HigestQulification.values()}" value="${student?.higestQualification}" /></td>
				  	</tr>
				  	<tr>
				  		<td></td>
				  		<td><g:fieldError bean="${student}" field="higestQualification"/></td>
				  	</tr>
			  	</tbody>	
		  	</table>
	  	</div>
	 	<div id="popup-footer" class="popUpDailogFooter" align="right">
			<g:submitButton class="blueRegularSizeEditButton" name="Save"/>
	 		<input class="blueRegularSizeEditButton" type="button" value="Cancel" onclick="$('#studentFormPopUp').dialog('close')"/>			
		</div>
		</g:formRemote>
  </body>
</html>