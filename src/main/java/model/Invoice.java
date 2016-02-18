package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Invoices")
public class Invoice implements Serializable{
	@Id
	@GeneratedValue
	private Integer id;
	private String name;
	private BigDecimal amount;
	
	@Column(name = "Time", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date time;
	
	private String comment;
	private Boolean isWarning;
	private String place;
	//private Integer CategoryId;
	
	@ManyToOne()
	@JoinColumn(name="CategoryId")
	private Category category;
	
	@ManyToOne()
	@JoinColumn(name="UserId")
	private User user;

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

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Boolean getIsWarning() {
		return isWarning;
	}

	public void setIsWarning(Boolean isWarning) {
		this.isWarning = isWarning;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
