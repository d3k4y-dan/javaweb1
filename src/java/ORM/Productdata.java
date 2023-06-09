package ORM;
// Generated May 23, 2021 12:57:40 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Productdata generated by hbm2java
 */
public class Productdata  implements java.io.Serializable {


     private Integer id;
     private Userdata userdata;
     private String date;
     private String name;
     private String brand;
     private String gender;
     private String category;
     private String description;
     private String price;
     private String image;
     private String status;
     private Set wishlists = new HashSet(0);
     private Set carts = new HashSet(0);
     private Set reviewses = new HashSet(0);
     private Set invoiceProductses = new HashSet(0);

    public Productdata() {
    }

	
    public Productdata(Userdata userdata, String date, String name, String brand, String gender, String category, String description, String price, String image, String status) {
        this.userdata = userdata;
        this.date = date;
        this.name = name;
        this.brand = brand;
        this.gender = gender;
        this.category = category;
        this.description = description;
        this.price = price;
        this.image = image;
        this.status = status;
    }
    public Productdata(Userdata userdata, String date, String name, String brand, String gender, String category, String description, String price, String image, String status, Set wishlists, Set carts, Set reviewses, Set invoiceProductses) {
       this.userdata = userdata;
       this.date = date;
       this.name = name;
       this.brand = brand;
       this.gender = gender;
       this.category = category;
       this.description = description;
       this.price = price;
       this.image = image;
       this.status = status;
       this.wishlists = wishlists;
       this.carts = carts;
       this.reviewses = reviewses;
       this.invoiceProductses = invoiceProductses;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Userdata getUserdata() {
        return this.userdata;
    }
    
    public void setUserdata(Userdata userdata) {
        this.userdata = userdata;
    }
    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getBrand() {
        return this.brand;
    }
    
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getGender() {
        return this.gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getCategory() {
        return this.category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getPrice() {
        return this.price;
    }
    
    public void setPrice(String price) {
        this.price = price;
    }
    public String getImage() {
        return this.image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Set getWishlists() {
        return this.wishlists;
    }
    
    public void setWishlists(Set wishlists) {
        this.wishlists = wishlists;
    }
    public Set getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set carts) {
        this.carts = carts;
    }
    public Set getReviewses() {
        return this.reviewses;
    }
    
    public void setReviewses(Set reviewses) {
        this.reviewses = reviewses;
    }
    public Set getInvoiceProductses() {
        return this.invoiceProductses;
    }
    
    public void setInvoiceProductses(Set invoiceProductses) {
        this.invoiceProductses = invoiceProductses;
    }




}


