package ORM;
// Generated May 23, 2021 12:57:40 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Userdata generated by hbm2java
 */
public class Userdata  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String address;
     private String mobile;
     private String email;
     private String password;
     private String username;
     private String date;
     private Set wishlists = new HashSet(0);
     private Set postses = new HashSet(0);
     private Set billingdetailses = new HashSet(0);
     private Set carts = new HashSet(0);
     private Set reviewses = new HashSet(0);
     private Set invoiceses = new HashSet(0);
     private Set productdatas = new HashSet(0);

    public Userdata() {
    }

	
    public Userdata(String name, String address, String mobile, String email, String password, String username, String date) {
        this.name = name;
        this.address = address;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
        this.username = username;
        this.date = date;
    }
    public Userdata(String name, String address, String mobile, String email, String password, String username, String date, Set wishlists, Set postses, Set billingdetailses, Set carts, Set reviewses, Set invoiceses, Set productdatas) {
       this.name = name;
       this.address = address;
       this.mobile = mobile;
       this.email = email;
       this.password = password;
       this.username = username;
       this.date = date;
       this.wishlists = wishlists;
       this.postses = postses;
       this.billingdetailses = billingdetailses;
       this.carts = carts;
       this.reviewses = reviewses;
       this.invoiceses = invoiceses;
       this.productdatas = productdatas;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getDate() {
        return this.date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    public Set getWishlists() {
        return this.wishlists;
    }
    
    public void setWishlists(Set wishlists) {
        this.wishlists = wishlists;
    }
    public Set getPostses() {
        return this.postses;
    }
    
    public void setPostses(Set postses) {
        this.postses = postses;
    }
    public Set getBillingdetailses() {
        return this.billingdetailses;
    }
    
    public void setBillingdetailses(Set billingdetailses) {
        this.billingdetailses = billingdetailses;
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
    public Set getInvoiceses() {
        return this.invoiceses;
    }
    
    public void setInvoiceses(Set invoiceses) {
        this.invoiceses = invoiceses;
    }
    public Set getProductdatas() {
        return this.productdatas;
    }
    
    public void setProductdatas(Set productdatas) {
        this.productdatas = productdatas;
    }




}


