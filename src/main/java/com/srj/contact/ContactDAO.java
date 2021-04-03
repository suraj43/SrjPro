package com.srj.contact;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactDAO 
{
	String saveDetailsForContact(ContactModel appointmentmodel);

	List<ContactModel> getListContact();

	void delete(int contactId);

	ContactModel get(int contactId);
	

}
