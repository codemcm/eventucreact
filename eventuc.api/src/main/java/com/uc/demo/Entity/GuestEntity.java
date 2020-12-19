package com.uc.demo.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="guest")
public class GuestEntity {
	
	  @Id //indicamos que es el id
	  @GeneratedValue(strategy=GenerationType.IDENTITY)// Agregamos que es autoincrementable
	  @Column(name="guest_id") //relacion con el campo de la bd
	  private Integer guestId;
	  @Column(name="name", nullable=false, length=50)
	  private String name;
	  @Column(name="last_name")
	  private String lastName;
	  @Column(name="created_date")
	  private Date createdDate;
	  @Column(name="active")
	  private Boolean active;
	  @Column(name="created_by")
	  private int createdBy;

	  public Integer getGuestId() {
	    return guestId;
	  }

	  public void setGuestId(Integer guestId) {
	    this.guestId = guestId;
	  }

	  public String getName() {
	    return name;
	  }

	  public void setName(String name) {
	    this.name = name;
	  }

	  public String getLastName() {
	    return lastName;
	  }

	  public void setLastName(String lastName) {
	    this.lastName = lastName;
	  }

	  public Date getCreatedDate() {
	    return createdDate;
	  }

	  public void setCreatedDate(Date createdDate) {
	    this.createdDate = createdDate;
	  }

	  public Boolean getActive() {
	    return active;
	  }

	  public void setActive(Boolean active) {
	    this.active = active;
	  }

	  public int getCreatedBy() {
	    return createdBy;
	  }

	  public void setCreatedBy(int createdBy) {
	    this.createdBy = createdBy;
	  }
	  
	  
}
