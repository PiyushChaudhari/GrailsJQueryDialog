package com.dialog

class Student {

	String name
	Date dateOfBirth
	String address
	HigestQulification higestQualification
	
	enum HigestQulification{
		MCA,
		BCA,
		BTech,
		MTech,
		BSc,
		MSc
	}
	
    static constraints = {
		name blank:false,nullable:false
		address blank:true,nullable:true		
    }
	
	static mapping = {
		name(type:"text")
		address(type:"text")
	}
}
