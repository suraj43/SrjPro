package com.srj.contact;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ContactDAOImpl implements ContactDAO 
{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Transactional
	@Override
	public String saveDetailsForContact(ContactModel appointmentmodel) 
	{
		String output = "ERROR";
		Statement stmt = null;
		int  	id =0;
		id 	  =  appointmentmodel.getContactId();
		String 	fname =  appointmentmodel.getFname()!=null && appointmentmodel.getFname().length()>0 ? appointmentmodel.getFname().trim():"0";
		String 	lname =  appointmentmodel.getLname()!=null && appointmentmodel.getLname().length()>0 ? appointmentmodel.getLname().trim():"-";
		String 	email =  appointmentmodel.getEmail()!=null && appointmentmodel.getEmail().length()>0 ? appointmentmodel.getEmail().trim():"-";
		String 	contact =  appointmentmodel.getContact()!=null && appointmentmodel.getContact().length()>0 ? appointmentmodel.getContact().trim():"-";
		String 	status  =  appointmentmodel.getStatus()!=null && appointmentmodel.getStatus().length()>0 ? appointmentmodel.getStatus().trim():"-";
		
		Connection connection = null;
		try
		{
			connection = jdbcTemplate.getDataSource().getConnection();
			
			StringBuilder qString = new StringBuilder();
		if(id>0) {
			qString.append(	"Update Contact set fName='"+fname+"',lName='"+lname+"',email='"+email+"',mobNo="+contact+",status='"+status+"' where contact_id="+id);
		
		}else {
			qString.append(	"insert into Contact(contact_id,fName,lName,email,mobNo,status)");
			qString.append(	" values(contact_seq.NEXTVAL,'"+fname+"','"+lname+"','"+email+"',"+contact+",'"+status+"')");
		}			
			stmt = connection.createStatement( );
			int  rslt = stmt.executeUpdate(qString.toString()); 
			
			if(rslt>0)
			{
				output = "PASS.APPOINTMENT SCHEDULED SUCCESSFULLY ON ";
			}
			else
			{
				output = "FAIL.UNABLE TO SCHEDULE YOUR APPINTMENT , PLEASE TRY AGAIN LATER.";
			}
			
		}
		catch (Exception e) 
		{
			 System.out.print(Thread.currentThread().getStackTrace()[1].getClassName());
			 System.out.print(Thread.currentThread().getStackTrace()[1].getMethodName()+" : "+e);
		}
		finally
        {
       	 try 
       	 { 
	        	if(connection!= null)
	        	{
	 				connection.close();
	 			}
	 			
       	 }
       	catch (Exception e)
    		{
    			System.out.print(Thread.currentThread().getStackTrace()[1].getClassName());
    			System.out.print(Thread.currentThread().getStackTrace()[1].getMethodName()+" : "+e);
    			
    		}
        }    
		  return output;
	}
	

	@Transactional
	@Override
	public List<ContactModel> getListContact() {
		List<Object[]>  results=null;
		Statement stmt = null;
		Connection connection = null;
		List<ContactModel> list=null;
		try
		{
			
			
			connection = jdbcTemplate.getDataSource().getConnection();
			stmt = connection.createStatement(  );
			 list = jdbcTemplate.query("SELECT * FROM contact", new RowMapper<ContactModel>() {

				public ContactModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					ContactModel emp = new ContactModel();
					emp.setContactId(rs.getInt("contact_id"));
					emp.setFname(rs.getString("fname"));
					emp.setLname(rs.getString("lname"));
					emp.setEmail(rs.getString("email"));
					emp.setContact(rs.getString("mobno"));
					emp.setStatus(rs.getString("status"));

					return emp;
				}

			});
			
			
			
		}
		catch(Exception e)
		{

		}
		return list;

	}
	
	
	
	public void delete(int contactId) {
	    String sql = "DELETE FROM contact WHERE contact_id=?";
	    jdbcTemplate.update(sql, contactId);
	   
	}
	
	
	public ContactModel get(int contactId) {
	    String sql = "SELECT * FROM contact WHERE contact_id=" + contactId;
	    return jdbcTemplate.query(sql, new ResultSetExtractor<ContactModel>() {
	 
	        public ContactModel extractData(ResultSet rs) throws SQLException,
	                DataAccessException {
	            if (rs.next()) {
	            	ContactModel contact = new ContactModel();
	                contact.setContactId(rs.getInt("contact_id"));
	                contact.setFname(rs.getString("fname"));
	                contact.setLname(rs.getString("lname"));
	                contact.setEmail(rs.getString("email"));
	                contact.setContact(rs.getString("mobno"));
	                contact.setStatus(rs.getString("status"));
	                return contact;
	            }
	 
	            return null;
	        }
	 
	    });
	}
	
	
}
