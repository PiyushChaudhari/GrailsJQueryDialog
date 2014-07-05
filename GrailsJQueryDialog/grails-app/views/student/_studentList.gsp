<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Date OF Birth</th>
				<th>Address</th>
				<th>Qualification</th>
				<th></th>				
			</tr>
		</thead>
		<tbody>
			<g:if test="${studentList}">
				<g:each in="${studentList}" var="student" >
		 			<tr>
			 			<td><g:fieldValue bean="${student}" field="name" /></td>
			 			<td align="center"><g:formatDate format="MM/dd/yyyy" date="${student?.dateOfBirth}"/> </td>
			 			<td><g:fieldValue bean="${student}" field="address" /></td>
			 			<td align="left"><g:fieldValue bean="${student}" field="higestQualification" /></td>
			 			<td>
			 				<span title="Edit ${student?.name}" onclick="${remoteFunction(controller:"student",action:"editStudent",id:student?.id,update:"studentFormPopUp",onLoading:"showAjaxLoader();",onLoaded:"hideAjaxLoader('studentFormPopUp');")}" class="ui-icon ui-icon-pencil"></span>
			 				<span title="Delete ${student?.name}" onclick="${remoteFunction(controller:"student",action:"deleteStudent",id:student?.id,update:"studentListTable",onLoading:"showAjaxLoader();",onLoaded:"hideAjaxLoader('');")}" class="ui-icon ui-icon-trash"></span>		 				
			 			</td>
		 			</tr>
	 			</g:each>
	 		</g:if>
	 		<g:else>
	 			<tr>
	 				<td colspan="100%" align="center" >No record found.</td>
	 			</tr>
	 		</g:else>
		</tbody> 		
 </table>