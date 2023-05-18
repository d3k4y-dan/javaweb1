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
import java.util.List;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author this pc
 */
public class CartModel {
    
    SessionFactory sf;
    Session ses;

    public CartModel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public boolean addToCart (String umail, String proId, String qty, String size){
        
        ses=sf.openSession();
        ses.beginTransaction();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", umail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Productdata.class);
        int id=Integer.parseInt(proId);
        cr1.add(Restrictions.eq("id", id));
        List<Productdata> pdlist = cr1.list();
        Productdata pd=pdlist.get(0);
        
        int quantity=Integer.parseInt(qty);
        
        if(pd.getStatus().equals("Available")){
            Cart cart=new Cart(pd,ud,size,quantity);
            ses.save(cart);
            ses.getTransaction().commit();
            ses.close();
            return true;
        }else{
            ses.getTransaction().rollback();
            ses.close();
            return false;
        }
        
    }
    
    @OneToMany(fetch = FetchType.LAZY)
    public List<Cart> getCartItems(String mail){
        
        ses=HibernateUtil.getSessionFactory().openSession();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", mail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Cart.class);
        cr1.add(Restrictions.eq("userdata", ud));
        
        List<Cart> cartlist = cr1.list();
        
        ses.close();
        
        return cartlist;
        
    }
    
    public boolean deleteCartItems(String mail){
        
        try {
            ses=HibernateUtil.getSessionFactory().openSession();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", mail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Cart.class);
        cr1.add(Restrictions.eq("userdata", ud));
        
        List<Cart> cartlist = cr1.list();
        
        for (int i = 0; i < cartlist.size(); i++) {
            Cart get = cartlist.get(i);
            ses.delete(get);
        }
        
        ses.getTransaction().commit();
            ses.close();
            return true;
        
        } catch (Exception e) {
            ses.getTransaction().rollback();
            ses.close();
            return false;
        }
        
    }
    
    public boolean deleteCartItem(String usermail, String cartItemID){
        
        try {
            
            ses=HibernateUtil.getSessionFactory().openSession();
            ses.beginTransaction();
            
            Criteria cr = ses.createCriteria(Userdata.class);
            cr.add(Restrictions.eq("email", usermail));
            List<Userdata> uslist = cr.list();
            Userdata ud=uslist.get(0);
            
            Criteria cr1 = ses.createCriteria(Cart.class);
            cr1.add(Restrictions.eq("userdata", ud));
            List<Cart> cartlist = cr1.list();
            
            Integer cid=Integer.parseInt(cartItemID);
        
            for (int i = 0; i < cartlist.size(); i++) {
                Cart get = cartlist.get(i);
                if(get.getId().equals(cid)){
                    ses.delete(get);
                }
            }
            
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
    
    public static void main(String[] args) {
        
//        CartModel cm=new CartModel();
//        
//        List<Cart> lpd=cm.getCartItems("dankabesh@gmail.com");
//        
//        for (int idx = 0; idx < lpd.size(); idx++) {
//            
//            Cart cart = lpd.get(idx);
//            
//            Productdata pd=cart.getProductdata();
//            
//            System.out.println(cart.getUserdata());
//        }
        
    }
    
}
