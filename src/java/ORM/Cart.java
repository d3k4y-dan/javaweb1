package ORM;
// Generated May 23, 2021 12:57:40 AM by Hibernate Tools 4.3.1



/**
 * Cart generated by hbm2java
 */
public class Cart  implements java.io.Serializable {


     private Integer id;
     private Productdata productdata;
     private Userdata userdata;
     private String size;
     private int quantity;

    public Cart() {
    }

    public Cart(Productdata productdata, Userdata userdata, String size, int quantity) {
       this.productdata = productdata;
       this.userdata = userdata;
       this.size = size;
       this.quantity = quantity;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Productdata getProductdata() {
        return this.productdata;
    }
    
    public void setProductdata(Productdata productdata) {
        this.productdata = productdata;
    }
    public Userdata getUserdata() {
        return this.userdata;
    }
    
    public void setUserdata(Userdata userdata) {
        this.userdata = userdata;
    }
    public String getSize() {
        return this.size;
    }
    
    public void setSize(String size) {
        this.size = size;
    }
    public int getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }




}


