/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Cart;
import ORM.Productdata;
import ORM.Userdata;
import ORM.Wishlist;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author this pc
 */
public class ProductModel {
    SessionFactory sf;
    Session ses;

    public ProductModel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public void addProduct(String usermail, String date, String name, String brand, String gender, String category, String description, String price, String image){
        ses=sf.openSession();
        ses.beginTransaction();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", usermail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Productdata pd=new Productdata(ud, date, name, brand, gender, category, description, price, image, "Available");
        
        ses.save(pd);
        ses.getTransaction().commit();
        ses.close();
    }
    
    public List<Productdata> getUserProducts(String usermail){
        
        ses=sf.openSession();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", usermail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        cr1.add(Restrictions.eq("userdata", ud));
        List<Productdata> pdlist = cr1.list();
        
        ses.close();
        
        return pdlist;
        
    }
    
    public List<Productdata> getProducts(){
        ses=sf.openSession();
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        List<Productdata> pdlist = cr1.list();
        
        ses.close();
        
        return pdlist;
    }
    
    public List<Productdata> getSelectedProduct(String proId){
        
        ses=sf.openSession();
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        
        int id=Integer.parseInt(proId);
        
        cr1.add(Restrictions.eq("id", id));
        List<Productdata> pdlist = cr1.list();
        
        ses.close();
        
        return pdlist;
        
    }
    
    public void editProduct(String proID,String name,String price,String description,String category,String brand,String gender,String status){
        
        try {
            ses=sf.openSession();
            ses.beginTransaction();
            
            int id=Integer.parseInt(proID);
        
            Productdata pm=(Productdata)ses.get(Productdata.class, id);
        
            pm.setName(name);
            pm.setPrice(price);
            pm.setDescription(description);
            pm.setCategory(category);
            pm.setBrand(brand);
            pm.setGender(gender);
            pm.setStatus(status);
        
            ses.getTransaction().commit();
            ses.update(pm);
            ses.close();
        } catch (Exception e) {
            if (ses.getTransaction() != null) {
                ses.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        
    }
    
    public boolean deleteProduct(String proID){
        
        try {
            ses=sf.openSession();
            ses.beginTransaction();
        
            int id=Integer.parseInt(proID);
            Productdata pm=(Productdata)ses.get(Productdata.class, id);
        
            ses.delete(pm);
            ses.getTransaction().commit();
            ses.close();
            return true;
            
        } catch (Exception e) {
            if (ses.getTransaction() != null) {
                ses.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Productdata> getProductsbyName(String search){
        
        ses=sf.openSession();
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        List<Productdata> pdlist = cr1.list();
        List<Productdata> pdlist1 = cr1.list();
        pdlist1.clear();
        
        for (int i = 0; i < pdlist.size(); i++) {
            Productdata get = pdlist.get(i);
            
            if(get.getName().startsWith(search)){
                pdlist1.add(get);
            }
            
        }
        
        ses.close();
        
        return pdlist1;
        
    }
    
    public List<Productdata> getProductsbyBrand(String search){
        
        ses=sf.openSession();
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        List<Productdata> pdlist = cr1.list();
        List<Productdata> pdlist1 = cr1.list();
        pdlist1.clear();
        
        for (int i = 0; i < pdlist.size(); i++) {
            Productdata get = pdlist.get(i);
            
            if(get.getBrand().startsWith(search)){
                pdlist1.add(get);
            }
            
        }
        
        ses.close();
        
        return pdlist1;
        
    }
    
    public List<Productdata> getProductsbyCategory(String search){
        
        ses=sf.openSession();
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        List<Productdata> pdlist = cr1.list();
        List<Productdata> pdlist1 = cr1.list();
        pdlist1.clear();
        
        for (int i = 0; i < pdlist.size(); i++) {
            Productdata get = pdlist.get(i);
            
            if(get.getCategory().startsWith(search)){
                pdlist1.add(get);
            }
            
        }
        
        ses.close();
        
        return pdlist1;
        
    }
    
    public static void main(String[] args) {
//        ProductModel pm=new ProductModel();
//        System.out.println(pm.getProductsbyName("not"));
    }
}
