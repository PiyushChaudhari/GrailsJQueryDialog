package com.dialog

import java.text.SimpleDateFormat

import javax.servlet.http.HttpServletResponse

class StudentController {

    def index() { }
	
	def studentList(){
		render(template:'studentList',model:[studentList:Student.findAll([sort:'name',order:'asc'])])
	}
	
	def openStudentPopUp(){
		render(template:'student',model:[calledAction:'createStudent'])
	}
	
	def createStudent(){
		def student=new Student()
		student.name=params?.name ? params?.name : null
		student.dateOfBirth =params?.dateOfBirth ? new SimpleDateFormat("MM/dd/yyyy").parse(params?.dateOfBirth) : null
		student.address =params?.address ? params?.address :null
		student.higestQualification = params?.higestQualification ? params?.higestQualification : null
		if(student?.validate()){
			student.save(flash:true)
			redirect(action:"studentList",status:HttpServletResponse.SC_OK)			
		}else{
			render(template:'student',model:[student:student,calledAction:'createStudent'],status:HttpServletResponse.SC_INTERNAL_SERVER_ERROR)
		}
	}
	
	def editStudent(){
		def student=Student.get(params?.id)
		render(template:'student',model:[student:student,calledAction:'updateStudent'])
	}
	
	def updateStudent(){
		def student=Student.get(Long.valueOf(params?.id))
		student.name=params?.name ? params?.name : null
		student.dateOfBirth =params?.dateOfBirth ? new SimpleDateFormat("MM/dd/yyyy").parse(params?.dateOfBirth) : null
		student.address =params?.address ? params?.address :null
		student.higestQualification = params?.higestQualification ? params?.higestQualification : null
		if(student?.validate()){
			student.save(flash:true)
			render(template:'studentList',model:[studentList:Student.findAll([sort:'name',order:'asc']),calledAction:'updateStudent'],status:HttpServletResponse.SC_OK)
		}else{
			render(template:'student',model:[student:student,calledAction:'updateStudent'],status:HttpServletResponse.SC_INTERNAL_SERVER_ERROR)
		}
	}
	
	def deleteStudent(){
		def student=Student.get(params?.id)
		student.delete(flash:true)
		redirect(action:"studentList")
	}
}
