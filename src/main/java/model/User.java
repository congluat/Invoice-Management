package model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Users")
public class User implements Serializable{
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty
	@Size(max=100)
	private String name;
	
	@Range(min=1,max=110)
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
	
	@JsonIgnore
	public Collection<Invoice> getInvoices() {
		return invoices;
	}
	public void setInvoices(Collection<Invoice> invoices) {
		this.invoices = invoices;
	}
	
	
}
