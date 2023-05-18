/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Productdata;
import ORM.Userdata;
import ORM.Wishlist;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author this pc
 */
public class WishlistModel {
    
    SessionFactory sf;
    Session ses;

    public WishlistModel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public void addToWishlist (String umail, String proId, String qty, String size){
        
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
        
        Wishlist wishlist=new Wishlist(pd,ud,size,quantity);
        ses.save(wishlist);
        ses.getTransaction().commit();
        ses.close();
        
    }
    
}
