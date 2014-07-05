import java.text.DateFormat
import java.text.SimpleDateFormat

import com.dialog.Student
import com.dialog.Student.HigestQulification;

class BootStrap {

    def init = { servletContext ->
		new Student(name:"Piyush Chaudhari",dateOfBirth:new SimpleDateFormat("MM/dd/yyyy").parse("10/20/2012"),address:"Surat Gujarat",higestQualification:HigestQulification.MCA).save(validate:false,failOnError:true)
		new Student(name:"Saurabh Chaudhari",dateOfBirth:new SimpleDateFormat("MM/dd/yyyy").parse("15/02/2013"),address:"Surat Gujarat",higestQualification:HigestQulification.BTech).save(validate:false,failOnError:true)
		new Student(name:"Alpan Patel",dateOfBirth:new SimpleDateFormat("MM/dd/yyyy").parse("05/21/2014"),address:"Valsad Gujarat",higestQualification:HigestQulification.MTech).save(validate:false,failOnError:true)
		new Student(name:"Vipul Solanki",dateOfBirth:new SimpleDateFormat("MM/dd/yyyy").parse("05/06/2016"),address:"Somnath Gujarat",higestQualification:HigestQulification.MCA).save(validate:false,failOnError:true)
		new Student(name:"Harsad Chaudhari",dateOfBirth:new SimpleDateFormat("MM/dd/yyyy").parse("10/11/2016"),address:"Rajkot Gujarat",higestQualification:HigestQulification.MCA).save(validate:false,failOnError:true)
    }
    def destroy = {
    }
}
