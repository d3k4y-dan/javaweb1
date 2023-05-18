/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Cart;
import ORM.InvoiceProducts;
import ORM.Invoices;
import ORM.Productdata;
import ORM.Userdata;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author this pc
 */
public class InvoiceProductsModel {
    
    SessionFactory sf;
    Session ses;

    public InvoiceProductsModel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public boolean addInvoiceProducts(String usermail){
        
        try {
            ses=sf.openSession();
        ses.beginTransaction();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", usermail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Cart.class);
        cr1.add(Restrictions.eq("userdata", ud));
        List<Cart> lpd = cr1.list();
        
        Criteria c2=ses.createCriteria(Invoices.class);
        c2.add(Restrictions.eq("userdata", ud));
        List<Invoices> lpd2 = c2.list();
        
        int s=lpd2.size();
        int invid=s-1;
        
        Invoices invoice=lpd2.get(invid);
        
        for (int i = 0; i < lpd.size(); i++) {
            
            Cart get = lpd.get(i);
            Productdata pd=get.getProductdata();
            
            Double price=Double.parseDouble(pd.getPrice())*get.getQuantity();
            
            InvoiceProducts ip=new InvoiceProducts(invoice, pd, get.getQuantity(), get.getSize(), price);
            ses.save(ip);
            
        }
        
        ses.getTransaction().commit();
        ses.close();
        return true;
        
        } catch (Exception e) {
            System.out.println(e);
            ses.getTransaction().rollback();
            ses.close();
            return false;
        }
        
    }
    
    public static void main(String[] args) {
//        InvoiceProductsModel ipm=new InvoiceProductsModel();
//        boolean r=ipm.addInvoiceProducts("dankabesh@gmail.com");
//        System.out.println(r);
    }
    
}
