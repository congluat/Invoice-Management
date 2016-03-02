package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "Invoices")
public class Invoice implements Serializable {
	@Id
	@GeneratedValue
	private Integer id;

	@NotEmpty
	@Size(max = 100)
	private String name;

	@Digits(integer =15,fraction =3)
	@NotNull
	private BigDecimal amount;

	@Temporal(TemporalType.TIMESTAMP)
	private Date time;

	@Size(max = 200)
	private String comment;
	private Boolean isWarning = false;

	@Size(max = 200)
	private String place;
	// private Integer CategoryId;

	@OneToMany(mappedBy = "invoice", fetch = FetchType.EAGER)
	private Collection<Photo> photos;

	public Collection<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(Collection<Photo> photos) {
		this.photos = photos;
	}

	@ManyToOne()
	@JoinColumn(name = "CategoryId")
	Category category;

	@ManyToOne()
	@JoinColumn(name = "UserId")
	User user;

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
