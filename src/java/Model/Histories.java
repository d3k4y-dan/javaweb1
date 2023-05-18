/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Cart;
import ORM.InvoiceProducts;
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
public class Histories {
    
    SessionFactory sf;
    Session ses;

    public Histories() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public List<InvoiceProducts> getSellHistory(String email){
        
        ses=sf.openSession();
        
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", email));
        List<Userdata> uslist = cr.list();
        Userdata ud=uslist.get(0);
        
        Criteria cr1 = ses.createCriteria(InvoiceProducts.class);
        List<InvoiceProducts> lpd = cr1.list();
        List<InvoiceProducts> lpd1 = cr1.list();
        lpd1.clear();
        
        for (int i = 0; i < lpd.size(); i++) {
            InvoiceProducts get = lpd.get(i);
            String mail=get.getProductdata().getUserdata().getEmail();
            if(email.equals(mail)){
                lpd1.add(lpd.get(i));
            }
        }
        
        ses.close();
        
        return lpd1;
        
    }
}
