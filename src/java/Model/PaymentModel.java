/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Billingdetails;
import ORM.Cart;
import ORM.Invoices;
import ORM.Productdata;
import ORM.Userdata;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author this pc
 */
public class PaymentModel {
    
    SessionFactory sf;
    Session ses;

    public PaymentModel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public boolean codPay(String usermail, String firstname, String lastname, String email, String address, String city, String country, String tel){
        
        try {
            ses=sf.openSession();
        ses.beginTransaction();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", usermail));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(Invoices.class);
        cr1.add(Restrictions.eq("userdata", ud));
        List<Invoices> ilist = cr1.list();
        
        int s=ilist.size();
        int invid=s-1;
        
        Invoices invoice=ilist.get(invid);
        
        Billingdetails bd=new Billingdetails(invoice,ud, firstname, lastname, email, address, city, country, tel);
        
        ses.save(bd);
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
//        PaymentModel pm=new PaymentModel();
//        Boolean b=pm.codPay("dankabesh@gmail.com", "Dan", "Kabesh", "dankabesh@gmail.com", "agfnsdngk", "sfsdf", "safsaf", "141", "0701025014");
//        System.out.println(b);
    }
    
}
