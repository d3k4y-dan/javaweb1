/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Cart;
import ORM.Invoices;
import ORM.Productdata;
import ORM.Userdata;
import java.text.SimpleDateFormat;
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
public class InvoiceModel {
    
    SessionFactory sf;
    Session ses;

    public InvoiceModel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public int getInvoices(String usermail){
        ses=sf.openSession();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", usermail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Invoices.class);
        cr1.add(Restrictions.eq("userdata", ud));
        List<Invoices> lpd = cr1.list();
        
        int isize=lpd.size();
        
        int last_inv=isize-1;
        
        Invoices inv=lpd.get(last_inv);
        
        int last_inv_id=inv.getId();
        
        int next_inv_id=last_inv_id+1;
        
        ses.close();
        
        return next_inv_id;
    }
    
    public List<Invoices> getUserInvoices(String usermail){
        
        ses=sf.openSession();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", usermail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Invoices.class);
        cr1.add(Restrictions.eq("userdata", ud));
        List<Invoices> lpd = cr1.list();
        
        ses.close();
        
        return lpd;
        
    }
    
    public boolean addInvoice(String usermail){
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
        
        Date d=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date=sdf.format(d);
        
        Double grossTotal=0.0;
        
        for (int idx = 0; idx < lpd.size(); idx++) {
            
            Cart cart = lpd.get(idx);
            Productdata pd=cart.getProductdata();
            
            Double price=Double.parseDouble(pd.getPrice());
            
            Double actTotal=price*cart.getQuantity();
            
            grossTotal=grossTotal+actTotal;
            
        }
        
        Invoices i=new Invoices(ud, date, grossTotal);
        
        ses.save(i);
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
//        InvoiceModel im=new InvoiceModel();
//        Boolean b=im.addInvoice("dankabesh@gmail.com");
//        System.out.println(b);
    }
    
}
