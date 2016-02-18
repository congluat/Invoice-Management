package model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Users")
public class User implements Serializable{
	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;
	private Integer age;
	
	@OneToMany(mappedBy="user")
	Collection<Invoice> invoices;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Collection<Invoice> getInvoices() {
		return invoices;
	}
	public void setInvoices(Collection<Invoice> invoices) {
		this.invoices = invoices;
	}
	
	
}
