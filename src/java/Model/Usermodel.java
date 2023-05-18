/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.HibernateUtil;
import ORM.Userdata;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author this pc
 */
public class Usermodel {
    
    SessionFactory sf;
    Session ses;

    public Usermodel() {
        sf = HibernateUtil.getSessionFactory();
    }
    
    public boolean checkIsUser(String username) {
        ses=sf.openSession();
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("username", username));
        List<Userdata> uslist = cr.list();
        ses.close();
        if (uslist.size() > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean checkEmail(String email) {
        ses=sf.openSession();
        Criteria cr = ses.createCriteria(Userdata.class);
        cr.add(Restrictions.eq("email", email));
        List<Userdata> uslist = cr.list();
        ses.close();
        if (uslist.size() > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    public void addUser(String name, String address, String mobile, String email, String password, String username, String date){
        
        ses=sf.openSession();
        ses.beginTransaction();
        Userdata user=new Userdata(name,address,mobile,email,password,username,date);
        ses.save(user);
        ses.getTransaction().commit();
        ses.close();
        
    }
    
    public boolean getUser(String email, String password){
        ses=sf.openSession();
        Transaction transaction = ses.beginTransaction();
        Userdata user = null;
        try{
            user = (Userdata) ses.createQuery("FROM Userdata U WHERE U.email = :email").setParameter("email", email)
                .uniqueResult();
            if (user != null && user.getPassword().equals(password)) {
                return true;
            }
            transaction.commit();
            ses.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    
    public Userdata getUserData(String email){
        
        try {
            
            ses=sf.openSession();
            
            Criteria cr = ses.createCriteria(Userdata.class);
            cr.add(Restrictions.eq("email", email));
            List<Userdata> uslist = cr.list();
            Userdata ud=uslist.get(0);
            
            ses.close();
            
            return ud;
            
        } catch (Exception e) {
            
            System.out.println(e);
            return null;
            
        }
        
    }
    
    public boolean editUserdata(String email, String name, String address, String mobile){
        try {
            
            ses=sf.openSession();
            ses.beginTransaction();
            
            Criteria cr = ses.createCriteria(Userdata.class);
            cr.add(Restrictions.eq("email", email));
            List<Userdata> uslist = cr.list();
            Userdata ud=uslist.get(0);
            
            ud.setName(name);
            ud.setMobile(mobile);
            ud.setAddress(address);
            
            ses.saveOrUpdate(ud);
            ses.getTransaction().commit();
            ses.close();
            
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
    
    public String isPasswordMatching(String email, String password){
        
        try {
            
            ses=sf.openSession();
            
            Criteria cr = ses.createCriteria(Userdata.class);
            cr.add(Restrictions.eq("email", email));
            List<Userdata> uslist = cr.list();
            Userdata ud=uslist.get(0);
            String result=" ";
            
            if(ud.getPassword().equals(password)){
                result=password;
            }
            ses.close();
            
            return result;
            
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        
    }
    
    public Boolean changePassword(String email, String newpassword){
        
        try {
            
            ses=sf.openSession();
            ses.beginTransaction();
            
            Criteria cr = ses.createCriteria(Userdata.class);
            cr.add(Restrictions.eq("email", email));
            List<Userdata> uslist = cr.list();
            Userdata ud=uslist.get(0);
            
            ud.setAddress(newpassword);
            
            ses.saveOrUpdate(ud);
            ses.getTransaction().commit();
            ses.close();
            
            ses.close();
            
            return true;
            
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        
    }
    
    public static void main(String[] args) {
//        Usermodel u=new Usermodel();
//        u.checkIsUser("un");
    }
    
}
